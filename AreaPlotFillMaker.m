%% Droplet Plot Maker
% This code was written by:
% Jon Komperda
% Lecturer
% 842 W. Taylor St (MC/251)
% Department of Mechanical and Industrial Engineering
% Chicago, IL 60607
% Contact: jonk@uic.edu

%%
% You first need to clear your matlab workspace, and load your data from a
% .mat file. The data structure of the .mat file follows:
% 1st column = droplet size,  2nd column = minimums,
% 3rd column = averages,      4th column = maximums.
clc
clear
load('sampleData.mat');

% Variables to make the plots pretty, edit these as needed
lw = 2;       % this is the line thickness
fs = 16;      % this is the font size on figures
fn = 'Times'; % this is the name of the font for all the figures, you can use 'listfonts' to see all available fonts in matlab
alpha = 0.2;  % this is the transparency of the min/max area
color1 = 'b'; % color of the droplet plots
tscale = [0.01 100]; % y scale of the time plots

%% This section actually creates the plot and saves it as a PNG

% Create a sample plot
figure(1)
hold on
area(dropData(:,1),dropData(:,2),dropData(:,4),color1,alpha); %area for water
plot(dropData(:,1),dropData(:,3),'LineWidth',lw,'Color',color1); %line plot average for watertime
set(gca,'YScale','log') % sets the y axis to a log scale
set(gca,'FontSize',fs);
set(gca,'FontName',fn);
xlabel('Droplet Size (\mum)');
ylabel('Time (minutes)');
legend('Droplet Range','Droplet Average');
legend boxoff
box on
ylim(tscale);
saveas(gcf,'sample.png')


%% This function (which was a headache) makes the area plot for the ranges.
% x = droplet size range array
% minData = the minimum of the range
% maxData = the maximum of the range
% color = color you want for the area to be filled
% transparency = range from [0,1] of how transparent you want the area
function out = area(x,minData,maxData,color,transparency)
    out = fill([x' fliplr(x')],[maxData' fliplr(minData')],color);
    set(out,'facealpha',transparency);
    set(out,'EdgeColor','none'); % don't delete this line, it eliminates the outline
end