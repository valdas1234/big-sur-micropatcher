#!/bin/sh
# Maybe I should make an actual Makefile, but this script compiles one
# source file to two different binary files using two different sets of
# compiler flags. In fact, considering that's nearly *all* this file does,
# I'm not even sure that Make is the right tool for the job.

FLAGS="-dynamiclib -fmodules"

rm -f HaxDoNotSeal.dylib HaxSeal.dylib
clang $FLAGS -DDO_NOT_SEAL HaxLib.m -o HaxDoNotSeal.dylib
clang $FLAGS -DSEAL HaxLib.m -o HaxSeal.dylib
codesign -f -s - HaxDoNotSeal.dylib HaxSeal.dylib