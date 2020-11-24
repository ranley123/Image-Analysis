fig1 = imread("fig1.jpg");
fig2 = imread("fig2.jpg");
fig3 = imread("fig3.png");

% Red Components
% R1 = fig3(:,:,1);
% figure (1);
% imshow(R1), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
% % 
% % Green Components
% G1 = fig3(:,:,2);
% figure (2);
% image(G1), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
% % 
% % Blue Components
% B1 = fig3(:,:,3);
% figure(3);
% image(B1), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;

% % Red Components
% R2 = fig2(:,:,1);
% figure;
% imshow(R2), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
% % 
% % Green Components
% G2 = fig2(:,:,2);
% figure;
% image(G2), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
% % 
% % Blue Components
% B2 = fig2(:,:,3);
% figure;
% image(B2), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;

% Question 2: from RGB to YCbCr
% YCbCr_data = rgb2ycbcr(fig3);
% 
% figure;
% imshow(YCbCr_data);
% 
% figure;
% Y_data = YCbCr_data(:, : , 1);
% imshow(Y_data);
% 
% figure;
% Cb_data = YCbCr_data(:, : , 2);
% imshow(Cb_data);
% 
% figure;
% Cr_data = YCbCr_data(:, : , 3);
% imshow(Cr_data);

% YCbCr_data = rgb2ycbcr(fig2);
% 
% figure;
% imshow(YCbCr_data);

% figure;
% Y_data = YCbCr_data(:, : , 1);
% imshow(Y_data);
% 
% figure;
% Cb_data = YCbCr_data(:, : , 2);
% imshow(Cb_data);
% 
% figure;
% Cr_data = YCbCr_data(:, : , 3);
% imshow(Cr_data);

% new_Cb_data = YCbCr_data(:,:,2);
% new_Cr_data = YCbCr_data(:,:,3);
% [ROW,COL, DIM] = size(new_Cb_data);
% % 
% for i = 1:8:ROW
%     for j = 1:8:COL
%         new_Cb_data = helper(new_Cb_data, i, j, 8);
%         new_Cr_data = helper(new_Cr_data, i, j, 8);
%     end
% end
% 
% new_YCbCr_data = YCbCr_data;
% new_YCbCr_data(:,:,2) = new_Cb_data;
% new_YCbCr_data(:,:,3) = new_Cr_data;
% figure;
% imshow(new_YCbCr_data);
% 
% % figure; imshow(ycbcr2rgb(new_YCbCr_data));
% 
% diff1 = YCbCr_data - new_YCbCr_data;
% figure;
% imshow(ycbcr2rgb(diff1));





% fig1 = rgb2gray(fig1);
% fig1_fft = abs(dct2(fig1));
% S = log(1+abs(fig1_fft));
% figure;
% imshow(S,[]);     % 带噪声的幅度图，亮度代表着能量
% title('fig1: high');

fig2 = rgb2gray(fig3);
fig2_fft = abs(dct2(fig2));
S2 = log(1+abs(fig2_fft));
figure;
imshow(S2,[]);     % 带噪声的幅度图，亮度代表着能量
title('fig2: low');


function new_matrix = helper(matrix, i, j, n)
    new_matrix = matrix;
    for row = i: (i + n - 1)
        for col = j: (j + n - 1)
            new_matrix(row, col) = matrix(i,j);
        end
    end
end
