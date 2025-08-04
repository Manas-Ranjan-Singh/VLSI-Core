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
//-----------------------------------------------------------
    module rca_4_full_addr(
                            o_sum,
					 	    o_cy,
						    i_ain,
						    i_bin,
						    i_c);
	output [3:0]        o_sum;
	output              o_cy;
	
	input  [3:0]        i_ain;
	input  [3:0]        i_bin;
	input               i_c;
	
	wire                c0,c1,c2;
	
	full_adder f1 ( .o_s(o_sum[0]),
	                .o_c(c0),
	                .i_a(i_ain[0]),
                    .i_b(i_bin[0]),
	                .i_cin(i_c));
					
	full_adder f2 ( .o_s(o_sum[1]),
	                .o_c(c1),
	                .i_a(i_ain[1]),
                    .i_b(i_bin[1]),
	                .i_cin(c0));
					
	full_adder f3 ( .o_s(o_sum[2]),
	                .o_c(c2),
	                .i_a(i_ain[2]),
                    .i_b(i_bin[2]),
	                .i_cin(c1));		

	full_adder f4 ( .o_s(o_sum[3]),
	                .o_c(o_cy),
	                .i_a(i_ain[3]),
                    .i_b(i_bin[3]),
	                .i_cin(c2));	
    endmodule					
//---------------------Testbench--------------------------------------
    module rca_4_full_addr_tb();
    wire        o_sum;
	wire     	o_cy;
    reg	    	i_ain;
	reg			i_bin;
	reg			i_c;
	
	rca_4_full_addr dut(
	                    .o_sum(o_sum),
				        .o_cy(o_cy),
				        .i_ain(i_ain),
				        .i_bin(i_bin),
				        .i_c(i_c));
	
    initial $monitor ($time,"/t %b /t %b /t %b /t %b /t %b",o_sum,o_cy,i_ain,i_bin,i_c);	 
	
	initial begin //input signal
	    i_ain = 1'b0;   i_bin = 1'b0;  i_c=1'b0; #10;
		i_ain = 1'b0;   i_bin = 1'b1;  i_c=1'b0; #10;
		i_ain = 1'b1;   i_bin = 1'b0;  i_c=1'b0; #10;
		i_ain = 1'b1;   i_bin = 1'b1;  i_c=1'b0; #10;
	end
    endmodule
