module PE_Arrays #(
    parameter Data_width = 8
)
(
    input iClk,
    input iRest_n,

    //control signal
    input Run,
    input enable_w,

    output [Data_width-1:0] Psum_t_down,

);

wire [Data_width-1:0] Ifmap_f_left [Data_width-1:0];
wire [Data_width-1:0] Weight_f_top [Data_width-1:0];
wire [Data_width-1:0] Psum_f_top [Data_width-1:0];

wire [Data_width-1:0] Ifmap_t_right[Data_width-1:0];

genvar i;
generate 
    for(i = 1; i < 9; i = i+1)begin
        if(i == 1)begin
            PE process_element(
                .iClk(iClk),
                .iRest_n(iRest_n),
                .enable_w(enable_w),
                .Run(Run),
                .Weight_f_top(Weight_f_top[i]),
                .Ifmap_f_left(Ifmap_f_left[i]),
                .Ifmap_t_right(Ifmap_t_right[i]),
                .Psum_f_top(Psum_f_top[i]),
                .Psum_t_down(Psum_t_down)
            );
        end
        else if(i == 8)begin
            PE process_element(
                .iClk(iClk),
                .iRest_n(iRest_n),
                .enable_w(enable_w),
                .Run(Run),
                .Weight_f_top(Weight_f_top[i]),
                .Ifmap_t_right(Ifmap_f_right[i]),
                .Ifmap_f_left(Ifmap_f_left[i]),
                .Psum_f_top(Psum_f_top[i]),
                .Psum_t_down(Psum_t_down)
            );
        end
        else begin
            PE process_element(
                .iClk(iClk),
                .iRest_n(iRest_n),
                .enable_w(enable_w),
                .Run(Run),
                .Weight_f_top(Weight_f_top[i]),
                .Ifmap_f_right(Ifmap_f_right[i]),
                .Ifmap_f_left(Ifmap_f_left[i]),
                .Psum_f_top(Psum_f_top[i]),
                .Psum_t_down(Psum_t_down)
            );
        end
    end
endgenerate

endmodule