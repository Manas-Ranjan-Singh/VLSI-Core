// adder_16bit  using 4 rca_4b
    module cp_adder_16b(
	                    o_s,
					    o_cy,
					    i_a,
					    i_b,
					    i_cin);
					
	output	[15:0]	o_s;
	output			o_cy;
	
	input	[15:0]	i_a;
	input	[15:0]	i_b;
	input			i_cin;
	
	cp_rca_4b	inst_0	(	.o_s(o_s[3:0]),
							.o_cy(w_rca0_cy_to_rca1_cin),
							.i_a(i_a[3:0]),
							.i_b(i_b[3:0]),
							.i_cin(i_cin) );
							
	cp_rca_4b	inst_1	(	.o_s(o_s[7:4]),
							.o_cy(w_rca1_cy_to_rca2_cin),
							.i_a(i_a[7:4]),
							.i_b(i_b[7:4]),
							.i_cin(w_rca0_cy_to_rca1_cin) );
							
	cp_rca_4b	inst_2	(	.o_s(o_s[11:8]),
							.o_cy(w_rca2_cy_to_rca3_cin),
							.i_a(i_a[11:8]),
							.i_b(i_b[11:8]),
							.i_cin(w_rca1_cy_to_rca2_cin) );
	cp_rca_4b	inst_3	(	.o_s(o_s[15:12]),
							.o_cy(o_cy),
							.i_a(i_a[15:12]),
							.i_b(i_b[15:12]),
							.i_cin(w_rca2_cy_to_rca3_cin) );
							
    endmodule
	
//--------------------------------------------------------------------

//Testbench 4bit_rca
    module rca_4b_tb();
        wire        o_s;
	    wire		o_cy;
	    reg			i_a;
	    reg			i_b;
	    reg			i_cin;
		
		rca_4b dut(
		           .o_s(o_s),
				   .o_cy(o_cy),
				   .i_a(i_a),
				   .i_b(i_b),
				   .i_cin(i_cin));
				   
	    initial begin
		i_a=4'b0000; i_b=4'b0000; cin=4'b0; #10;
		i_a=4'b0001; i_b=4'b0001; cin=4'b1; #10;
        i_a=4'b0010; i_b=4'b0010; cin=4'b0; #10;
        i_a=4'b0011; i_b=4'b0011; cin=4'b1; #10;
        i_a=4'b0101; i_b=4'b0101; cin=4'b0; #10;
        i_a=4'b0110; i_b=4'b0110; cin=4'b1; #10;
        i_a=4'b0111; i_b=4'b0111; cin=4'b0; #10;
        i_a=4'b1000; i_b=4'b1000; cin=4'b1; #10;	
        i_a=4'b1001; i_b=4'b1001; cin=4'b1; #10;
        i_a=4'b1010; i_b=4'b1010; cin=4'b0; #10;
        i_a=4'b1100; i_b=4'b1100; cin=4'b1; #10;
        i_a=4'b1101; i_b=4'b1101; cin=4'b0; #10;
        i_a=4'b1110; i_b=4'b1110; cin=4'b1; #10;	
        i_a=4'b1111; i_b=4'b1111; cin=4'b0; #10;		
		
		$finish;
	  end
	endmodule	
