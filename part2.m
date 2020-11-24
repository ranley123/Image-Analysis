% easy = imread("money_easy.jpg");
% easy = rgb2gray(easy);
% figure; imshow(easy);
% thresh=graythresh(easy);
% bw_easy=im2bw(easy,thresh);
% figure; imshow(bw_easy);
% % bw_easy = imfill(bw_easy);
% 
% 
% % 
% % figure;
% % imshow(I4);
% bw_easy = bwareaopen(bw_easy, 100);
% figure; imshow(bw_easy);
% 
% [centers, radii, metric] = imfindcircles(bw_easy,[130 270], 'ObjectPolarity','dark', 'Sensitivity',0.97);
% number = length(centers);
% 
% imshow(bw_easy);
% h=viscircles(centers, radii,'Color','b');

% d = drawline;
% pos = d.Position;
% diffPos = diff(pos);
% diameter = hypot(diffPos(1),diffPos(2));

% medium = imread("money_medium.jpg");
% medium = rgb2gray(medium);
% figure; imshow(medium);
% thresh=graythresh(medium);
% bw_medium=im2bw(medium,thresh);
% figure; imshow(bw_medium);
% bw_medium = bwareaopen(bw_medium, 100);
% figure; imshow(bw_medium);
% 
% [centers, radii, metric] = imfindcircles(bw_medium,[130 270], 'ObjectPolarity','dark', 'Sensitivity',0.97);
% number = length(centers);
% 
% imshow(bw_medium);
% h=viscircles(centers, radii,'Color','b');


% hard = imread("money_hard.jpg");
% hard = rgb2gray(hard);
% figure; imshow(hard);
% hard = medfilt2(hard);
% figure; imshow(hard);
% [centers, radii, metric] = imfindcircles(hard,[130 270], 'ObjectPolarity','dark', 'Sensitivity',0.975);
% number = length(centers);
% 
% imshow(hard);
% h=viscircles(centers, radii,'Color','b');


very_hard = imread("money_extreme.jpg");
very_hard = rgb2gray(very_hard);
figure, imshow(very_hard), title('gray scale');

% Edge detection
m = 12;
n = 12;
img_filter = imfilter(very_hard, fspecial('average', [m n]));
[~, threshold] = edge(img_filter, 'canny');
fudgeFactor = 1.5;
img_edge = edge(img_filter, 'canny', threshold * fudgeFactor);

% Dilate image to make the coin edges complete without holes
se_disk = strel('disk',4);
img_dilated = imdilate(img_edge, se_disk);

% Remove stuff touching the image border and fill complete objects
img_clearborder = imclearborder(img_dilated, 4);
figure, imshow(img_clearborder), title('cleared border image');

% figure;
% imshow(bw_very_hard);
[centers, radii, metric] = imfindcircles(img_clearborder,[130 270], 'ObjectPolarity','bright', 'Sensitivity',0.955);
number = length(centers);

imshow(img_clearborder);
h=viscircles(centers, radii,'Color','b');

% very_hard = imread("money_extreme.jpg");
% very_hard = rgb2gray(very_hard);
% thresh=graythresh(very_hard);
% bw_very_hard=im2bw(very_hard,thresh);
% % figure, imshow(very_hard), title('gray scale')
% m = 12;
% n = 12;
% img_filter = imfilter(very_hard, fspecial('average', [m n]));
% 
% % Edge detection
% [~, threshold] = edge(img_filter, 'canny');
% fudgeFactor = 1.5;
% img_edge = edge(img_filter, 'canny', threshold * fudgeFactor);
% 
% % Dilate image to make the coin edges complete without holes
% se_disk = strel('disk',4);
% img_dilated = imdilate(img_edge, se_disk);
% 
% % Remove stuff touching the image border and fill complete objects
% img_clearborder = imclearborder(img_dilated, 4);
% figure, imshow(img_clearborder), title('cleared border image');
% 
% [centers, radii, metric] = imfindcircles(img_clearborder,[130 270], 'ObjectPolarity','bright', 'Sensitivity',0.955);
% number = length(centers);
% 
% imshow(img_clearborder);
% h=viscircles(centers, radii,'Color','b');