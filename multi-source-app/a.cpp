#include "common.h"

void kernel2();

void kernel1() { test_kernel<10>(); }

int main() {
  kernel1();
  kernel2();

  return 0;
}
