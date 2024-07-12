function import_and_display_images(directory)
    % Function to import and display images with different colormaps
    % Input:
    %   directory: Path to the directory containing images

    % Check if directory exists
    if ~exist(directory, 'dir')
        error('Directory does not exist.');
    end

    % List all files in the directory
    files = dir(fullfile(directory, '*.*'));

    % Initialize figure for displaying images
    figure;

    % Loop through each file in the directory
    for i = 1:length(files)
        filename = fullfile(directory, files(i).name);

        % Check if file is an image (skip directories and non-image files)
        [~, ~, ext] = fileparts(filename);
        if ~ismember(ext, {'.jpg', '.jpeg', '.png', '.bmp'})
            continue;
        end

        % Import the image using imread
        try
            img = imread(filename);
        catch
            warning(['Error importing ', filename]);
            continue;
        end

        % Display the image using different colormaps
        colormap_list = {'gray', 'hot', 'jet'};
        num_colormaps = length(colormap_list);

        for cmap_idx = 1:num_colormaps
            subplot(length(files), num_colormaps, (i-1)*num_colormaps + cmap_idx);
            imshow(img);
            colormap(colormap_list{cmap_idx});
            colorbar;
            title(sprintf('Image %d - Colormap: %s', i, colormap_list{cmap_idx}));
        end
    end

    % Adjust figure properties
    sgtitle('Images with Different Colormaps');
    set(gcf, 'Position', [100, 100, 1200, 800]);
end

