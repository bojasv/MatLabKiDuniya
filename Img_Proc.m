/% clears the terminal
clear;clc

% Read in the video
video = VideoReader('VideoFrame.mp4');

% Play the video and allow the user to select a frame
while hasFrame(video)
    % Read in the next frame
    frame = readFrame(video);
    
    imshow(frame);

    /% the code gets stuck at a frame here onwards, rest logic is fine
    while true
        % Prompt the user to select a frame
        title('Click on a point on the screen to select the desired frame');
        [x, y, button] = ginput(1);
        
        % Exit the loop if the user clicks a button
        if button == 1
            break;
        end
    end

    % If the user clicked the left mouse button, stop playing the video and display the selected frame
    if button == 1
        % Extract the selected frame
        selectedFrame = read(video, video.CurrentTime);
        
        % Prompt the user to select two points on the frame
        title('Click on two points to calculate the distance');
        [mv_point_h1, mv_point_v1, button1] = ginput(1);
        [mv_point_h2, mv_point_v2, button2] = ginput(1);
        
        % If the user clicked the left mouse button twice, calculate the distance between the two points
        if button1 == 1 && button2 == 1
            % Calculate the distance between the two points
            distance = sqrt((mv_point_h2-mv_point_h1)^2 + (mv_point_v2-mv_point_v1)^2);
            
            % Display the distance on the screen
            text(mv_point_h1, mv_point_v1, ['Distance: ' num2str(distance)], 'Color', 'red', 'FontSize', 14);
        end
        % Wait for the user to click a button before moving on to the next frame
        waitforbuttonpress;
    end
end

% Release the video player object
release(videoPlayer);
