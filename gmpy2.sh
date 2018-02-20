#!/bin/bash
mkdir -p $HOME/src
mkdir -p $HOME/static
sudo apt-get install m4
#INSTALL GMP
v=6.1.2
cd $HOME/src
wget https://gmplib.org/download/gmp/gmp-${v}.tar.bz2
tar -jxvf gmp-${v}.tar.bz2 && cd gmp-${v}
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic
sudo make
sudo make check
sudo make install
#INSTALL MPFR
v=4.0.1
cd $HOME/src
wget http://www.mpfr.org/mpfr-current/mpfr-${v}.tar.bz2
tar -jxvf mpfr-${v}.tar.bz2 && cd mpfr-${v}
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic --with-gmp=$HOME/static
sudo make
sudo make check
sudo make install
#INSTALL MPC
v=1.1.0
cd $HOME/src
wget ftp://ftp.gnu.org/gnu/mpc/mpc-${v}.tar.gz
tar -zxvf mpc-${v}.tar.gz && cd mpc-${v}
./configure --prefix=$HOME/static --enable-static --disable-shared --with-pic --with-gmp=$HOME/static --with-mpfr=$HOME/static
sudo make
sudo make check 
sudo make install
#INSTALL gmpy2
v=2.1.0a1
cd $HOME/src
wget https://github.com/aleaxit/gmpy/releases/download/gmpy2-2.1.0a1/gmpy2-${v}.tar.gz
tar xf gmpy2-${v}.tar.gz && cd gmpy2-${v}
sudo python setup.py build_ext --static=$HOME/static install
