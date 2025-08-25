module decoder_2_to_4 (
    input        i_en,   
    input  [1:0] i_a,    
    output reg [3:0] o_y );
    always @(*) begin
        o_y = 4'b0000;
        if (i_en) begin
            case (i_a)
                2'b00:   o_y = 4'b0001; // Activate output 0
                2'b01:   o_y = 4'b0010; // Activate output 1
                2'b10:   o_y = 4'b0100; // Activate output 2
                2'b11:   o_y = 4'b1000; // Activate output 3
                default: o_y = 4'b0000; // All others, no output
            endcase
        end
    end
endmodule


//------------------------------------------------------------------
// Testbench for the 2-to-4 Decoder
// r_ for registers (stimulus)
// w_ for wires (observed)
//------------------------------------------------------------------

module decoder_2_to_4_tb;

    reg        r_i_en; // Stimulus for enable
    reg  [1:0] r_i_a;  // Stimulus for input address
    wire [3:0] w_o_y;  // Wire to observe the output

    decoder_2_to_4 UUT (
        .i_en(r_i_en),
        .i_a(r_i_a),
        .o_y(w_o_y) );

    initial begin
        $monitor("%4d | %1b  | %2b | %4b", $time, r_i_en, r_i_a, w_o_y);

        r_i_en = 1'b1; 
        r_i_a  = 2'b00;
        #10;

        r_i_a = 2'b00;
        #10;

        r_i_a = 2'b01;
        #10;

        r_i_a = 2'b10;
        #10;

        r_i_a = 2'b11;
        #10;

        r_i_en = 1'b0;
        #10;

        r_i_a = 2'b01;
        #10;
        $finish; 
    end

endmodule
