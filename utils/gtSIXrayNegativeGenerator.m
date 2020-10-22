clc
clear all
close all
warning off

% change this as per your system location
pn  = 'C:\accv\SIXray\1\1\'; 
ext_img = [pn '*.jpg'];
a = dir(ext_img);
nfile = length(a);

index = 1;
for i=1:nfile
    fn = a(i).name; 
    
    img = uint8(zeros(576, 768));
    
    [r,c] = size(img);
    
    imwrite(imresize(img,[576 768],'bilinear'),[pn 'gt\' replace(fn,".jpg","") '.png'],'PNG');
end