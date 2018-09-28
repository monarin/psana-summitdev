from mpi4py import MPI
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

import os
print('size=%d rank=%d host=%s'%(size, rank, os.environ.get('HOSTNAME')))
