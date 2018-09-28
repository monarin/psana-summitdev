import os
from psana import DataSource

def filter(evt):
    return True

# Usecase#1 : two iterators
xtc_dir = "/lustre/atlas/scratch/monarin/chm137/xtc/cxid9114"
ds = DataSource('exp=cxid9114:run=109:dir=%s'%(xtc_dir), filter=filter, max_events=10, det_name='DscCsPad')
#beginJobCode
for run in ds.runs():
    det = ds.Detector(ds.det_name)
    #beginRunCode
    for evt in run.events():
        #eventCode
        for d in evt:
            print(det.raw.shape)
    #endRunCode
#endJobCode
