module overdrive #(parameter DATA_WIDTH = 24) (
    input clk,
    input signed[(DATA_WIDTH-1):0] audio_right_in,
    input signed[(DATA_WIDTH-1):0] audio_left_in,
    output reg signed[(DATA_WIDTH-1):0] audio_right_out,
    output reg signed[(DATA_WIDTH-1):0] audio_left_out
);

    reg[DATA_WIDTH-1:0] threshold = 24'd8388600;

    always @ (negedge clk) begin
        if (audio_right_in <= -threshold)
            audio_right_out = -threshold;
        else if (audio_right_in > -threshold && audio_right_in < threshold)
            audio_right_out = audio_right_in;
        else
            audio_right_out = threshold;

        if (audio_left_in <= -threshold)
            audio_left_out = -threshold;
        else if (audio_left_in > -threshold && audio_left_in < threshold)
            audio_left_out = audio_left_in;
        else
            audio_left_out = threshold;
    end

endmodule
