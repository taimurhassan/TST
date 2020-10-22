clc
clear all
close all
warning off

% change this as per your system location
pn  = 'positive-Annotation\Annotation\'; 
ext_img = [pn '*.xml'];
a = dir(ext_img);
nfile = length(a);
gt = {};

index = 1;
for i=1:nfile
    fn = a(i).name; 
    
    xml = xml2struct([pn fn]);
    
	im = zeros(str2double(xml.annotation.size.height.Text),str2double(xml.annotation.size.width.Text));
        
    if ~isfield(xml.annotation,'object') % does not contain objects field
        continue;
    end
    
    for o = 1:length(xml.annotation.object)
        if length(xml.annotation.object) == 1
            object = xml.annotation.object;
        else
            object = xml.annotation.object{o};
        end
        
        if ~isfield(object,'name') % some objects fields are empty in original annotations
            continue;
        end
        
        name = object.name.Text;
        xmin = str2double(object.bndbox.xmin.Text)+1; % diff between MATLAB and python indices
        xmax = str2double(object.bndbox.xmax.Text)+1;
        ymin = str2double(object.bndbox.ymin.Text)+1;
        ymax = str2double(object.bndbox.ymax.Text)+1;
        
        name = convertCharsToStrings(name);
        
        gt{index} = [fn, name, xml.annotation.size.height.Text, xml.annotation.size.width.Text, [ymin,xmin,ymax,xmax]];
        index = index + 1;
        
        value = 0;
        if name == "Gun"
            value = 1;
        elseif name == "Knife"
            value = 2;
        elseif name == "Wrench"
            value = 3;
        elseif name == "Pliers"
            value = 4;
        elseif name == "Scissors"
            value = 5;
        elseif contains(name,"Hammer")
            value = 6;
        end
        
        im(ymin:ymax,xmin:xmax) = value;
    end
    im = uint8(im);
    imwrite(imresize(im,[576 768],'bilinear'),[pn 'gt\' replace(fn,".xml","") '.png'],'PNG');
end
save('gtSIXray.mat','gt');