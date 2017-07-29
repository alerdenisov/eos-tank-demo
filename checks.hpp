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

inline void error(bool ok, const char* str) {
  assert(ok ? uint32_t(1) : uint32_t(0), str);
}

inline void require_true(bool value, const char* str = "incorrect data")                 { error((value), str); }
inline void require_false(bool value, const char* str = "incorrect data")                { error((!value), str); }

template<typename T>
inline void require_less(const T &a, const T &b, const char* str = "incorrect data")     { error((a < b), str); }

template<typename T>
inline void require_not_less(const T &a, const T &b, const char* str = "incorrect data") { error((a >= b), str); }

template<typename T>
inline void require_more(const T &a, const T &b, const char* str = "incorrect data")     { error((a > b), str); }

template<typename T>
inline void require_not_more(const T &a, const T &b, const char* str = "incorrect data") { error((a <= b), str); }


inline void require_ready(const TankDemo::Tank &tank) 
{
  require_true(tank.is_valid());
  require_true(tank.in_game);
  require_true(tank.is_alive());
}