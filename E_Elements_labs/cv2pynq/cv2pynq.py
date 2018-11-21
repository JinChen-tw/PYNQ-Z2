import os
import numpy as np
from pynq import Overlay, PL, MMIO
from pynq import DefaultIP, DefaultHierarchy
from pynq.lib import DMA
import cv2

CV2PYNQ_ROOT_DIR = os.path.dirname(os.path.realpath(__file__))
CV2PYNQ_BIT_DIR = os.path.join(CV2PYNQ_ROOT_DIR, 'bitstreams')

class cv2pynq():
    MAX_WIDTH  = 1920
    MAX_HEIGHT = 1080
    def __init__(self, load_overlay=True):
        #self.bitstream_name = None
        self.bitstream_name = "opencv.bit"
        self.bitstream_path = os.path.join(CV2PYNQ_BIT_DIR, self.bitstream_name)
        self.ol = Overlay(self.bitstream_path)
        self.ol.download()
        self.ol.reset()
        self.img_filters = self.ol.image_filters
        self.dmaOut = self.img_filters.axi_dma_0.sendchannel 
        self.dmaIn =  self.img_filters.axi_dma_0.recvchannel 
        self.dmaOut.stop()
        self.dmaIn.stop()
        self.dmaIn.start()
        self.dmaOut.start()
        self.filter2DType = -1  # filter types: SobelX=0, SobelY=1, ScharrX=2, ScharrY=3, Laplacian1=4, Laplacian3=5
        self.filter2D_5Type = -1  # filter types: SobelX=0, SobelY=1,                     Laplacian5=4
        self.f2D = self.img_filters.filter2D_hls_0
        self.f2D.reset()
        self.f2D_5 = self.img_filters.filter2D_hls_5_0
        self.f2D_5.reset()
        
    def close(self):
        self.dmaOut.stop()
        self.dmaIn.stop()

    def Sobel(self,src, ddepth, dx, dy, dst, ksize):
        if(ksize == 3):
            self.f2D.rows = src.shape[0]
            self.f2D.columns = src.shape[1]
            self.f2D.channels = 1
            if (dx == 1) and (dy == 0) :
                if self.filter2DType != 0 :
                    self.filter2DType = 0
                    self.f2D.r1 = 0x000100ff #[-1  0  1]
                    self.f2D.r2 = 0x000200fe #[-2  0  2]
                    self.f2D.r3 = 0x000100ff #[-1  0  1]
            elif (dx == 0) and (dy == 1) :
                if self.filter2DType != 1 :
                    self.filter2DType = 1
                    self.f2D.r1 = 0x00fffeff #[-1 -2 -1]
                    self.f2D.r2 = 0x00000000 #[ 0  0  0]
                    self.f2D.r3 = 0x00010201 #[ 1  2  1]
            else:
                raise RuntimeError("Incorrect dx dy configuration")
            self.img_filters.select_filter(0)
            self.f2D.start()  
            return self.filter2D(src, dst)
        else:   #ksize == 5
            self.f2D_5.rows = src.shape[0]
            self.f2D_5.columns = src.shape[1]
            if (dx == 1) and (dy == 0) :
                if self.filter2D_5Type != 0 :
                    self.filter2D_5Type = 0
                    self.f2D_5.par_V = bytes([ \
                    #-1,  -2,   0,    2,    1,
                    0xff, 0xfe, 0x00, 0x02, 0x01, \
                    #-4,  -8,   0,    8,    4,
                    0xfc, 0xf8, 0x00, 0x08, 0x04, \
                    #-6,  -12,  0,    12,   6,
                    0xfa, 0xf4, 0x00, 0x0c, 0x06, \
                    #-4,  -8,   0,    8,    4,
                    0xfc, 0xf8, 0x00, 0x08, 0x04, \
                    #-1,  -2,   0,    2,    1,
                    0xff, 0xfe, 0x00, 0x02, 0x01, \
                    0,0,0]) #fill up to allign with 4
            elif (dx == 0) and (dy == 1) :
                if self.filter2D_5Type != 1 :
                    self.filter2D_5Type = 1
                    self.f2D_5.par_V = bytes([ \
                    #-1,  -4,   -6,   -4,   -1,
                    0xff, 0xfc, 0xfa, 0xfc, 0xff, \
                    #-2,  -8,   -12,  -8,   -2,
                    0xfe, 0xf8, 0xf4, 0xf8, 0xfe, \
                    # 0,  0,    0,    0,    0,
                    0x00, 0x00, 0x00, 0x00, 0x00, \
                    # 2,  8,    12,   8,    2,
                    0x02, 0x08, 0x0c, 0x08, 0x02, \
                    # 1,  4,    6,    4,    1,
                    0x01, 0x04, 0x06, 0x04, 0x01, \
                    0,0,0]) #fill up to allign with 4
            else:
                raise RuntimeError("Incorrect dx dy configuration")
            self.img_filters.select_filter(1)
            self.f2D_5.start()  
            return self.filter2D(src, dst)  

    def Laplacian(self,src, ddepth, dst, ksize):
        if ksize == 5:
            self.f2D_5.rows = src.shape[0]
            self.f2D_5.columns = src.shape[1]
            if self.filter2D_5Type != 4 :
                self.filter2D_5Type = 4 # "Laplacian_5"
                self.f2D_5.par_V = bytes([ \
                #2,   4,    4,    4,    2,
                0x02, 0x04, 0x04, 0x04, 0x02, \
                #4,   0,    -8,   0,    4,
                0x04, 0x00, 0xf8, 0x00, 0x04, \
                #4,   -8,   -24,  -8,   4,
                0x04, 0xf8, 0xe8, 0xf8, 0x04, \
                #4,   0,    -8,   0,    4,
                0x04, 0x00, 0xf8, 0x00, 0x04, \
                #2,   4,    4,    4,    2,
                0x02, 0x04, 0x04, 0x04, 0x02, \
                0,0,0]) #fill up to allign with 4
            self.img_filters.select_filter(1)
            self.f2D_5.start() 
            return self.filter2D(src, dst) 
        else: #ksize 1 or 3
            self.f2D.rows = src.shape[0]
            self.f2D.columns = src.shape[1]
            self.f2D.channels = 1
            if ksize == 1:
                if (self.filter2DType != 4)  :
                    self.filter2DType = 4 # "Laplacian_1"
                    self.f2D.r1 = 0x00000100 #[ 0  1  0]
                    self.f2D.r2 = 0x0001fc01 #[ 1 -4  1]
                    self.f2D.r3 = 0x00000100 #[ 0  1  0] 
            elif ksize == 3:
                if (self.filter2DType != 5)  :
                    self.filter2DType = 5 # "Laplacian_3"
                    self.f2D.r1 = 0x00020002 #[ 2  0  2]
                    self.f2D.r2 = 0x0000f800 #[ 0 -8  0]
                    self.f2D.r3 = 0x00020002 #[ 2  0  2] 
            self.img_filters.select_filter(0)
            self.f2D.start()
            return self.filter2D(src, dst)

    def filter2D(self, src, dst):
        if hasattr(src, 'physical_address') and hasattr(dst, 'physical_address') :
            self.dmaIn.transfer(dst)
            self.dmaOut.transfer(src)
            self.dmaIn.wait()
            return dst

class cv2pynqDiverImageFilters(DefaultHierarchy):
    def __init__(self, description):
        super().__init__(description)
        self.intc1 = MMIO(0x43C10000, 0x10000)#get axis_interconnect_1
        self.intc2 = MMIO(0x43C20000, 0x10000)#get axis_interconnect_2
        self.filter = 0
        self.intc1.write(0x40 + 0*4, 0x00000000)#select slave0 for master1
        self.intc1.write(0x40 + 1*4, 0x80000000)#disable master1
        self.intc2.write(0x40, self.filter)#select slave# for master0 
        self.intc1.write(0x00, 0x2)#reset interconnect 1
        self.intc2.write(0x00, 0x2)#reset interconnect 2

    @staticmethod
    def checkhierarchy(description):
        if 'axi_dma_0' in description['ip'] \
           and 'axis_interconnect_1' in description['ip'] \
           and 'axis_interconnect_2' in description['ip'] \
           and 'filter2D_hls_0' in description['ip'] \
           and 'filter2D_hls_5_0' in description['ip']:
            return True
        return False
    
    def select_filter(self, filter):
        if not self.filter == filter:
            self.intc1.write(0x40 + self.filter*4, 0x80000000)#disable old master
            self.intc1.write(0x40 + filter*4, 0x00000000)#select slave0 for new master
            self.intc2.write(0x40, filter)#select new slave for master0
            self.intc1.write(0x00, 0x2)#reset interconnect 1
            self.intc2.write(0x00, 0x2)#reset interconnect 2
            self.filter = filter
        
class cv2pynqDriverFilter2D(DefaultIP):
    def __init__(self, description):
        super().__init__(description=description)
        self.reset()
        
    bindto = ['xilinx.com:hls:filter2D_hls:1.0']

    def start(self):
        self.write(0x00, 0x01)

    def auto_restart(self):
        self.write(0x00, 0x81)

    def reset(self):
        self.rows_value = -1
        self.rows = 0
        self.columns_value = -1
        self.columns = 0
        self.channels_value = -1
        self.channels = 1 
        self.mode_value = -1
        self.mode = 0  
        self.r1_value = -1  
        self.r1 = 0
        self.r2_value = -1
        self.r2 = 0
        self.r3_value = -1
        self.r3 = 0
 
    @property
    def rows(self):
        return self.read(0x14)
    @rows.setter
    def rows(self, value):
        if not self.rows_value == value:
            self.write(0x14, value)
            self.rows_value = value

    @property
    def columns(self):
        return self.read(0x1c)
    @columns.setter
    def columns(self, value):
        if not self.columns_value == value:
            self.write(0x1c, value)
            self.columns_value = value

    @property
    def channels(self):
        return self.read(0x24)
    @channels.setter
    def channels(self, value):
        if not self.channels_value == value:
            self.write(0x24, value)
            self.channels_value = value
        
    @property
    def mode(self):
        return self.read(0x2c)
    @mode.setter
    def mode(self, value):
        if not self.mode_value == value:
            self.write(0x2c, value)
            self.mode_value = value    
    
    @property
    def r1(self):
        return self.read(0x34)
    @r1.setter
    def r1(self, value):
        if not self.r1_value == value:
            self.write(0x34, value)
            self.mode_value = value         
    
    @property
    def r2(self):
        return self.read(0x3c)
    @r2.setter
    def r2(self, value):
        if not self.r2_value == value:
            self.write(0x3c, value)
            self.mode_value = value

    @property
    def r3(self):
        return self.read(0x44)
    @r3.setter
    def r3(self, value):
        if not self.r3_value == value:
            self.write(0x44, value)
            self.mode_value = value

class cv2pynqDriverFilter2D_5(DefaultIP):
    def __init__(self, description):
        super().__init__(description=description)
        self.reset()

    bindto = ['xilinx.com:hls:filter2D_hls_5:1.0']

    def start(self):
        self.write(0x00, 0x01)

    def auto_restart(self):
        self.write(0x00, 0x81)

    def reset(self):
        self.rows_value = -1
        self.rows = 0
        self.columns_value = -1
        self.columns = 0
        self.par_V_value = bytes([0,0,0,0])
        self.par_V = 0  
 
    @property
    def rows(self):
        return self.read(0x14)
    @rows.setter
    def rows(self, value):
        if not self.rows_value == value:
            self.write(0x14, value)
            self.rows_value = value

    @property
    def columns(self):
        return self.read(0x1c)
    @columns.setter
    def columns(self, value):
        if not self.columns_value == value:
            self.write(0x1c, value)
            self.columns_value = value

    @property
    def par_V(self):
        return self.read(0x40)
    @par_V.setter
    def par_V(self, value):
        if not self.par_V_value == value:
            self.write(0x40, value)
            self.par_V_value = value    