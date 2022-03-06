EESchema Schematic File Version 2
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:power
LIBS:eSim_Plot
LIBS:transistors
LIBS:conn
LIBS:eSim_User
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:eSim_Analog
LIBS:eSim_Devices
LIBS:eSim_Digital
LIBS:eSim_Hybrid
LIBS:eSim_Miscellaneous
LIBS:eSim_Power
LIBS:eSim_Sources
LIBS:eSim_Subckt
LIBS:eSim_Nghdl
LIBS:eSim_Ngveri
LIBS:Frequency_Divider-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4500 3450 3    60   Input ~ 0
CLK
$Comp
L adc_bridge_1 U2
U 1 1 622393A8
P 5150 3500
F 0 "U2" H 5150 3500 60  0000 C CNN
F 1 "adc_bridge_1" H 5150 3650 60  0000 C CNN
F 2 "" H 5150 3500 60  0000 C CNN
F 3 "" H 5150 3500 60  0000 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
$Comp
L counter U1
U 1 1 622393A9
P 3550 5350
F 0 "U1" H 6400 7150 60  0000 C CNN
F 1 "counter" H 6400 7350 60  0000 C CNN
F 2 "" H 6400 7300 60  0000 C CNN
F 3 "" H 6400 7300 60  0000 C CNN
	1    3550 5350
	1    0    0    -1  
$EndComp
$Comp
L dac_bridge_1 U3
U 1 1 622393AA
P 7700 3500
F 0 "U3" H 7700 3500 60  0000 C CNN
F 1 "dac_bridge_1" H 7700 3650 60  0000 C CNN
F 2 "" H 7700 3500 60  0000 C CNN
F 3 "" H 7700 3500 60  0000 C CNN
	1    7700 3500
	1    0    0    -1  
$EndComp
$Comp
L plot_v1 U4
U 1 1 622393AB
P 4500 3650
F 0 "U4" H 4500 4150 60  0000 C CNB
F 1 "plot_v1" H 4700 4000 60  0000 C CNN
F 2 "" H 4500 3650 60  0000 C CNN
F 3 "" H 4500 3650 60  0000 C CNN
	1    4500 3650
	1    0    0    -1  
$EndComp
$Comp
L astable_multivibrator X1
U 1 1 62239527
P 3700 3450
F 0 "X1" H 3700 3300 60  0000 C CNN
F 1 "astable_multivibrator" H 3750 3650 60  0000 C CNN
F 2 "" H 3700 3450 60  0001 C CNN
F 3 "" H 3700 3450 60  0001 C CNN
	1    3700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3450 4500 3450
$Comp
L plot_v1 U5
U 1 1 62239ADD
P 8250 3650
F 0 "U5" H 8250 4150 60  0000 C CNB
F 1 "plot_v1" H 8450 4000 60  0000 C CNN
F 2 "" H 8250 3650 60  0000 C CNN
F 3 "" H 8250 3650 60  0000 C CNN
	1    8250 3650
	1    0    0    -1  
$EndComp
Text GLabel 8250 3450 3    60   Input ~ 0
OUT
$EndSCHEMATC
