#include <stddef.h>

typedef struct PointFFI {
  double x;
  double y;
} PointFFI;

unsigned long long add_ffi(unsigned long long left, unsigned long long right);

char **do_something_to_string_ffi(const char *input);

void free_string_pointer(char **pointer);

double distance_between_ffi(const struct PointFFI *p1, const struct PointFFI *p2);

double do_something_with_array_ffi(const double *values, unsigned long long n);
