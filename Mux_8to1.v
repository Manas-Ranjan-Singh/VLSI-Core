module mux_8_to_1 (
    input      [7:0] i_data, // Input: 8-bit data bus
    input      [2:0] i_sel,  // Input: 3-bit select line
    output           o_y  );   // Output: 1-bit data output
    assign o_y = i_data[i_sel];
endmodule

//------------------------------------------------------------------
// Testbench for the 8-to-1 Multiplexer
// r_ for registers (stimulus)
// w_ for wires (observed)
//------------------------------------------------------------------

module mux_8_to_1_tb;
    reg  [7:0] r_i_data; // Stimulus for data input
    reg  [2:0] r_i_sel;  // Stimulus for select line
    wire       w_o_y;    // Wire to observe the output

    mux_8_to_1 UUT (
        .i_data(r_i_data),
        .i_sel(r_i_sel),
        .o_y(w_o_y) );
    initial begin
        $monitor("%4d | %3b | %8b |   %1b", $time, r_i_sel, r_i_data, w_o_y);

        r_i_data = 8'b11001010;
        r_i_sel  = 3'b000;
        #10;

        for (integer i = 0; i < 8; i = i + 1) begin
            r_i_sel = i;
            #10;
        end
        $finish; 
    end
endmodule
endmodule
