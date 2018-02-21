#!/bin/bash

mkdir -p dist

if [ -d "z3" ]; then
    cd z3
    git pull origin master
    cd ..
else
    git clone https://github.com/Z3Prover/z3.git
fi

if [[ `uname` == 'Darwin' ]]; then
    virtualenv venv && source venv/bin/activate
    cd z3
    CXX=clang++ CC=clang python scripts/mk_make.py --java --python --git-describe
else
    cd z3
    python scripts/mk_make.py --java --python
fi


cd build
make

cd ../..

if [[ `uname` == 'Darwin' ]]; then
    cp z3/build/*.{dylib,jar} dist/
else
    cp z3/build/*.{so,jar} dist/
fi

