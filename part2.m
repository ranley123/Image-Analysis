easy = imread("money_easy.jpg");
medium = imread("money_medium.jpg");
hard = imread("money_hard.jpg");
veryhard = imread("money_very_hard.jpg");
extreme = imread("money_extreme.jpg");

easy_sensitivity = 0.94;
medium_sensitivity = 0.945;
hard_sensitivity = 0.951;
veryhard_sensitivity = 0.955;
extreme_sensitivity = 0.955;

% number of coins
[number, value] = run(easy, easy_sensitivity);

function [number, coinValue] = run(fig, sensitivity)
    defaultMax = 209.7;
    fig = rgb2gray(fig);
    figure, imshow(fig), title('gray scale');

    % Edge detection
    m = 12;
    n = 12;
    img_filter = imfilter(fig, fspecial('average', [m n]));
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
    [centers, radii, metric] = imfindcircles(img_clearborder,[130 270], 'ObjectPolarity','bright', 'Sensitivity',sensitivity);
    number = length(centers);

%     imshow(img_clearborder);
%     h=viscircles(centers, radii,'Color','b');
    
%   scale to the money_easy case
    curMax = max(radii);
    ratio = curMax/defaultMax;
    radii = radii / ratio;
    coinTypes = string(zeros(1,number));
    coinValue = 0.0;

    for k = 1:number
        curRadii = radii(k);

        if curRadii < 150 % 5p
            coinTypes(k) = "5p";
            coinValue = coinValue + 0.05;
        elseif curRadii >= 150 && curRadii < 160 % 1p
            coinTypes(k) = "1p";
            coinValue = coinValue + 0.01;
        elseif curRadii >= 160 && curRadii < 162 % 20p
            coinTypes(k) = "20p";
            coinValue = coinValue + 0.2;
        elseif curRadii >= 162 && curRadii < 178 % 1 pound
            coinTypes(k) = "1 pound";
            coinValue = coinValue + 1;
        elseif curRadii >= 178 && curRadii < 180 % 10p
            coinTypes(k) = "10p";
            coinValue = coinValue + 0.1;
        elseif curRadii >= 180 && curRadii < 190 % 2p
            coinTypes(k) = "2p";
            coinValue = coinValue + 0.02;
        elseif curRadii >= 190 && curRadii < 200 % 50p
            coinTypes(k) = "50p";
            coinValue = coinValue + 0.5;
        elseif curRadii >= 200 % 2 pound
            coinTypes(k) = "2 pounds";
            coinValue = coinValue + 2;
        end
    end

    imshow(img_clearborder);
    axis on
    hold on;
    x = centers(:, 1);
    y = centers(:,2);
    plot(x, y, 'r+', 'MarkerSize', 30, 'LineWidth', 2);
    text(x,y,coinTypes,'VerticalAlignment','bottom','HorizontalAlignment','right','Color','r',...
          'FontSize',16,'FontWeight','bold');
    
end