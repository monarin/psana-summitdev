#!/bin/bash
# modified from Elliott's build script for python 2

set -e

# Setup environment
cat > env.sh <<EOF
module load gcc/7.1.1-20170802
export CC=gcc
export CXX=g++

export CONDA_PREFIX=$PWD/conda
export REL_DIR=\$CONDA_PREFIX/myrel
export PATH=\$CONDA_PREFIX/bin:\$PATH

if [[ -d \$REL_DIR ]]; then
  source activate \$REL_DIR
fi

export LCLS2_DIR=$PWD/lcls2
export PYTHONPATH=\$LCLS2_DIR/install/lib/python2.7/site-packages:\$PYTHONPATH
EOF

source env.sh

# Clean up any previous installs
rm -rf $CONDA_PREFIX
rm -rf channels
rm -rf relmanage
rm -rf lcls2

# Install Conda environment
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-ppc64le.sh
bash Miniconda2-latest-Linux-ppc64le.sh -b -p $CONDA_PREFIX
rm Miniconda2-latest-Linux-ppc64le.sh
conda update -y conda
conda install -y conda-build # Must be installed in root environment
conda create -y -p $REL_DIR python=2.7 cmake h5py ipython numpy cffi curl cython rapidjson pytest
source activate $REL_DIR
CC=$OMPI_CC MPICC=mpicc pip install -v --no-binary mpi4py mpi4py

# Install psana2
git clone https://github.com/slac-lcls/lcls2.git "$LCLS2_DIR"
pushd "$LCLS2_DIR"
./build_all.sh -d -p install
pytest psana/psana/tests
popd
