module out_i2s #(parameter DATA_WIDTH = 24) (
    input BCLK,
    input start,
    input [(DATA_WIDTH - 1): 0] left_data,
    input [(DATA_WIDTH - 1): 0] right_data,
    output reg DACLRC,
    output reg DACDAT,
    output reg data_ready
);

    // Internal register
    reg[5:0] bit_counter = 5'd0;
    reg running = 0;

    //DAC processing
    always @(negedge BCLK) begin
        if(start) begin
            running = 1;
            bit_counter = 5'd0;
            data_ready = 0;
        end
        if(running) begin
            DACLRC = bit_counter >= DATA_WIDTH + 1;
            if(DACLRC) begin
                if(bit_counter > DATA_WIDTH + 1) DACDAT = right_data[DATA_WIDTH + DATA_WIDTH + 1 - bit_counter];
            end else begin
                if (bit_counter > 0) DACDAT = left_data[DATA_WIDTH - bit_counter];
            end
            if(!start) bit_counter = bit_counter + 1;
            if(bit_counter == DATA_WIDTH + DATA_WIDTH + 3) begin
                running = 0;
                data_ready = 1;
            end
        end
    end

   endmodule
