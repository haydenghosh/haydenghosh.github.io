clc; clear; close all;
int_name = 'latex';
set(groot, ...
    'defaultAxesTickLabelInterpreter', int_name, ...
    'defaultTextInterpreter',              int_name, ...
    'defaultLegendInterpreter',            int_name, ...
    'defaultAxesFontSize',                12);
t = 0:0.00001:3;
txt = ["$$p(t)$$","$$-p(t-T_{0}/2)$$","$$p(t-T_{0})$$","$$-p(t-T_{0}/2-T_{0})$$","$$p(t-2T_{0})$$","$$-p(t-T_{0}/2-2T_{0})$$"];
colors = ["Blue","#75147c","Blue","#75147c","Blue","#75147c"];
figure;
hold on;
for n = 0:5
    text(0.25+n/2,1.1*(-1)^n,txt(n+1),"HorizontalAlignment","center",FontSize=14,Color=colors(n+1))
    pos_pulse = pulse(t-n,1);
    neg_pulse = -pulse(t-n-0.5,1);
    plot(t(pos_pulse ~= 0),pos_pulse(pos_pulse ~= 0),'LineWidth',2,'Color','blue');
    plot(t(neg_pulse ~= 0),neg_pulse(neg_pulse ~= 0),'LineWidth',2,'Color','#75147c');
end
hold off;
xlabel("$$t$$");
ylabel("$$x(t)$$");
title("Parabolic Approximation of $$r(t)=\sin(2\pi t)$$");
grid on;
ylim([-1.2,1.2]);
xlim([0,3.3]);
text(3.15,0,"$$\ldots$$","HorizontalAlignment","center",FontSize=14);
% Format tick labels with LaTeX
ax = gca;
ax.XTickLabel = arrayfun(@(x) sprintf('$$%g$$', x), ax.XTick, 'UniformOutput', false);
ax.YTickLabel = arrayfun(@(y) sprintf('$$%g$$', y), ax.YTick, 'UniformOutput', false);
ax.Box = 'on';
pos = ax.Position;
xdata = [0,1];
ydata = [-1.375,-1.375];
xlim = ax.XLim;
ylim = ax.YLim;
% --- convert ----------------------------------------------------------
xn = pos(1) + pos(3) * (xdata - xlim(1)) / diff(xlim);
yn = pos(2) + pos(4) * (ydata - ylim(1)) / diff(ylim);
annotation('arrow',xn,yn,HeadStyle="plain",HeadWidth=8);
text(0.5,-1.425,"$$T_{0}=1$$",HorizontalAlignment="center");
