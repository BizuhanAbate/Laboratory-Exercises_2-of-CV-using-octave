function compare_color_spaces(image_path)
    % Function to load images with different color spaces and display them
    % Input:
    %   image_path: Path to the image file to be loaded
    % Output:
    %   Displays images in different color spaces and their comparison

    % Load the image in RGB color space
    rgb_img = imread(image_path);

    % Convert RGB image to CMYK color space using custom transformation
    cmyk_img = rgb2cmyk(rgb_img);

    % Display original RGB image
    figure;
    subplot(1, 2, 1);
    imshow(rgb_img);
    title('RGB Color Space');

    % Display CMYK image (converted from RGB)
    subplot(1, 2, 2);
    imshow(cmyk_img);
    title('CMYK Color Space');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 400]);
    sgtitle('Comparison of RGB and CMYK Color Spaces');
end

% Custom RGB to CMYK conversion function
function cmyk_img = rgb2cmyk(rgb_img)
    % Function to convert RGB image to CMYK color space
    % Input:
    %   rgb_img: RGB image matrix (uint8 or double)
    % Output:
    %   cmyk_img: CMYK image matrix (uint8 or double)

    % Convert RGB to CMY
    cmy_img = imcomplement(rgb_img);

    % Separate CMY channels
    c = cmy_img(:, :, 1);
    m = cmy_img(:, :, 2);
    y = cmy_img(:, :, 3);

    % Calculate K channel
    k = min(cmy_img, [], 3);

    % Combine CMYK channels
    cmyk_img = cat(3, c, m, y, k);
end

