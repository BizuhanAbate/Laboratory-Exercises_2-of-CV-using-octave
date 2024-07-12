function compare_color_spaces_effect(image_path)
    % Function to compare effects of different color spaces on image processing tasks
    % Input:
    %   image_path: Path to the image file
    % Output:
    %   Displays original image and processed images in different color spaces

    % Check if the image package is loaded, otherwise load it
    if (~pkg('list', 'image'))
        pkg load image;
    end

    % Load the original image
    img = imread(image_path);

    % Convert image to grayscale
    gray_img = rgb2gray(img);

    % Convert image to HSV color space
    hsv_img = rgb2hsv(img);

    % Extract components of HSV image
    hue_img = hsv_img(:,:,1);
    saturation_img = hsv_img(:,:,2);
    value_img = hsv_img(:,:,3);

    % Perform edge detection on grayscale image
    edge_gray = edge(gray_img, 'Sobel');

    % Perform edge detection on value channel of HSV image
    edge_value = edge(value_img, 'Sobel');

    % Perform segmentation on saturation channel of HSV image
    % Example: Thresholding to obtain binary image
    threshold =

