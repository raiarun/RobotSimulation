
classdef SetGetCommand < handle
   properties (GetAccess ='public', SetAccess ='public')
       ioWiFly;
       turnLeft;
       turnRight;
       XY;
       Center_Ramp;
       Entrance_Ramp;
       Exit_Ramp;
       Target;
     
       FrontSensor;
       BackSensor;
       LeftSensor;
       RightSensor1;
       RightSensor2;  
       
       figure;
       figure2;
       
       state;
       msgCounter;
       
       turnSignal;
       command;
       currentCmd;
   end
   
   methods (Access='public')
       
       function setCurrentCommand(obj, currentCmd)
           obj.currentCmd = currentCmd;
       end
       function currentCmd = getCurrentCommand(obj)
           currentCmd = obj.currentCmd;
       end
       function setRoverCommand(obj, command)
          obj.command = command; 
       end
       function command = getRoverCommand(obj)
           command = obj.command;
       end
       function setTurnSignal(obj, signal)
           obj.turnSignal = signal;
       end
       function signal = getTurnSignal(obj)
           signal = obj.turnSignal;
       end
       function setMessageCounter(obj, count)
          obj.msgCounter = count; 
       end
       function count = getMessageCounter(obj)
          count = obj.msgCounter; 
       end
       function setDestinationState(obj, s)
          obj.state = s; 
       end
       function s = getDestinationState(obj)
           s = obj.state;
       end
       function saveFigure(obj, fig, fig2)
          obj.figure = fig; 
%           obj.figure2 = fig2;
       end
       function fig = getFigure(obj)
          fig = obj.figure; 
       end
       function fig = getFigure2(obj)
          fig = obj.figure2; 
       end
       function obj =  SetGetCommand(wifly)
           obj.ioWiFly = wifly;
       end
       function setTurn(obj, turn)
          obj.turnLeft = turn; 
       end
       function turn = getTurn(obj)
          turn = obj.turnLeft; 
       end
       function object = getIoWiFly(obj)
          object = obj.ioWiFly; 
       end
       
       function storMap(obj, xy, center_ramp, entrance_ramp, exit_ramp, target)
          obj.XY = xy;
          obj.Center_Ramp = center_ramp;
          obj.Entrance_Ramp = entrance_ramp;
          obj.Exit_Ramp = exit_ramp;
          obj.Target = target;
       end
       function xy = getXY(obj)
          xy = obj.XY; 
       end
       % Set Sensor Value
       function SetFrontSensorValue(obj, val)
          obj.FrontSensor = val; 
       end
       function SetBackSensorValue(obj, val)
          obj.BackSensor = val; 
       end
       function SetLeftSensorValue(obj, val)
          obj.LeftSensor = val; 
       end
       function SetRightSensor1Value(obj, val)
          obj.RightSensor1 = val; 
       end
       function SetRightSensor2Value(obj, val)
          obj.RightSensor2 = val; 
       end
       
       % Get Sensor Values
       function value = GetFrontSensorValue(obj)
          value = obj.FrontSensor; 
       end
       function value = GetBackSensorValue(obj)
          value = obj.BackSensor;
       end
       function value = GetLeftSensorValue(obj)
          value = obj.LeftSensor; 
       end
       function value = GetRightSensor1Value(obj)
          value = obj.RightSensor1; 
       end
       function value = GetRightSensor2Value(obj)
          value = obj.RightSensor2; 
       end
   end
end