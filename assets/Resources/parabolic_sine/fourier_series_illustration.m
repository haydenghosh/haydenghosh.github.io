%% fourier series illustration
clc; clear; close all;
int_name = 'latex';
set(groot, ...
    'defaultAxesTickLabelInterpreter', int_name, ...
    'defaultTextInterpreter',              int_name, ...
    'defaultLegendInterpreter',            int_name, ...
    'defaultAxesFontSize',                12);

% Period of the waveform
T = 1/4;  % You can change this to any positive number

% Time vector from -T/2 to T/2
t = linspace(0, 4*T, 1000);

% Number of odd harmonics to include
N = 3;

% Initialize Fourier approximation
x = zeros(size(t));

% Plot setup
figure; hold on;
deadspace_proportion = 0.35;
normalized_amplitude = (1-deadspace_proportion)/(N+2);
space_between_terms = 2*deadspace_proportion/(N+1);
xlim([-0.1,1]);
txt = ["","$$+$$","$$+$$"];

% Plot individual sine components
for k = 1:N
    n = 2*k - 1; % odd harmonics only
    omega_n = 2*pi*n / T; % angular frequency
    b_n = (8/pi^2) * ((-1)^((n-1)/2)) / n^2;
    term = b_n * sin(omega_n * t);
    x = x + term;
    term_height = max(term);
    normalized_term = normalized_amplitude*(term/term_height);
    plot(t, normalized_term+1-(k-1)*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,'Color','#75147c','LineWidth', 2, 'HandleVisibility','off');
    text(-0.05,1-(k-1)*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,txt(k),"HorizontalAlignment","center",FontSize=18);
end

% Plot full Fourier approximation
plot(t, x*normalized_amplitude+1-N*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,'Color','#75147c', 'LineWidth', 2, 'DisplayName', 'Fourier Series Approximation');
text(-0.05,1-N*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,"$$=$$","HorizontalAlignment","center",FontSize=18);

% Plot true triangle wave for comparison
triangle_true = (2/pi) * asin(sin(2*pi*t/T)); % scaled to match period T
plot(t, triangle_true*normalized_amplitude+1-(N+1)*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,'Color','#75147c', 'LineWidth', 2, 'DisplayName', 'True Triangle Wave');
text(-0.05,1-(N+1)*(2*normalized_amplitude+space_between_terms)-normalized_amplitude,"$$\approx$$","HorizontalAlignment","center",FontSize=18);

set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
set(gca,'Visible','off')