function color_space_comparison(image_path)
    % Function to compare image processing tasks across different color spaces
    % Input:
    %   image_path: Path to the image file
    % Output:
    %   Displays original and processed images in different color spaces

    % Check if the image package is loaded, otherwise load it
    if (~pkg('list', 'image'))
        pkg load image;
    end

    % Load the original image
    img = imread(image_path);

    % Display the original image
    figure;
    subplot(2, 3, 1);
    imshow(img);
    title('Original Image');

    % Convert image to grayscale
    gray_img = rgb2gray(img);

    % Display the grayscale image
    subplot(2, 3, 2);
    imshow(gray_img);
    title('Grayscale');

    % Convert image to HSV color space
    hsv_img = rgb2hsv(img);

    % Display the HSV components: Hue, Saturation, Value
    subplot(2, 3, 3);
    imshow(hsv_img(:, :, 1));
    title('HSV - Hue');

    subplot(2, 3, 4);
    imshow(hsv_img(:, :, 2));
    title('HSV - Saturation');

    subplot(2, 3, 5);
    imshow(hsv_img(:, :, 3));
    title('HSV - Value');

    % Perform edge detection on grayscale image
    edge_img = edge(gray_img, 'Sobel');

    % Display edges detected in grayscale
    subplot(2, 3, 6);
    imshow(edge_img);
    title('Edges Detected (Grayscale)');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1200, 800]);
    sgtitle('Comparison of Color Spaces for Image Processing');
end
