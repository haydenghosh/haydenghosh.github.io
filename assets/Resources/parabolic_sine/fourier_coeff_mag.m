clc; clear; close all;
int_name = 'latex';
set(groot, ...
    'defaultAxesTickLabelInterpreter', int_name, ...
    'defaultTextInterpreter',              int_name, ...
    'defaultLegendInterpreter',            int_name, ...
    'defaultAxesFontSize',                12);
% Define parameters
A = 1;
k = -10:10;  % Range of k values
a_k = zeros(size(k));  % Initialize a_k

% Compute a_k using the given piecewise expression
for idx = 1:length(k)
    if mod(k(idx), 2) ~= 0 && k(idx) ~= 0  % k is odd and non-zero
        a_k(idx) = -A * (16j) / (pi^3 * k(idx)^3);
    else
        a_k(idx) = 0;
    end
end

% Plot the magnitude of a_k
scatter(k, abs(a_k), 'filled', MarkerFaceColor='#75147c');
hold on;
xlabel('$$k$$');
title('Magnitude of Fourier Series Coefficients of $$x(t)$$');
grid on;
dt = 0.01;
t = 1:dt:10;
x = abs(a_k(10))*t.^(-3);
plot(t,x,LineStyle=":",LineWidth=1,Color='blue');
plot(-t,x,LineStyle=":",LineWidth=1,Color='blue');
legend('$$|a_{k}|$$','$$1/k^{3}$$ Decay');
ax = gca;
ax.XTickLabel = arrayfun(@(x) sprintf('$$%g$$', x), ax.XTick, 'UniformOutput', false);
ax.YTickLabel = arrayfun(@(y) sprintf('$$%g$$', y), ax.YTick, 'UniformOutput', false);
