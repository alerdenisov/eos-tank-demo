// Copyright (c) 2017 Aler Denisov

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#include <tank_demo/tank_demo.hpp>
#include <tank_demo/checks.hpp>

namespace TankDemo
{
using namespace eos;

///  When storing accounts, check for empty balance and remove account
void save_tank(AccountName owner, const Tank &tank)
{
  /// value, scope
  Tanks::store(tank, owner);
}

void move_tank(Tank &tank, int32_t new_x, int32_t new_y) 
{
  int64_t prev_hash = pos_to_hash(tank.x, tank.y);
  Positions::remove(tank, prev_hash);
  tank.x = new_x;
  tank.y = new_y;
  int64_t next_hash = pos_to_hash(new_x, new_y);
  Positions::store(tank, next_hash);
}

void apply_spawn_tank(const Coordinate &coordinate)
{
  requireAuth(coordinate.owner);

  auto tank = get_tank(coordinate.owner);
  
  require_true(tank.valid);
  require_false(tank.in_game);

  auto found = get_at_position(coordinate.x, coordinate.y);
  require_false(found.valid);

  tank.x = coordinate.x;
  tank.y = coordinate.y;
  tank.lives = INITIAL_LIVES;
  tank.points = MAX_POINT_RECOVER;

  int64_t hash = pos_to_hash(tank.x, tank.y);
  Positions::store(tank, hash);

  save_tank(coordinate.owner, tank);
}

void apply_move_tank(const Coordinate &coordinate)
{
  requireAuth(coordinate.owner);

  auto tank = get_tank(coordinate.owner);
  require_ready(tank);

  int32_t distance = get_distance(tank.x, tank.y, coordinate.x, coordinate.y);
  require_not_less(tank.points, distance);

  auto found = get_at_position(coordinate.x, coordinate.y);
  require_false(found.valid);

  move_tank(tank, coordinate.x, coordinate.y);
  tank.points -= distance;

  save_tank(coordinate.owner, tank);
}

// execute fire transaction
void apply_fire(const Interact &interaction)
{
  requireNotice(interaction.from, interaction.to);
  requireAuth(interaction.from);

  auto from = get_tank(interaction.from);
  auto to = get_tank(interaction.to);

  require_ready(from);
  require_ready(to);

  int32_t distance = get_distance(from.x, from.y, to.x, to.y);

  // Check if tank have enough points
  int32_t required_points = max(1, distance - BASE_SHOT_DISTANCE);
  require_not_more(, from.points);

  from.points -= distance - BASE_SHOT_DISTANCE;
  to.lives -= 1;

  save_tank(interaction.from, from);
  save_tank(interaction.to, to);
}

// execute share trx 
void apply_share(const Interact &interaction)
{
  requireNotice(interaction.from, interaction.to);
  requireAuth(interaction.from);

  auto from = get_tank(interaction.from);
  auto to = get_tank(interaction.to);

  require_ready(from);
  require_ready(to);

  // check if tank have enough points
  require_not_less(from.points, 1);
  
  // TODO: check is distance is too far
  int32_t distance = get_distance(from.x, from.y, to.x, to.y);
  require_not_more(distance, 3);
  
  from.points -= 1;
  to.points += 1;

  save_tank(interaction.from, from);
  save_tank(interaction.to, to);
}

// Check if tank isn't ready yet (reject trx)
inline void require_ready(const Tank &tank) 
{
  require_true(tank.valid);
  require_true(tank.in_game);
  require_true(tank.is_alive());
}
}

using namespace TankDemo;

extern "C" {
void init()
{
  save_tank(N(tank), Tank(int32_t(0), int32_t(0));
}

/// The apply method implements the dispatch of events to this contract
void apply(uint64_t code, uint64_t action)
{
  if (code == N(tank))
  {
    if (action == N(spawn))
    {
      TankDemo::apply_spawn_tank(currentMessage<TankDemo::Coordinate>());
    }
    else if (action == N(move))
    {
      TankDemo::apply_move_tank(currentMessage<TankDemo::Coordinate>());
    }
    else if (action == N(fire))
    {
      TankDemo::apply_fire(currentMessage<TankDemo::Interact>());
    }
    else if (action == N(share))
    {
      TankDemo::apply_share(currentMessage<TankDemo::Interact>());
    }
    else if (action == N(info))
    {
      // not implemented yet
    }
  }
  else if (code == N(judge))
  {
    // not implemented yet
  }
}
}
