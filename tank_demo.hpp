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

#include <tank_demo/position_math.hpp>
#include <eoslib/eos.hpp>
#include <eoslib/token.hpp>
#include <eoslib/db.hpp>
#include <stdlib.h>

namespace TankDemo
{
const int32_t MIN_WORLD_COORD = -350;
const int32_t MAX_WORLD_COORD =  350;

const int32_t BASE_SHOT_DISTANCE = 2;

const uint32_t MAX_POINT_RECOVER = 3;
const uint32_t INITIAL_LIVES = 3;

struct Tank
{
  Tank() {}
  Tank(
    int32_t x, int32_t y,
    uint32_t lives = INITIAL_LIVES,
    uint32_t p = MAX_POINT_RECOVER)
    :points(p)
    ,x(x)
    ,y(y)
    ,lives(lives)
    ,valid(1) {}

  // Same as key inside currency example
  // (The owner is constant because there is only one tank per account)
  const uint64_t owner = N(account);

  uint8_t valid;

  // 0 means tanks no in the game
  uint8_t in_game;

  // Amount of points available 
  uint32_t points;
  // Current amount of health points (0...3)
  uint32_t lives;

  // Current tank position on world map
  // 16 bit is enough
  int32_t x;
  int32_t y;

  bool valid()   const { return valid != 0; }
  bool is_alive() const { return lives > 0; }
  bool is_dead()  const { return !is_alive(); }

  // Do not fill more than MAX_POINT_RECOVER (more only from other tanks)
  bool isRecovered() const { return points >= MAX_POINT_RECOVER; }
};

static_assert(sizeof(Tank) == sizeof(uint64_t) + 
                              sizeof(uint32_t) * 4, "unexpected packing");

struct Interact {
  AccountName from;
  AccountName to;
};

struct Coordinate {
  AccountName owner;
  int32_t     x;
  int32_t     y;
};

using Tanks     = Table<N(tank), N(tank), N(account), Tank, uint64_t>;
using Positions = Table<N(tank), N(tank), N(position), Tank, int64_t>;


inline Tank get_at_position(const int32_t &x, const int32_t &y) 
{
  Tank tank;
  int64_t hash = pos_to_hash(x, y);
  Positions::get(tank, hash);
  return tank;
}

inline Tank get_tank(AccountName owner)
{
  Tank tank;
  Tanks::get(tank, owner);
  return tank;
}

} /// namespace TankDemo
