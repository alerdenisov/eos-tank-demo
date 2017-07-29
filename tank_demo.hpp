#include <eoslib/eos.hpp>
#include <eoslib/token.hpp>
#include <eoslib/db.hpp>

namespace TankDemo
{

const uint8_t MAX_POINT_RECOVER = 3;
const uint8_t INITIAL_LIVES = 3;

struct Tank
{
  Tank(
    int32_t x = 0, int32_t y = 0,
    uint32_t lives = INITIAL_LIVES,
    uint32_t p = MAX_POINT_RECOVER)
    :points(p)
    ,x(x)
    ,y(y)
    ,lives(lives) {}

  // Same as key inside currency example
  // (The owner is constant because there is only one tank per account)
  const uint64_t owner = N(account);

  // Amount of points available 
  uint32_t points;
  // Current amount of health points (0...3)
  uint32_t lives;

  // Current tank position on world map
  // 16 bit is enough
  int32_t x;
  int32_t y;

  bool isEmpty() const { return points == 0; }
  bool isAlive() const { return lives > 0; }
  bool isDead()  const { return !isAlive(); }

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

inline int64_t pos_to_hash(const int32_t &x, const int32_t &y) {
  return int64_t(x) | (int64_t(y) << 32);
}

inline void hash_to_pos(int64_t hash, int32_t *x, int32_t *y) {
  *x = int32_t(hash);
  *y = int32_t(hash >> 32);
}

inline Tank get_at_position(int32_t x, int32_t y) 
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
