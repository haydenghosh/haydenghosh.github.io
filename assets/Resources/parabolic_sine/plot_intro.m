clc; clear; close all;
int_name = 'latex';
set(groot, ...
    'defaultAxesTickLabelInterpreter', int_name, ...
    'defaultTextInterpreter',              int_name, ...
    'defaultLegendInterpreter',            int_name, ...
    'defaultAxesFontSize',                12);
%% plots for introduction
t = 0:0.001:1;
r = sin(2*pi*t);
x = zeros(size(t));
for n = 0:1
    x = x + pulse(t-n,1);
    x = x - pulse(t-n-0.5,1);
end
figure;
plot(t,x,'LineWidth',2,'Color','blue');
hold on;
plot(t,r,'LineWidth',2,'Color','#75147c',LineStyle=':');
hold off;
grid on;
legend('Parabolic Approximation','True Sinusoid');
% Format tick labels with LaTeX
ax = gca;
ax.XTickLabel = arrayfun(@(x) sprintf('$$%g$$', x), ax.XTick, 'UniformOutput', false);
ax.YTickLabel = arrayfun(@(y) sprintf('$$%g$$', y), ax.YTick, 'UniformOutput', false);