module audio #(parameter DATA_WIDTH = 24) (
    input clk,
    // Codec
    output BCLK,
    output ADCLRC,
    output DACLRC,
    input ADCDAT,
    output DACDAT
);

    wire start,in_data_ready;

    assign BCLK = clk;

    in_i2s audio_in(
        .BCLK(BCLK),
        .ADCDAT(ADCDAT),    
        .start(start),
        .ADCLRC(ADCLRC),
        .data_ready(in_data_ready);

     )  

endmodule
