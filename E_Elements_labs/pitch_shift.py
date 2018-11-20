from pynq import Overlay

class pitch(Overlay):
	
	def start(self):	
		self.pitchshift.write(0x00, 0x01)
		
	def data_len(self, length):	
		self.pitchshift.write(0x10, length)
	