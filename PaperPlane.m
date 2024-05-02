%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005


	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
    [V,Gam,H,R] = setup_sim();
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to;tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	b) Oscillating Glide due to Zero Initial Flight Path Angle
	xo		=	[V;0;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);

%	c) Effect of Increased Initial Velocity
	xo		=	[1.5*V;0;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);

%	d) Effect of Further Increase in Initial Velocity
	xo		=	[3*V;0;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);
    

    Vrange= [V+2,V+7.50];
    GamRange = [Gam-0.5,Gam+0.4];
    Vmin = min(Vrange);
    Vmax = max(Vrange);
    GamMax = max(GamRange);
    GamMin = min(GamRange);

% 2x1 figure of different trajectories
    tspan = linspace(to, tf, 100);
    figure;
    subplot(2,1,1)
    hold on;
    
    %Nomail Velocity 
    xo = [V;GamMin;H;R];
    [t4, x4] = ode23(@(t4,x4) EqMotion(t4,x4), tspan, xo);

    xo = [V;GamMax;H;R];
    [t5, x5] = ode23(@(t5,x5) EqMotion(t5,x5), tspan, xo);


    xo = [V;Gam;H;R];

    [t6, x6] = ode23(@(t6,x6) EqMotion(t6,x6), tspan, xo);

	plot(x4(:,4),x4(:,3),'r', x5(:,4),x5(:,3), 'g', x6(:,4),x6(:,3),'-k')
	xlabel('Range'); ylabel('Height'); grid
    title('2D flight trajectories');
    
    % Nomial Angle
    xo = [Vmin;Gam;H;R];
    [t1, x1] = ode23(@(t1,x1) EqMotion(t1,x1), tspan, xo);

    xo = [Vmax;Gam;H;R];
    [t2, x2] = ode23(@(t2,x2) EqMotion(t2,x2), tspan, xo);

    xo = [V;Gam;H;R];
    [t3, x3] = ode23(@(t3,x3) EqMotion(t3,x3), tspan, xo);

    subplot(2,1,2);
	plot(x1(:,4),x1(:,3), 'r', x2(:,4),x2(:,3),'g', x3(:,4),x3(:,3), '-k')
	xlabel('Range'); ylabel('Height'); grid
   




	figure
	plot(xa(:,4),xa(:,3),xb(:,4),xb(:,3),xc(:,4),xc(:,3),xd(:,4),xd(:,3))
	xlabel('Range, m'), ylabel('Height, m'), grid

	figure
	subplot(2,2,1)
	plot(ta,xa(:,1),tb,xb(:,1),tc,xc(:,1),td,xd(:,1))
	xlabel('Time, s'), ylabel('Velocity, m/s'), grid
	subplot(2,2,2)
	plot(ta,xa(:,2),tb,xb(:,2),tc,xc(:,2),td,xd(:,2))
	xlabel('Time, s'), ylabel('Flight Path Angle, rad'), grid
	subplot(2,2,3)
	plot(ta,xa(:,3),tb,xb(:,3),tc,xc(:,3),td,xd(:,3))
	xlabel('Time, s'), ylabel('Altitude, m'), grid
	subplot(2,2,4)
	plot(ta,xa(:,4),tb,xb(:,4),tc,xc(:,4),td,xd(:,4))
	xlabel('Time, s'), ylabel('Range, m'), grid



figure;
hold on;
for i = 1:100
  v_random = Vmin + (Vmax + -Vmin) * rand(1);
  gamma_random = GamMin + (GamMax + 0.5) * rand(1);
  xo = [v_random; gamma_random; H; R];
  tspan = linspace(to, tf, 100);
  [t, x] = ode23(@(t,x) EqMotion(t,x), tspan, xo);
  plot(x(:, 4), x(:, 3), 'Color', rand(1,3));
end
xlabel('Range');
ylabel('Height');
title('100 Simulated Trajectories in 2D');
grid on;
% Polyfit Data
degree = 3;
poly_range = polyfit(traj_time(:), traj_range(:), degree);
poly_height = polyfit(traj_time(:), traj_height(:), degree);
% Evaluate the polynomial curves
time_fit = linspace(min(traj_time(:)), max(traj_time(:)), 1000);
range_fit = polyval(poly_range, time_fit);
height_fit = polyval(poly_height, time_fit);
% Plot the average trajectory
figure;
plot(range_fit, height_fit, '-k', 'LineWidth', 2);
xlabel('Range');
ylabel('Height');
title('Average Trajectory');
grid on;


height_derivative = diff(height_fit) ./ diff(time_fit);
range_derivative = diff(range_fit) ./ diff(time_fit);

figure;
subplot (2,1,1); 
plot(time_fit(1:end-1), height_derivative, '-k', 'LineWidth', 2);
xlabel('Time');
ylabel('m/s');
title('Height Over Time Derivative');
grid on;

subplot(2,1,2);
plot(time_fit(1:end-1), range_derivative, 'r', 'LineWidth', 2);
xlabel('Time');
ylabel('m/s');
title('Range Over Time Derivative');
grid on;

% simulate trajectories 
xo = [V;Gam;H;R];
x = ode23('EqMotion',tspan,xo);
xf = [7.5;0.4;H;R];
y = ode23('EqMotion',tspan,xo);
fname = 'animated_plot.gif';
frame_rate = 10;
%plot_gif(x,y,z, fname, frame_rate);

figure;
xo = [V;Gam;H;R];

[t6, x6] = ode23(@(t,x) EqMotion(t,x), tspan, xo);

xf = [7.5;0.4;H;R];
[t7, x7] = ode23('EqMotion',tspan,xo);

Gif(length(tspan)) = struct('cdata', [], 'colormap', []);
for k=1:length(tspan)

    clf 
    
    plot(x6(k, 4), x6(k, 3),x7(k, 4), x7(k, 3), 'go', 'LineWidth', 3, 'MarkerSize', 20);

    hold on;

	plot(x6(:,4),x6(:,3),x7(:,4),x7(:,3), '-k', 'LineWidth', 2)

    xlabel('Range');
    ylabel('Height');
    title('2D Trajectory Animation');
    grid on;

    
    Gif(k) = getframe;  
end
filename = 'trajectory_animation.gif';
frame_rate = 10;
write_gif(filename, Gif, frame_rate);

function write_gif(filename, Gif, frame_rate)
    % Write the GIF file
    gif_writer = VideoWriter(filename, 'Uncompressed AVI');
    gif_writer.FrameRate = frame_rate;
    open(gif_writer);
    writeVideo(gif_writer, Gif);
    close(gif_writer);
end

