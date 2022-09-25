module tlc(clk,rst,TRed,TYel,TGrn);
parameter SIZE = 8;
parameter	RED = 2'b01,
		YELLOW = 2'b10,
		GREEN = 2'b11;

input clk,rst;
output reg TRed,TYel,TGrn;

reg [SIZE-1:0] count;
reg [1:0]current_state, nxt_state;

always @(posedge clk) 
begin
	if (rst) 
	begin
		current_state = RED;
		count = 0;
		{TRed,TYel,TGrn} = 3'b000;
	end
	else 
	begin
	current_state = nxt_state;
	count = count +1;
	end
end

always @(current_state or count) 
begin
	case (current_state)

		RED : if (count == 40) begin
					nxt_state = YELLOW;
					count = 0;
					$display ("%0t YELLOW",$time);
					TRed = 1'b0;
				end
				else begin
					nxt_state = RED;
					TRed = 1'b1;
				end

		GREEN : if (count == 30) begin
					nxt_state = RED;
					count = 0;
					$display ("%0t RED",$time);
					TGrn = 1'b0;
				end
				else begin
					nxt_state = GREEN;
					TGrn = 1'b1;
				end
		YELLOW : if (count == 10) begin
					nxt_state = GREEN;
					count = 0;
					$display ("%0t GREEN",$time);
					TYel = 1'b0;
				end
				else begin
					nxt_state = YELLOW;
					TYel = 1'b1;
				end

	endcase
end
endmodule
