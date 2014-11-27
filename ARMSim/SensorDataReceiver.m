function SensorDataReceiver( obj, event, setCommand)
% bytesAvailable = obj.BytesAvailable;
[data count msg] =  fread(obj, 1, 'uint8'); %fscanf(obj, '%u', 1); %

% valuesReceived = obj.ValuesReceived;
% fprintf('callbackARMSimWiFly: Received data %s, %d bytes. Total of % d bytes read.\n',...
% data, bytesAvailable, valuesReceived);

% h = setCommand.getFigure();
% figure(h);
% str = sprintf('%s',data(1:(length(data)-1)));
% fprintf('callbackARMSimWiFly: Modified data = %s\n',str);
% value = str2double(str);
% fprintf('callbackARMSimWiFly: Received the value %f\n',value);
% h2 = setCommand.getFigure2();
% figure(h2);
% plot(-3,15,'.');
% fprintf('Data received from the sensor: %d \n', data);
if data == 253
   fprintf('START byte received: %d \n', data); 
   setCommand.setMessageCounter(0);
end
if setCommand.getMessageCounter() == 1
    fprintf('Front sensor value received: %d \n', data);
    setCommand.SetFrontSensorValue(data);
%     plotSensorData(1, data, h);
elseif setCommand.getMessageCounter() == 2
    fprintf('Left sensor value received: %d \n', data);
%     plotSensorData(2, data, h);
    setCommand.SetLeftSensorValue(data);
elseif setCommand.getMessageCounter() == 3
    fprintf('Right front sensor value received: %d \n', data); 
    setCommand.SetRightSensor1Value(data);
%     plotSensorData(3, data, h);
elseif setCommand.getMessageCounter() == 4
    fprintf('Right back sensor value received: %d \n', data);
    setCommand.SetRightSensor2Value(data);
%     plotSensorData(4, data, h);
elseif setCommand.getMessageCounter() == 5
    fprintf('Back sensor value received: %d \n', data);
    setCommand.SetBackSensorValue(data);
%     plotSensorData(5, data, h);
elseif setCommand.getMessageCounter() == 6
    fprintf('End byte received: %d \n\n', data); 
end
setCommand.setMessageCounter(setCommand.getMessageCounter() + 1);

% [pos1, pos2] = GetRobotPosition(setCommand.GetFrontSensorValue(), setCommand.GetLeftSensorValue(),...
%                 setCommand.GetRightSensor1Value(), setCommand.GetBackSensorValue(), setCommand.getXY());
% 
% fprintf('X Valaue received: %d \n', pos1);
DistanceToWall = 2;

setCommand.getTurnSignal();
for i=1:2
    if setCommand.GetBackSensorValue() == 0
%         RoverCommand = 0;
%         setCommand.setRoverCommand(RoverCommand);
%         fprintf('Destination reached. %d \n', RoverCommand);
%         break;
    end
    if setCommand.GetLeftSensorValue() <= DistanceToWall
        if setCommand.GetFrontSensorValue() <= DistanceToWall
            RoverCommand = 3; % Turn right
            setCommand.setRoverCommand(RoverCommand);
            fprintf('Turn right %d \n', RoverCommand);
            break;
        end
    end

    if setCommand.GetRightSensor1Value() <= DistanceToWall
        if setCommand.GetFrontSensorValue() <= DistanceToWall
            RoverCommand = 2; % Turn left
            setCommand.setRoverCommand(RoverCommand);
            fprintf('Turn left %d \n', RoverCommand);
            break;
        end
    end

    if setCommand.GetFrontSensorValue() >= DistanceToWall
        if setCommand.GetRightSensor1Value() <= DistanceToWall
            RoverCommand = 4; % Follow wall
            setCommand.setRoverCommand(RoverCommand);
            fprintf('FOLLOW wall, right side %d \n', RoverCommand);
            setCommand.setTurnSignal(2);
            break;
        end
    end
    if setCommand.GetFrontSensorValue() >= DistanceToWall
        if setCommand.GetLeftSensorValue() <= DistanceToWall
            RoverCommand = 4; % Follow wall
            setCommand.setRoverCommand(RoverCommand);
            fprintf('FOLLOW wall, left side %d \n', RoverCommand);
            setCommand.setTurnSignal(1);
            break;
        end
    end
    if setCommand.GetFrontSensorValue() >= DistanceToWall
        if setCommand.GetLeftSensorValue() >= DistanceToWall
            if setCommand.GetRightSensor1Value() >= DistanceToWall
                if setCommand.getTurnSignal() == 2
                    RoverCommand = 3; % Turn right
                    setCommand.setRoverCommand(RoverCommand);
                    fprintf('Leaving the wall. Turn right %d \n', RoverCommand);
                    setCommand.setTurnSignal(0);
                    break;
                elseif setCommand.getTurnSignal() == 1
                    RoverCommand = 2; % Turn left
                    setCommand.setRoverCommand(RoverCommand);
                    fprintf('Leaving the wall. Turn left %d \n', RoverCommand);
                    setCommand.setTurnSignal(0);
                    break;
                end
            end
        end
    end
    
    if setCommand.GetFrontSensorValue() <= DistanceToWall
        RoverCommand = 3;
        fprintf('Turn right %d \n', RoverCommand);
        setCommand.setRoverCommand(RoverCommand);
        break;
    end 
end

setCommand.getRoverCommand();
DistanceToWall = 1;
for i=1:2
    if setCommand.GetFrontSensorValue() <= DistanceToWall
        setCommand.setTurn(1);
        break;
    elseif setCommand.GetLeftSensorValue() <= DistanceToWall
        setCommand.setTurn(1);
        break;
    elseif setCommand.GetRightSensor1Value() <= DistanceToWall
        setCommand.setTurn(1);
        break;
    elseif setCommand.GetRightSensor2Value() <= DistanceToWall
        setCommand.setTurn(1);
        break;
    else
        setCommand.setTurn(2);
        break;
    end
end

end

% We use the value just received and include it in our dataArray. We
% then update our plot of data received from the SensorSim.
% figure(h);
% if isempty(dataArray)
%     dataArray = [value];
%     figureAxis = axis();
%     figureAxis(1) = 0;
%     figureAxis(2) = 10;
%     figureAxis(3) = 0;
%     figureAxis(4) = 10;
%     plot(1,dataArray,'+');
%     axis(figureAxis);
%     title('Data received from SensorSim');
%     xlabel('Data index');
%     ylabel('Data value (ft)');
%     % We hold the plot so that we can just add data values one at a time
%     % without the figure flashing on and off.
%     hold on;
% else
%     dataArray = [dataArray value];
%     if(length(dataArray)>figureAxis(2))
%         figureAxis(2) = figureAxis(2) + 10;
%         axis(figureAxis);
%     end
%     plot(length(dataArray),value,'+');
% end
