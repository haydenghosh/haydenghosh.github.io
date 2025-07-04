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
scatter(k, 10*log10(abs(a_k).^2)-10*log10(abs(a_k(10)).^2), 'filled', MarkerFaceColor='#75147c');
xlabel('$$k$$');
ylabel('$$|a_{k}|^{2}$$ (dB)');
title('Power of Fourier Series Coefficients of $$x(t)$$');
grid on;
ax = gca;
ax.XTickLabel = arrayfun(@(x) sprintf('$$%g$$', x), ax.XTick, 'UniformOutput', false);
ax.YTickLabel = arrayfun(@(y) sprintf('$$%g$$', y), ax.YTick, 'UniformOutput', false);
