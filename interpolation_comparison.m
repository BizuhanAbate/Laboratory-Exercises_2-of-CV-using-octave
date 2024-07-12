function interpolation_comparison(image_path, new_width, new_height)
    % Function to compare different interpolation methods for image resizing
    % Input:
    %   image_path: Path to the input image file
    %   new_width: Desired width of the resized image
    %   new_height: Desired height of the resized image

    % Load the original image
    original_img = imread(image_path);

    % Perform resizing using different interpolation methods
    resized_nn = resize_nearest_neighbor(original_img, new_width, new_height);
    resized_bilinear = resize_bilinear(original_img, new_width, new_height);
    resized_bicubic = resize_bicubic(original_img, new_width, new_height);

    % Display the original and resized images for comparison
    figure;
    subplot(2, 2, 1); imshow(original_img); title('Original Image');
    subplot(2, 2, 2); imshow(resized_nn); title('Nearest Neighbor');
    subplot(2, 2, 3); imshow(resized_bilinear); title('Bilinear');
    subplot(2, 2, 4); imshow(resized_bicubic); title('Bicubic');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 800]);
    sgtitle('Comparison of Different Interpolation Methods for Image Resizing');
end

% Nearest neighbor interpolation
function resized_img = resize_nearest_neighbor(original_img, new_width, new_height)
    resized_img = imresize(original_img, [new_height, new_width], 'nearest');
end

% Bilinear interpolation
function resized_img = resize_bilinear(original_img, new_width, new_height)
    resized_img = imresize(original_img, [new_height, new_width], 'bilinear');
end

% Bicubic interpolation
function resized_img = resize_bicubic(original_img, new_width, new_height)
    resized_img = imresize(original_img, [new_height, new_width], 'bicubic');
end

% Example usage
image_path = 'C:\Users\Bee\image.jpg';
new_width = 400;
new_height = 300;
interpolation_comparison(image_path, new_width, new_height);

