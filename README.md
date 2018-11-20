# E-Elements_labs PIP INSTALL Package

PYNQ-Z2實作範例 

- 實驗一 : 運用多重迴圈運算 
- 實驗二 : 聲音調變器
- 實驗三 : 實現OpenCV影像處理
- 實驗四 : 實現即時人臉偵測理



## Quick Start

In order to install it to your PYNQ, connect to the board, open a terminal and type:

```
sudo pip3 install git+https://github.com/E-Elements-tw/PYNQ-Z2.git (on PYNQ v2.3)
sudo pip3.6 install git+https://github.com/E-Elements-tw/PYNQ-Z2.git (on PYNQ v2.2 and earlier)
```


## Hardware design rebuilt

In order to rebuild the hardware designs, the repo should be cloned in a machine with installation of the Vivado Design Suite (tested with 2018.2). 
Following the step-by-step instructions:

1.	Clone the repository on your linux machine: git clone https://github.com/Xilinx/BNN-PYNQ.git;
2.	Move to `<clone_path>/BNN_PYNQ/bnn/src/network/`
3.	Set the XILINX_BNN_ROOT environment variable to `<clone_path>/BNN_PYNQ/bnn/src/`
4.	Launch the shell script make-hw.sh with passing parameters for target network, target platform and mode, with the command `./make-hw.sh {network} {platform} {mode}` where:
	- network can be cnvW1A1, cnvW1A2, cnvW2A2 or lfcW1A1, lfcW1A2;
	- platform can be pynqZ1-Z2 or ultra96;
	- mode can be `h` to launch Vivado HLS synthesis, `b` to launch the Vivado project (needs HLS synthesis results), `a` to launch both;
5.	The results will be visible in `clone_path/BNN_PYNQ/bnn/src/network/output/` that is organized as follows:
	- bitstream: contains the generated bitstream(s);
	- hls-syn: contains the Vivado HLS generated RTL and IP (in the subfolder named as the target network and target platform);
	- report: contains the Vivado and Vivado HLS reports;
	- vivado: contains the Vivado project;
6.	Copy the generated bitstream and tcl script on the PYNQ board `pip_installation_path/bnn/bitstreams/`

