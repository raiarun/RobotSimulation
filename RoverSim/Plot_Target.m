function Plot_Target( h, Target )
% Plot_Target( h, Target )
% h is the plot handle

% set current figure
figure(h);

% hold on graph
hold on

% draw target
plot(Target(1,1),Target(2,1),'go');
plot(Target(1,1),Target(2,1),'gx');
str = sprintf('Target');
text(Target(1,1)+2,Target(2,1)+2,str);

% hold off graph
hold off

end

