clc
clear all
close all

load('gTruth.mat');

for i = 1:length(gTruth.DataSource.Source)
    
    cell = gTruth.DataSource.Source(i);
    fn = cell{1};
    [filepath,name,ext] = fileparts(fn);
    
    img = imread(fn);
    img = imresize(img,[576 768],'bilinear');
    imwrite(img,['images\' name '.png'],'PNG');
    
    cell = gTruth.LabelData.PixelLabelData(i);
    labelPath = cell{1};
    img = imread(labelPath);
    
    img = imresize(img,[576 768],'bilinear');
    imwrite(img,['gt\' name '.png'],'PNG');
end