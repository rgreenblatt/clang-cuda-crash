#include <bits/int_limits.h>

namespace first {
namespace second {
template <unsigned Base, char Dig> struct Digit;

template <unsigned Base>
struct Digit<Base, '0'> : integral_constant<unsigned, 0> {
  using valid = true_type;
};

template <unsigned Base>
struct Digit<Base, '1'> : integral_constant<unsigned, 1> {
  using valid = true_type;
};

template <unsigned Base, unsigned _Val>
struct DigitImpl : integral_constant<unsigned, _Val> {
  static_assert(Base > _Val, "invalid digit");
  using valid = true_type;
};

template <unsigned Base> struct Digit<Base, '2'> : DigitImpl<Base, 2> {};

template <unsigned Base> struct Digit<Base, '3'> : DigitImpl<Base, 3> {};

template <unsigned Base> struct Digit<Base, '4'> : DigitImpl<Base, 4> {};

template <unsigned Base> struct Digit<Base, '5'> : DigitImpl<Base, 5> {};

template <unsigned Base> struct Digit<Base, '6'> : DigitImpl<Base, 6> {};

template <unsigned Base> struct Digit<Base, '7'> : DigitImpl<Base, 7> {};

template <unsigned Base> struct Digit<Base, '8'> : DigitImpl<Base, 8> {};

template <unsigned Base> struct Digit<Base, '9'> : DigitImpl<Base, 9> {};

template <unsigned Base>
struct Digit<Base, 'a'> : DigitImpl<Base, 0xa> {};

template <unsigned Base>
struct Digit<Base, 'A'> : DigitImpl<Base, 0xa> {};

template <unsigned Base>
struct Digit<Base, 'b'> : DigitImpl<Base, 0xb> {};

template <unsigned Base>
struct Digit<Base, 'B'> : DigitImpl<Base, 0xb> {};

template <unsigned Base>
struct Digit<Base, 'c'> : DigitImpl<Base, 0xc> {};

template <unsigned Base>
struct Digit<Base, 'C'> : DigitImpl<Base, 0xc> {};

template <unsigned Base>
struct Digit<Base, 'd'> : DigitImpl<Base, 0xd> {};

template <unsigned Base>
struct Digit<Base, 'D'> : DigitImpl<Base, 0xd> {};

template <unsigned Base>
struct Digit<Base, 'e'> : DigitImpl<Base, 0xe> {};

template <unsigned Base>
struct Digit<Base, 'E'> : DigitImpl<Base, 0xe> {};

template <unsigned Base>
struct Digit<Base, 'f'> : DigitImpl<Base, 0xf> {};

template <unsigned Base>
struct Digit<Base, 'F'> : DigitImpl<Base, 0xf> {};

//  Digit separator
template <unsigned Base>
struct Digit<Base, '\''> : integral_constant<unsigned, 0> {
  using valid = false_type;
};

//------------------------------------------------------------------------------

template <unsigned long long _Val>
using __ull_constant = integral_constant<unsigned long long, _Val>;

template <unsigned Base, char Dig, char... _Digs> struct _Power_help {
  using __next = typename _Power_help<Base, _Digs...>::type;
  using __valid_digit = typename Digit<Base, Dig>::valid;
  using type = __ull_constant<__next::value *(__valid_digit{} ? Base : 1ULL)>;
};

template <unsigned Base, char Dig> struct _Power_help<Base, Dig> {
  using __valid_digit = typename Digit<Base, Dig>::valid;
  using type = __ull_constant<__valid_digit::value>;
};
} // namespace second
} // namespace first
