function plotSensorData(obj, h)
persistent figureAxis1;
persistent figureAxis2;
persistent figureAxis3;
persistent figureAxis4;
persistent figureAxis5;

persistent dataArray1;
persistent dataArray2;
persistent dataArray3;
persistent dataArray4;
persistent dataArray5;

figure(h);

% Red - Front sensor 
% Blue - Left sensor
% Black - Right sensor
% Green - Back sensor
value = obj.GetFrontSensorValue();
if isempty(dataArray1)
    dataArray1 = [value];
    figureAxis1 = axis();
    figureAxis1(1) = 0;
    figureAxis1(2) = 300;
    figureAxis1(3) = 0;
    figureAxis1(4) = 100;
    plot(1,dataArray1,'+');
    axis(figureAxis1);
    title('Data received from SensorSim');
    xlabel('Data index');
    ylabel('Data value (ft)');
    % We hold the plot so that we can just add data values one at a time
    % without the figure flashing on and off.
    hold on;
else
    dataArray1 = [dataArray1 value];
    if(length(dataArray1)>figureAxis1(2))
        figureAxis1(2) = figureAxis1(2) + 10;
        axis(figureAxis1);
    end
    plot(length(dataArray1),value,'r.-');
end

value = obj.GetLeftSensorValue();
if isempty(dataArray2)
    dataArray2 = [value];
    figureAxis2 = axis();
    figureAxis2(1) = 0;
    figureAxis2(2) = 300;
    figureAxis2(3) = 0;
    figureAxis2(4) = 100;
    plot(1,dataArray2,'+');
    axis(figureAxis2);
    title('Data received from SensorSim');
    xlabel('Data index');
    ylabel('Data value (ft)');
    % We hold the plot so that we can just add data values one at a time
    % without the figure flashing on and off.
    hold on;
else
    dataArray2 = [dataArray2 value];
    if(length(dataArray2)>figureAxis2(2))
        figureAxis2(2) = figureAxis2(2) + 10;
        axis(figureAxis2);
    end
    plot(length(dataArray2),value,'b.-');
end

value = obj.GetRightSensor1Value();
if isempty(dataArray3)
    dataArray3 = [value];
    figureAxis3 = axis();
    figureAxis3(1) = 0;
    figureAxis3(2) = 300;
    figureAxis3(3) = 0;
    figureAxis3(4) = 100;
    plot(1,dataArray3,'+');
    axis(figureAxis3);
    title('Data received from SensorSim');
    xlabel('Data index');
    ylabel('Data value (ft)');
    % We hold the plot so that we can just add data values one at a time
    % without the figure flashing on and off.
    hold on;
else
    dataArray3 = [dataArray3 value];
    if(length(dataArray3)>figureAxis3(2))
        figureAxis3(2) = figureAxis3(2) + 10;
        axis(figureAxis3);
    end
    plot(length(dataArray3),value,'k.-');
end

value = obj.GetRightSensor2Value();
if isempty(dataArray4)
    dataArray4 = [value];
    figureAxis4 = axis();
    figureAxis4(1) = 0;
    figureAxis4(2) = 300;
    figureAxis4(3) = 0;
    figureAxis4(4) = 100;
    plot(1,dataArray4,'+');
    axis(figureAxis4);
    title('Data received from SensorSim');
    xlabel('Data index');
    ylabel('Data value (ft)');
    % We hold the plot so that we can just add data values one at a time
    % without the figure flashing on and off.
    hold on;
else
    dataArray4 = [dataArray4 value];
    if(length(dataArray4)>figureAxis4(2))
        figureAxis4(2) = figureAxis4(2) + 10;
        axis(figureAxis4);
    end
    plot(length(dataArray4),value,'k.-');
end

value = obj.GetBackSensorValue();
if isempty(dataArray5)
    dataArray5 = [value];
    figureAxis5 = axis();
    figureAxis5(1) = 0;
    figureAxis5(2) = 300;
    figureAxis5(3) = 0;
    figureAxis5(4) = 100;
    plot(1,dataArray5,'+');
    axis(figureAxis5);
    title('Data received from SensorSim');
    xlabel('Data index');
    ylabel('Data value (ft)');
    % We hold the plot so that we can just add data values one at a time
    % without the figure flashing on and off.
    hold on;
else
    dataArray5 = [dataArray5 value];
    if(length(dataArray5)>figureAxis5(2))
        figureAxis5(2) = figureAxis5(2) + 10;
        axis(figureAxis5);
    end
    plot(length(dataArray5),value,'g.-');
end
end
