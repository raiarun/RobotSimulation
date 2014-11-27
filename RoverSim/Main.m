
clear all
filename = 'originalMap.txt';
% filename = 'Map1.txt';
[XY, Ramp_Center, Ramp_Entrance, Ramp_Exit, Target] = Read_Map_File(filename);
h = figure(1);
clf(h);

axis([-40 30 -50 60])

Plot_Map(h, XY);
Plot_Ramps(h, Ramp_Center, Ramp_Entrance, Ramp_Exit);
Plot_Target(h, Target);

obj = Sensor(5.0);
obj.setFigure(h);
obj.setMap(XY, Ramp_Center, Ramp_Entrance, Ramp_Exit, Target);
pos1 = -5;
pos2 = -4;
angle = 2;
counter = 0;
Radius = 1;
theta1 = 45;
theta2 = 15;

if angle == 1
    % Front Sensor
    fig1 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
    fig2 = line([pos1 ,pos1], [pos2, pos2 + 2], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
    fig4 = line([pos1 ,pos1], [pos2, pos2 - 2], 'Color', 'g', 'LineWidth', 2);
    
    LeftSensor1 = line([pos1 + 0.5, pos1 + 2], [pos2 + 0.0, pos2 + 0.0], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 + 0.5, pos1 + 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 - 0.5, pos1 - 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 - 0.5, pos1 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
    obj.setLeft1Angle1(-180 - theta1);
    obj.setLeft1Angle2(-180 - theta2);
    obj.setLeft2Angle1(-180 + theta1);
    obj.setLeft2Angle2(-180 + theta2);
    obj.setRight1Angle1(theta1);
    obj.setRight1Angle2(theta2);
    obj.setRight2Angle1( -theta1);
    obj.setRight2Angle2( -theta2);
elseif angle == 2
    % Front Sensor
    fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
    fig2 = line([pos1 ,pos1 + 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
    fig4 = line([pos1 ,pos1 - 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);
    
    LeftSensor1 = line([pos1 + 0.0, pos1 + 0.0], [pos2 + 0.5, pos2 + 2], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + 2], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 + 0.5,pos1 + 0.5], [pos2 - 0.5, pos2 - 2], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - 2], 'Color', 'g', 'LineWidth', 2);
    obj.setLeft1Angle1(90 - theta1);
    obj.setLeft1Angle2(90 - theta2);
    obj.setLeft2Angle1(-180 - (90 - theta1));
    obj.setLeft2Angle2(-180 - (90 - theta2));
    obj.setRight1Angle1( -(90 - theta1));
    obj.setRight1Angle2( -(90 - theta2));
    obj.setRight2Angle1(-180 + (90 - theta1));
    obj.setRight2Angle2(-180 + (90 - theta2));
    
elseif angle == 3
    % Front Sensor
    fig1 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
    fig2 = line([pos1 ,pos1], [pos2, pos2 - 2], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
    fig4 = line([pos1 ,pos1], [pos2, pos2 + 2], 'Color', 'g', 'LineWidth', 2);
    
    LeftSensor1 = line([pos1 + 0.5,pos1 + 2], [pos2 + 0, pos2 + 0], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 + 0.5,pos1 + 2], [pos2 - 0, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 - 0.5, pos1 - 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 - 0.5, pos1 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
    obj.setLeft1Angle1( -theta1);
    obj.setLeft1Angle2( -theta2);
    obj.setLeft2Angle1(theta1);
    obj.setLeft2Angle2(theta2);
    obj.setRight1Angle1(-180 + theta1);
    obj.setRight1Angle2(-180 + theta2);
    obj.setRight2Angle1(-180 - theta1);
    obj.setRight2Angle2(-180 - theta2);
    
elseif angle == 4
    % Front Sensor
    fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
    fig2 = line([pos1 ,pos1 - 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
    fig4 = line([pos1 ,pos1 + 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);
    
    LeftSensor1 = line([pos1 + 0.0, pos1 + 0.0], [pos2 + 0.5, pos2 + 2], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + 2], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 + 0.5,pos1 + 0.5], [pos2 - 0.5, pos2 - 2], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - 2], 'Color', 'g', 'LineWidth', 2);
    obj.setLeft1Angle1(-180 + (90 - theta1));
    obj.setLeft1Angle2(-180 + (90 - theta2));
    obj.setLeft2Angle1(-(90 - theta1));
    obj.setLeft2Angle2(-(90 - theta2));
    obj.setRight1Angle1(-180 - (90 - theta1));
    obj.setRight1Angle2(-180 - (90 - theta2));
    obj.setRight2Angle1(90 - theta1);
    obj.setRight2Angle2(90 - theta2);
end

obj.figure1(fig1);
obj.figure2(fig2);
obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);

obj.setPositionValueX(pos1);
obj.setPositionValueY(pos2);
obj.setDirection(angle);
obj.setCounter(counter);
obj.setCurrentAngle(counter);
obj.setTurnSignal(0);
obj.setRampCounter(1);
obj.setTurnSignal(0);
obj.setTurnSignal(0);

% set initial angles of the 
% sensors


obj.setSmoothTurn1(1);
obj.setSmoothTurn2(1);
obj.setSmoothTurn3(1);
obj.setSmoothTurn4(1);
obj.setSmoothTurn5(1);
obj.setSmoothTurn6(1);
obj.setSmoothTurn7(1);
obj.setSmoothTurn8(1);
obj.setSmoothTurn9(1);
obj.setSmoothTurn10(1);
obj.setSmoothTurn11(1);
obj.setSmoothTurn12(1);
obj.setToTurnInDirection(1);

move = 1;
obj.setMovement(move);
startByte = 253;
endByte = 254;
obj.setStartByte(startByte);
obj.setEndByte(endByte);

pause(1);
sensorSimTimer = timer;
sensorSimTimer.Period         = 0.2; %obj.getTimerPeriod();
sensorSimTimer.ExecutionMode  = 'fixedRate';
sensorSimTimer.TimerFcn       = {@RoverSimulator,obj};
sensorSimTimer.BusyMode       = 'drop';
start(sensorSimTimer);

ioSensorSimWiFly    =   serial('COM10','BaudRate',57600);
obj.saveSerialPort(ioSensorSimWiFly);

ioSensorSimWiFly.BytesAvailableFcnCount = 1;
ioSensorSimWiFly.BytesAvailableFcnMode = 'byte';

ioSensorSimWiFly.BytesAvailableFcn = {@SensorDataSimulator,obj};
%io2.terminator = uint8(255);
% ioSensorSimWiFly.terminator = ' ';
fopen(ioSensorSimWiFly);
