  // rca_4b
module	cp_rca_4b (
					o_s,
					o_cy,
					i_a,
					i_b,
					i_cin
				);
				
	output	[3:0]		o_s;
	output				o_cy;
	
	input	[3:0]		i_a;
	input	[3:0]		i_b;
	input				i_cin;

	cp_full_add_str	 inst_0(	  .o_sum(o_s[0]),
	                              .o_cout(w_fa0_cy_to_fa1_cin),
	                               .i_ain(i_a[0]),
						          .i_bin(i_b[0]),
						          .i_cin(i_cin));

	cp_full_add_str	 inst_1(	.o_sum(o_s[1]),
						          .o_cout(w_fa1_cy_to_fa2_cin),
						          .i_ain(i_a[1]),
						          .i_bin(i_b[1]),
						          .i_cin(w_fa0_cy_to_fa1_cin));	
						
	cp_full_add_str	 inst_2(	.o_sum(o_s[2]),
						          .o_cout(w_fa2_cy_to_fa3_cin),
						          .i_ain(i_a[2]),
						          .i_bin(i_b[2]),
						          .i_cin(w_fa1_cy_to_fa2_cin));	

	cp_full_add_str	 inst_3(	.o_sum(o_s[3]),
						          .o_cout(o_cy),
						          .i_ain(i_a[3]),
						          .i_bin(i_b[3]),
						          .i_cin(w_fa2_cy_to_fa3_cin));	
						
endmodule
