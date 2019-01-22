# E-Elements_labs PIP INSTALL Package

PYNQ-Z2實作範例 

- 實作一 : 多重迴圈運算 
- 實作二 : 聲音調變器
- 實作三 : OpenCV影像處理
- 實作四 : 即時人臉偵測



## Quick Start

將實作範例安裝到PYNQ，請先連接到PYNQ-Z2開發版，打開終端並鍵入：

```
sudo pip3 install git+https://github.com/E-Elements-tw/PYNQ-Z2.git (on PYNQ v2.3)
sudo pip3.6 install git+https://github.com/E-Elements-tw/PYNQ-Z2.git (on PYNQ v2.2 and earlier)
```

# PYNQ-Z2 Hardware design rebuilt

重建硬體設計，將範例檔案下載到安裝Vivado Design Suite的機器中（使用2018.2版本）。 按照以下步驟說明進行操作：

1.下載並解壓縮檔案到你的電腦:https://github.com/E-Elements-tw/PYNQ-Z2.git

2.開啟Vivado Design Suite軟體，在Tcl Console鍵入:
```
  cd <範例檔案路徑>/PYNQ-Z2-master/E_Elements_labs/src/Pynq-Z2/  
```
3.在專案路徑下建立所需的IP，在Tcl Console鍵入:
```
  source ./build_base_ip.tcl
```
4.建立實作專案: 

     ○ 實作一 (多重迴圈運算)，在Tcl Console鍵入:
      source ./lab1.tcl 

     
     ○ 實作二 (實現聲音調變器)，在Tcl Console鍵入:
      source ./lab2.tcl 

 
     ○ 實作三 (實現OpenCV影像處理)，在Tcl Console鍵入:      
      source ./lab3.tcl 

