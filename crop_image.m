function cropped_img = crop_image(original_img, top_left, bottom_right)
    % Function to crop an image to a specific region of interest (ROI)
    % Input:
    %   original_img: The original image matrix (RGB or grayscale)
    %   top_left: Coordinates of the top-left corner [x1, y1]
    %   bottom_right: Coordinates of the bottom-right corner [x2, y2]
    % Output:
    %   cropped_img: The cropped image matrix

    % Check if coordinates are within image bounds
    [rows, cols, ~] = size(original_img);
    x1 = top_left(1);   % x-coordinate of top-left corner
    y1 = top_left(2);   % y-coordinate of top-left corner
    x2 = bottom_right(1);   % x-coordinate of bottom-right corner
    y2 = bottom_right(2);   % y-coordinate of bottom-right corner

    % Ensure coordinates are within image bounds
    x1 = max(1, x1);
    y1 = max(1, y1);
    x2 = min(cols, x2);
    y2 = min(rows, y2);

    % Calculate width and height of the crop region
    crop_width = x2 - x1 + 1;
    crop_height = y2 - y1 + 1;

    % Perform cropping
    if ndims(original_img) == 3  % Color image
        cropped_img = original_img(y1:y2, x1:x2, :);
    else  % Grayscale image
        cropped_img = original_img(y1:y2, x1:x2);
    end

    % Display original and cropped images for comparison (optional)
    figure;
    subplot(1, 2, 1); imshow(original_img); title('Original Image');
    rectangle('Position', [x1, y1, crop_width, crop_height], 'EdgeColor', 'r');
    subplot(1, 2, 2); imshow(cropped_img); title('Cropped Image');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 400]);
    sgtitle('Comparison of Original and Cropped Images');
end

