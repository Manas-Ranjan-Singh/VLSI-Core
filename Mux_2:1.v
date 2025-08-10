  //-----------------------------------------
  //MUX
  //Design: mux_2_to_1_line
  //------------------------------------------
  module mux_2_to_1_line(
                         o_y,
						 i_en,
						 i_sel,
						 i_data_0,
						 i_data_1);
						 
	output               o_y;
	
	input                i_en;
	input                i_sel;
	input                i_data_0;
	input                i_data_1;
	
	assign o_y=i_en?(1'bz):(i_sel?(i_data_0):(i_data_1));
	endmodule
//Testbench for mux_2_to_1_line
//----------------------------------------------------
  module mux_2_to_1_tb();
       
	   wire     mux_z; // z capture countinous the signals
	   
	   reg      mux_en;
	   reg      mux_sel;
	   reg      mux_data_0;
       reg      mux_data_1;
	   
   module mux_2_to_1_line trx (
                         .o_y(mux_z),
						 .i_en(mux_en),
						 .i_sel(mux_sel),
						 .i_data_0(mux_data_0),
						 .i_data_1(mux_data_1));
           //Enable
      initial begin
                   mux_en = 1'b1;
      	     #200  mux_en = 1'b0;
             #200;
      end

          //Select line

      initial begin 
                   mux_sel = 1'b0;
         #50       mux_sel = 1'b1;
         #130      mux_sel = 1'b0;	
         #150      mux_sel = 1'b1;
         #200      mux_sel = 1'b1;
		 #220      mux_sel = 1'b0;
	  end
	     //data
      initial begin 
                   mux_data_0 =1'b0; mux_data_1 =1'b0;	  
		   #70     mux_data_0 =1'b0;
		   #30                       mux_data_1 =1'b1;
		   #90     mux_data_0 =1'b1;
		   #40     mux_data_0 =1'b0;
		   #20                       mux_data_1 =1'b0;
		   #30     mux_data_0 =1'b1;
		   #50;
		   end
		   
  endmodule
