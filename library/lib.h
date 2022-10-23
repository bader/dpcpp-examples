#pragma once

#include <sycl/sycl.hpp>

using namespace sycl;

class TestFnObj {
public:
  TestFnObj(buffer<int> &buf, handler &cgh)
      : data(buf.get_access<access::mode::write>(cgh)) {}
  accessor<int, 1, access::mode::write, access::target::device> data;
  void operator()(id<1> item) const { data[item] = item[0]; }
};

template <int size> void test_kernel() {
  static int data[size];
  {
    buffer<int> b(data, range<1>(size));
    queue q;
    q.submit([&](sycl::handler &cgh) {
      TestFnObj kernel(b, cgh);
      cgh.parallel_for(range<1>(size), kernel);
    });
  }
  for (int i = 0; i < size; i++) {
    assert(data[i] == i);
  }
}
