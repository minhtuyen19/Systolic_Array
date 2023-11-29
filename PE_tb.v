`timescale 1ns/1ps
module PE_tb();
    reg clk;
    reg reset;

    reg mode; 
    reg shiftRead;

    reg [31:0] Xin;
    reg [31:0] Zin;
    wire [31:0] Xout;
    wire [31:0] Zout;

    PE u1 (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .shiftRead(shiftRead),
        .Xin(Xin),
        .Zin(Zin),
        .Xout(Xout),
        .Zout(Zout)
    );

    initial begin
        clk = 1'b0;
        reset = 1'b0;
        forever begin
            #10 begin
                clk = !clk;
            end
        end
    end

    initial begin
        #100 begin
            reset = 1'b1;
            mode = 1'b1;
            Zin = 32'd0;
            Xin = 32'd0;
            sorting(32'd10, Xin);
            sorting(32'd24, Xin);
            sorting(32'd6, Xin);
            sorting(32'd7, Xin);
            sorting(32'd3, Xin);
            sorting(32'd1, Xin);
            sorting(32'd100, Xin);
            sorting(32'd6, Xin);
        end
        #100 begin
            mode = 1'b0;
            shiftRead = 1'b1;
            read(32'd9, Zin);
            read(32'd6, Zin);
            read(32'd5, Zin);
            read(32'd3, Zin);
        end
    end


    task sorting;
        input [31:0] value;
        output [31:0] Xin;
        begin
            #20 begin
                Xin = value;
                $display(Xin);
            end
        end
    endtask

    task read;
        input [31:0] value;
        output [31:0] Zin;
        begin
            #20 begin
                Zin = value;
                $display(Zin);
            end
        end
    endtask

endmodule



