# Mixed Signal Frequency Divider
# Frequency Divider Using Astable Multivibrator and MOD-4 Counter
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Software Used](#software-used)
  * [eSim](#esim)
  * [NgSpice](#ngspice)
  * [Makerchip](#makerchip)
  * [Verilator](#verilator)
- [Circuit Diagram in eSim](#circuit-diagram-in-esim)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip-1)
- [Makerchip Plots](#makerchip-plots)
- [Netlists](#netlists)
- [NgSpice Plots](#ngspice-plots)
- [Steps to run generate NgVeri Model](#steps-to-run-generate-ngveri-model)
- [Steps to run this project](#steps-to-run-this-project)
- [Acknowlegdements](#acknowlegdements)
- [References](#references)

## Abstract
Frequency Divider is an electronic circuit that divides a given frequency by a factor of n, where n is an integer. Here a divide-by-4 circuit is used which divides the input frequency by 4. The frequency divider is made up of two parts - an astable multivibrator and a divide-by-4 counter. Frequency dividers are an integral part of communication and audio based systems like Frequency Synthesizers, RF devices, Communication.

The Frequency Divider is made up of an astable multivibrator and a divide-by-4 counter. The astable multivibrator generates a clock signal of a specific frequency which is used as an input in the counter. Then the counter produces an output signal of a divide-by-4 frequency.

## Reference Circuit Diagram
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Reference%20images/Frequency%20Divider%20Schematic.png)
## Reference Waveform
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Reference%20images/Frequency%20Divider%20Waveform.png)


## Circuit Details
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/frequency_divider.jpg)

### Astable Multivibrator
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/astable_multivibrator.jpg)

The Astable Multivibrator is also called a free-running multivibrator. It has two quasi-stable states and no external signal is required to produce the changes in state. The component values are used to decide the time for which circuit remains in each state. Usually, as the astable multivibrator oscillates between two states, is used to produce a square wave. In this circuit, the time period is dependent upon the value of the resistor and capacitor. It also depends upon the upper and lower threshold voltage of the op-amp.

#### Astable Multivibrator Symbol
<img src="https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/astable_multivibrator_symbol.png" width=400 height=200>

### MOD-4 Counter
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/MOD-4%20Counter.png)

A Divide-By-4 counter is a binary divider composed of two D flip flops where an inverted output terminal is connected back to the data terminal in a feedback loop. It is an asynchronous counter, where the first flip-flop is clocked by the external clock pulse and then each successive flip-flop is clocked by the output of the preceding flip-flop. As the signal moves in a ripple pattern, it takes some time at each stage resulting in the lower frequency at the output.

#### MOD-4 Counter Symbol
<img src="https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/counter_symbol.png" width=500 height=300>

## Software Used
### eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD.
</br>
For more details refer:
</br>
https://esim.fossee.in/home
### NgSpice
It is an Open Source Software for Spice Simulations. For more details refer:
</br>
http://ngspice.sourceforge.net/docs.html
### Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. Refer
</br> https://www.makerchip.com/
### Verilator
It is a tool which converts Verilog code to C++ objects. Refer:
https://www.veripool.org/verilator/

## Circuit Diagram in eSim
The following is the schematic in eSim:
![image]()

## Verilog Code

### Counter
```
`include "ff.v"
module counter(CLK, COUNT); 
 	
	input CLK; 
	output COUNT; 
	 
	reg CLK; 
	reg COUNT;

	wire C1; 
	wire Q1; 
	wire Q2; 
	 
	FF TFF1(.CLK(CLK), .Q(Q1), .QBAR(C1)); 
	FF TFF2(.CLK(C1), .Q(), .QBAR(Q2)); 
	 
	assign COUNT = Q2; 
 
endmodule 
```

### D Flip Flop
```
module FF(CLK, Q, QBAR); 
 
	input CLK; 
 
	output QBAR; 
	output Q; 
 
	wire CLK; 
	wire Q; 
	wire QBAR; 
	 
	reg state; 
	 
	always @(posedge CLK) 
	begin 
		begin 
			state <= ~state; 
		end 
	end 
	 
	assign QBAR = ~state; 
	assign Q = state; 
 
endmodule 
```

### Testbench
```
`include "counter.v"
module tb; 
 
	reg CLK; 
	reg COUNT; 
   
	always 
	begin 
      
		CLK = 0; 
		#2.5; 
     
		CLK = 1; 
      		#2.5; 
	end 
endmodule
```

## Makerchip
```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/

//Your Verilog/System Verilog Code Starts Here:
module tb; 
 
	reg CLK; 
	reg COUNT; 
   
	always 
	begin 
      
		CLK = 0; 
		#2.5; 
     
		CLK = 1; 
      #2.5; 
	end 
 
endmodule

//Top Module Code Starts here:	
module FF(CLK, Q, QBAR); 
 
	input CLK; 
 
	output QBAR; 
	output Q; 
 
	wire CLK; 
	wire Q; 
	wire QBAR; 
	 
	reg state; 
	 
	always @(posedge CLK) 
	begin 
		begin 
			state <= ~state; 
		end 
	end 
	 
	assign QBAR = ~state; 
	assign Q = state; 
 
endmodule 

module counter(CLK, COUNT); 
 
	input CLK; 
	output COUNT; 
	 
	wire CLK; 
	wire COUNT; 
	 
	wire C1; 
	wire Q1; 
	wire Q2; 
	 
	FF TFF1(.CLK(CLK), .Q(Q1), .QBAR(C1)); 
	FF TFF2(.CLK(C1), .Q(), .QBAR(Q2)); 
	 
	assign COUNT = Q2;
 
endmodule 

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
	logic COUNT;		
   counter counter1(.CLK(clk), .COUNT(COUNT));
endmodule
```

## Makerchip Plots
### Counter Signals
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/Makerchip%20Signals.png)
### Counter Signals Close-Up
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/Makerchip%20Signals%20Zoom.png)
### All Signals
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/Makerchip%20All%20Signals.png)


## Netlists
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Circuit%20images/netlist.jpg)

## NgSpice Plots
### Simulation for 10ms
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/CLK%20Signal%2010ms%20new.jpg)
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/OUT%20Signal%2010ms%20new.jpg)

### Simulation for 50ms
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/CLK%20Signal%2050ms%20new.jpg)
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Results/OUT%20Signal%2050ms%20new.jpg)

## Steps to run generate NgVeri Model
1. Open eSim
2. Run NgVeri-Makerchip 
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice Converter
7. Debug if any errors
8. Model created successfully

## Steps to run this project
1. Open a new terminal
2. Clone this project using the following command:</br>
```git clone https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider.git ```</br>
3. Change directory:</br>
```cd frequency_divider```</br>
4. Run ngspice:</br>
```ngspice Frequency_Divider.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>

## Acknowlegdements
- FOSSEE, IIT Bombay
- Steve Hoover, Founder, Redwood EDA
- Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
- Sumanto Kar, eSim Team, FOSSEE

## References
- [Op-amp Astable Multivibrator](https://www.electronics-tutorials.ws/opamp/op-amp-multivibrator.html)
- [Frequency Division Using Flip Flops](https://www.electronics-tutorials.ws/counter/count_1.html#:~:text=The%20final%20output%20clock%20signal,the%20way%20they%20are%20clocked.)

