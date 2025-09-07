module decoder_3_to_8 (
    input        i_en,   // Input: Enable signal
    input  [2:0] i_a,    // Input: 3-bit address/data
    output reg [7:0] o_y); // Output: 8-bit decoded output

    always @(*) begin
        o_y = 8'b00000000;
        if (i_en) begin
            case (i_a)
                3'b000:  o_y = 8'b00000001; // Activate output 0
                3'b001:  o_y = 8'b00000010; // Activate output 1
                3'b010:  o_y = 8'b00000100; // Activate output 2
                3'b011:  o_y = 8'b00001000; // Activate output 3
                3'b100:  o_y = 8'b00010000; // Activate output 4
                3'b101:  o_y = 8'b00100000; // Activate output 5
                3'b110:  o_y = 8'b01000000; // Activate output 6
                3'b111:  o_y = 8'b10000000; // Activate output 7
                default: o_y = 8'b00000000; // All others, no output
            endcase
        end
    end

endmodule


//------------------------------------------------------------------
// Testbench for the 3-to-8 Decoder
// r_ for registers (stimulus)
// w_ for wires (observed)
//------------------------------------------------------------------

module decoder_3_to_8_tb;

    reg        r_i_en; 
    reg  [2:0] r_i_a;  
    wire [7:0] w_o_y;  

    decoder_3_to_8 UUT (
        .i_en(r_i_en),
        .i_a(r_i_a),
        .o_y(w_o_y) );

    initial begin
      $monitor("%4d , %1b  , %3b , %8b", $time, r_i_en, r_i_a, w_o_y);

        r_i_en = 1'b1; 
        r_i_a  = 3'b000;
        #10;
    
        for (integer i = 0; i < 8; i = i + 1) begin
            r_i_a = i;
            #10;
        end
        r_i_en = 1'b0;
        r_i_a = 3'b101;
        #10;
        r_i_en = 1'b1;
        #10;
        $finish; // End the simulation
    end

endmodule
