figure;
hold on;
for i = 1:100
  v_random = v_nominal + (2 + 7.5) * rand();
  gamma_random = -0.18 + (0.4 + 0.5) * rand();
  xo = [v_random; gamma_random; H; R];
  tspan = linspace(to, tf, 100);
 [t, x] = ode23(@(t,x) EqMotion(t,x), tspan, xo);
 plot(x(:, 4), x(:, 3), 'Color', rand(1,3));

end

xlabel('Range');
ylabel('Height');
title('100 Simulated 2D Trajectories');

traj_range(:, i) = x(:, 4)';
traj_height(:, i) = x(:, 3)';
traj_time(:, i) = tspan';


grid on;
% Polyfit Data
degree = 3;
poly_range = polyfit(traj_time(:), traj_range(:), degree);
poly_height = polyfit(traj_time(:), traj_height(:), degree);
% Evaluate the polynomial curves
time_fit = linspace(0, 6, 1000);
range_fit = polyval(poly_range, time_fit);
height_fit = polyval(poly_height, time_fit);
% Plot the average trajectory
figure;
plot(range_fit, height_fit, 'k-', 'LineWidth', 2);
xlabel('Range');
ylabel('Height');
title('Average Trajectory');
grid on;