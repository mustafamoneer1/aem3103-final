    Vrange= [V+2,V+7.50];
    GamRange = [Gam-0.5,Gam+0.4];
    Vmin = min(Vrange);
    Vmax = max(Vrange);
    GamMax = max(GamRange);
    GamMin = min(GamRange);

% 2x1 figure 
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