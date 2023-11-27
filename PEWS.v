module PE #(
    parameter Data_width = 8
)
(
    input iClk,
    input iRest_n,

    //input data from
    input [Data_width-1:0]Weight_f_top,
    input [Data_width-1:0]Ifmap_f_left,
    input [Data_width-1:0]Psum_f_top,

    //control signal
    input enable_w,
    input enable_sum,
    input enable_in,


    //output data to
    output [Data_width-1:0]Ifmap_t_right,
    output [Data_width-1:0]Psum_t_down

);

    reg [Data_width-1:0]Weight;
    reg [Data_width-1:0]Input;
    reg [Data_width-1:0]Psum;

always@(posedge iClk, negedge iRest_n)
    if(iRest_n)
    begin
        
        Weight = 8'd0;
        Input = 8'd0;
        Psum = 8'd0;
    end
    else begin
        if(enable_w)
            Weight = Weight_f_top;
        else Weight = Weight;            
    end
assign Psum_t_down = Weight*Input + Psum_f_top;
always@(*)begin
        if(enable_in)
            Input = Ifmap_f_left;
        else
            Input = Input;
    end
assign Ifmap_t_right = Input;

    always@(*)begin
        if(enable_sum)
            Psum = Psum_f_top;
        else
            Psum = Psum;
    end
endmodule