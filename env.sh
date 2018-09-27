module load gcc/7.1.1-20170802
export CC=gcc
export CXX=g++

export CONDA_PREFIX=/ccs/home/monarin/psana-summitdev/conda
export REL_DIR=$CONDA_PREFIX/myrel
export PATH=$CONDA_PREFIX/bin:$PATH

if [[ -d $REL_DIR ]]; then
  source activate $REL_DIR
fi

export LCLS2_DIR=/ccs/home/monarin/psana-summitdev/lcls2
export PYTHONPATH=$LCLS2_DIR/install/lib/python2.7/site-packages:$PYTHONPATH
