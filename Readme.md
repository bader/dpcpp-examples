# Build instructions

```bash
cmake -B build -S . -G Ninja -DCMAKE_CXX_COMPILER=<path/to/clang++/or/icpx>
cd build
ninja
```

To test example run `ctest` from build directory.
