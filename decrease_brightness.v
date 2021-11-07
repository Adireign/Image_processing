module IMAGE_BRIGHTNESS_DECREASE #(    
    parameter HEIGHT1 = 768,
    WIDTH1 = 512,
    INFILE1 =  "testimage.hex"
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
        if(a - v <= 0 || a - v >= a) R = 0;
        else R = a - v; 
        if(b - v <= 0 || b - v >= b) G = 0;
        else G = b - v; 
        if(c - v <= 0 || c - v >= c) B = 0;
        else B = c - v; 
end
endmodule
