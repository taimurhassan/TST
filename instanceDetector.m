clc
clear all
close all

% change this as per your system location
pn2 = 'C:\accv\code\testingDataset\segmentation_results\';
% coherent tensor representations (output of structure tensor module)
pn = 'C:\accv\code\testingDataset\test_images\';
% path to original images
pn3 = 'C:\accv\code\testingDataset\original\';

ext_img = [pn '*.png'];
a = dir(ext_img);
nfile = length(a);
proposals = {};
obj = [];

% update these color codes by evaluating the results saved at path 'pn2'
bg = [20 215 197];
gun1 = [207 248 132];
gun2 = [183 244 155];
gun3 = [144 71 111];
gun4 = [128 48 71];
gun5 = [50 158 75];
gun6 = [241 169 37];
knife1 = [222 181 51];
knife2 = [244 104 161];
knife3 = [31 133 226];
knife4 = [149 154 55];
knife5 = [104 170 63];
knife6 = [96 94 148];
razor1 = [123 162 197];
razor2 = [46 227 147];
wrench1 = [204 47 7];
wrench2 = [170 252 0];
wrench3 = [141 200 41];
scissor1 = [122 113 97];
scissor2 = [133 16 95];
plier1 = [46 229 72];
plier2 = [250 163 41];
hammer = [19 76 66];
others = [45 35 243];

for i=1:nfile
    fn = a(i).name; 
    img = imread([pn fn]);
    img2 = imread([pn2 fn]);
    
    [r,c,ch] = size(img2);
    im = uint8(zeros(r,c,3));
    im(:,:,1) = 61;
    im(:,:,2) = 38;
    im(:,:,3) = 168;
    
    im3 = im;
    
    gun1m = zeros(r,c,3);
    gun2m = zeros(r,c,3);
    gun3m = zeros(r,c,3);
    gun4m = zeros(r,c,3);
    gun5m = zeros(r,c,3);
    gun6m = zeros(r,c,3);
    knife1m = zeros(r,c,3);
    knife2m = zeros(r,c,3);
    knife3m = zeros(r,c,3);
    knife4m = zeros(r,c,3);
    knife5m = zeros(r,c,3);
    knife61m = zeros(r,c,3);
    razor1m = zeros(r,c,3);
    razor2m = zeros(r,c,3);
    wrench1m = zeros(r,c,3);
    wrench2m = zeros(r,c,3);
    wrench31m = zeros(r,c,3);
    scissor1m = zeros(r,c,3);
	scissor21m = zeros(r,c,3);
    plier1m = zeros(r,c,3);
    plier2m = zeros(r,c,3);
    hammer1m = zeros(r,c,3);
    others1m = zeros(r,c,3);
    
    for i = 1:r
        for j = 1:c
            if img2(i,j,1) == gun1(1) && img2(i,j,2) == gun1(2) && img2(i,j,3) == gun1(3)
                gun1m(i,j,1) = 255;
                gun1m(i,j,2) = 0;
                gun1m(i,j,3) = 0;
            elseif img2(i,j,1) == gun2(1) && img2(i,j,2) == gun2(2) && img2(i,j,3) == gun2(3)
                gun2m(i,j,1) = 0;
                gun2m(i,j,2) = 255;
                gun2m(i,j,3) = 0;
            elseif img2(i,j,1) == gun3(1) && img2(i,j,2) == gun3(2) && img2(i,j,3) == gun3(3)
                gun3m(i,j,1) = 0;
                gun3m(i,j,2) = 0;
                gun3m(i,j,3) = 255;
            elseif img2(i,j,1) == gun4(1) && img2(i,j,2) == gun4(2) && img2(i,j,3) == gun4(3)
                gun4m(i,j,1) = 255;
                gun4m(i,j,2) = 255;
                gun4m(i,j,3) = 0;
            elseif img2(i,j,1) == gun5(1) && img2(i,j,2) == gun5(2) && img2(i,j,3) == gun5(3)
                gun5m(i,j,1) = 0;
                gun5m(i,j,2) = 255;
                gun5m(i,j,3) = 255;
            elseif img2(i,j,1) == gun6(1) && img2(i,j,2) == gun6(2) && img2(i,j,3) == gun6(3)
                gun6m(i,j,1) = 255;
                gun6m(i,j,2) = 0;
                gun6m(i,j,3) = 255;
            elseif img2(i,j,1) == knife1(1) && img2(i,j,2) == knife1(2) && img2(i,j,3) == knife1(3)
                knife1m(i,j,1) = 128;
                knife1m(i,j,2) = 64;
                knife1m(i,j,3) = 0;
            elseif img2(i,j,1) == knife2(1) && img2(i,j,2) == knife2(2) && img2(i,j,3) == knife2(3)
                knife2m(i,j,1) = 64;
                knife2m(i,j,2) = 128;
                knife2m(i,j,3) = 0;
            elseif img2(i,j,1) == knife3(1) && img2(i,j,2) == knife3(2) && img2(i,j,3) == knife3(3)
                knife3m(i,j,1) = 64;
                knife3m(i,j,2) = 0;
                knife3m(i,j,3) = 128;
            elseif img2(i,j,1) == knife4(1) && img2(i,j,2) == knife4(2) && img2(i,j,3) == knife4(3)
                knife4m(i,j,1) = 128;
                knife4m(i,j,2) = 128;
                knife4m(i,j,3) = 64;
            elseif img2(i,j,1) == knife5(1) && img2(i,j,2) == knife5(2) && img2(i,j,3) == knife5(3)
                knife5m(i,j,1) = 64;
                knife5m(i,j,2) = 128;
                knife4m(i,j,3) = 128;
            elseif img2(i,j,1) == razor1(1) && img2(i,j,2) == razor1(2) && img2(i,j,3) == razor1(3)
                razor1m(i,j,1) = 128;
                razor1m(i,j,2) = 64;
                razor1m(i,j,3) = 128;
            elseif img2(i,j,1) == razor2(1) && img2(i,j,2) == razor2(2) && img2(i,j,3) == razor2(3)
                razor2m(i,j,1) = 64;
                razor2m(i,j,2) = 50;
                razor2m(i,j,3) = 0;
            elseif img2(i,j,1) == wrench1(1) && img2(i,j,2) == wrench1(2) && img2(i,j,3) == wrench1(3)
                wrench1m(i,j,1) = 50;
                wrench1m(i,j,2) = 64;
                wrench1m(i,j,3) = 0;
            elseif img2(i,j,1) == wrench2(1) && img2(i,j,2) == wrench2(2) && img2(i,j,3) == wrench2(3)
                wrench2m(i,j,1) = 0;
                wrench2m(i,j,2) = 50;
                wrench2m(i,j,3) = 64;
            elseif img2(i,j,1) == scissor1(1) && img2(i,j,2) == scissor1(2) && img2(i,j,3) == scissor1(3)
                scissor1m(i,j,1) = 64;
                scissor1m(i,j,2) = 20;
                scissor1m(i,j,3) = 20;
            elseif img2(i,j,1) == plier1(1) && img2(i,j,2) == plier1(2) && img2(i,j,3) == plier1(3)
                plier1m(i,j,1) = 20;
                plier1m(i,j,2) = 64;
                plier1m(i,j,3) = 20;
            elseif img2(i,j,1) == plier2(1) && img2(i,j,2) == plier2(2) && img2(i,j,3) == plier2(3)
                plier2m(i,j,1) = 64;
                plier2m(i,j,2) = 20;
                plier2m(i,j,3) = 64;
            elseif img2(i,j,1) == knife6(1) && img2(i,j,2) == knife6(2) && img2(i,j,3) == knife6(3)
                knife61m(i,j,1) = 40;
                knife61m(i,j,2) = 30;
                knife61m(i,j,3) = 0;
            elseif img2(i,j,1) == scissor2(1) && img2(i,j,2) == scissor2(2) && img2(i,j,3) == scissor2(3)
                scissor21m(i,j,1) = 30;
                scissor21m(i,j,2) = 40;
                scissor21m(i,j,3) = 0;
            elseif img2(i,j,1) == others(1) && img2(i,j,2) == others(2) && img2(i,j,3) == others(3)
                others1m(i,j,1) = 20;
                others1m(i,j,2) = 40;
                others1m(i,j,3) = 100;
            elseif img2(i,j,1) == hammer(1) && img2(i,j,2) == hammer(2) && img2(i,j,3) == hammer(3)
                hammer1m(i,j,1) = 40;
                hammer1m(i,j,2) = 22;
                hammer1m(i,j,3) = 11;
            elseif img2(i,j,1) == wrench3(1) && img2(i,j,2) == wrench3(2) && img2(i,j,3) == wrench3(3)
                wrench31m(i,j,1) = wrench3(1);
                wrench31m(i,j,2) = wrench3(2);
                wrench31m(i,j,3) = wrench3(3);
            end
        end
    end
    
    threshold = 600;
    
    g1 = bwareaopen(imbinarize(rgb2gray(gun1m),0.1),threshold);
    g2 = bwareaopen(imbinarize(rgb2gray(gun2m),0.1),threshold);
    g3 = bwareaopen(imbinarize(rgb2gray(gun3m),0.1),threshold);
    g4 = bwareaopen(imbinarize(rgb2gray(gun4m),0.1),threshold);
    g5 = bwareaopen(imbinarize(rgb2gray(gun5m),0.1),threshold);
    g6 = bwareaopen(imbinarize(rgb2gray(gun6m),0.1),threshold);
    k1 = bwareaopen(imbinarize(rgb2gray(knife1m),0.1),threshold);
    k2 = bwareaopen(imbinarize(rgb2gray(knife2m),0.1),threshold);
    k3 = bwareaopen(imbinarize(rgb2gray(knife3m),0.1),threshold);
    s1 = bwareaopen(imbinarize(rgb2gray(knife4m),0.1),threshold);
    s2 = bwareaopen(imbinarize(rgb2gray(knife5m),0.1),threshold);
    r1 = bwareaopen(imbinarize(rgb2gray(razor1m),0.1),threshold);
    r2 = bwareaopen(imbinarize(rgb2gray(razor2m),0.1),threshold);
    w1 = bwareaopen(imbinarize(rgb2gray(wrench1m),0.1),threshold);
    w2 = bwareaopen(imbinarize(rgb2gray(wrench2m),0.1),threshold);
    sc1 = bwareaopen(imbinarize(rgb2gray(scissor1m),0.1),threshold);
    p1 = bwareaopen(imbinarize(rgb2gray(plier1m),0.1),threshold);
    p2 = bwareaopen(imbinarize(rgb2gray(plier2m),0.1),threshold);
    st1 = bwareaopen(imbinarize(rgb2gray(knife61m),0.1),threshold);
    scr1 = bwareaopen(imbinarize(rgb2gray(scissor21m),0.1),threshold);
    po1 = bwareaopen(imbinarize(rgb2gray(others1m),0.1),threshold);
    h1 = bwareaopen(imbinarize(rgb2gray(hammer1m),0.1),threshold);
    a1 = bwareaopen(imbinarize(rgb2gray(wrench31m),0.1),threshold);
    
    gun1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun1m),0.1),threshold),'canny'),'skel');
    gun2m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun2m),0.1),threshold),'canny'),'skel');
    gun3m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun3m),0.1),threshold),'canny'),'skel');
    gun4m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun4m),0.1),threshold),'canny'),'skel');
    gun5m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun5m),0.1),threshold),'canny'),'skel');
    gun6m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(gun6m),0.1),threshold),'canny'),'skel');
    knife1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife1m),0.1),threshold),'canny'),'skel');
    knife2m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife2m),0.1),threshold),'canny'),'skel');
    knife3m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife3m),0.1),threshold),'canny'),'skel');
    knife4m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife4m),0.1),threshold),'canny'),'skel');
    knife5m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife5m),0.1),threshold),'canny'),'skel');
    razor1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(razor1m),0.1),threshold),'canny'),'skel');
    razor2m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(razor2m),0.1),threshold),'canny'),'skel');
    wrench1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(wrench1m),0.1),threshold),'canny'),'skel');
    wrench2m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(wrench2m),0.1),threshold),'canny'),'skel');
    scissor1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(scissor1m),0.1),threshold),'canny'),'skel');
    plier1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(plier1m),0.1),threshold),'canny'),'skel');
    plier2m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(plier2m),0.1),threshold),'canny'),'skel');
    knife61m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(knife61m),0.1),threshold),'canny'),'skel');
	scissor21m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(scissor21m),0.1),threshold),'canny'),'skel');
    others1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(others1m),0.1),threshold),'canny'),'skel');
    hammer1m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(hammer1m),0.1),threshold),'canny'),'skel');
    wrench31m = bwmorph(edge(bwareaopen(imbinarize(rgb2gray(wrench31m),0.1),threshold),'canny'),'skel');
    
    im(:,:,1) = im(:,:,1) + gun1(1) * uint8(g1);
    im(:,:,2) = im(:,:,2) + gun1(2) * uint8(g1);
    im(:,:,3) = im(:,:,3) + gun1(3) * uint8(g1);
    
    im(:,:,1) = im(:,:,1) + gun2(1) * uint8(g2);
    im(:,:,2) = im(:,:,2) + gun2(2) * uint8(g2);
    im(:,:,3) = im(:,:,3) + gun2(3) * uint8(g2);
    
    im(:,:,1) = im(:,:,1) + gun3(1) * uint8(g3);
    im(:,:,2) = im(:,:,2) + gun3(2) * uint8(g3);
    im(:,:,3) = im(:,:,3) + gun3(3) * uint8(g3);
    
    im(:,:,1) = im(:,:,1) + gun4(1) * uint8(g4);
    im(:,:,2) = im(:,:,2) + gun4(2) * uint8(g4);
    im(:,:,3) = im(:,:,3) + gun4(3) * uint8(g4);
    
    im(:,:,1) = im(:,:,1) + gun5(1) * uint8(g5);
    im(:,:,2) = im(:,:,2) + gun5(2) * uint8(g5);
    im(:,:,3) = im(:,:,3) + gun5(3) * uint8(g5);
    
    im(:,:,1) = im(:,:,1) + gun6(1) * uint8(g6);
    im(:,:,2) = im(:,:,2) + gun6(2) * uint8(g6);
    im(:,:,3) = im(:,:,3) + gun6(3) * uint8(g6);
    
    im(:,:,1) = im(:,:,1) + knife1(1) * uint8(k1);
    im(:,:,2) = im(:,:,2) + knife1(2) * uint8(k1);
    im(:,:,3) = im(:,:,3) + knife1(3) * uint8(k1);
    
    im(:,:,1) = im(:,:,1) + knife2(1) * uint8(k2);
    im(:,:,2) = im(:,:,2) + knife2(2) * uint8(k2);
    im(:,:,3) = im(:,:,3) + knife2(3) * uint8(k2);
    
    im(:,:,1) = im(:,:,1) + knife3(1) * uint8(k3);
    im(:,:,2) = im(:,:,2) + knife3(2) * uint8(k3);
    im(:,:,3) = im(:,:,3) + knife3(3) * uint8(k3);
    
    im(:,:,1) = im(:,:,1) + knife4(1) * uint8(s1);
    im(:,:,2) = im(:,:,2) + knife4(2) * uint8(s1);
    im(:,:,3) = im(:,:,3) + knife4(3) * uint8(s1);
    
    im(:,:,1) = im(:,:,1) + knife5(1) * uint8(s2);
    im(:,:,2) = im(:,:,2) + knife5(2) * uint8(s2);
    im(:,:,3) = im(:,:,3) + knife5(3) * uint8(s2);
    
    im(:,:,1) = im(:,:,1) + razor1(1) * uint8(r1);
    im(:,:,2) = im(:,:,2) + razor1(2) * uint8(r1);
    im(:,:,3) = im(:,:,3) + razor1(3) * uint8(r1);
    
    im(:,:,1) = im(:,:,1) + razor2(1) * uint8(r2);
    im(:,:,2) = im(:,:,2) + razor2(2) * uint8(r2);
    im(:,:,3) = im(:,:,3) + razor2(3) * uint8(r2);
    
    im(:,:,1) = im(:,:,1) + wrench1(1) * uint8(w1);
    im(:,:,2) = im(:,:,2) + wrench1(2) * uint8(w1);
    im(:,:,3) = im(:,:,3) + wrench1(3) * uint8(w1);
    
    im(:,:,1) = im(:,:,1) + wrench2(1) * uint8(w2);
    im(:,:,2) = im(:,:,2) + wrench2(2) * uint8(w2);
    im(:,:,3) = im(:,:,3) + wrench2(3) * uint8(w2);
    
    im(:,:,1) = im(:,:,1) + scissor1(1) * uint8(sc1);
    im(:,:,2) = im(:,:,2) + scissor1(2) * uint8(sc1);
    im(:,:,3) = im(:,:,3) + scissor1(3) * uint8(sc1);
    
    im(:,:,1) = im(:,:,1) + scissor1(1) * uint8(p1);
    im(:,:,2) = im(:,:,2) + scissor1(2) * uint8(p1);
    im(:,:,3) = im(:,:,3) + scissor1(3) * uint8(p1);
    
    im(:,:,1) = im(:,:,1) + scissor1(1) * uint8(p2);
    im(:,:,2) = im(:,:,2) + scissor1(2) * uint8(p2);
    im(:,:,3) = im(:,:,3) + scissor1(3) * uint8(p2);
    
    im(:,:,1) = im(:,:,1) + knife6(1) * uint8(st1);
    im(:,:,2) = im(:,:,2) + knife6(2) * uint8(st1);
    im(:,:,3) = im(:,:,3) + knife6(3) * uint8(st1);
    
    im(:,:,1) = im(:,:,1) + scissor2(1) * uint8(scr1);
    im(:,:,2) = im(:,:,2) + scissor2(2) * uint8(scr1);
    im(:,:,3) = im(:,:,3) + scissor2(3) * uint8(scr1);
    
    im(:,:,1) = im(:,:,1) + others(1) * uint8(po1);
    im(:,:,2) = im(:,:,2) + others(2) * uint8(po1);
    im(:,:,3) = im(:,:,3) + others(3) * uint8(po1);
    
    im(:,:,1) = im(:,:,1) + hammer(1) * uint8(h1);
    im(:,:,2) = im(:,:,2) + hammer(2) * uint8(h1);
    im(:,:,3) = im(:,:,3) + hammer(3) * uint8(h1);
    
    im(:,:,1) = im(:,:,1) + wrench3(1) * uint8(a1);
    im(:,:,2) = im(:,:,2) + wrench3(2) * uint8(a1);
    im(:,:,3) = im(:,:,3) + wrench3(3) * uint8(a1);
    
    imwrite(im,[pn2 'results4\' fn],'PNG');
    
    fn2 = replace(fn,'png','jpg');
    
    % this is to display the output of the proposed framework on the
    % original scans
    if exist([pn3 fn])
        im2 = imread([pn3 fn]);
    else
        im2 = imread([pn3 fn2]);
    end
    
    if max(max(gun1m)) ~= 0
        ab = regionprops(g1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(gun2m)) ~= 0
        ab = regionprops(g2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(gun3m)) ~= 0
        ab = regionprops(g3, 'BoundingBox');
        ab = {ab.BoundingBox};
        
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(gun4m)) ~= 0
        ab = regionprops(g4, 'BoundingBox');
        ab = {ab.BoundingBox};
        
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(gun5m)) ~= 0
        ab = regionprops(g5, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(gun6m)) ~= 0
        ab = regionprops(g6, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Gun','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife1m)) ~= 0
        ab = regionprops(k1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife2m)) ~= 0
        ab = regionprops(k2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife3m)) ~= 0
        ab = regionprops(k3, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife4m)) ~= 0
        ab = regionprops(s1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife5m)) ~= 0
        ab = regionprops(s2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(razor1m)) ~= 0
        ab = regionprops(r1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Razor','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(razor2m)) ~= 0
        ab = regionprops(r2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Razor','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(wrench1m)) ~= 0
        ab = regionprops(w1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Wrench','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(wrench2m)) ~= 0
        ab = regionprops(w2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Wrench','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(scissor1m)) ~= 0
        ab = regionprops(sc1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Scissor','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(plier1m)) ~= 0
        ab = regionprops(p1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Plier','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(plier2m)) ~= 0
        ab = regionprops(p2, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Plier','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(knife61m)) ~= 0
        ab = regionprops(st1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Knife','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(scissor21m)) ~= 0
        ab = regionprops(scr1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Scissor','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(others1m)) ~= 0
        ab = regionprops(po1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Others','FontSize',28,'LineWidth',4);
        end
    end
    
    if max(max(hammer1m)) ~= 0
        ab = regionprops(h1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Hammer','FontSize',28,'LineWidth',4);
        end 
    end
    
    if max(max(wrench31m)) ~= 0
        ab = regionprops(a1, 'BoundingBox');
        ab = {ab.BoundingBox};
        for k = 1:length(ab)
            im2 = insertObjectAnnotation(im2,'rectangle',ab{k},'Wrench','FontSize',28,'LineWidth',4);
        end
    end
    
    imshow(im2)
    hold on
    
    if max(max(gun1m)) ~= 0
        [r,c] = find(g1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun1(1)/255, gun1(2)/255, gun1(3)/255],'MarkerEdgeColor',[gun1(1)/255, gun1(2)/255, gun1(3)/255]);
    end
    
    if max(max(gun2m)) ~= 0
        [r,c] = find(g2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun2(1)/255, gun2(2)/255, gun2(3)/255],'MarkerEdgeColor',[gun2(1)/255, gun2(2)/255, gun2(3)/255]);
    end
    
    if max(max(gun3m)) ~= 0
        [r,c] = find(g3 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun3(1)/255, gun3(2)/255, gun3(3)/255],'MarkerEdgeColor',[gun3(1)/255, gun3(2)/255, gun3(3)/255]);
    end
    
    if max(max(gun4m)) ~= 0
        [r,c] = find(g4 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun4(1)/255, gun4(2)/255, gun4(3)/255],'MarkerEdgeColor',[gun4(1)/255, gun4(2)/255, gun4(3)/255]);
    end
    
    if max(max(gun5m)) ~= 0
        [r,c] = find(g5 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun5(1)/255, gun5(2)/255, gun5(3)/255],'MarkerEdgeColor',[gun5(1)/255, gun5(2)/255, gun5(3)/255]);
    end
    
    if max(max(gun6m)) ~= 0
        [r,c] = find(g6 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[gun6(1)/255, gun6(2)/255, gun6(3)/255],'MarkerEdgeColor',[gun6(1)/255, gun6(2)/255, gun6(3)/255]);
    end
    
    if max(max(knife1m)) ~= 0
        [r,c] = find(k1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife1(1)/255, knife1(2)/255, knife1(3)/255],'MarkerEdgeColor',[knife1(1)/255, knife1(2)/255, knife1(3)/255]);
    end
    
    if max(max(knife2m)) ~= 0
        [r,c] = find(k2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife2(1)/255, knife2(2)/255, knife2(3)/255],'MarkerEdgeColor',[knife2(1)/255, knife2(2)/255, knife2(3)/255]);
    end
    
    if max(max(knife3m)) ~= 0
        [r,c] = find(k3 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife3(1)/255, knife3(2)/255, knife3(3)/255],'MarkerEdgeColor',[knife3(1)/255, knife3(2)/255, knife3(3)/255]);
    end
    
    if max(max(knife4m)) ~= 0
        [r,c] = find(s1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife4(1)/255, knife4(2)/255, knife4(3)/255],'MarkerEdgeColor',[knife4(1)/255, knife4(2)/255, knife4(3)/255]);
    end
    
    if max(max(knife5m)) ~= 0
        [r,c] = find(s2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife5(1)/255, knife5(2)/255, knife5(3)/255],'MarkerEdgeColor',[knife5(1)/255, knife5(2)/255, knife5(3)/255]);
    end
    
    if max(max(razor1m)) ~= 0
        [r,c] = find(r1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[razor1(1)/255, razor1(2)/255, razor1(3)/255],'MarkerEdgeColor',[razor1(1)/255, razor1(2)/255, razor1(3)/255]);
    end
    
    if max(max(razor2m)) ~= 0
        [r,c] = find(r2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[razor2(1)/255, razor2(2)/255, razor2(3)/255],'MarkerEdgeColor',[razor2(1)/255, razor2(2)/255, razor2(3)/255]);
    end
    
    if max(max(wrench1m)) ~= 0
        [r,c] = find(w1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[wrench1(1)/255, wrench1(2)/255, wrench1(3)/255],'MarkerEdgeColor',[wrench1(1)/255, wrench1(2)/255, wrench1(3)/255]);
    end
    
    if max(max(wrench2m)) ~= 0
        [r,c] = find(w2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[wrench2(1)/255, wrench2(2)/255, wrench2(3)/255],'MarkerEdgeColor',[wrench2(1)/255, wrench2(2)/255, wrench2(3)/255]);
    end
    
    if max(max(scissor1m)) ~= 0
        [r,c] = find(sc1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[scissor1(1)/255, scissor1(2)/255, scissor1(3)/255],'MarkerEdgeColor',[scissor1(1)/255, scissor1(2)/255, scissor1(3)/255]);
    end
    
    if max(max(plier1m)) ~= 0
        [r,c] = find(p1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[plier1(1)/255, plier1(2)/255, plier1(3)/255],'MarkerEdgeColor',[plier1(1)/255, plier1(2)/255, plier1(3)/255]);
    end
    
    if max(max(plier2m)) ~= 0
        [r,c] = find(p2 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[plier2(1)/255, plier2(2)/255, plier2(3)/255],'MarkerEdgeColor',[plier2(1)/255, plier2(2)/255, plier2(3)/255]);
    end
    
    if max(max(knife61m)) ~= 0
        [r,c] = find(st1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[knife6(1)/255, knife6(2)/255, knife6(3)/255],'MarkerEdgeColor',[knife6(1)/255, knife6(2)/255, knife6(3)/255]);
    end
    
    if max(max(scissor21m)) ~= 0
        [r,c] = find(scr1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[scissor2(1)/255, scissor2(2)/255, scissor2(3)/255],'MarkerEdgeColor',[scissor2(1)/255, scissor2(2)/255, scissor2(3)/255]);
    end
    
    if max(max(others1m)) ~= 0
        [r,c] = find(po1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[others(1)/255, others(2)/255, others(3)/255],'MarkerEdgeColor',[others(1)/255, others(2)/255, others(3)/255]);
    end
    
    if max(max(hammer1m)) ~= 0
        [r,c] = find(h1 == 1);
        scatter1 = scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[hammer(1)/255, hammer(2)/255, hammer(3)/255],'MarkerEdgeColor',[hammer(1)/255, hammer(2)/255, hammer(3)/255]);
    end
    
    if max(max(wrench31m)) ~= 0
        [r,c] = find(a1 == 1);
        scatter(c,r,'.','MarkerEdgeAlpha',0.07,'MarkerFaceAlpha',0.07,'MarkerFaceColor',[wrench3(1)/255, wrench3(2)/255, wrench3(3)/255],'MarkerEdgeColor',[wrench3(1)/255, wrench3(2)/255, wrench3(3)/255]);
    end
    
    axis off tight
    hold off
    
    saveas(gcf,[pn2 'results3/' fn],'png');
end