// adder_16bitttt
       module add_16b (
	                   o_s,
					   o_cy,
					   i_a,
					   i_b,
					   i_cin);
					   
	  //Port declaration
	   output [15:0]         o_s;
	   output               o_cy;
	   
	   input [15:0]          i_a;
	   input [15:0]          i_b;
	   input                 i_cin;
	   
	   //functionality
	   rca_4b INST0 (
	                  .o_s(o_s[3:0]),
					  .o_cy(w_rca0_cy_to_rca1_cin),
					  .i_a(i_a[3:0]),
					  .i_b(i_b[3:0]),
					  .i_cin(w_rca2_cy_to_rca3_cin));
	   rca_4b INST1 (
	                  .o_s(o_s[7:4]),
					  .o_cy(w_rca1_cy_to_rca2_cin),
					  .i_a(i_a[7:4]),
					  .i_b(i_b[7:4]),
					  .i_cin(w_rca1_cy_to_rca0_cin));
	   rca_4b INST2 (
	                  .o_s(o_s[11:8]),
					  .o_cy(w_rca2_cy_to_rca3_cin),
					  .i_a(i_a[11:8]),
					  .i_b(i_b[11:8]),
					  .i_cin(w_rca1_cy_to_rca2_cin));
	   rca_4b INST3 (
	                  .o_s(o_s[15:12]),
					  .o_cy(o_cy),
					  .i_a(i_a[15:12]),
					  .i_b(i_b[15:12]),
					  .i_cin(w_rca2_cy_to_rca3_cin));
   endmodule
