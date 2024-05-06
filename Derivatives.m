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
