function Plot_Ramps( h, Ramp_Center, Ramp_Entrance, Ramp_Exit )
% Plot_Ramps( h, Ramp_Center, Ramp_Entrance, Ramp_Exit )
% h is the plot handle

% set current figure
figure(h);

% hold on graph
hold on

% draw ramps
for i=1:size(Ramp_Center,1)
    x(1) = Ramp_Center(i,1) - 1;
    x(2) = Ramp_Center(i,1) + 1;
    x(3) = Ramp_Center(i,1) + 1;
    x(4) = Ramp_Center(i,1) - 1;
    x(5) = Ramp_Center(i,1) - 1;
    y(1) = Ramp_Center(i,2) - 1;
    y(2) = Ramp_Center(i,2) - 1;
    y(3) = Ramp_Center(i,2) + 1;
    y(4) = Ramp_Center(i,2) + 1;
    y(5) = Ramp_Center(i,2) - 1;
    plot(x,y,'k-');
    str = sprintf('Ramp %d',i);
    text(Ramp_Center(i,1)+2,Ramp_Center(i,2)+2,str);
end
clear x y;

% draw entrance/exit vectors
for i=1:size(Ramp_Center,1)
    x(1) = Ramp_Center(i,1) - 2*Ramp_Entrance(i,1);
    y(1) = Ramp_Center(i,2) - 2*Ramp_Entrance(i,2);
    x(2) = Ramp_Center(i,1);
    y(2) = Ramp_Center(i,2);
    plot(x,y,'r-');
    x(1) = Ramp_Center(i,1) + 2*Ramp_Exit(i,1);
    y(1) = Ramp_Center(i,2) + 2*Ramp_Exit(i,2);
    x(2) = Ramp_Center(i,1);
    y(2) = Ramp_Center(i,2);
    plot(x,y,'b-');
end

% hold off graph
hold off

end

