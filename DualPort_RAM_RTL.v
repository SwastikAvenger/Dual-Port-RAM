//8 location x 16 bits Asynchronous DPRAM
//Read and Write Clock different
`timescale 1ns / 1ps
module Lab5Assign2(
    input wire rst,
    input wire wr_clk,   //write clock
    input wire rd_clk,   //read clock
    input wire we,       //write enable
    input wire re,       //real enable 
    input wire [7:0] data_in,    //8 bit input data

    output reg [7:0] data_out    //8 bit output data
);

    reg [7:0]mem[15:0];     //memory size, 16 cells, each cell being 8bit wide
    reg [3:0] wr_addr;      //write address
    reg [3:0] rd_addr;      //read address
    //Write Port
    always@(posedge wr_clk)begin
        if(rst)begin
            wr_addr = 4'b0;     //reset the write address
            rd_addr = 4'b0;     //reset the read address
            data_out = data_out;
        end
        else if(we)begin
            mem[wr_addr] = data_in;
            wr_addr = wr_addr + 1'b1;
        end
    end
    
    //Read Port
    always@(posedge rd_clk)begin
        if(rst)begin
            wr_addr = 4'b0;     //reset the write address
            rd_addr = 4'b0;     //reset the read address
            data_out = data_out;
        end
        else if(re)begin
            data_out = mem[rd_addr];
            rd_addr = rd_addr + 1'b1;
        end
    end
    
endmodule
