fig1 = imread("fig1.jpg");
fig2 = imread("fig2.jpg");
fig3 = imread("fig3.png");

run(fig1);

function run(fig)
    % Red Components
    R = fig(:,:,1);
    figure;
    imshow(R), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;
    
    % Green Components
    G = fig(:,:,2);
    figure;
    image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
    
    % Blue Components
    B = fig(:,:,3);
    figure;
    image(B), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;
    
    % Question 2: from RGB to YCbCr
    YCbCr_data = rgb2ycbcr(fig);
    
    figure;
    imshow(YCbCr_data);
    
    % show Y component
    figure;
    Y_data = YCbCr_data(:, : , 1);
    imshow(Y_data);
    
    % show Cb component
    figure;
    Cb_data = YCbCr_data(:, : , 2);
    imshow(Cb_data);
    
    % show Cr component
    figure;
    Cr_data = YCbCr_data(:, : , 3);
    imshow(Cr_data);
    
%     Question 3
    new_Cb_data = YCbCr_data(:,:,2);
    new_Cr_data = YCbCr_data(:,:,3);
    [ROW,COL, DIM] = size(new_Cb_data);
    
    for i = 1:8:ROW
        for j = 1:8:COL
            new_Cb_data = helper(new_Cb_data, i, j, 8);
            new_Cr_data = helper(new_Cr_data, i, j, 8);
        end
    end
    
    % construct the image after down sampling
    new_YCbCr_data = YCbCr_data;
    new_YCbCr_data(:,:,2) = new_Cb_data;
    new_YCbCr_data(:,:,3) = new_Cr_data;
    
    figure;
    imshow(new_YCbCr_data);
    title('down sampling');
    
    % diff image
    diff = YCbCr_data - new_YCbCr_data;
    figure;
    imshow(diff);
    title('diff image');
    
%     Question 4
    grayfig = rgb2gray(fig);
    fig_fft = abs(dct2(grayfig));
    S = log(1+abs(fig_fft));
    figure;
    imshow(S,[]);
end

% for 8*8 = 64 cells, their values are the same
function new_matrix = helper(matrix, i, j, n)
    new_matrix = matrix;
    for row = i: (i + n - 1)
        for col = j: (j + n - 1)
            new_matrix(row, col) = matrix(i,j);
        end
    end
end
