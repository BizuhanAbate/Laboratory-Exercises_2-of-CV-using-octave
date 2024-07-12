function rotated_img = rotate_image(original_img, angle_deg)
    % Function to rotate an image by a specified angle in degrees
    % Input:
    %   original_img: The original image matrix (RGB or grayscale)
    %   angle_deg: The angle of rotation in degrees (positive = counterclockwise)
    % Output:
    %   rotated_img: The rotated image matrix

    % Convert angle from degrees to radians
    angle_rad = deg2rad(angle_deg);

    % Get size of the original image
    [rows, cols, ~] = size(original_img);

    % Compute new image size to accommodate rotated image
    new_rows = ceil(abs(rows * cos(angle_rad)) + abs(cols * sin(angle_rad)));
    new_cols = ceil(abs(cols * cos(angle_rad)) + abs(rows * sin(angle_rad)));

    % Perform rotation using imrotate with 'bilinear' interpolation
    rotated_img = imrotate(original_img, angle_deg, 'bilinear', 'crop');

    % Display the original and rotated images for comparison
    figure;
    subplot(1, 2, 1); imshow(original_img); title('Original Image');
    subplot(1, 2, 2); imshow(rotated_img); title('Rotated Image');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 400]);
    sgtitle(['Comparison of Original and Rotated Image (Angle: ', num2str(angle_deg), ' degrees)']);
end

