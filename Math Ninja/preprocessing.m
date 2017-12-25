%% Image segmentation and extraction

clear all

%% Read Image
I = imread('Case 3/3.2.jpg');
 [Wi Hi Li] = size(I);
 I = imresize(I,[Wi*1.5 Hi*1.5]);
%% Show image
figure(1)
imshow(I);
title('INPUT IMAGE WITH NOISE')

%% Convert to gray scale
if size(I,3) == 3 % RGB image
  I=rgb2gray(I);
end

% I = imadjust(I);

[H, W] = size(I);
%% Convert to binary image
threshold = graythresh(I);
I = im2bw(I,threshold);


%% Check whether the background is white or black
numWhitePixels = sum(sum(I));
numBlackPixels = (H * W) - numWhitePixels;

if numWhitePixels > numBlackPixels
    I = ~I;
end

%% Remove all object containing fewer than 30 pixels
I = bwareaopen(I, 15);
I = imclearborder(I);
pause(1)

%% Show image binary image
imshow(I);
title('INPUT IMAGE WITHOUT NOISE')



%% Deliate Image
 se = strel('line',170,20);
 Dilated = imdilate(I,se);
 [L, number_of_cc] = bwlabel(Dilated);
 DilatedObjects = regionprops(L, 'BoundingBox');
 figure(7)
 imshow(Dilated), title('Dilated');
 
 hold on
for n = 1 : size(DilatedObjects, 1)
  rectangle('Position',DilatedObjects(n).BoundingBox,'EdgeColor','g','LineWidth',2);
end 
 indx = 0;
 width = 0;
 for n = 1 : size(DilatedObjects, 1)
  tmp = DilatedObjects(n).BoundingBox;
  if DilatedObjects(n).BoundingBox(3) > width
      width = DilatedObjects(n).BoundingBox(3);
      indx = n;
  end
 end
 equation = imcrop(I, DilatedObjects(indx).BoundingBox);
 figure(8)
 imshow(equation);

 %% Label connected components
[L, number_of_cc] = bwlabel(equation);

%% Measure properties of image regions
region_props = regionprops(L, 'BoundingBox');


 hold off
hold on



%% Create Templates, initialize output word
templates = create_templates();
word = [];
num_letras=size(templates,2);
%% Plot Bounding Box
for n = 1 : size(region_props, 1)
  rectangle('Position',region_props(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    %figure(n)
    offset = 0;
    cropped_image = imcrop(equation, [ceil(region_props(n).BoundingBox(1)-offset),ceil(region_props(n).BoundingBox(2)-offset),ceil(region_props(n).BoundingBox(3)+offset),ceil(region_props(n).BoundingBox(4)+offset)]);
    cropped_image = imresize(cropped_image, [90, 120]);
    %cropped_image = bwmorph(cropped_image, 'skel', inf);
    % Call fcn to convert image to text
%       se = strel('line',15,10);
%       DilatedD = imdilate(cropped_image,se);
      letter=read_letter(cropped_image,num_letras, templates);
    %Letter concatenation
       word=[word letter];
      %cropped_image = bwmorph(cropped_image, 'skel', inf);
        %imshow(cropped_image);
      imwrite(cropped_image, strcat('bonus\', int2str(n),'.jpg'));
end
word