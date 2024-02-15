#!/bin/bash
#setsycl

# Dump macro values
echo "Dump macro values"
clang++ -fsycl -dM sycl.cpp -o sycl.full.defs
clang++ -fsycl-device-only -dM sycl.cpp -o sycl.device.defs

# Dump dependencies
echo "Dump dependencies"
clang++ -fsycl -MD sycl.cpp -MF sycl.full.deps
clang++ -fsycl-device-only -MD sycl.cpp -MF sycl.device.deps

# Dump pre-processed output with comments
echo "Dump pre-processed output with comments"
clang++ -fsycl -E sycl.cpp -o sycl.full.ii && wc -l sycl.full.ii
clang++ -fsycl-device-only -E sycl.cpp -o sycl.device.ii && wc -l sycl.device.ii

# Dump pre-processed output without comments and whitespaces
echo "Dump pre-processed output without comments and whitespaces"
clang++ -fsycl -E -P sycl.cpp -o sycl.full.no-comments.ii && wc -l sycl.full.no-comments.ii
clang++ -fsycl-device-only -E -P sycl.cpp -o sycl.device.no-comments.ii && wc -l sycl.device.no-comments.ii

# Dump pre-processed output (exclude extension includes)
echo "Dump pre-processed output (exclude extension includes)"
clang++ -DSYCL_NO_EXTENSION_INCLUDES=1 -fsycl -E -P sycl.cpp -o sycl.full.no-ext.ii && wc -l sycl.full.no-ext.ii
clang++ -DSYCL_NO_EXTENSION_INCLUDES=1 -fsycl-device-only -E -P sycl.cpp -o sycl.device.no-ext.ii && wc -l sycl.device.no-ext.ii
