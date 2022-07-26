# DCO2010: LABORATÓRIO DE RÁDIO DEFINIDO POR SOFTWARE (2022.1)

## UNIDADE I

## Hands-on 00: Preparação do ambiente de prática e desenvolvimento

### [Criação de máquina virtual Ubuntu Virtual Box (UBUNTU 20.04)](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H00_VM_VBox.ipynb)  - [Link alternativo via nbviewer](http://nbviewer.jupyter.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H00_VM_VBox.ipynb)
**Objetivos:**
- Instalar Virtual Box no Windows
- Baixar e criar máquina virtual Ubuntu 20.04 no Windows

### [Criação de máquina virtual Ubuntu VMWare (UBUNTU 20.04) - alternativa ao Virtual Box](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/h00_VM_20_04.ipynb)  - [Link alternativo via nbviewer](http://nbviewer.jupyter.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/h00_VM_20_04.ipynb)
**Objetivos:**
- Instalar VMWare no Windows
- Baixar e criar máquina virtual Ubuntu 20.04 no Windows

### [Básico do Jupyter Notebook: Instalação e prática (UBUNTU 20.04) - Python 3.8.5](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/h00_BJ_20.04.ipynb) - [Link alternativo via nbviewer](http://nbviewer.jupyter.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/h00_BJ_20.04.ipynb)
**Objetivos**
- Instalar pacotes de suporte ao Jupyter Notebook (Anaconda, nbconvert, pandoc, extensions)
- Baixar, abrir, editar e criar Notebooks que executem blocos de código de Python (Python 3)
- Fazer um primeiro uso da linguagem Python 3 dentro dos Notebooks

### [Instalação de GNU Radio via apt-get](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H00_Install_GNURADIO_APTGET.ipynb) - [Link alternativo via nbviewer](http://nbviewer.jupyter.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H00_Install_GNURADIO_APTGET.ipynb)
**Objetivos**
- Instalar o UHD Driver (suporte para USRP)
- Instalar o GNU Radio
- Configurar e testar o GNU Radio

## Hands-on 01 - Instrumentação Virtual Básica usando GNU Radio e a USRP

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H01.ipynb) - [Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H01.ipynb)

**Objetivos:**
- Apresentar alguns conceitos básicos do software GRC (GNU Radio Companion);
- Manipular um sinal senoidal e analisá-lo através da virtualização de instrumentos tradicionais como osciloscópio e analisador de espectro;
- Aprender o básico sobre o GNU Radio e ter o primeiro contato com a USRP.


## Hands-on 02 - Manipulação de áudio e filtragem (arquivos e microfone)
#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H02.ipynb) - [Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H02.ipynb)
**Objetivos:**
- Usar conceitos básicos e algumas dicas aprendidas em exercícios passados;
- Manipular a saída e entrada de áudio provenientes de arquivos “.wav” e microfone;
- Uso de filtros, fazer o controle de tonalidade .

## Hands-on 03 - Transmissão e recepção da modulação AM utilizando o GNURadio (loopback)

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H03.ipynb) - [Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H03.ipynb)
**Objetivos**
- Usar conceitos básicos de manipulação de sinais  básicos de manipulação de sinais e algumas dicas aprendidas em exercícios passados;
- o uso do conhecimento teórico sinais AM-DSB ;
- construir um “loop-back” da transmissão e recepção de sinais AM-DSB (AM comercial).

## Hands-on 04 - Loopback transmissão e recepção BPSK utilizando o GNURadio

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H04_parte_01.ipynb) - [Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H04_parte_01.ipynb)
**Objetivos**
- Introdução sobre modulação digital;
- Projetar um loopback de um sistema de transmissão BPSK;
- Analisar algumas características do sinal modulado e recebido.

## Hands-on 05 - Projeto de filtros digitais com o GNU Radio

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H05.ipynb) - [Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H05.ipynb)
**Objetivos**
- Usar conceitos básicos e algumas dicas aprendidas em exercícios passados para filtrar a saída de dois sinais com frequências diferentes;
- Tanto usando filtros digitais FIR quanto IIR;
- Utilizar a ferramenta Filter Design do GNU Radio.

## Hands-on 06 Parte 01 - Receptor WBFM (GRC)

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H06_parte_01.ipynb) -[Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H06_parte_01.ipynb)
**Objetivos**
- Construir um receptor FM usando o USRP N210 e o GNU Radio Companion;
- Aprender mais sobre o GNU Radio Companion (GRC) a interface gráfica do usuário (GUI);
- Construir projetos com o GNU Radio (GNU Radio flowgraphs) para Rádio FM;

## Hands-on 06 Parte 02 - Transmissor WBFM (GRC) 

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H06_parte_02.ipynb) -[Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H06_parte_02.ipynb)
**Objetivos**
- Utilziar os conceitos sobre modulação em frequência (FM) e alguns blocos básicos mostrados em tutoriais passados;
- Com GNR (GNU Radio Companion), criar um transmissor FM capaz de enviar ao espaço livre áudio proveniente de arquivo “.wav” ou microfone.

## Hands-on 07 - Receptor WBFM usando o Dongle

#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H07.ipynb) -[Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H07.ipynb)
**Objetivos**
- Demodulação FM usando o software GNURadio GRC e o dispositivo Dongle SDR TV Digital.

## Hands-on 08 - Transmissor/Receptor WBFM em 2,4GHz (GRC)
#### [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H08.ipynb) -[Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H08.ipynb)
**Objetivos**
- Utilizar os conceitos sobre modulação em frequência (FM);
- Construção de transmissor e receptor FM em 2,4 GHz. 

## Hands-on 09 - Parte 01: Transmissão/Recepção PSK sem fio em canais limitados em banda
###  [Hands-on](https://github.com/vicentesousa/DCO2010_2022/blob/main/notebooks/H09_parte_01.ipynb) - -[Link alternativo via nbviewer](https://nbviewer.org/github/vicentesousa/DCO2010_2022/blob/main/notebooks/H09_parte_01.ipynb)
**Objetivos**
- Transmissão/recepção digital usando modulação PKS;
- Ambiente com a presença de ruído AWGN, multipercurso e offsets de tempo e frequência.



