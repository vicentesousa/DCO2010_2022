#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Ho1_USRP
# Author: Leonardo
# Generated: Fri Jul 31 15:16:09 2015
##################################################

from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
from gnuradio import blocks
from gnuradio import eng_notation
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
        gr.top_block.__init__(self, "Ho1_USRP")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Ho1_USRP")
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
        self.samp_rate = samp_rate = 1000000
        self.gain_rf = gain_rf = 70
        self.freq_fina = freq_fina = 0
        self.freq = freq = 98.9e6

        ##################################################
        # Blocks
        ##################################################
        self.janela = Qt.QTabWidget()
        self.janela_widget_0 = Qt.QWidget()
        self.janela_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.janela_widget_0)
        self.janela_grid_layout_0 = Qt.QGridLayout()
        self.janela_layout_0.addLayout(self.janela_grid_layout_0)
        self.janela.addTab(self.janela_widget_0, "Waterfall")
        self.janela_widget_1 = Qt.QWidget()
        self.janela_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.janela_widget_1)
        self.janela_grid_layout_1 = Qt.QGridLayout()
        self.janela_layout_1.addLayout(self.janela_grid_layout_1)
        self.janela.addTab(self.janela_widget_1, "Espectro WBFM")
        self.top_layout.addWidget(self.janela)
        self._gain_rf_layout = Qt.QVBoxLayout()
        self._gain_rf_label = Qt.QLabel("Ganho (dB)")
        self._gain_rf_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._gain_rf_slider.setRange(0, 110, 10)
        self._gain_rf_slider.setValue(self.gain_rf)
        self._gain_rf_slider.setMinimumWidth(50)
        self._gain_rf_slider.valueChanged.connect(self.set_gain_rf)
        self._gain_rf_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._gain_rf_layout.addWidget(self._gain_rf_label)
        self._gain_rf_layout.addWidget(self._gain_rf_slider)
        self.top_layout.addLayout(self._gain_rf_layout)
        self._freq_fina_layout = Qt.QVBoxLayout()
        self._freq_fina_label = Qt.QLabel("Ajuste Fino")
        self._freq_fina_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._freq_fina_slider.setRange(-250e3, 250e3, 500)
        self._freq_fina_slider.setValue(self.freq_fina)
        self._freq_fina_slider.setMinimumWidth(50)
        self._freq_fina_slider.valueChanged.connect(self.set_freq_fina)
        self._freq_fina_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._freq_fina_layout.addWidget(self._freq_fina_label)
        self._freq_fina_layout.addWidget(self._freq_fina_slider)
        self.top_layout.addLayout(self._freq_fina_layout)
        self._freq_layout = Qt.QVBoxLayout()
        self._freq_label = Qt.QLabel("Frequencia Central")
        self._freq_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._freq_slider.setRange(88e6, 108e6, 100)
        self._freq_slider.setValue(self.freq)
        self._freq_slider.setMinimumWidth(50)
        self._freq_slider.valueChanged.connect(self.set_freq)
        self._freq_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._freq_layout.addWidget(self._freq_label)
        self._freq_layout.addWidget(self._freq_slider)
        self.top_layout.addLayout(self._freq_layout)
        self.uhd_usrp_source_0 = uhd.usrp_source(
        	",".join(("", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_source_0.set_samp_rate(samp_rate)
        self.uhd_usrp_source_0.set_center_freq(freq+freq_fina, 0)
        self.uhd_usrp_source_0.set_gain(gain_rf, 0)
        self.qtgui_waterfall_sink_x_0 = qtgui.waterfall_sink_c(
        	1024, #size
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	freq+freq_fina, #fc
        	samp_rate, #bw
        	"", #name
                1 #number of inputs
        )
        self.qtgui_waterfall_sink_x_0.set_update_time(0.10)
        self.qtgui_waterfall_sink_x_0.enable_grid(False)
        
        if complex == type(float()):
          self.qtgui_waterfall_sink_x_0.set_plot_pos_half(not True)
        
        labels = ["", "", "", "", "",
                  "", "", "", "", ""]
        colors = [0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
                  1.0, 1.0, 1.0, 1.0, 1.0]
        for i in xrange(1):
            if len(labels[i]) == 0:
                self.qtgui_waterfall_sink_x_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_waterfall_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_waterfall_sink_x_0.set_color_map(i, colors[i])
            self.qtgui_waterfall_sink_x_0.set_line_alpha(i, alphas[i])
        
        self.qtgui_waterfall_sink_x_0.set_intensity_range(-100, 10)
        
        self._qtgui_waterfall_sink_x_0_win = sip.wrapinstance(self.qtgui_waterfall_sink_x_0.pyqwidget(), Qt.QWidget)
        self.janela_layout_0.addWidget(self._qtgui_waterfall_sink_x_0_win)
        self.qtgui_freq_sink_x_0 = qtgui.freq_sink_c(
        	1024, #size
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	98.9e6, #fc
        	samp_rate, #bw
        	"", #name
        	1 #number of inputs
        )
        self.qtgui_freq_sink_x_0.set_update_time(0.10)
        self.qtgui_freq_sink_x_0.set_y_axis(-140, 10)
        self.qtgui_freq_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, 0.0, 0, "")
        self.qtgui_freq_sink_x_0.enable_autoscale(False)
        self.qtgui_freq_sink_x_0.enable_grid(False)
        self.qtgui_freq_sink_x_0.set_fft_average(1.0)
        
        if complex == type(float()):
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
        self.janela_layout_1.addWidget(self._qtgui_freq_sink_x_0_win)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, samp_rate,True)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_throttle_0, 0), (self.qtgui_freq_sink_x_0, 0))    
        self.connect((self.blocks_throttle_0, 0), (self.qtgui_waterfall_sink_x_0, 0))    
        self.connect((self.uhd_usrp_source_0, 0), (self.blocks_throttle_0, 0))    

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.uhd_usrp_source_0.set_samp_rate(self.samp_rate)
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)
        self.qtgui_waterfall_sink_x_0.set_frequency_range(self.freq+self.freq_fina, self.samp_rate)
        self.qtgui_freq_sink_x_0.set_frequency_range(98.9e6, self.samp_rate)

    def get_gain_rf(self):
        return self.gain_rf

    def set_gain_rf(self, gain_rf):
        self.gain_rf = gain_rf
        Qt.QMetaObject.invokeMethod(self._gain_rf_slider, "setValue", Qt.Q_ARG("double", self.gain_rf))
        self.uhd_usrp_source_0.set_gain(self.gain_rf, 0)

    def get_freq_fina(self):
        return self.freq_fina

    def set_freq_fina(self, freq_fina):
        self.freq_fina = freq_fina
        self.uhd_usrp_source_0.set_center_freq(self.freq+self.freq_fina, 0)
        self.qtgui_waterfall_sink_x_0.set_frequency_range(self.freq+self.freq_fina, self.samp_rate)
        Qt.QMetaObject.invokeMethod(self._freq_fina_slider, "setValue", Qt.Q_ARG("double", self.freq_fina))

    def get_freq(self):
        return self.freq

    def set_freq(self, freq):
        self.freq = freq
        self.uhd_usrp_source_0.set_center_freq(self.freq+self.freq_fina, 0)
        self.qtgui_waterfall_sink_x_0.set_frequency_range(self.freq+self.freq_fina, self.samp_rate)
        Qt.QMetaObject.invokeMethod(self._freq_slider, "setValue", Qt.Q_ARG("double", self.freq))

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
