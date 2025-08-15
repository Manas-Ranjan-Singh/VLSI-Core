// Demux: 1_to_8_ch_8b
    module demux_1_to_8b(
                         o_channel_0
						 O_channel_1,
						 O_channel_2,
						 o_channel_3,
						 o_channel_4,
						 o_channel_5,
						 O_channel_6,
						 O_channel_7,
					     i_en,
				         i_sel,
					     i_data);
	
	    parameter DATA_WIDTH = 8;
	   // parameter CH_WIDTH =8;
	
	    output [DATA_WIDTH-1:2]    o_channel_0;
		output [DATA_WIDTH-1:2]    o_channel_1;
		output [DATA_WIDTH-1:2]    o_channel_2;
		output [DATA_WIDTH-1:2]    o_channel_3;
		output [DATA_WIDTH-1:2]    o_channel_4;
		output [DATA_WIDTH-1:2]    o_channel_5;
		output [DATA_WIDTH-1:2]    o_channel_6;
		output [DATA_WIDTH-1:2]    o_channel_7;
		input                     i_en;       		
		input   [2:0]             i_sel;
		input   [DATA_WIDTH-1:0]  i_data;
		
		wire    [DATA_WIDTH-1:0]  i_data;
		
		assign  w_ch_sel[0]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[1]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[2]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[3]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[4]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[5]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[6]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
		assign  w_ch_sel[7]=(!i_sel[2]) && !(i_sel[1]) && (!i_sel[0]);
	
//output Logic	
		assign o_channel_0={8{i_en}} & {8{w_ch_sel[0]}} & i_data;
		assign o_channel_1={8{i_en}} & {8{w_ch_sel[1]}} & i_data;
		assign o_channel_2={8{i_en}} & {8{w_ch_sel[2]}} & i_data;
		assign o_channel_3={8{i_en}} & {8{w_ch_sel[3]}} & i_data;
		assign o_channel_4={8{i_en}} & {8{w_ch_sel[4]}} & i_data;
		assign o_channel_5={8{i_en}} & {8{w_ch_sel[5]}} & i_data;
		assign o_channel_6={8{i_en}} & {8{w_ch_sel[6]}} & i_data;
		assign o_channel_7={8{i_en}} & {8{w_ch_sel[7]}} & i_data;
		
		endmodule
