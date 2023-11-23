module up_down_counter (
  input wire clk,
  input wire rst,
  input wire up,
  output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
  if (rst) begin
    count <= 4'b0000;
  end else begin
    if (up) begin
      count <= count + 1;
    end else begin
      count <= count - 1;
    end
  end
end

endmodule
