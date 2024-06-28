// 1011 Sequence Detector Non-Overlapping

module seq_detect_non_ov(
  input clk,
  input inbits,
  input reset,
  output reg detect
);
  
  reg[2:0] state;
  
  initial
    begin
      state = 3'b000;
    end
  
  always@(posedge clk, posedge reset)
    begin
      if (reset) state <= 3'b00;
      else
        begin
          case (state)
            3'b000:
              begin
                if (inbits)	state <= 3'b001;
                else		state <= 3'b000;
              end
            3'b001:
              begin
                if (inbits)	state <= 3'b001;
                else		state <= 3'b010;
              end
            3'b010:
              begin
                if (inbits)	state <= 3'b011;
                else		state <= 3'b000;
              end
            3'b011:
              begin
                if (inbits)	state <= 3'b100;
                else		state <= 3'b010;
              end
            3'b100:
              begin
                if (inbits)	state <= 3'b001;
                else		state <= 3'b000;
              end
          endcase
        end
    end
  
  always@(posedge clk, posedge reset)
    begin
      if (reset)
        detect <= 0;
      else if (state == 3'b100)
        detect <= 1;
      else
        detect <= 0;
    end
  
endmodule