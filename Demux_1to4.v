module demux_1_to_4 (
    input wire data_in,      // Data input line
    input wire [1:0] select, // 2 select lines (S1, S0)
    output reg [3:0] data_out // 4 output lines (Y3, Y2, Y1, Y0)
);

    // Behavioral description using a 'case' statement
    always @(*) begin
        // By default, all outputs are set to 0
        data_out = 4'b0000;

        case(select)
            2'b00: data_out[0] = data_in; // Select Y0
            2'b01: data_out[1] = data_in; // Select Y1
            2'b10: data_out[2] = data_in; // Select Y2
            2'b11: data_out[3] = data_in; // Select Y3
            default: data_out = 4'b0000; // Unhandled cases
        endcase
    end
endmodule
