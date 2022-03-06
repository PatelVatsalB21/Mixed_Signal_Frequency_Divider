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


## Reference Circuit Diagram
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Reference%20images/Frequency%20Divider%20Schematic.png)
## Reference Waveform
![image](https://github.com/PatelVatsalB21/Mixed_Signal_Frequency_Divider/blob/main/Reference%20images/Frequency%20Divider%20Waveform.png)


## Circuit Details

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

### T Flip Flop
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
