from psana.pscalib.calib.MDBWebUtils import calib_constants
pedestals = calib_constants('cspad_0002', exp='cxid9114', ctype='pedestals', run=96, time_sec=None, vers=None)
print(pedestals.shape)
