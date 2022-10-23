Build instructions:

```
mkdir build
cd build
cmake -G Ninja -DCMAKE_CXX_COMPILER=<path/to/clang++/or/icpx> ..
ninja
```

To test example run `ctest` from build directory.