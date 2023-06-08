# Reference: https://blog.csdn.net/weixin_64343528/article/details/123740406
brew install gcc
brew list gcc
# Output in the terminal on my machine, a m2 macmini
    # mengxu@localhost ~ % brew list gcc
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-c++-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-g++-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-gcc-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-gcc-ar-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-gcc-nm-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-gcc-ranlib-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/aarch64-apple-darwin22-gfortran-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/c++-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/cpp-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/g++-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcc-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcc-ar-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcc-nm-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcc-ranlib-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcov-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcov-dump-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gcov-tool-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gfortran
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/gfortran-13
    # /opt/homebrew/Cellar/gcc/13.1.0/bin/lto-dump-13
    # /opt/homebrew/Cellar/gcc/13.1.0/include/c++/ (814 files)
    # /opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/ (618 files)
    # /opt/homebrew/Cellar/gcc/13.1.0/libexec/gcc/ (14 files)
    # /opt/homebrew/Cellar/gcc/13.1.0/share/gcc-13/ (4 files)
    # /opt/homebrew/Cellar/gcc/13.1.0/share/man/ (11 files)

sudo mkdir -p /opt/gfortran/lib/gcc/aarch64-apple-darwin20.0/12.2.0
sudo cp -R /opt/homebrew/Cellar/gcc/13.1.0 /opt/gfortran/lib/gcc/aarch64-apple-darwin20.0/12.2.0
mkdir ~/.R
cd ~/.R
vim Makevars
# Then paste following text, note the value setting of 'VER' and 'FLIBS' must consistent ref gcc list
    # VER=-13
    # CC=gcc$(VER)
    # CXX=g++$(VER)
    # CFLAGS=-mtune=native -g -O2 -Wall -pedantic -Wconversion
    # CXXFLAGS=-mtune=native -g -O2 -Wall -pedantic -Wconversion
    # FLIBS=-L/usr/local/Cellar/gcc/13.1.0/lib/gcc/13