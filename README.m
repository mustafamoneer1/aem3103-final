% Paper Airplane Numerical Study
% Final Project: AEM 3103 Spring 2024
% 
% - By Mustafa Moneer and Kong Vang
% 
% Summary of findings:
% 
% 
% | Variations        | Parameters                                        |
% |-------------------|------------------------------------------------|
% | Nominal           | V = 7 m/s, Gam = 0 rads   
% |Case A: max        |: V = 7.5 m/s, Gam = -.5 rads   
% | Case A: m         | V = 2 m/s, Gam = 0.4 rad 
% | animated gif      | V = 7.5 m/s, Gam = 0.4 rad 
% 
% 
% The code that we have worked on for the last couple weeks 
% simulates the flight path of a paper airplane. It analyzes various 
% conditions and of different velocities and angles. It also predicts flight
% patterns in random variations of angles and velocities. An average velocity
% was also analyzed using curve fitting of the random projections. Each analysis 
% is plotted. Lastly, a GIF was created simulating flight patterns under 2 
% different conditions. It is observed that by increasing velocity, range also increases.
% Increasing angle increases the height of flight. In conclusion, to apply this to 
% real world, increasing propulsoion of an aircraft and its angle of attack will result in
% a further and higher flight. 
% 
% A)Variated Parameters: https://github.com/mustafamoneer1/aem3103-final/blob/main/VariatedParameters.m
% 
%     This code segment generates a 2x1 figure displaying the 2D flight 
%     trajectories of a paper airplane with 2 different conditions.
% 
% B)Average Trajectories: https://github.com/mustafamoneer1/aem3103-final/blob/main/AverageTrajectory.m
% 
%     This code plots 100 simulated trajectories of a paper airplane using random 
%     parameters. 
% 
% C&D)Derivatives: https://github.com/mustafamoneer1/aem3103-final/blob/main/Derivatives.m
% 
%     This segment plots the average rate of change of height over time and
%     range over time. 
% 
% E) Plotted Gif: https://github.com/mustafamoneer1/aem3103-final/blob/main/plot_gif.m
% 
%     This code generates a GIF that displays trajectories of two different parameters. 
% 
% 
% Figures:
% 
% 1)
Figure1.fig;
![Variated Parameters](https://github.com/mustafamoneer1/aem3103-final/assets/167791403/32f31077-5e54-49e1-bc0d-ecaf58c5443e)


