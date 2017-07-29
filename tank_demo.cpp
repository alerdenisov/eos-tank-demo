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
#include <stdlib.h>

namespace TankDemo
{
using namespace eos;

///  When storing accounts, check for empty balance and remove account
void save_tank(AccountName owner, const Tank &a)
{
  /// value, scope
  Tanks::store(a, owner);
}

int32_t move_tank(Tank &a, int32_t new_x, int32_t new_y) 
{
  int64_t prev_hash = pos_to_hash(a.x, a.y);
  Positions::remove(a, prev_hash);

  int32_t ox = abs(a.x - new_x);
  int32_t oy = abs(a.x - new_y);

  a.x = new_x;
  a.y = new_y;
  int64_t next_hash = pos_to_hash(new_x, new_y);
  Positions::store(a, next_hash);

  return ox + oy;
}

void apply_spawn_tank(const Coordinate &coordinate)
{
  requireAuth(coordinate.owner);

  auto tank = get_tank(coordinate.owner);

  // TODO: check if tank is already in game
  // TODO: check if coord is busy
  tank.x = coordinate.x;
  tank.y = coordinate.y;

  save_tank(coordinate.owner, tank);
}

void apply_move_tank(const Coordinate &coordinate)
{
  requireAuth(coordinate.owner);

  auto tank = get_tank(coordinate.owner);

  // TODO: check if tank is away from game
  // TODO: check if tank is dead
  // TODO: remove desire amount of points
  // TODO: check if coord is busy
  // tank.x = coordinate.x;
  // tank.y = coordinate.y;
  tank.points -= move_tank(tank, coordinate.x, coordinate.y); 

  save_tank(coordinate.owner, tank);
}

void apply_fire(const Interact &interaction)
{
  requireNotice(interaction.from, interaction.to);
  requireAuth(interaction.from);

  auto from = get_tank(interaction.from);
  auto to = get_tank(interaction.to);

  // TODO: check if tanks is away from game
  // TODO: check if tanks is dead
  // TODO: remove desire amount of points
  // TODO: check is distance is too far
  // TODO: check amount of points
  from.points -= 1;
  to.lives -= 1;

  save_tank(interaction.from, from);
  save_tank(interaction.to, to);
}

void apply_share(const Interact &interaction)
{
  requireNotice(interaction.from, interaction.to);
  requireAuth(interaction.from);

  auto from = get_tank(interaction.from);
  auto to = get_tank(interaction.to);

  // TODO: check if tanks is away from game
  // TODO: check if tanks is dead
  // TODO: remove desire amount of points
  // TODO: check is distance is too far
  // TODO: check amount of points
  from.points -= 1;
  to.points += 1;

  save_tank(interaction.from, from);
  save_tank(interaction.to, to);
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