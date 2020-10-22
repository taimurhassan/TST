clc
clear all
close all

% change this as per your system location
pn = 'C:\accv\OPIXray-master\DOAM\OPIXray_Dataset\test\test_annotation\';
pn2 = 'C:\accv\OPIXray-master\DOAM\OPIXray_Dataset\test\test_image\';

ext_img = [pn '*.txt'];
a = dir(ext_img);
nfile = length(a);
gt = {};

index = 1;
for i=1:nfile
    fn = a(i).name; 
    fileID = fopen([pn fn]);
    formatSpec = "%s";
    A = textscan(fileID,formatSpec);
    fileName = A{1}{1};
    item = A{1}{2};
    minY = str2num(A{1}{3});
    minX = str2num(A{1}{4});
    maxY = str2num(A{1}{5});
    maxX = str2num(A{1}{6});
    img = imread([pn2 replace(fn,'txt','jpg')]);
    
    [r,c,~] = size(img);
    
    im2 = zeros(r,c);
    
    if item == "Straight_Knife"
        im2(minX:maxX,minY:maxY) = 1;
    elseif item == "Scissor"
        im2(minX:maxX,minY:maxY) = 2;
    elseif item == "Multi-tool_Knife"
        im2(minX:maxX,minY:maxY) = 3;
    elseif item == "Utility_Knife"
        im2(minX:maxX,minY:maxY) = 4;
    elseif item == "Folding_Knife"
        im2(minX:maxX,minY:maxY) = 5;
    end
    
    im2 = uint8(im2);
    
    imwrite(imresize(im2,[576 768],'bilinear'),[pn 'gt\' replace(fn,".txt","") '.png'],'PNG');
end