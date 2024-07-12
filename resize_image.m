function resize_image(original_image_path, new_width, new_height)
    % Function to resize an image while maintaining aspect ratio
    % and compare it with the original image

    % Read the original image
    original_img = imread(original_image_path);

    % Get original dimensions
    [original_height, original_width, ~] = size(original_img);

    % Compute aspect ratio of the original image
    original_aspect_ratio = original_width / original_height;

    % Calculate new dimensions while maintaining aspect ratio
    if nargin < 3
        % Only one dimension provided (new_width or new_height)
        if nargin == 1
            error('Specify both new width and new height or leave both empty for automatic resizing.');
        end

        if new_width > 0
            new_height = new_width / original_aspect_ratio;
        elseif new_height > 0
            new_width = new_height * original_aspect_ratio;
        else
            error('Invalid dimensions provided.');
        end
    else
        % Both dimensions provided (new_width and new_height)
        new_aspect_ratio = new_width / new_height;

        if abs(new_aspect_ratio - original_aspect_ratio) > eps
            warning('Resizing may distort aspect ratio.');
        end
    end

    % Resize the image while maintaining aspect ratio
    resized_img = imresize(original_img, [new_height, new_width]);

    % Display the original and resized images side by side
    figure;

    % Display original image
    subplot(1, 2, 1);
    imshow(original_img);
    title('Original Image');

    % Display resized image
    subplot(1, 2, 2);
    imshow(resized_img);
    title('Resized Image');

    % Adjust figure properties
    set(gcf, 'Position', [100, 100, 1200, 500]);
    sgtitle('Comparison of Original and Resized Images');
end

