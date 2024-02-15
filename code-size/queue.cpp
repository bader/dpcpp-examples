#include <sycl/queue.hpp>

using namespace sycl;

int main () {
  queue q;
  q.single_task([](){});
}
