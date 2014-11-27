function Plot_Map( h, XY )
% Plot_Map( h, XY )
% h is the plot handle
% XY are the corners

% set current figure
figure(h);

% hold on graph
hold on

% draw points
for i=1:size(XY,1)
    plot(XY(i,1),XY(i,2),'.');
end

% draw lines
for i=1+1:size(XY,1)
    plot([XY(i-1,1) XY(i,1)],[XY(i-1,2), XY(i,2)],'b-');
end
plot([XY(size(XY,1),1) XY(1,1)],[XY(size(XY,1),2), XY(1,2)],'b-');

% hold off graph
hold off

% make the axes equal so it looks correct
axis('equal');

% label Map Plot
title('My Map');
xlabel('X (in Map Units)');
ylabel('Y (in Map Units)');

end

