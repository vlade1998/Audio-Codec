module tremolo
#(parameter DATA_WIDTH=16)
(
    input clk,
    input signed[(DATA_WIDTH-1):0] audio_right_in,
    input signed[(DATA_WIDTH-1):0] audio_left_in,
    output reg signed[(DATA_WIDTH-1):0] audio_right_out,
    output reg signed[(DATA_WIDTH-1):0] audio_left_out
);
    wire[15:0] sine;

    sine_generator sine_generator(
        .clk(clk),
        .fcw(24'b000000000000000010000000),
        .sine(sine)
    );

    always @(negedge clk) begin
        audio_right_out = audio_right_out*sine;
        audio_left_out = audio_left_out*sine;
    end

endmodule

