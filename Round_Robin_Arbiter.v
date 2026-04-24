module arbiter_rr (
    input clk,
    input rst,
    input [3:0] req,
    output reg [3:0] gnt
);

reg [1:0] ptr;  // 2-bit pointer (0 to 3)

always @(posedge clk or posedge rst) begin
    if (rst) begin
        ptr <= 2'd0;
        gnt <= 4'b0000;
    end 
    else begin
        gnt <= 4'b0000;  // clear previous grant

        case (ptr)
            2'd0: begin
                if (req[0]) gnt[0] <= 1'b1;
                else if (req[1]) gnt[1] <= 1'b1;
                else if (req[2]) gnt[2] <= 1'b1;
                else if (req[3]) gnt[3] <= 1'b1;
            end

            2'd1: begin
                if (req[1]) gnt[1] <= 1'b1;
                else if (req[2]) gnt[2] <= 1'b1;
                else if (req[3]) gnt[3] <= 1'b1;
                else if (req[0]) gnt[0] <= 1'b1;
            end

            2'd2: begin
                if (req[2]) gnt[2] <= 1'b1;
                else if (req[3]) gnt[3] <= 1'b1;
                else if (req[0]) gnt[0] <= 1'b1;
                else if (req[1]) gnt[1] <= 1'b1;
            end

            2'd3: begin
                if (req[3]) gnt[3] <= 1'b1;
                else if (req[0]) gnt[0] <= 1'b1;
                else if (req[1]) gnt[1] <= 1'b1;
                else if (req[2]) gnt[2] <= 1'b1;
            end

            default: gnt <= 4'b0000;
        endcase

        // ✅ SAFE POINTER UPDATE (NO TRUNCATION)
        case (ptr)
            2'd0: ptr <= 2'd1;
            2'd1: ptr <= 2'd2;
            2'd2: ptr <= 2'd3;
            2'd3: ptr <= 2'd0;
            default: ptr <= 2'd0;
        endcase

    end
end

endmodule