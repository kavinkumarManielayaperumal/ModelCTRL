Fig_F = figure('Position', [1000 1000 990 540]);
set(gcf, 'Name','Displacement of scale platform')
set(Fig_F,'Color',[0.95 0.95 0.95])
fontsize = 24;

axis_displ = subplot(1,1,1);
set(axis_displ, 'Title', text('String','Displacement of scale platform','Color','k','FontWeight','bold'))
set(get(axis_displ,'XLabel'),'String','Time (s)')
set(get(axis_displ,'YLabel'),'String','x (m)')
set(axis_displ,'XGrid','on')
set(axis_displ,'YGrid','on')
set(gca, 'FontName','Arial','FontSize', fontsize)

line_mass = [];
legend_labels = {};
n = 1;

for m = 0.02:0.02:0.1
    % Set mass and simulate
    assignin('base','m',m);     % Pass variable m to Simulink base workspace
    simOut = sim('scale_noctrl.slx');   % Run model

    % Extract displacement
    time = simOut.res_displ.time;
    x = simOut.res_displ.signals.values;

    % Plot the result
    line_mass(n) = plot(time, x, 'LineWidth', 2);
    hold on;

    % Final displacement value
    x_final_mm = x(end) * 1000;
    fprintf('Mass = %.2f kg → Final displacement = %.2f mm\n', m, x_final_mm);

    % Optional: Annotate final point on plot
    text(time(end), x(end), sprintf('%.2f mm', x_final_mm), ...
         'FontSize', 12, 'VerticalAlignment','bottom', 'HorizontalAlignment','right');

    % Add to legend
    legend_labels{end+1} = sprintf('m = %.2f kg', m);
    n = n + 1;
end

legend(axis_displ, line_mass, legend_labels{:}, 'Location', 'southeast');
