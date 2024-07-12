function grayscale_conversion_methods(image_path)
    % Function to apply different grayscale conversion methods and display results
    % Input:
    %   image_path: Path to the color image file

    % Read the color image
    color_img = imread(image_path);

    % Display the original color image
    figure;
    subplot(2, 2, 1);
    imshow(color_img);
    title('Original Color Image');

    % Convert to grayscale using average method
    gray_avg = average_grayscale(color_img);
    subplot(2, 2, 2);
    imshow(gray_avg);
    title('Grayscale (Average Method)');

    % Convert to grayscale using luminosity method
    gray_luminosity = luminosity_grayscale(color_img);
    subplot(2, 2, 3);
    imshow(gray_luminosity);
    title('Grayscale (Luminosity Method)');

    % Convert to grayscale using desaturation method
    gray_desaturation = desaturation_grayscale(color_img);
    subplot(2, 2, 4);
    imshow(gray_desaturation);
    title('Grayscale (Desaturation Method)');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 800]);
    sgtitle('Comparison of Grayscale Conversion Methods');
end

% Function to convert to grayscale using average method
function gray_img = average_grayscale(img)
    % Calculate grayscale using average method
    gray_img = uint8(mean(img, 3));
end

% Function to convert to grayscale using luminosity method
function gray_img = luminosity_grayscale(img)
    % Luminosity method coefficients
    luminosity = [0.2126, 0.7152, 0.0722];

    % Calculate grayscale using luminosity method
    gray_img = uint8(sum(bsxfun(@times, double(img), luminosity), 3));
end

% Function to convert to grayscale using desaturation method
function gray_img = desaturation_grayscale(img)
    % Calculate grayscale using desaturation method
    gray_img = uint8(max(img, [], 3));
end

