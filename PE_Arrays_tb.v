`timescale 10ps/1ps
module PE_Arrays_tb();

    parameter Data_width = 8;
    parameter WORD_SIZE = 72;

    reg iClk;
    reg iRest_n;
    reg enable_w;

    reg Run;

    //Reg data from
    reg [WORD_SIZE-1:0] Weight_f_top;
    reg [Data_width-1:0] Ifmap_f_left_1, Ifmap_f_left_2, Ifmap_f_left_3, Ifmap_f_left_4, Ifmap_f_left_5, Ifmap_f_left_6, Ifmap_f_left_7, Ifmap_f_left_8, Ifmap_f_left_9;

    //wire data to
    wire [Data_width-1:0] Psum_t_down;
    wire [WORD_SIZE-1:0] Ifmap_t_right;

    PE_Arrays #(
        .Data_width(Data_width),
        .WORD_SIZE(WORD_SIZE)
    )
    
    U1 (
        .iClk(iClk),
        .iRest_n(iRest_n),
        .enable_w(enable_w),
        .Run(Run),
        .Weight_f_top(Weight_f_top),
        .Ifmap_f_left_1(Ifmap_f_left_1),
        .Ifmap_f_left_2(Ifmap_f_left_2),
        .Ifmap_f_left_3(Ifmap_f_left_3),
        .Ifmap_f_left_4(Ifmap_f_left_4),
        .Ifmap_f_left_5(Ifmap_f_left_5),
        .Ifmap_f_left_6(Ifmap_f_left_6),
        .Ifmap_f_left_7(Ifmap_f_left_7),
        .Ifmap_f_left_8(Ifmap_f_left_8),
        .Ifmap_f_left_9(Ifmap_f_left_9),
        .Psum_t_down(Psum_t_down),
        .Ifmap_t_right(Ifmap_t_right)
    );

    initial begin
        iClk = 1'b0;
        iRest_n = 1'b0;
        Run = 1'b0;
        forever begin
            #10 iClk = ~iClk;
        end
    end

    initial begin
        Weight_f_top = 72'b00000001_00000001_00000001_00000001_00000001_00000001_00000001_00000001_00000001;
        #20 begin
            iRest_n = 1'b1;
            enable_w = 1'b1;
            Run = 1'b1;
        end
        #10
            Ifmap_f_left_1 = 8'd1;
        #20 
            Ifmap_f_left_2 = 8'd1;
        #20
            Ifmap_f_left_3 = 8'd1;
        #20
            Ifmap_f_left_4 = 8'd1;
        #20
            Ifmap_f_left_5 = 8'd1;
        #20
            Ifmap_f_left_6 = 8'd1;
        #20
            Ifmap_f_left_7 = 8'd1;
        #20
            Ifmap_f_left_8 = 8'd1;
        #20
            Ifmap_f_left_9 = 8'd1;
    end

endmodule
