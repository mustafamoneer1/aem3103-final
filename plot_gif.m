% Initialize the figure
figure;

% Define initial conditions
xo = [V; Gam; H; R];
xf = [7.5; 0.4; H; R];
% Simulate the trajectory for the original and modified scenarios
[t, x] = ode23(@(t, x) EqMotion(t, x), tspan, xo);
[t_new, x_new] = ode23(@(t, x) EqMotion(t, x), tspan, xf);

% Initialize the GIF structure array
Gif(length(tspan)) = struct('cdata', [], 'colormap', []);

% Loop through each time step
for k = 1:length(tspan)
    clf; % Clear the figure
    


    plot(x(:, 4), x(:, 3), '-k', 'LineWidth', 2);
    hold on;
    plot(x(k, 4), x(k, 3), 'go', 'LineWidth', 3, 'MarkerSize', 20);
    plot(x_new(:, 4), x_new(:, 3), '-b', 'LineWidth', 2);
    plot(x_new(k, 4), x_new(k, 3), 'ro', 'LineWidth', 3, 'MarkerSize', 20);
    xlabel('Range');
    ylabel('Height');
    title('2D Trajectory Animation');
    grid on;

    % Capture the frame for the GIF
    Gif(k) = getframe;
end

% Write the GIF file
filename = 'trajectory_animation.gif';
frame_rate = 10;
write_gif(filename, Gif, frame_rate);

function write_gif(filename, Gif, frame_rate)
    % Write the GIF file
    gif_writer = VideoWriter(filename, 'Trajectory Animation');
    gif_writer.FrameRate = frame_rate;
    open(gif_writer);
    writeVideo(gif_writer, Gif);
    close(gif_writer);
end