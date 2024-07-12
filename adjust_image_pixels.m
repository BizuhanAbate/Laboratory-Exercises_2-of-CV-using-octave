function adjust_image_pixels(image_path, scale_factor, translation_offset)
    % Function to adjust pixel values of an image using scaling and translation
    % Input:
    %   image_path: Path to the image file
    %   scale_factor: Scaling factor (1.0 means no scaling)
    %   translation_offset: Translation offset (positive/negative values)
    % Output:
    %   Displays the original and adjusted images side by side

    % Load the image
    img = imread(image_path);

    % Display the original image
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');

    % Adjust pixel values using scaling
    scaled_img = img * scale_factor;
    scaled_img = uint8(scaled_img); % Convert back to uint8

    % Display the scaled image
    subplot(1, 2, 2);
    imshow(scaled_img);
    title(sprintf('Scaled Image (Factor: %.2f)', scale_factor));

    % Adjust pixel values using translation
    translated_img = img + translation_offset;
    translated_img = uint8(translated_img); % Convert back to uint8

    % Display the translated image
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(translated_img);
    title(sprintf('Translated Image (Offset: %.2f)', translation_offset));

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1200, 600]);
end

