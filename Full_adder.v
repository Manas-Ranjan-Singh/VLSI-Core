`timescale 1ns / 1ps
//Full adder
	module full_add(
                      o_s,
					  o_c,
					  i_a,
					  i_b,
					  i_c);
	output            o_s;
	output            o_c;
	
	input             i_a;
	input             i_b;
    input             i_c;
    
    assign {o_c,o_s} = (i_a + i_b + i_c);
    
    endmodule

	//full adder test bench

    module full_add_tb();
    wire       o_s;
	wire       o_c;
	reg        i_a;
	reg        i_b;
	reg        i_c;
	
	full_add dut(
	             .o_s(o_s),
			     .o_c(o_c),
				 .i_a(i_a),
				 .i_b(i_b),
				 .i_c(i_c));
	
    initial $monitor ($time,"/t %b /t %b /t %b /t %b /t %b",o_s,o_c,i_a,i_b,i_c);	 
	
	initial begin //input signal
	    i_a = 1'b0;   i_b = 1'b0;  i_c=1'b0; #10;
		i_a = 1'b0;   i_b = 1'b1;  i_c=1'b0; #10;
		i_a = 1'b1;   i_b = 1'b0;  i_c=1'b0; #10;
		i_a = 1'b1;   i_b = 1'b1;  i_c=1'b0; #10;
	end
endmodule

//--------------------------------Using half adder design full adder------------------------------------------------
     module half_adder(
	                  sum,
					  carry,
					  a,
					  b);
	output            sum;
	output            carry;
	
	input             a;	
	input             b;
	
	xor x1  (sum,a,b);
	and a1  (carry,a,b);
	
    endmodule
	
	module full_adder(
	                  o_s,
					  o_c,
					  i_a,
					  i_b,
					  i_cin);
	output          o_s;
    output          o_c;
    
    input           i_a;
	input           i_b;
    input           i_cin;
	wire            x,y,z;
	
	half_adder h1(.a(i_a),.b(i_b),.sum(x),.carry(z));
	half_adder h2(.a(x),.b(i_cin),.sum(o_s),.carry(y));
	or o1 (o_c,y,z);
    endmodule

//------------------Testbench------------------------------------
    module full_adder_tb();
            wire       o_s;
	        wire       o_c;
	        reg        i_a;
        	reg        i_b;
	        reg        i_cin;
	
	full_adder dut(
	               .o_s(o_s),
				   .o_c(o_c),
				   .i_a(i_a),
				   .i_b(i_b),
				   .i_cin(i_cin));
	
    initial $monitor ($time,"/t %b /t %b /t %b /t %b /t %b",o_s,o_c,i_a,i_b,i_cin);	 
	
	initial begin //input signal
	    i_a = 1'b0;   i_b = 1'b0;  i_cin=1'b0; #10;
		i_a = 1'b0;   i_b = 1'b1;  i_cin=1'b0; #10;
		i_a = 1'b1;   i_b = 1'b0;  i_cin=1'b0; #10;
		i_a = 1'b1;   i_b = 1'b1;  i_cin=1'b0; #10;
	end
    endmodule
