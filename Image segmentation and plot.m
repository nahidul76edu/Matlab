s = xlsread("s.csv");
m = xlsread("m.csv");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
silent = s(:, [4,5,6,7,8]);
music = m(:, [4,5,6,7,8]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n1=1;
for i = 1:fix(length(silent)/640)
    silent640{i,1} = silent(n1:n1+639,:);
    n1=n1+640;
end

n2=1;
for i = 1:fix(length(music)/640)
    music640{i,1} = music(n2:n2+639,:);
    n2=n2+640;
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
silent_t7 = silent640{1, 1}(:,2);
silent_t8 = silent640{1, 1}(:,4);
music_t7 = music640{1, 1}(:,2);
music_t8 = music640{1, 1}(:,4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure;
subplot(4,1,1) % 2 rows, 1 column, first position
plot(silent_t7, "k", "LineWidth", 1);
legend('T7', 'FontSize',10)
set(gca,'TickLabelInterpreter','none');
set(gca,'fontweight','bold','fontsize',9);
title('Hearing Nothing (Soundproof Room)')
grid

subplot(4,1,2) % 2 rows, 1 column, second position
plot(silent_t8, "k", "LineWidth", 1);
legend('T8', 'FontSize',10)
set(gca,'TickLabelInterpreter','none');
set(gca,'fontweight','bold','fontsize',9);
grid

subplot(4,1,3) % 2 rows, 1 column, first position
plot(music_t7, "k", "LineWidth", 1);
legend('T7', 'FontSize',10)
title('Provide Auditory Stimulus Through Headphone')
set(gca,'TickLabelInterpreter','none');
set(gca,'fontweight','bold','fontsize',9);
grid

subplot(4,1,4) % 2 rows, 1 column, second position
plot(music_t8, "k", "LineWidth", 1);
legend('T8', 'FontSize',10)
set(gca,'TickLabelInterpreter','none');
set(gca,'fontweight','bold','fontsize',9);
grid

% Give common xlabel, ylabel and title to your figure
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';

ylabel(han,'Amplitude (\muV)','fontweight','bold');

yl=get(gca,'ylabel');
pyl = get(yl,'position');
pyl(1) = 1*pyl(1);
set(yl,'position',pyl)

% xh = get(gca,'ylabel') % handle to the label object
% p = get(xh,'position') % get the current position property
% p(2) = - 0.1 + p(2) ;       % double the distance, 
%                        % negative values put the label below the axis
% set(xh,'position',p)   % set the new position


xlabel(han,'Time (ms)','fontweight','bold');


silent = xlsread("E:\####EMOTIV INSIGHT\jui\scilent\t1_28.08.20_16.18.43.md.pm.bp.csv");
music = xlsread("E:\####EMOTIV INSIGHT\jui\music\j1m.csv");

silent = silent(:, [4,5,6,7,8]);
music = music(:, [4,5,6,7,8]);

n1=1;
for i = 1:fix(length(silent)/640)
    silent640{i,1} = silent(n1:n1+639,:);
    n1=n1+640;
end

n2=1;
for i = 1:fix(length(music)/640)
    music640{i,1} = music(n2:n2+639,:);
    n2=n2+640;
end 

silent_t7 = silent640{1, 1}(:,2);
silent_t8 = silent640{1, 1}(:,4);
music_t7 = music640{1, 1}(:,2);
music_t8 = music640{1, 1}(:,4);


fig = figure;
subplot(4,1,1) % 2 rows, 1 column, first position
plot(silent_t7, "k", "LineWidth", 1);
title('Hearing Nothing (Soundproof Room)')
grid
subplot(4,1,2) % 2 rows, 1 column, second position
plot(silent_t8, "k", "LineWidth", 1);
grid
subplot(4,1,3) % 2 rows, 1 column, first position
plot(music_t7, "k", "LineWidth", 1);
title('Provide Auditory Stimulus Through Headphone')
grid
subplot(4,1,4) % 2 rows, 1 column, second position
plot(music_t8, "k", "LineWidth", 1);
grid

% Give common xlabel, ylabel and title to your figure
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Amplitude (\muV)');
xlabel(han,'Time (ms)');