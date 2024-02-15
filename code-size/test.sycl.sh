#!/bin/bash
#setsycl

# Dump macro values
# echo "Dump macro values"
# clang++ -fsycl -dM $1.cpp -o $1.full.defs
# clang++ -fsycl-device-only -dM $1.cpp -o $1.device.defs

# Dump dependencies
# echo "Dump dependencies"
# clang++ -fsycl -MD $1.cpp -MF $1.full.deps
# clang++ -fsycl-device-only -MD $1.cpp -MF $1.device.deps

# Dump pre-processed output with comments
echo "Dump pre-processed output with comments"
# clang++ -fsycl -E $1.cpp -o $1.full.ii && wc -l $1.full.ii
clang++ -fsycl-device-only -E $1.cpp -o $1.device.ii && wc -l $1.device.ii

# Dump pre-processed output without comments and whitespaces
echo "Dump pre-processed output without comments and whitespaces"
# clang++ -fsycl -E -P $1.cpp -o $1.full.no-comments.ii && wc -l $1.full.no-comments.ii
clang++ -fsycl-device-only -E -P $1.cpp -o $1.device.no-comments.ii && wc -l $1.device.no-comments.ii

# Dump pre-processed output (exclude extension includes)
# echo "Dump pre-processed output (exclude extension includes)"
# clang++ -DSYCL_NO_EXTENSION_INCLUDES=1 -fsycl -E -P $1.cpp -o $1.full.no-ext.ii && wc -l $1.full.no-ext.ii
# clang++ -DSYCL_NO_EXTENSION_INCLUDES=1 -fsycl-device-only -E -P $1.cpp -o $1.device.no-ext.ii && wc -l $1.device.no-ext.ii
