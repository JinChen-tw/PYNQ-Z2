import cv2
from cv2 import *
import numpy as np
from .cv2pynq import *
from pynq.lib.video import *

__version__ = 0.3

c = cv2pynq()
video = c.ol.video #cv2pynq uses the pynq video library and the Pynq-Z2 video subsystem

def Sobel(src, ddepth, dx, dy, dst=None, ksize=3, scale=1, delta=0, borderType=cv2.BORDER_DEFAULT):
    """dst = cv.Sobel(	src, ddepth, dx, dy[, dst[, ksize[, scale[, delta[, borderType]]]]]	)
    Executes the Sobel operator on hardware if input parameters fit to hardware constraints.
    Otherwise the OpenCV Sobel function is called."""
    if (ksize == 3 or ksize == 5) and (scale == 1) and (delta == 0) and (borderType == cv2.BORDER_DEFAULT) :
        if (src.dtype == np.uint8) and (src.ndim == 2) :
            if (src.shape[0] <= cv2pynq.MAX_HEIGHT) and (src.shape[0] > 0) and (src.shape[1] <= cv2pynq.MAX_WIDTH) and (src.shape[1] > 0) :
                if ((ddepth == -1) and (dx == 1) and (dy == 0)) or ((ddepth == -1) and (dx == 0) and (dy == 1)) :
                    return c.Sobel(src, ddepth, dx, dy, dst, ksize)   
    return cv2.Sobel(src, ddepth, dx, dy, dst, ksize, scale, delta, borderType)

def Laplacian(src, ddepth, dst=None, ksize=1, scale=1, delta=0, borderType=cv2.BORDER_DEFAULT):
    """dst = cv.Laplacian( src, ddepth[, dst[, ksize[, scale[, delta[, borderType]]]]]	)
    Executes the Laplacian operator on hardware if input parameters fit to hardware constraints.
    Otherwise the OpenCV Laplacian function is called."""
    if (ksize == 1 or ksize ==3 or ksize == 5) and (scale == 1) and (delta == 0) and (borderType == cv2.BORDER_DEFAULT) :
        if (src.dtype == np.uint8) and (src.ndim == 2) :
            if (src.shape[0] <= cv2pynq.MAX_HEIGHT) and (src.shape[0] > 0) and (src.shape[1] <= cv2pynq.MAX_WIDTH) and (src.shape[1] > 0) :
                if (ddepth == -1) :
                    return c.Laplacian(src, ddepth, dst, ksize)   
    return cv2.Laplacian(src, ddepth, dst, ksize, scale, delta, borderType)

def close():
    '''this function should be called after using the cv2pynq library.
    It cleans up the internal state and frees the used CMA-buffers.
    '''
    c.close()