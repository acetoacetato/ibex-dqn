#if ! defined(ROUNDING_CONTROL_CONFIG_HPP)
#define ROUNDING_CONTROL_CONFIG_HPP

#if ! defined(_MSC_VER)
// SSE
/*
 */
#define HAVE_SSE

// X87
/* #undef HAVE_X87 */

// ISO C99 rounding functions
/*
#if ! defined(__STDC_IEC_559__)
#define __STDC_IEC_559__
#endif
*/
#endif

#endif
