close all;
ip=imread('parrot.bmp'); % 24-bit BMP image RGB888 
var=1;
for i=512:-1:1 % image is written from the last row to the first row
for j=1:768
op(var)=ip(i,j,1);
op(var+1)=ip(i,j,2);
op(var+2)=ip(i,j,3);
var=var+3;
end
end
fid = fopen('testimage.hex', 'wt');
fprintf(fid, '%x\n', op);
fclose(fid);