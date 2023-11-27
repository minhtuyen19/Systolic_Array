`timescale 10ps/1ps
module PE_tb();
    parameter Data_width = 8;
    reg iClk;
    reg iRest_n;
    reg enable_w;

    reg Run;

    //reg data from
    reg [Data_width - 1: 0] Weight_f_top;
    reg [Data_width - 1: 0] Psum_f_top;
    reg [Data_width - 1: 0] Ifmap_f_left;

    //wire data to
    wire [Data_width - 1: 0] Ifmap_t_right;
    wire [Data_width - 1: 0] Psum_t_down;

    PE # (
        .Data_width(Data_width)
    )
    U1 (
        .iClk(iClk),
        .iRest_n(iRest_n),
        .enable_w(enable_w),
        .Run(Run),
        .Weight_f_top(Weight_f_top),
        .Psum_f_top(Psum_f_top),
        .Ifmap_f_left(Ifmap_f_left),
        .Ifmap_t_right(Ifmap_t_right),
        .Psum_t_down(Psum_t_down)
    );

    initial begin
        iClk = 1'b0;
        iRest_n = 1'b0;
        Psum_f_top = 8'd0;
        Run = 1'b0;
        forever begin
            #10 iClk = ~iClk;
        end
    end

    initial begin
        Weight_f_top = 8'd5;
        Ifmap_f_left = 8'd4;
        enable_w = 1'b0;
        #20 begin
            iRest_n = 1'b1;
            enable_w = 1'b1;
            Run = 1'b1;
        end
    end

endmodule 
