function [R] = checkInshape(Regions)
%function that check if there is shape inside another shape and return the
%index , otherwise it returns 0
% 1 - Looping Through regions
% 2 - see if the four corners inside another shape
% 4 - if yes ==> return index
% 5 - if no ===> return 0
R = [];
for i = 1 : size(Regions, 1)
    
    x1 = Regions(i).BoundingBox(1);
    y1 = Regions(i).BoundingBox(2);
    width1 = Regions(i).BoundingBox(3);
    hight1 =Regions(i).BoundingBox(4);
    
    for j = 1 : size(Regions, 1)
    
    if i == j
        continue;
    end
    x2 = Regions(j).BoundingBox(1);
    y2 = Regions(j).BoundingBox(2);
    width2 = Regions(j).BoundingBox(3);
    hight2 =Regions(j).BoundingBox(4);
    
        if((x1 >= x2 && y1 >= y2) && (x1 + width1) <= (x2 + width2) && (y1 + hight1) <= (y2 + hight2))
           R = [R i];
        end
    end
end

end

