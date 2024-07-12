function image_enhancement_comparison(image_path)
    % Function to compare different image enhancement techniques
    % Input:
    %   image_path: Path to the image file
    % Output:
    %   Displays original and enhanced images side by side

    % Check if the image package is loaded, otherwise load it
    if (~pkg('list', 'image'))
        pkg load image;
    end

    % Load the original image
    img = imread(image_path);

    % Display the original image
    figure;
    subplot(2, 2, 1);
    imshow(img);
    title('Original Image');

    % Convert image to grayscale if it's RGB
    if size(img, 3) == 3
        gray_img = rgb2gray(img);
    else
        gray_img = img;
    end

    % Apply histogram equalization
    histeq_img = histeq(gray_img);

    % Display the histogram equalized image
    subplot(2, 2, 2);
    imshow(histeq_img);
    title('Histogram Equalization');

    % Apply contrast stretching
    stretched_img = imadjust(gray_img);

    % Display the contrast stretched image
    subplot(2, 2, 3);
    imshow(stretched_img);
    title('Contrast Stretching');

    % Apply adaptive histogram equalization
    adapthisteq_img = adapthisteq(gray_img);

    % Display the adaptive histogram equalized image
    subplot(2, 2, 4);
    imshow(adapthisteq_img);
    title('Adaptive Histogram Equalization');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1000, 800]);
    sgtitle('Comparison of Image Enhancement Techniques');
end

