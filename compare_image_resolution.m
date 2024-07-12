function compare_image_resolution(image_paths)
    % Function to compare images of different resolutions
    % Input:
    %   image_paths: Cell array of paths to image files of different resolutions
    % Output:
    %   Displays images side by side for visual comparison

    % Check if the image package is loaded, otherwise load it
    if (~pkg('list', 'image'))
        pkg load image;
    end

    % Initialize figure for displaying images
    num_images = numel(image_paths);
    figure('Position', [100, 100, 1200, 600]);

    % Loop through each image path
    for i = 1:num_images
        % Load the image
        img = imread(image_paths{i});

        % Display the image in subplot
        subplot(1, num_images, i);
        imshow(img);
        [~, filename, ~] = fileparts(image_paths{i});
        title(sprintf('Image %d: %s\nResolution: %d x %d pixels', i, filename, size(img, 2), size(img, 1)));
    end

    % Adjust figure properties
    sgtitle('Comparison of Images with Different Resolutions');
end

