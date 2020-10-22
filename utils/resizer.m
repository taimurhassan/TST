clc
clear all
close all

pn = 'C:\accv\code\trainingDataset\train_images\';

imagefiles = dir([pn '*.png']);

nfiles = length(imagefiles);    

for ii=1:1:nfiles

    fn = imagefiles(ii).name;
    img=imread([pn fn]);
    
    if ismatrix(img) == false
        img = rgb2gray(img);
    end
    
%     if(size(img,3) ~= 3)
%         img = cat(3,img,img,img);
%     end

    img = imresize(img,[576 768],'bilinear');
    fn = replace(fn,'.png','');
    imwrite(img,[pn 'Resized\' fn '.png'],'PNG');

end