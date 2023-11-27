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
    input Run,


    //output data to
    output [Data_width-1:0]Ifmap_t_right,
    output [Data_width-1:0]Psum_t_down

);

    reg [Data_width-1:0]Weight;
    reg [Data_width-1:0]Input;
    reg [Data_width-1:0]Psum;

    // reg enable_in;
    // reg enable_sum;

always@(posedge iClk, negedge iRest_n)begin
    if(!iRest_n)
    begin
        
        Weight = 8'd0;
        Input = 8'd0;
        Psum = 8'd0;
    end
    else begin
        if(enable_w)
            Weight = Weight_f_top;
        else Weight = Weight;  
        if(Run) begin
            Input = Ifmap_f_left;
            Psum = Psum_f_top;
        end
        else begin
            Input = Input;
            Psum = Psum;
        end

    end
end
assign Ifmap_t_right = Input;
assign Psum_t_down = Weight*Input + Psum_f_top;


// always@(*)begin
//     if(Run)begin
//         enable_in = 1'b1;
//         enable_sum = 1'b1;
//     end
//     else begin
//         enable_in = 1'b0;
//         enable_sum = 1'b0;
//     end
// end



endmodule