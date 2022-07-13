module audio #(parameter DATA_WIDTH = 24) (
    input clk,
    // Codec
    output wire BCLK,
    output wire ADCLRC,
    output wire DACLRC,
    input ADCDAT,
    output DACDAT
);

    wire in_data_ready, out_data_ready;
    reg[(DATA_WIDTH-1):0] left_data, right_data;
    reg pClk = 1;
    reg start_in, start_out;

    assign BCLK = clk;

    in_lj audio_in(
        .BCLK(BCLK),
        .ADCDAT(ADCDAT),    
        .start(start_in),
        .ADCLRC(ADCLRC),
        .data_ready(in_data_ready),
        .left_data(left_data),
        .right_data(right_data)
    ); 

   out_lj(
       .BCLK(BCLK),
       .DACLRC(DACLRC),
       .DACDAT(DACDAT),
       .left_data(left_data),
       .right_data(right_data),
       .start(start_out),
       .data_ready(out_data_ready)
   );

   always @(posedge clk) begin
       if(pClk)begin
           pClk = 0;
           start_in = 1;
       end
       if(in_data_ready) begin
           start_out = 1;
       end
       start_in = 0;
   end

endmodule
