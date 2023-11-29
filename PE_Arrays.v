module PE_Arrays #(
    parameter Data_width = 8,
    parameter WORD_SIZE = 72
)
(
    input iClk,
    input iRest_n,

    //control signal
    input Run,
    input enable_w,


    //Data from
    input [Data_width-1:0] Ifmap_f_left_1, Ifmap_f_left_2, Ifmap_f_left_3, Ifmap_f_left_4, Ifmap_f_left_5, Ifmap_f_left_6, Ifmap_f_left_7, Ifmap_f_left_8, Ifmap_f_left_9,
    input [WORD_SIZE-1:0] Weight_f_top,
    output [Data_width-1:0] Psum_t_down,
    output [WORD_SIZE-1:0] Ifmap_t_right
);

wire [Data_width-1:0] Psum_1, Psum_2, Psum_3, Psum_4, Psum_5, Psum_6, Psum_7, Psum_8;


//**************************************************//
//                  SYSTOLIC_ARRAY_9                
//**************************************************//

PE pe00(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[7:0]), .Ifmap_f_left(Ifmap_f_left_1), .Psum_f_top(0) , .Ifmap_t_right(Ifmap_t_right[7:0]), .Psum_t_down(Psum_1));
PE pe01(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[15:8]), .Ifmap_f_left(Ifmap_f_left_2), .Psum_f_top(Psum_1), .Ifmap_t_right(Ifmap_t_right[15:8]), .Psum_t_down(Psum_2));
PE pe02(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[23:16]), .Ifmap_f_left(Ifmap_f_left_3), .Psum_f_top(Psum_2), .Ifmap_t_right(Ifmap_t_right[23:16]), .Psum_t_down(Psum_3));
PE pe10(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[31:24]), .Ifmap_f_left(Ifmap_f_left_4), .Psum_f_top(Psum_3), .Ifmap_t_right(Ifmap_t_right[31:24]), .Psum_t_down(Psum_4));
PE pe11(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[39:32]), .Ifmap_f_left(Ifmap_f_left_5), .Psum_f_top(Psum_4), .Ifmap_t_right(Ifmap_t_right[39:32]), .Psum_t_down(Psum_5));
PE pe12(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[47:40]), .Ifmap_f_left(Ifmap_f_left_6), .Psum_f_top(Psum_5), .Ifmap_t_right(Ifmap_t_right[47:40]), .Psum_t_down(Psum_6));
PE pe20(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[55:48]), .Ifmap_f_left(Ifmap_f_left_7), .Psum_f_top(Psum_6), .Ifmap_t_right(Ifmap_t_right[55:48]), .Psum_t_down(Psum_7));
PE pe21(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[63:56]), .Ifmap_f_left(Ifmap_f_left_8), .Psum_f_top(Psum_7), .Ifmap_t_right(Ifmap_t_right[63:56]), .Psum_t_down(Psum_8));
PE pe22(.iClk(iClk), .iRest_n(iRest_n), .enable_w(enable_w), .Run(Run), .Weight_f_top(Weight_f_top[71:64]), .Ifmap_f_left(Ifmap_f_left_9), .Psum_f_top(Psum_8), .Ifmap_t_right(Ifmap_t_right[71:64]), .Psum_t_down(Psum_t_down));



// genvar i;
// generate 
//     for(i = 1; i < 9; i = i+1)begin
//         if(i == 1)begin
//             PE process_element(
//                 .iClk(iClk),
//                 .iRest_n(iRest_n),
//                 .enable_w(enable_w),
//                 .Run(Run),
//                 .Weight_f_top(Weight_f_top[]),
//                 .Ifmap_f_left(Ifmap_f_left[]),
//                 .Ifmap_t_right(Ifmap_t_right[i]),
//                 .Psum_f_top(Psum_f_top[i]),
//                 .Psum_t_down(Psum_t_down)
//             );
//         end
//         else if(i == 8)begin
//             PE process_element(
//                 .iClk(iClk),
//                 .iRest_n(iRest_n),
//                 .enable_w(enable_w),
//                 .Run(Run),
//                 .Weight_f_top(Weight_f_top[i]),
//                 .Ifmap_t_right(Ifmap_f_right[i]),
//                 .Ifmap_f_left(Ifmap_f_left[i]),
//                 .Psum_f_top(Psum_f_top[i]),
//                 .Psum_t_down(Psum_t_down)
//             );
//         end
//         else begin
//             PE process_element(
//                 .iClk(iClk),
//                 .iRest_n(iRest_n),
//                 .enable_w(enable_w),
//                 .Run(Run),
//                 .Weight_f_top(Weight_f_top[i]),
//                 .Ifmap_f_right(Ifmap_f_right[i]),
//                 .Ifmap_f_left(Ifmap_f_left[i]),
//                 .Psum_f_top(Psum_f_top[i]),
//                 .Psum_t_down(Psum_t_down)
//             );
//         end
//     end
// endgenerate

endmodule