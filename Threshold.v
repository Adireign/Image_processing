module THRESHOLD #(    
    parameter HEIGHT1 = 768,
    WIDTH1 = 512,
    THRESHOLD= 90,
    INFILE1 =  "IM.hex"
    ) (
    input clk,
    input wire[7:0] v,
    output reg[7:0] R,
    output reg[7:0] G,
    output reg[7:0] B
);
wire [7:0]a;
wire [7:0]b;
wire [7:0]c;

IMAGE_READ #(.HEIGHT(HEIGHT1),.WIDTH(WIDTH1),.INFILE(INFILE1)) a2(clk,a,b,c);
 
always@(posedge clk)
begin
        if((a+b+c)/3>THRESHOLD) 
        begin
            R = 255;
            G = 255;
            B = 255;
        end
        else begin
            R = 0;
            G = 0;
            B = 0;
        end
end
endmodule