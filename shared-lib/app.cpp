#include "lib.h"

void kernela();
void kernelb();

void kernel1() { test_kernel<10>(); }

int main() {
  kernel1();
  kernela();
  kernelb();

  return 0;
}
