function Fun1_Plot_CapacityCdfFigure

clear
close all
clc

% load data
cd PlotData
load C_SNR_5
load C_SNR_10
load C_SNR_15
load C_SNR_20

figure(1);

Opt_5 = cdfplot(C_SNR_5_Opt);
set(Opt_5, 'Color', 'red','LineWidth', 2, 'LineStyle', '--')
hold on
Max_5 = cdfplot(C_SNR_5_Max);
set(Max_5, 'Color', 'red','LineWidth', 2)
hold on
Opt_10 = cdfplot(C_SNR_10_Opt);
set(Opt_10, 'Color', 'black','LineWidth', 2, 'LineStyle', '--')% blue
hold on
Max_10 = cdfplot(C_SNR_10_Max);
set(Max_10, 'Color', 'black','LineWidth', 2)
hold on
Opt_15 = cdfplot(C_SNR_15_Opt);
set(Opt_15, 'Color', [0.19,0.5,0.08],'LineWidth', 2, 'LineStyle', '--')% green
hold on
Max_15 = cdfplot(C_SNR_15_Max);
set(Max_15, 'Color', [0.19,0.5,0.08],'LineWidth', 2)
hold on
Opt_20 = cdfplot(C_SNR_20_Opt);
set(Opt_20, 'Color', [1,0.5,0],'LineWidth', 2, 'LineStyle', '--')% orange
hold on
Max_20 = cdfplot(C_SNR_20_Max);
set(Max_20, 'Color', [1,0.5,0],'LineWidth', 2)
hold off

% legend
Leg = legend([Max_10,Opt_10],'Scheme MAX','Scheme PCS', 'Box','off','Location','SouthEast');
Leg.FontSize =14;

% title\ labels
% title('CDF of Capacity');
xlabel('Capacity for optimal overhead and maximum overhead (bps/Hz)');
ylabel('CDF');
title(' ')
set(gca,'FontSize',12);


% save figure
print(1,'-depsc','-r300','/Users/wocutewobear/Documents/ÂÛÎÄ/02 OTFS/20GC/[20GC] ·ÂÕæ/Fig/Fig1')