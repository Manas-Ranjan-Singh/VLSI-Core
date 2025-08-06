//output=o_
//input=i_
//wire=w_
//reg=r_
//parameter=PARAMETER
//----------------------------------
//[COMPARATOR]
  module Comparator_4b(
                     o_gt,
					 o_lt,
					 o_eq
					 i_a
					 i_b);
					 
	//port Declaration-----
	parameter     DATA_WIDTH= 4;
	output              o_gt;
    output              o_lt;
    output              o_eq;
    
    input[DATA_WIDTH-1:0] i_a;
    input[DATA_WIDTH-1:0] i_b;

//Operations---------------

    assign o_gt = i_a > i_b;
    assign o_lt = i_a < i_b;
	assign o_eq = i_a == i_b;
	
   endmodule
