#include <sycl/sycl.hpp>

using namespace sycl;

int main () {
  queue q;
  q.single_task([](){});
}
