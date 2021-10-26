#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Top Block
# Generated: Fri Jul 31 15:37:28 2015
##################################################

from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
from gnuradio import analog
from gnuradio import audio
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import uhd
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import sys
import time

from distutils.version import StrictVersion
class top_block(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Top Block")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Top Block")
        try:
             self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
             pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())


        ##################################################
        # Variables
        ##################################################
        self.slider_0 = slider_0 = 1
        self.samp_rate = samp_rate = 44100

        ##################################################
        # Blocks
        ##################################################
        self._slider_0_layout = Qt.QVBoxLayout()
        self._slider_0_tool_bar = Qt.QToolBar(self)
        self._slider_0_layout.addWidget(self._slider_0_tool_bar)
        self._slider_0_tool_bar.addWidget(Qt.QLabel("slider_0"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._slider_0_counter = qwt_counter_pyslot()
        self._slider_0_counter.setRange(0, 30, 0.1)
        self._slider_0_counter.setNumButtons(2)
        self._slider_0_counter.setValue(self.slider_0)
        self._slider_0_tool_bar.addWidget(self._slider_0_counter)
        self._slider_0_counter.valueChanged.connect(self.set_slider_0)
        self._slider_0_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._slider_0_slider.setRange(0, 30, 0.1)
        self._slider_0_slider.setValue(self.slider_0)
        self._slider_0_slider.setMinimumWidth(400)
        self._slider_0_slider.valueChanged.connect(self.set_slider_0)
        self._slider_0_layout.addWidget(self._slider_0_slider)
        self.top_layout.addLayout(self._slider_0_layout)
        self.uhd_usrp_sink_0 = uhd.usrp_sink(
        	",".join(("", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_sink_0.set_samp_rate(884956)
        self.uhd_usrp_sink_0.set_center_freq(88.2e6, 0)
        self.uhd_usrp_sink_0.set_gain(10, 0)
        self.blocks_multiply_const_vxx_0_0 = blocks.multiply_const_vff((slider_0, ))
        self.audio_source_0 = audio.source(samp_rate, "", True)
        self.analog_wfm_tx_0 = analog.wfm_tx(
        	audio_rate=44100,
        	quad_rate=882000,
        	tau=75e-6,
        	max_dev=75e3,
        )

        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_wfm_tx_0, 0), (self.uhd_usrp_sink_0, 0))    
        self.connect((self.audio_source_0, 0), (self.blocks_multiply_const_vxx_0_0, 0))    
        self.connect((self.blocks_multiply_const_vxx_0_0, 0), (self.analog_wfm_tx_0, 0))    

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_slider_0(self):
        return self.slider_0

    def set_slider_0(self, slider_0):
        self.slider_0 = slider_0
        Qt.QMetaObject.invokeMethod(self._slider_0_counter, "setValue", Qt.Q_ARG("double", self.slider_0))
        Qt.QMetaObject.invokeMethod(self._slider_0_slider, "setValue", Qt.Q_ARG("double", self.slider_0))
        self.blocks_multiply_const_vxx_0_0.set_k((self.slider_0, ))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"
    parser = OptionParser(option_class=eng_option, usage="%prog: [options]")
    (options, args) = parser.parse_args()
    if(StrictVersion(Qt.qVersion()) >= StrictVersion("4.5.0")):
        Qt.QApplication.setGraphicsSystem(gr.prefs().get_string('qtgui','style','raster'))
    qapp = Qt.QApplication(sys.argv)
    tb = top_block()
    tb.start()
    tb.show()
    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()
    tb = None #to clean up Qt widgets
