function capture_image_with_adjustments()
    % Function to capture images from a connected camera with adjustments
    % Input: None (User interaction within the function)
    % Output: None (Displays the captured image)

    % Check if the image-acquisition package is loaded, otherwise load it
    if (~pkg('list', 'image-acquisition'))
        pkg load image-acquisition;
    end

    % Create a video input object for the default camera
    vid = videoinput('winvideo', 1); % Adjust 'winvideo' as per your platform

    % Set video input properties
    set(vid, 'FramesPerTrigger', 1); % Capture single frame per trigger
    set(vid, 'TriggerRepeat', Inf); % Infinite trigger repeats until stopped

    % Start video input to preview image
    preview(vid);
    fprintf('Camera preview started. Adjust parameters as needed.\n');

    % Adjust image properties interactively
    prompt = 'Adjust brightness (0-1): ';
    brightness = input(prompt);
    prompt = 'Adjust contrast (0-1): ';
    contrast = input(prompt);

    % Set adjusted properties
    set(vid, 'Brightness', brightness);
    set(vid, 'Contrast', contrast);

    % Capture a single image
    fprintf('Press any key to capture the image...\n');
    pause;
    fprintf('Capturing image...\n');
    trigger(vid);
    img_data = getdata(vid);

    % Stop video input and close preview window
    stoppreview(vid);
    delete(vid);

    % Display the captured image
    figure;
    imshow(img_data);
    title('Captured Image');
end

