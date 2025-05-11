function spring_damper(N, tf)
    % Parameters
    m = 1;      % mass (kg)
    b = 0.5;    % damping coefficient (N·s/m)
    k = 10;     % spring constant (N/m)
    F = 1;      % constant external force (N)

    % Simulation settings
    t0 = 0;      % initial time
    h = (tf - t0) / N;  % time step
    x10 = 0;     % initial position
    x20 = 0;     % initial velocity
    tt = t0:h:tf;  % time vector from t0 to tf

    % Define the system as a function of time and state
    sys_ODE = @(t, x) [x(2); (F - b * x(2) - k * x(1)) / m];

    % Solve using ode23 and ode45
    [t_x23, x23] = ode23(sys_ODE, tt, [x10; x20]);
    [t_x45, x45] = ode45(sys_ODE, tt, [x10; x20]);

    % Plot the results
    plot_result(t_x23, x23, t_x45, x45);
end

function plot_result(t_x23, x23, t_x45, x45)
    figure(4);
    
    % Subplot for ode23 (Position)
    subplot(4, 1, 1);
    plot(t_x23, x23(:, 1), 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Position (m)');
    title('Spring Damper System: Position (ode23)');
    grid on;

    % Subplot for ode23 (Velocity)
    subplot(4, 1, 2);
    plot(t_x23, x23(:, 2), 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    title('Spring Damper System: Velocity (ode23)');
    grid on;

    % Subplot for ode45 (Position)
    subplot(4, 1, 3);
    plot(t_x45, x45(:, 1), 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Position (m)');
    title('Spring Damper System: Position (ode45)');
    grid on;

    % Subplot for ode45 (Velocity)
    subplot(4, 1, 4);
    plot(t_x45, x45(:, 2), 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    title('Spring Damper System: Velocity (ode45)');
    grid on;
end

spring_damper(1000,100)