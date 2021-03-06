function [output_args] = Plate_Detector(ex);

inputImage = imread(ex);
greyImage = (0.2989 * double(inputImage(:,:,1)) + 0.5870 * double(inputImage(:,:,2)) + 0.1140 * double(inputImage(:,:,3)))/255;

kernal = [1 2 1; 0 0 0; -1 -2 -1];
Gx =  conv2(double(greyImage),kernal);
Gy = conv2(double(greyImage),kernal');
G = sqrt(Gx.^2 + Gy.^2);
G = im2bw(G,0.5);

dialationStrel = strel('diamond',1);
Gnew = imdilate(G,dialationStrel);

fill = imfill(Gnew,'holes');


end