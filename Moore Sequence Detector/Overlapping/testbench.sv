`timescale 10ns/100ps
module testbench;
  
  reg clk_tb;
  reg reset_tb;
  reg inbits_tb;
  wire detect_tb;
  
  initial
    begin
      clk_tb = 0;
      reset_tb = 0;
      inbits_tb = 0;
    end
  
  initial
    begin
      reset_tb = 1'b1;
      #5 reset_tb = 1'b0;
    end
  
  always
    begin
      #10 clk_tb = !clk_tb;
    end
  
  always
    begin
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 1;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 1;
      #20 inbits_tb = 0;
      #20 inbits_tb = 0;
    end
  
  initial #500 $finish;
  
  seq_detect_ov seq_detect_inst(.clk(clk_tb), .inbits(inbits_tb), .detect(detect_tb), .reset(reset_tb));
  
endmodule
  