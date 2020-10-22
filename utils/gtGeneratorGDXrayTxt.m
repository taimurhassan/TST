clc
clear all
close all

% change this as per your system location
pn = 'C:\Users\Windows\Downloads\Baggages\B0001\';
item = "razor"; % change this as per items contained in the 'pn' folder.
load([pn 'ground_truth.txt']);
bb = ground_truth;

ext_img = [pn '*.png'];
a = dir(ext_img);
nfile = length(a);
gt = {};

index = 1;
for i=1:nfile
    fn = a(i).name; 
    img = imread([pn fn]);
    
    minY = bb(i,2);
    maxY = bb(i,3);
    minX = bb(i,4);
    maxX = bb(i,5);
    
    if ismatrix(img)
        [r,c] = size(img);
    else
        [r,c,~] = size(img);
    end
    
    im2 = zeros(r,c);
    
    if item == "gun"
        im2(minX:maxX,minY:maxY) = 1;
    elseif item == "razor"
        im2(minX:maxX,minY:maxY) = 2;
    elseif item == "shuriken"
        im2(minX:maxX,minY:maxY) = 3;
    elseif item == "knife"
        im2(minX:maxX,minY:maxY) = 4;
    end
    
    im2 = uint8(im2);
    
    imwrite(imresize(im2,[576 768],'bilinear'),[pn 'gt\' fn],'PNG');
end