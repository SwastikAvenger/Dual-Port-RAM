`timescale 1ns/1ps
module tb_Lab5Assign2();
    reg we; reg re; reg rst;
    reg wr_clk; reg rd_clk;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    //Dut declaration
    Lab5Assign2 dut(
        .we(we),
        .re(re),
        .rst(rst),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    always begin
        #5 wr_clk = ~wr_clk;
    end

    always begin
        #10 rd_clk = ~rd_clk;
    end

    // Stimulus process
    initial begin
        wr_clk = 0;
        rd_clk = 0;
        rst = 1;
        we = 0;
        re = 0;
        data_in = 8'h00;

        #40;
        rst = 0;
        #10;

        @(negedge wr_clk);
        we = 1;
        data_in = 8'hAA; // Written at wr_addr = 0
        
        @(negedge wr_clk);
        data_in = 8'hBB; // Written at wr_addr = 1
        
        @(negedge wr_clk);
        data_in = 8'hCC; // Written at wr_addr = 2
        
        @(negedge wr_clk);
        data_in = 8'hDD; // Written at wr_addr = 3
        
        @(negedge wr_clk);
        we      = 0;     // Stop writing
        data_in = 8'h00;
        #20;

        // Read the values back 
        @(negedge rd_clk);
        re = 1;          // Reads 8'hAA from rd_addr = 0
        
        @(negedge rd_clk); // Reads 8'hBB from rd_addr = 1
        @(negedge rd_clk); // Reads 8'hCC from rd_addr = 2
        @(negedge rd_clk); // Reads 8'hDD from rd_addr = 3
        @(negedge rd_clk);
        re = 0;          // Stop reading

        #100;
        $finish;
    end

    initial begin
        $monitor("Time=%0dns | rst=%b | we=%b data_in=%h | re=%b data_out=%h", 
                 $time, rst, we, data_in, re, data_out);
    end
    
endmodule
