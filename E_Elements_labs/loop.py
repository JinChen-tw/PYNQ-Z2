from pynq import Overlay

class TestOverlay(Overlay):
  
    def loop(self, I):
        self.testloop_0.write(0x10, I)
        return self.testloop_0.read(0x18)