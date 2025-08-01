//half adder
    module half_adder(
	                    o_s,
					            o_c,
					            i_a,
					            i_b);
	output            o_s;
	output            o_c;
	
	input             i_a;
	input             i_b;
	
	assign o_s = i_a ^ i_b;
	assign o_c = i_a & i_b;
endmodule
//or
    assign (o_c,o_s)=(i_a + i_b);

//----------Testbench--------------

  module half_adder_tb();
  wire       o_s;
	wire       o_c;
	reg        i_a;
	reg        i_b;
	
	half_adder dut(
	               .o_s(o_s),
				         .o_c(o_c),
				         .i_a(i_a),
				         .i_b(i_b));
	
 initial $monitor ($time,"/t %b /t %b /t %b /t %b",o_s,o_c,i_a,i_b);	 
	
	initial begin //input signal
	  i_a = 1'b0;   i_b = 1'b0;  #10;
		i_a = 1'b0;   i_b = 1'b1;  #10;
		i_a = 1'b1;   i_b = 1'b0;  #10;
		i_a = 1'b1;   i_b = 1'b1;  #10;
	end
endmodule	
