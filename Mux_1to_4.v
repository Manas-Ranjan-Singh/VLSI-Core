module mux_1_to_4 (
    input      [3:0] i_data, // Input: 4-bit data bus
    input      [1:0] i_sel,  // Input: 2-bit select line
    output           o_y );    // Output: 1-bit data output

    assign o_y = (i_sel == 2'b00) ? i_data[0] :
                 (i_sel == 2'b01) ? i_data[1] :
                 (i_sel == 2'b10) ? i_data[2] :
                 (i_sel == 2'b11) ? i_data[3] :
                 1'bx; // Assign 'x' (unknown) for any other case
endmodule


//------------------------------------------------------------------
// Testbench for the 1-to-4 Multiplexer
// r_ for registers (stimulus)
// w_ for wires (observed)
//------------------------------------------------------------------

module mux_1_to_4_tb
    reg  [3:0] r_i_data; 
    reg  [1:0] r_i_sel; 
    wire       w_o_y;   

    mux_1_to_4 UUT (
                   .i_data(r_i_data), 
                   .i_sel(r_i_sel),  
                   .o_y(w_o_y));
    initial begin
        $monitor("%4d | %2b  | %4b |   %1b", $time, r_i_sel, r_i_data, w_o_y);
        r_i_data = 4'b1010;
        r_i_sel  = 2'b00;
        #10; 

        r_i_sel = 2'b00;
        #10;

        r_i_sel = 2'b01;
        #10;

        r_i_sel = 2'b10;
        #10;

        r_i_sel = 2'b11;
        #10;

        r_i_data = 4'b0110;
        #10;

        r_i_sel = 2'b10;
        #10;

        r_i_sel = 2'b00;
        #10;

        $finish;
    end
endmodule

endmodule
