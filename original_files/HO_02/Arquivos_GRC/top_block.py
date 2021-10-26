#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Top Block
# Generated: Fri Jul 31 15:20:03 2015
##################################################

from PyQt4 import Qt
from PyQt4.QtCore import QObject, pyqtSlot
from gnuradio import audio
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import filter
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import PyQt4.Qwt5 as Qwt
import sip
import sys

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
        self.slider_low_pass = slider_low_pass = 1
        self.slider_high_pass = slider_high_pass = 1
        self.slider_band_pass = slider_band_pass = 1
        self.samp_rate = samp_rate = 44100

        ##################################################
        # Blocks
        ##################################################
        self.janela = Qt.QTabWidget()
        self.janela_widget_0 = Qt.QWidget()
        self.janela_layout_0 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.janela_widget_0)
        self.janela_grid_layout_0 = Qt.QGridLayout()
        self.janela_layout_0.addLayout(self.janela_grid_layout_0)
        self.janela.addTab(self.janela_widget_0, "Controles")
        self.janela_widget_1 = Qt.QWidget()
        self.janela_layout_1 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.janela_widget_1)
        self.janela_grid_layout_1 = Qt.QGridLayout()
        self.janela_layout_1.addLayout(self.janela_grid_layout_1)
        self.janela.addTab(self.janela_widget_1, "Sinal Original")
        self.janela_widget_2 = Qt.QWidget()
        self.janela_layout_2 = Qt.QBoxLayout(Qt.QBoxLayout.TopToBottom, self.janela_widget_2)
        self.janela_grid_layout_2 = Qt.QGridLayout()
        self.janela_layout_2.addLayout(self.janela_grid_layout_2)
        self.janela.addTab(self.janela_widget_2, "Sinal Filtrado")
        self.top_layout.addWidget(self.janela)
        self._slider_low_pass_layout = Qt.QVBoxLayout()
        self._slider_low_pass_label = Qt.QLabel("Grave")
        self._slider_low_pass_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._slider_low_pass_slider.setRange(1, 5, 0.1)
        self._slider_low_pass_slider.setValue(self.slider_low_pass)
        self._slider_low_pass_slider.setMinimumWidth(200)
        self._slider_low_pass_slider.valueChanged.connect(self.set_slider_low_pass)
        self._slider_low_pass_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._slider_low_pass_layout.addWidget(self._slider_low_pass_label)
        self._slider_low_pass_layout.addWidget(self._slider_low_pass_slider)
        self.janela_layout_0.addLayout(self._slider_low_pass_layout)
        self._slider_high_pass_layout = Qt.QVBoxLayout()
        self._slider_high_pass_label = Qt.QLabel("Agudo")
        self._slider_high_pass_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._slider_high_pass_slider.setRange(1, 10, 0.1)
        self._slider_high_pass_slider.setValue(self.slider_high_pass)
        self._slider_high_pass_slider.setMinimumWidth(200)
        self._slider_high_pass_slider.valueChanged.connect(self.set_slider_high_pass)
        self._slider_high_pass_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._slider_high_pass_layout.addWidget(self._slider_high_pass_label)
        self._slider_high_pass_layout.addWidget(self._slider_high_pass_slider)
        self.janela_layout_0.addLayout(self._slider_high_pass_layout)
        self._slider_band_pass_layout = Qt.QVBoxLayout()
        self._slider_band_pass_label = Qt.QLabel("Medio")
        self._slider_band_pass_slider = Qwt.QwtSlider(None, Qt.Qt.Horizontal, Qwt.QwtSlider.BottomScale, Qwt.QwtSlider.BgSlot)
        self._slider_band_pass_slider.setRange(1, 10, 0.1)
        self._slider_band_pass_slider.setValue(self.slider_band_pass)
        self._slider_band_pass_slider.setMinimumWidth(200)
        self._slider_band_pass_slider.valueChanged.connect(self.set_slider_band_pass)
        self._slider_band_pass_label.setAlignment(Qt.Qt.AlignBottom | Qt.Qt.AlignHCenter)
        self._slider_band_pass_layout.addWidget(self._slider_band_pass_label)
        self._slider_band_pass_layout.addWidget(self._slider_band_pass_slider)
        self.janela_layout_0.addLayout(self._slider_band_pass_layout)
        self.rational_resampler_xxx_0 = filter.rational_resampler_fff(
                interpolation=1,
                decimation=1,
                taps=None,
                fractional_bw=None,
        )
        self.qtgui_freq_sink_x_0_0 = qtgui.freq_sink_f(
        	1024, #size
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	0, #fc
        	samp_rate, #bw
        	"FFT Plot", #name
        	1 #number of inputs
        )
        self.qtgui_freq_sink_x_0_0.set_update_time(0.10)
        self.qtgui_freq_sink_x_0_0.set_y_axis(-140, -5)
        self.qtgui_freq_sink_x_0_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, 0.0, 0, "")
        self.qtgui_freq_sink_x_0_0.enable_autoscale(False)
        self.qtgui_freq_sink_x_0_0.enable_grid(False)
        self.qtgui_freq_sink_x_0_0.set_fft_average(1.0)
        
        if float == type(float()):
          self.qtgui_freq_sink_x_0_0.set_plot_pos_half(not True)
        
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
                self.qtgui_freq_sink_x_0_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_freq_sink_x_0_0.set_line_label(i, labels[i])
            self.qtgui_freq_sink_x_0_0.set_line_width(i, widths[i])
            self.qtgui_freq_sink_x_0_0.set_line_color(i, colors[i])
            self.qtgui_freq_sink_x_0_0.set_line_alpha(i, alphas[i])
        
        self._qtgui_freq_sink_x_0_0_win = sip.wrapinstance(self.qtgui_freq_sink_x_0_0.pyqwidget(), Qt.QWidget)
        self.janela_layout_1.addWidget(self._qtgui_freq_sink_x_0_0_win)
        self.qtgui_freq_sink_x_0 = qtgui.freq_sink_f(
        	1024, #size
        	firdes.WIN_BLACKMAN_hARRIS, #wintype
        	0, #fc
        	samp_rate, #bw
        	"FFT Plot - Sinal Filtrado", #name
        	1 #number of inputs
        )
        self.qtgui_freq_sink_x_0.set_update_time(0.10)
        self.qtgui_freq_sink_x_0.set_y_axis(-140, -5)
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
        self.janela_layout_2.addWidget(self._qtgui_freq_sink_x_0_win)
        self.low_pass_filter_0 = filter.fir_filter_fff(1, firdes.low_pass(
        	1, samp_rate, 240, 10, firdes.WIN_HAMMING, 6.76))
        self.high_pass_filter_0 = filter.fir_filter_fff(1, firdes.high_pass(
        	1, samp_rate, 4000, 10, firdes.WIN_HAMMING, 6.76))
        self.blocks_wavfile_source_0 = blocks.wavfile_source("/home/gppcom/Downloads/handson2_file_minicurso_44_1KHz.wav", True)
        self.blocks_multiply_const_vxx_2 = blocks.multiply_const_vff((slider_high_pass, ))
        self.blocks_multiply_const_vxx_1 = blocks.multiply_const_vff((slider_band_pass, ))
        self.blocks_multiply_const_vxx_0 = blocks.multiply_const_vff((slider_low_pass, ))
        self.blocks_add_xx_0 = blocks.add_vff(1)
        self.band_pass_filter_0 = filter.fir_filter_fff(1, firdes.band_pass(
        	1, samp_rate, 250, 3900, 10, firdes.WIN_HAMMING, 6.76))
        self.audio_sink_0 = audio.sink(samp_rate, "", True)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.band_pass_filter_0, 0), (self.blocks_multiply_const_vxx_1, 0))    
        self.connect((self.blocks_add_xx_0, 0), (self.audio_sink_0, 0))    
        self.connect((self.blocks_add_xx_0, 0), (self.qtgui_freq_sink_x_0, 0))    
        self.connect((self.blocks_multiply_const_vxx_0, 0), (self.blocks_add_xx_0, 0))    
        self.connect((self.blocks_multiply_const_vxx_1, 0), (self.blocks_add_xx_0, 1))    
        self.connect((self.blocks_multiply_const_vxx_2, 0), (self.blocks_add_xx_0, 2))    
        self.connect((self.blocks_wavfile_source_0, 0), (self.rational_resampler_xxx_0, 0))    
        self.connect((self.high_pass_filter_0, 0), (self.blocks_multiply_const_vxx_2, 0))    
        self.connect((self.low_pass_filter_0, 0), (self.blocks_multiply_const_vxx_0, 0))    
        self.connect((self.rational_resampler_xxx_0, 0), (self.band_pass_filter_0, 0))    
        self.connect((self.rational_resampler_xxx_0, 0), (self.high_pass_filter_0, 0))    
        self.connect((self.rational_resampler_xxx_0, 0), (self.low_pass_filter_0, 0))    
        self.connect((self.rational_resampler_xxx_0, 0), (self.qtgui_freq_sink_x_0_0, 0))    

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "top_block")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_slider_low_pass(self):
        return self.slider_low_pass

    def set_slider_low_pass(self, slider_low_pass):
        self.slider_low_pass = slider_low_pass
        self.blocks_multiply_const_vxx_0.set_k((self.slider_low_pass, ))
        Qt.QMetaObject.invokeMethod(self._slider_low_pass_slider, "setValue", Qt.Q_ARG("double", self.slider_low_pass))

    def get_slider_high_pass(self):
        return self.slider_high_pass

    def set_slider_high_pass(self, slider_high_pass):
        self.slider_high_pass = slider_high_pass
        self.blocks_multiply_const_vxx_2.set_k((self.slider_high_pass, ))
        Qt.QMetaObject.invokeMethod(self._slider_high_pass_slider, "setValue", Qt.Q_ARG("double", self.slider_high_pass))

    def get_slider_band_pass(self):
        return self.slider_band_pass

    def set_slider_band_pass(self, slider_band_pass):
        self.slider_band_pass = slider_band_pass
        self.blocks_multiply_const_vxx_1.set_k((self.slider_band_pass, ))
        Qt.QMetaObject.invokeMethod(self._slider_band_pass_slider, "setValue", Qt.Q_ARG("double", self.slider_band_pass))

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.band_pass_filter_0.set_taps(firdes.band_pass(1, self.samp_rate, 250, 3900, 10, firdes.WIN_HAMMING, 6.76))
        self.high_pass_filter_0.set_taps(firdes.high_pass(1, self.samp_rate, 4000, 10, firdes.WIN_HAMMING, 6.76))
        self.low_pass_filter_0.set_taps(firdes.low_pass(1, self.samp_rate, 240, 10, firdes.WIN_HAMMING, 6.76))
        self.qtgui_freq_sink_x_0.set_frequency_range(0, self.samp_rate)
        self.qtgui_freq_sink_x_0_0.set_frequency_range(0, self.samp_rate)

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
