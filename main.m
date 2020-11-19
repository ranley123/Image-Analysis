fig1 = imread("fig1.jpg");
fig2 = imread("fig2.jpg");
% fig3 = imread("fig3.svg");

% Red Components
R1 = fig1(:,:,1);
% figure (1);
% imshow(R1), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
% 
% Green Components
G1 = fig1(:,:,2);
% figure (2);
% image(G1), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
% 
% Blue Components
B1 = fig1(:,:,3);
% figure(3);
% image(B1), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;

% Question 2: from RGB to YCbCr
% [ROW,COL, DIM] = size(fig1);
% Y_data = zeros(ROW,COL);
% Cb_data = zeros(ROW,COL);
% Cr_data = zeros(ROW,COL);
% YCbCr_data = fig1;
% 
% for r = 1:ROW 
%     for c = 1:COL
%         Y_data(r, c) = 0.299 * R1(r, c) + 0.587 * G1(r, c) + 0.114 * B1(r, c);
%         Cb_data(r, c) = -0.1687 * R1(r, c) - 0.3313 * G1(r, c) + 0.5 * B1(r, c) + 128;
%         Cr_data(r, c) = 0.5 * R1(r, c) - 0.4187 * G1(r, c) - 0.0813 * B1(r, c) + 128;
%     end
% end 
% 
% YCbCr_data(:,:,1)=Y_data;
% YCbCr_data(:,:,2)=Cb_data;
% YCbCr_data(:,:,3)=Cr_data;

% YCbCr_data = rgb2ycbcr(fig1);
% figure;
% imshow(YCbCr_data);

figure;
YCbCr_data = rgb2ycbcr(fig1);
imshow(YCbCr_data);

figure;
Y_data = YCbCr_data(:, : , 1);
imshow(Y_data);

figure;
Cb_data = YCbCr_data(:, : , 2);
imshow(Cb_data);

figure;
Cr_data = YCbCr_data(:, : , 3);
imshow(Cr_data);