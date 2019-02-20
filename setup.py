#   Copyright (c) 2016, Xilinx, Inc.
#   All rights reserved.
# 
#   Redistribution and use in source and binary forms, with or without 
#   modification, are permitted provided that the following conditions are met:
#
#   1.  Redistributions of source code must retain the above copyright notice, 
#       this list of conditions and the following disclaimer.
#
#   2.  Redistributions in binary form must reproduce the above copyright 
#       notice, this list of conditions and the following disclaimer in the 
#       documentation and/or other materials provided with the distribution.
#
#   3.  Neither the name of the copyright holder nor the names of its 
#       contributors may be used to endorse or promote products derived from 
#       this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
#   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
#   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
#   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#   OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
#   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
#   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
#   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

from setuptools import setup, find_packages
import subprocess
import sys
import shutil
import E_Elements_labs
import os
from glob import glob
import site 

if os.environ['BOARD'] != 'Pynq-Z2-Package':
	print("Not E-Elements Pynq-Z2 package ,please contact your supplier ")
	exit(1)

setup(
	name = "E_Elements_labs",
	version = E_Elements_labs.__version__,
	url = 'pynq',
	license = 'Software License',
	author = "E-Elements",
	author_email = "jin.chen@e-elements.com",
	include_package_data = True,
	packages = ['E_Elements_labs'],
	package_data = {
	'' : ['*.bit','*.tcl','*.py'],
	},
	data_files = [(os.path.join('/home/xilinx/jupyter_notebooks/E_Elements_labs',root.replace('notebooks/','')), [os.path.join(root, f) for f in files]) for root, dirs, files in os.walk('notebooks/')],
	description = "PYNQ-Z2 labs using a hardware accelerated "
)

if os.path.isdir(os.environ["PYNQ_JUPYTER_NOTEBOOKS"]+"/E_Elements_labs/"):
	shutil.rmtree(os.environ["PYNQ_JUPYTER_NOTEBOOKS"]+"/E_Elements_labs/")
shutil.copytree("notebooks/",os.environ["PYNQ_JUPYTER_NOTEBOOKS"]+"/E_Elements_labs/")