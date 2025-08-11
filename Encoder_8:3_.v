//output=o_
//input=i_
//wire=w_
//reg=r_
//parameter=PARAMETER
//----------------------------------
//Encoder 8:3
module encoder_8_to_3 (
                       i_en,
                       o_y0,
					   o_y1,
					   o_y2,
					   i_i0,
					   i_i1,
					   i_i2,
					   i_i3,
					   i_i4,
					   i_i5,
					   i_i6,
					   i_i7);

input                  i_en;
output                 o_y0;
output                 o_y1;
output                 o_y2;
input                  i_i0;
input				   i_i1;
input				   i_i2;
input				   i_i3;
input				   i_i4;
input			       i_i5;
input				   i_i6;
input				   i_i7;

assign o_y0= i_en && (i_i1 || i_3 || i_i5 || i_7);
assign o_y1= i_en && (i_i2 || i_3 || i_i6 || i_7);
assign o_y2= i_en && (i_i4 || i_5 || i_i6 || i_7);

endmodule
 
// Testbench for Encoder 8 to 3
     `timescale 1ns/1ps
module tb_encoder_8_to_3;

    reg i_en;
    reg i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7;
    wire o_y0, o_y1, o_y2;

    // Instantiate the encoder
    encoder_8_to_3 uut (
        .i_en(i_en),
        .i_i0(i_i0),
        .i_i1(i_i1),
        .i_i2(i_i2),
        .i_i3(i_i3),
        .i_i4(i_i4),
        .i_i5(i_i5),
        .i_i6(i_i6),
        .i_i7(i_i7),
        .o_y0(o_y0),
        .o_y1(o_y1),
        .o_y2(o_y2)
    );

    initial begin
        $dumpfile("encoder_8_to_3.vcd"); // For waveform viewing
        $dumpvars(0, tb_encoder_8_to_3);

        // Initial values
        i_en = 0;
        {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00000000;

        // Enable encoder
        #10 i_en = 1;

        // Apply test cases
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00000001; // input 0 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00000010; // input 1 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00000100; // input 2 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00001000; // input 3 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00010000; // input 4 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b00100000; // input 5 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b01000000; // input 6 active
        #10 {i_i0, i_i1, i_i2, i_i3, i_i4, i_i5, i_i6, i_i7} = 8'b10000000; // input 7 active

        // Disable encoder
        #10 i_en = 0;
        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | EN=%b | Inputs=%b%b%b%b%b%b%b%b | Y2Y1Y0=%b%b%b",
                 $time, i_en, i_i7, i_i6, i_i5, i_i4, i_i3, i_i2, i_i1, i_i0,
                 o_y2, o_y1, o_y0);
    end

endmodule
