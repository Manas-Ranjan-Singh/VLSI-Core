//output=o_
//input=i_
//wire=w_
//reg=r_
//parameter=PARAMETER
//-----------------------------------------------------
module freq_div_duty #(parameter N = 5)(
   input clk,
   input rst,
   input [1:0] duty_sel,//00 - 20%,01 - 40%,10 - 60%,11 - 80%
   output reg out);
   
   reg [2:0] cout;
    
   always @ (posedge clk or posedge rst)begin
    if(rst)
	count <= 0;
	    else
	count <= (count == N-1) ?0: count +1;
	end
	always @(*) begin
	    case (duty_sel)
		    2'b00: out= (count <= 1); //20% duty
            2'b01: out= (count <= 2); //40% duty
  			2'b10: out= (count <= 3); //60% duty
			2'b11: out= (count <= 4); //80% duty
            default:out= 0;
	    endcase
    end
	endmodule

  //-----------Testbench--------------
  module freq_div_duty_tb();
      reg clk;
	  reg rst;
	  reg[1:0] duty_sel;
	  wire out;
	  
	 freq_div_duty uut (
	                    .clk(clk),
	                    .rst(rst),
	                    .duty_sel(duty_sel),
	                    .out(out));
						
	//clock generation
	initial clk =0;
	always #5 clk=~clk; //10ns clock period
	
	initial begin 
	$dumpfile("freq_div_duty.vcd");
	$dumpvars(0,freq_div_duty_tb);
	
	//reset
	rst=1;
	duty_sel = 2'b00;
	#20;
	rst = 0;
	
	//test each duty cycle
	duty_sel = 2'b00;  //20%
	#100;
	
	duty_sel = 2'b01;  //40%
	#100;
	
	duty_sel = 2'b10;  //60%
	#100;
	  
	duty_sel = 2'b11;  //80%
	#100;
	
	end
	endmodule
	
