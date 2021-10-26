#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Hands_on_6
# Author: Vicente Sousa 
# Generated: Fri Jul 31 15:43:08 2015
##################################################

from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
from gnuradio import analog
from gnuradio import audio
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import filter
from gnuradio import gr
from gnuradio import qtgui
from gnuradio import uhd
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import sip
import sys
import time

from distutils.version import StrictVersion
class top_block(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Hands_on_6")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Hands_on_6")
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
        self.samp_rate = samp_rate = 500e3
        self.xlate_tune = xlate_tune = 0
        self.usrp_freq = usrp_freq = 104.7e6
        self.rf_gain = rf_gain = 30
        self.filter_taps = filter_taps = firdes.low_pass(1,samp_rate,250000,20000, firdes.WIN_HAMMING,6.76)
        self.af_gain = af_gain = 3

        ##################################################
        # Blocks
        ##################################################
        self._xlate_tune_layout = Qt.QVBoxLayout()
        self._xlate_tune_tool_bar = Qt.QToolBar(self)
        self._xlate_tune_layout.addWidget(self._xlate_tune_tool_bar)
        self._xlate_tune_tool_bar.addWidget(Qt.QLabel("Fine Frequency"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._xlate_tune_counter = qwt_counter_pyslot()
        self._xlate_tune_counter.setRange(-250e3, 250e3, 500)
        self._xlate_tune_counter.setNumButtons(2)
        self._xlate_tune_counter.setValue(self.xlate_tune)
        self._xlate_tune_tool_bar.addWidget(self._xlate_tune_counter)
        self._xlate_tune_counter.valueChanged.connect(self.set_xlate_tune)
        self._xlate_tune_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._xlate_tune_slider.setRange(-250e3, 250e3, 500)
        self._xlate_tune_slider.setValue(self.xlate_tune)
        self._xlate_tune_slider.setMinimumWidth(200)
        self._xlate_tune_slider.valueChanged.connect(self.set_xlate_tune)
        self._xlate_tune_layout.addWidget(self._xlate_tune_slider)
        self.top_layout.addLayout(self._xlate_tune_layout)
        self._usrp_freq_layout = Qt.QVBoxLayout()
        self._usrp_freq_tool_bar = Qt.QToolBar(self)
        self._usrp_freq_layout.addWidget(self._usrp_freq_tool_bar)
        self._usrp_freq_tool_bar.addWidget(Qt.QLabel("Frequencia Central"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._usrp_freq_counter = qwt_counter_pyslot()
        self._usrp_freq_counter.setRange(88e6, 108e6, 200)
        self._usrp_freq_counter.setNumButtons(2)
        self._usrp_freq_counter.setValue(self.usrp_freq)
        self._usrp_freq_tool_bar.addWidget(self._usrp_freq_counter)
        self._usrp_freq_counter.valueChanged.connect(self.set_usrp_freq)
        self._usrp_freq_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._usrp_freq_slider.setRange(88e6, 108e6, 200)
        self._usrp_freq_slider.setValue(self.usrp_freq)
        self._usrp_freq_slider.setMinimumWidth(200)
        self._usrp_freq_slider.valueChanged.connect(self.set_usrp_freq)
        self._usrp_freq_layout.addWidget(self._usrp_freq_slider)
        self.top_layout.addLayout(self._usrp_freq_layout)
        self._rf_gain_layout = Qt.QVBoxLayout()
        self._rf_gain_tool_bar = Qt.QToolBar(self)
        self._rf_gain_layout.addWidget(self._rf_gain_tool_bar)
        self._rf_gain_tool_bar.addWidget(Qt.QLabel("Ganho de RF"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._rf_gain_counter = qwt_counter_pyslot()
        self._rf_gain_counter.setRange(0, 50, 50)
        self._rf_gain_counter.setNumButtons(2)
        self._rf_gain_counter.setValue(self.rf_gain)
        self._rf_gain_tool_bar.addWidget(self._rf_gain_counter)
        self._rf_gain_counter.valueChanged.connect(self.set_rf_gain)
        self._rf_gain_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._rf_gain_slider.setRange(0, 50, 50)
        self._rf_gain_slider.setValue(self.rf_gain)
        self._rf_gain_slider.setMinimumWidth(200)
        self._rf_gain_slider.valueChanged.connect(self.set_rf_gain)
        self._rf_gain_layout.addWidget(self._rf_gain_slider)
        self.top_layout.addLayout(self._rf_gain_layout)
        self._af_gain_layout = Qt.QVBoxLayout()
        self._af_gain_tool_bar = Qt.QToolBar(self)
        self._af_gain_layout.addWidget(self._af_gain_tool_bar)
        self._af_gain_tool_bar.addWidget(Qt.QLabel("AF"+": "))
        class qwt_counter_pyslot(Qwt.QwtCounter):
            def __init__(self, parent=None):
                Qwt.QwtCounter.__init__(self, parent)
            @pyqtSlot('double')
            def setValue(self, value):
                super(Qwt.QwtCounter, self).setValue(value)
        self._af_gain_counter = qwt_counter_pyslot()
        self._af_gain_counter.setRange(0, 10, 100)
        self._af_gain_counter.setNumButtons(2)
        self._af_gain_counter.setValue(self.af_gain)
        self._af_gain_tool_bar.addWidget(self._af_gain_counter)
        self._af_gain_counter.valueChanged.connect(self.set_af_gain)
        self._af_gain_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._af_gain_slider.setRange(0, 10, 100)
        self._af_gain_slider.setValue(self.af_gain)
        self._af_gain_slider.setMinimumWidth(200)
        self._af_gain_slider.valueChanged.connect(self.set_af_gain)
        self._af_gain_layout.addWidget(self._af_gain_slider)
        self.top_layout.addLayout(self._af_gain_layout)
        self.uhd_usrp_source_0 = uhd.usrp_source(
        	",".join(("", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_source_0.set_samp_rate(samp_rate)
        self.uhd_usrp_source_0.set_center_freq(usrp_freq, 0)
        self.uhd_usrp_source_0.set_gain(rf_gain, 0)
        self.rr_stereo_right = filter.rational_resampler_fff(
                interpolation=500,
                decimation=441,
                taps=None,
                fractional_bw=None,
        )
        self.rr_stereo_left = filter.rational_resampler_fff(
                interpolation=500,
                decimation=441,
                taps=None,
                fractional_bw=None,
        )
        self.qtgui_freq_sink_x_0 = qtgui.freq_sink_f(
        	1024, #size
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	usrp_freq, #fc
        	samp_rate, #bw
        	"Espectro L", #name
        	1 #number of inputs
        )
        self.qtgui_freq_sink_x_0.set_update_time(0.10)
        self.qtgui_freq_sink_x_0.set_y_axis(-140, 10)
        self.qtgui_freq_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, 0.0, 0, "")
        self.qtgui_freq_sink_x_0.enable_autoscale(False)
        self.qtgui_freq_sink_x_0.enable_grid(False)
        self.qtgui_freq_sink_x_0.set_fft_average(1.0)
        
        if float == type(float()):
          self.qtgui_freq_sink_x_0.set_plot_pos_half(not True)
        
        labels = ["", "", "", "", "",
                  "", "", "", "", ""]
        widths = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        colors = ["blue", "red", "green", "black", "cyan",
                  "magenta", "yellow", "dark red", "dark green", "dark blue"]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
                  1.0, 1.0, 1.0, 1.0, 1.0]
        for i in xrange(1):
            if len(labels[i]) == 0:
                self.qtgui_freq_sink_x_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_freq_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_freq_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_freq_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_freq_sink_x_0.set_line_alpha(i, alphas[i])
        
        self._qtgui_freq_sink_x_0_win = sip.wrapinstance(self.qtgui_freq_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_freq_sink_x_0_win)
        self.freq_xlating_fir_filter_xxx_0 = filter.freq_xlating_fir_filter_ccc(1, (filter_taps), -xlate_tune, samp_rate)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_float*1, samp_rate,True)
        self.audio_sink_0 = audio.sink(44100, "", True)
        self.analog_wfm_rcv_pll_0 = analog.wfm_rcv_pll(
        	demod_rate=samp_rate,
        	audio_decimation=10,
        )
        self.af_gain_stereo_right = blocks.multiply_const_vff((af_gain, ))
        self.af_gain_stereo_left = blocks.multiply_const_vff((af_gain, ))

        ##################################################
        # Connections
        ##################################################
        self.connect((self.af_gain_stereo_left, 0), (self.audio_sink_0, 0))    
        self.connect((self.af_gain_stereo_right, 0), (self.audio_sink_0, 1))    
        self.connect((self.analog_wfm_rcv_pll_0, 0), (self.blocks_throttle_0, 0))    
        self.connect((self.analog_wfm_rcv_pll_0, 0), (self.rr_stereo_left, 0))    
        self.connect((self.analog_wfm_rcv_pll_0, 1), (self.rr_stereo_right, 0))    
        self.connect((self.blocks_throttle_0, 0), (self.qtgui_freq_sink_x_0, 0))    
        self.connect((self.freq_xlating_fir_filter_xxx_0, 0), (self.analog_wfm_rcv_pll_0, 0))    
        self.connect((self.rr_stereo_left, 0), (self.af_gain_stereo_left, 0))    
        self.connect((self.rr_stereo_right, 0), (self.af_gain_stereo_right, 0))    
        self.connect((self.uhd_usrp_source_0, 0), (self.freq_xlating_fir_filter_xxx_0, 0))    

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.set_filter_taps(firdes.low_pass(1,self.samp_rate,250000,20000, firdes.WIN_HAMMING,6.76))
        self.uhd_usrp_source_0.set_samp_rate(self.samp_rate)
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
        self.qtgui_freq_sink_x_0.set_frequency_range(self.usrp_freq, self.samp_rate)

    def get_xlate_tune(self):
        return self.xlate_tune

    def set_xlate_tune(self, xlate_tune):
        self.xlate_tune = xlate_tune
        self.freq_xlating_fir_filter_xxx_0.set_center_freq(-self.xlate_tune)
        Qt.QMetaObject.invokeMethod(self._xlate_tune_counter, "setValue", Qt.Q_ARG("double", self.xlate_tune))
        Qt.QMetaObject.invokeMethod(self._xlate_tune_slider, "setValue", Qt.Q_ARG("double", self.xlate_tune))

    def get_usrp_freq(self):
        return self.usrp_freq

    def set_usrp_freq(self, usrp_freq):
        self.usrp_freq = usrp_freq
        self.uhd_usrp_source_0.set_center_freq(self.usrp_freq, 0)
        self.qtgui_freq_sink_x_0.set_frequency_range(self.usrp_freq, self.samp_rate)
        Qt.QMetaObject.invokeMethod(self._usrp_freq_counter, "setValue", Qt.Q_ARG("double", self.usrp_freq))
        Qt.QMetaObject.invokeMethod(self._usrp_freq_slider, "setValue", Qt.Q_ARG("double", self.usrp_freq))

    def get_rf_gain(self):
        return self.rf_gain

    def set_rf_gain(self, rf_gain):
        self.rf_gain = rf_gain
        self.uhd_usrp_source_0.set_gain(self.rf_gain, 0)
        Qt.QMetaObject.invokeMethod(self._rf_gain_counter, "setValue", Qt.Q_ARG("double", self.rf_gain))
        Qt.QMetaObject.invokeMethod(self._rf_gain_slider, "setValue", Qt.Q_ARG("double", self.rf_gain))

    def get_filter_taps(self):
        return self.filter_taps

    def set_filter_taps(self, filter_taps):
        self.filter_taps = filter_taps
        self.freq_xlating_fir_filter_xxx_0.set_taps((self.filter_taps))

    def get_af_gain(self):
        return self.af_gain

    def set_af_gain(self, af_gain):
        self.af_gain = af_gain
        self.af_gain_stereo_right.set_k((self.af_gain, ))
        self.af_gain_stereo_left.set_k((self.af_gain, ))
        Qt.QMetaObject.invokeMethod(self._af_gain_counter, "setValue", Qt.Q_ARG("double", self.af_gain))
        Qt.QMetaObject.invokeMethod(self._af_gain_slider, "setValue", Qt.Q_ARG("double", self.af_gain))

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
