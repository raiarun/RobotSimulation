function SensorDataSimulator( obj, event, objSensor )
% bytesAvailable = obj.BytesAvailable;
% [data] = fscanf(obj, '%s', 32); %fread(obj, bytesAvailable);
% serialPort = objSensor.getSerialPort();
[command] = fread(obj, 1, 'uint8');%fscanf(obj, '%s', 32); 
%str2double(data);
% command = objSensor.getReceivedData();
digits(2);
FrontSensor = 0.0;
BackSensor = 0.0;
LeftSensor1 = 0.0;
LeftSensor2 = 0.0;
RightSensor1 = 0.0;
RightSensor2 = 0.0;

pos1 = objSensor.getPositionValueX();
pos2 = objSensor.getPositionValueY();
xy = objSensor.getXY();
target = objSensor.targetRamp();
% angle = objSensor.getDirection();
offset = 1;
if objSensor.getDirection() == 1 || objSensor.getDirection() == 3
    start = 1; col1 = 1; col2 = 2; counter = 0;
    [FrontSensor, BackSensor] = FrontBackSensorReading(objSensor.getDirection(), pos1, pos2, xy, ...
                                      offset, start, col1, col2, counter, 1, 3);
    start = 2; col1 = 2; col2 = 1; counter = 1;
    data = zeros(length(xy) + 2, 2);
    for i=1:length(xy)
       data(i,1) = xy(i,1);
       data(i,2) = xy(i,2);
    end
    data(length(xy) + 1, 1) = xy(1,1);
    data(length(xy) + 1, 2) = xy(1,2);
    data(length(xy) + 2, 1) = xy(1,1);
    data(length(xy) + 2, 2) = xy(1,2);
    [RightSensor1, RightSensor2, LeftSensor1, LeftSensor2] = SideSensorReading(objSensor.getDirection(), pos2, pos1, data, ... 
                                                                                offset, start, col1, col2, counter, 1, 3);
elseif objSensor.getDirection() == 2 || objSensor.getDirection() == 4
    start = 2; col1 = 2; col2 = 1; counter = 1;
    data = zeros(length(xy) + 2, 2);
    for i=1:length(xy)
       data(i,1) = xy(i,1);
       data(i,2) = xy(i,2);
    end
    data(length(xy) + 1, 1) = xy(1,1);
    data(length(xy) + 1, 2) = xy(1,2);
    data(length(xy) + 2, 1) = xy(1,1);
    data(length(xy) + 2, 2) = xy(1,2);
    [FrontSensor, BackSensor] = FrontBackSensorReading(objSensor.getDirection(), pos2, pos1, data, ...
                                        offset, start, col1, col2, counter, 2, 4);
    start = 1; col1 = 1; col2 = 2; counter = 0;
    [RightSensor1, RightSensor2, LeftSensor1, LeftSensor2] = SideSensorReading(objSensor.getDirection(), pos1, pos2, xy, ...
                                                                                  offset, start, col1, col2, counter, 4, 2);
end

persistent MessageCounter;
if isempty(MessageCounter)
    MessageCounter = 1;
end

MessagePackage = zeros(7);
MessagePackage(1) = objSensor.getStartByte();
MessagePackage(2) = FrontSensor;
MessagePackage(3) = LeftSensor1;
MessagePackage(4) = RightSensor1;
MessagePackage(5) = RightSensor2;
MessagePackage(6) = BackSensor;
MessagePackage(7) = objSensor.getEndByte();
 
% target reached
% fprintf('POSSSSSSSSSSSSSSSSSSSSs1 %f \n', pos1);
% fprintf('POSSSSSSSSSSSSSSSSSSSSs2 %f \n', pos2);
% fprintf('TARGETTTTTTTTTTTTTTTTTTTTTTT2 %f \n', target(1,1));
% fprintf('TARGETTTTTTTTTTTTTTTTTTTTTTT2 %f \n', target(2,1));
if abs(target(2,1) - pos2) <= 0.2
%     fprintf('Destination $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ %d \n', 12);
   if abs(abs(target(1,1)) - abs(pos1)) <= 1
%        MessagePackage(6) = 0;
   end
end

if command == 2
    objSensor.setTurnCommand(2);
elseif command == 3
    objSensor.setTurnCommand(3);
elseif command == 0
    objSensor.setTurnCommand(0);
elseif command == 5
    objSensor.setTurnCommand(5);
else
    objSensor.setTurnCommand(10); % Misc command :) :)
end

for i=1:length(MessagePackage)
    Message = uint8(MessagePackage(i));
    if i == 1
        fprintf('START byte value: %d \n', Message);
    elseif i == 2
        fprintf('FrontSensor value: %d \n', Message);
    elseif i == 3
        fprintf('LeftSensor value: %d \n', Message);
    elseif i == 4
        fprintf('RightSensor1 value: %d \n', Message);
    elseif i == 5
        fprintf('RightSensor2 value: %d \n', Message);
    elseif i == 6
        fprintf('Backsensor value: %d \n', Message);
    elseif i == 7
        fprintf('END byte value: %d \n\n', Message);
    end        
    fwrite(obj, Message);
end
end