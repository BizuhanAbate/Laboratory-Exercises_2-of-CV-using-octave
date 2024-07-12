function download_and_display_images(url_list)
    % Function to download images from specified URLs and display them
    % Input:
    %   url_list: A cell array of URLs pointing to images
    % Output:
    %   Displays the downloaded images and any issues encountered

    % Check if the image package is loaded, otherwise load it
    if (~pkg('list', 'image'))
        pkg load image;
    end

    % Create a figure for displaying images and issues
    figure('Position', [100, 100, 1200, 800]);
    num_images = numel(url_list);

    % Loop through each URL in the list
    for i = 1:num_images
        url = url_list{i};

        try
            % Attempt to download the image
            fprintf('Downloading image from: %s\n', url);
            img_data = webread(url);

            % Determine the file extension from the URL
            [~, ~, ext] = fileparts(url);

            % Generate a filename based on timestamp to avoid overwriting
            timestamp = datestr(now, 'yyyymmddHHMMSS');
            filename = sprintf('image_%s%s', timestamp, ext);

            % Save the image locally
            imwrite(img_data, filename);
            fprintf('Image saved locally as: %s\n', filename);

            % Display the downloaded image
            subplot(2, num_images, i);
            imshow(img_data);
            title(sprintf('Image %d', i));

        catch ME
            % Handle any errors or issues encountered
            fprintf('Error downloading image from %s:\n%s\n', url, ME.message);

            % Display a placeholder image for the failed download
            failed_img = zeros(100, 100, 3); % Placeholder black image
            subplot(2, num_images, i);
            imshow(failed_img);
            title(sprintf('Failed to download image %d', i));
        end
    end

    % Adjust figure properties
    sgtitle('Downloaded Images and Issues');
    set(gcf, 'Name', 'Downloaded Images', 'NumberTitle', 'off');
end

