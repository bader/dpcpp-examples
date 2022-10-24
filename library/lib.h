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

template <int size> struct rep {
  static void test_kernel_gen() {
    static int data[size];
    {
      buffer<int> b(data, range<1>(size));
      queue q;
      q.submit([&](sycl::handler &cgh) {
        accessor<int, 1, access::mode::write, access::target::device> acc =
            b.get_access<access::mode::write>(cgh);
        cgh.parallel_for(range<1>(size), [=](id<1> id) { acc[id] = id[0]; });
      });
    }
    for (int i = 0; i < size; i++) {
      assert(data[i] == i);
    }
    rep<size-1>::test_kernel_gen();
  }
};

template <> struct rep<0> {
  static void test_kernel_gen() {}
};
