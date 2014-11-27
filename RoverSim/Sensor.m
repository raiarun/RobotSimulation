classdef Sensor < handle
    % An instance of this class is my sensor model
    % We implement this as a subclass of the handle class so that
    % we do not have to return the obj in the property setters
    % Note that the timer obj is external to this object
    % Also, the serial object (that talks to the WiFly) is external
    % These are all defined in the "SensorSim" script
    
    properties(Constant, GetAccess= 'private')
        % Values cannot be changed
        % Units are feet and seconds
        maxRange = 10.0;    % Maximum distance the sensor can see
        minRange = 1.0;     % Minimum distance the sensor can see
        timerPeriod = 5.0;  % How often we read the sensor
    end
    
    properties(GetAccess= 'private', SetAccess= 'private')
        % Values require get and set methods to view or manipulate
        % Sensor variables
        distance;   % Actual distance to wall
        spread;     % Variance of sensor
        currentTime;% Current time
        lastADReading % Most recent A/D reading
        myFigure;
        fig1;
        fig2;
        fig3;
        fig4;
        
        RightSensor1Fig;
        RightSensor2Fig;
        LeftSensor1Fig;
        LeftSensor2Fig;
        turningCmd;
        PositionValueX;
        PositionValueY;
        turn;
        angle;
        counter;
        currentAngle;
        
        XY;
        Center_Ramp;
        Entrance_Ramp;
        Exit_Ramp;
        Target;
        
        signal;
        ramp;
        
        TurnSignal;
        
        SmoothTurn1;
        SmoothTurn2;
        SmoothTurn3;
        SmoothTurn4;
        SmoothTurn5;
        SmoothTurn6;
        SmoothTurn7;
        SmoothTurn8;
        
        SmoothTurn9;
        SmoothTurn10;
        SmoothTurn11;
        SmoothTurn12;
        
        % Turning angles for sensors on the right
        % and the left side of the rover
        Left1Angle1;
        Left1Angle2;
        Left2Angle1;
        Left2Angle2;
        Right1Angle1;
        Right1Angle2;
        Right2Angle1;
        Right2Angle2;
        
        commandData;
        port;
        
        FrontSensor;
        LeftSensor1;
        LeftSensor2;
        RightSensor1;
        RightSensor2;
        
        startByte;
        endByte;
        move;
    end
    
    methods(Access= 'public')
        % Constructor Function
        
        function setMovement(obj, move)
           obj.move = move; 
        end
        function move = getMovement(obj)
           move = obj.move; 
        end
        
        function obj = Sensor(dist)
            % obj = SensorSim
            obj.distance = dist; % initial distance to wall
            obj.spread = 0.25;
            obj.currentTime = 0.0;
        end
        
        function setStartByte(obj, getByte)
           obj.startByte = getByte; 
        end
        function getByte = getStartByte(obj)
           getByte =  obj.startByte;
        end
        function setEndByte(obj, getByte)
           obj.endByte = getByte;
        end
        function getByte = getEndByte(obj)
           getByte =  obj.endByte;
        end
        function saveSerialPort(obj, p)
           obj.port = p; 
        end
        function p = getSerialPort(obj)
           p =  obj.port;
        end
        function receivedCommand(obj, data)
            obj.commandData = data;
        end
        function data = getReceivedData(obj)
            data = obj.commandData;
        end
        % Left side sensors angles - sensor 1
        function setLeft1Angle1(obj, angle)
           obj.Left1Angle1 = angle; 
        end
        function angle = getLeft1Angle1(obj)
           angle = obj.Left1Angle1; 
        end
        function setLeft1Angle2(obj, angle)
           obj.Left1Angle2 = angle; 
        end
        function angle = getLeft1Angle2(obj)
           angle = obj.Left1Angle2; 
        end
        % Left side sensors angles - sensor 2
        function setLeft2Angle1(obj, angle)
           obj.Left2Angle1 = angle; 
        end
        function angle = getLeft2Angle1(obj)
           angle = obj.Left2Angle1; 
        end
        function setLeft2Angle2(obj, angle)
           obj.Left2Angle2 = angle; 
        end
        function angle = getLeft2Angle2(obj)
           angle = obj.Left2Angle2; 
        end
        % Right side sensors angles - sensor 1
        function setRight1Angle1(obj, angle)
           obj.Right1Angle1 = angle; 
        end
        function angle = getRight1Angle1(obj)
           angle = obj.Right1Angle1; 
        end
        function setRight1Angle2(obj, angle)
           obj.Right1Angle2 = angle; 
        end
        function angle = getRight1Angle2(obj)
           angle = obj.Right1Angle2; 
        end
        % Right side sensors angles - sensor 2
        function setRight2Angle1(obj, angle)
           obj.Right2Angle1 = angle; 
        end
        function angle = getRight2Angle1(obj)
           angle = obj.Right2Angle1; 
        end
        function setRight2Angle2(obj, angle)
           obj.Right2Angle2 = angle; 
        end
        function angle = getRight2Angle2(obj)
           angle = obj.Right2Angle2; 
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function saveFigures(obj, rfig1, rfig2, lfig1, lfig2, fig3, fig4)
           obj.RightSensor1Fig = rfig1;
           obj.RightSensor2Fig = rfig2;
           obj.LeftSensor1Fig = lfig1;
           obj.LeftSensor2Fig = lfig2;
           obj.fig3 = fig3;
           obj.fig4 = fig4;
        end
        
        function EraseFigures(obj)
            set(obj.RightSensor1Fig, 'Visible', 'off');
            set(obj.RightSensor2Fig, 'Visible', 'off');
            set(obj.LeftSensor1Fig, 'Visible', 'off');
            set(obj.LeftSensor2Fig, 'Visible', 'off');
            set(obj.fig3, 'Visible', 'off');
            set(obj.fig4, 'Visible', 'off');
        end
        % Smooth turns by 90 degree
        function setSmoothTurn1(obj, t)
           obj.SmoothTurn1 = t; 
        end
        function turn = getSmoothTurn1(obj)
           turn = obj.SmoothTurn1; 
        end
        
        function setSmoothTurn2(obj, t)
           obj.SmoothTurn2 = t; 
        end
        function turn = getSmoothTurn2(obj)
           turn = obj.SmoothTurn2; 
        end
        
        function setSmoothTurn3(obj, t)
           obj.SmoothTurn3 = t; 
        end
        function turn = getSmoothTurn3(obj)
           turn = obj.SmoothTurn3; 
        end
        
        function setSmoothTurn4(obj, t)
           obj.SmoothTurn4 = t; 
        end
        function turn = getSmoothTurn4(obj)
           turn = obj.SmoothTurn4; 
        end
        function setSmoothTurn5(obj, t)
           obj.SmoothTurn5 = t; 
        end
        function turn = getSmoothTurn5(obj)
           turn = obj.SmoothTurn5; 
        end
        function setSmoothTurn6(obj, t)
           obj.SmoothTurn6 = t; 
        end
        function turn = getSmoothTurn6(obj)
           turn = obj.SmoothTurn6; 
        end
        function setSmoothTurn7(obj, t)
           obj.SmoothTurn7 = t; 
        end
        function turn = getSmoothTurn7(obj)
           turn = obj.SmoothTurn7; 
        end
        function setSmoothTurn8(obj, t)
           obj.SmoothTurn8 = t; 
        end
        function turn = getSmoothTurn8(obj)
           turn = obj.SmoothTurn8; 
        end
        function setSmoothTurn9(obj, t)
           obj.SmoothTurn9 = t; 
        end
        function turn = getSmoothTurn9(obj)
           turn = obj.SmoothTurn9; 
        end
        function setSmoothTurn10(obj, t)
           obj.SmoothTurn10 = t; 
        end
        function turn = getSmoothTurn10(obj)
           turn = obj.SmoothTurn10; 
        end
        function setSmoothTurn11(obj, t)
           obj.SmoothTurn11 = t; 
        end
        function turn = getSmoothTurn11(obj)
           turn = obj.SmoothTurn11; 
        end
        function setSmoothTurn12(obj, t)
           obj.SmoothTurn12 = t; 
        end
        function turn = getSmoothTurn12(obj)
           turn = obj.SmoothTurn12; 
        end
        % smooth transitions function end
        
        function setToTurnInDirection(obj, sig)
           obj.TurnSignal = sig; 
        end
        function signal = getToTurnInDirection(obj)
           signal = obj.TurnSignal; 
        end
        
        function setRampCounter(obj, count)
           obj.ramp = count; 
        end
        
        function count = getRampCounter(obj)
           count = obj.ramp; 
        end
        
        function setTurnSignal(obj, sig)
           obj.signal = sig; 
        end
        function signal = getTurnSignal(obj)
           signal = obj.signal; 
        end
        function setMap(obj, xy, center_ramp, entrance_ramp, exit_ramp, target)
          obj.XY = xy;
          obj.Center_Ramp = center_ramp;
          obj.Entrance_Ramp = entrance_ramp;
          obj.Exit_Ramp = exit_ramp;
          obj.Target = target;
        end
        function xy = getXY(obj)
           xy = obj.XY; 
        end
        function center = centerRamp(obj)
           center = obj.Center_Ramp;
        end
        function entrance = entranceRamp(obj)
           entrance = obj.Entrance_Ramp; 
        end
        function exit = exitRamp(obj)
           exit = obj.Exit_Ramp; 
        end
        function target = targetRamp(obj)
           target = obj.Target; 
        end
        
        function setCurrentAngle(obj, angle)
            obj.currentAngle = angle;
        end
        
        function angle = getCurrentAngle(obj)
           angle = obj.currentAngle; 
        end
       
        function setCounter(obj, count)
           obj.counter = count; 
        end
        function count = getCounter(obj)
           count = obj.counter; 
        end
        function setTurn(obj, t)
           obj.turn = t; 
        end
        function t = getTurn(obj)
           t = obj.turn; 
        end
        function setDirection(obj, dir)
           obj.angle = dir; 
        end
        function Angle = getDirection(obj)
           Angle = obj.angle; 
        end
        function setPositionValueX(obj, pos)
           obj.PositionValueX = pos; 
        end
        function setPositionValueY(obj, pos)
           obj.PositionValueY = pos; 
        end
        function position = getPositionValueX(obj)
            position = obj.PositionValueX;
        end
        function position = getPositionValueY(obj)
            position = obj.PositionValueY;
        end
        function setTurnCommand(obj, cmd)
           obj.turningCmd = cmd; 
        end
        function command = getTurnCommand(obj)
            command = obj.turningCmd;
        end
        
        function figure1(obj, f1)
           obj.fig1 = f1; 
        end
        function figure2(obj, f2)
           obj.fig2 = f2; 
        end
        function EraseFigure1(obj)
           set(obj.fig1, 'Visible', 'off');
        end
        function EraseFigure2(obj)
           set(obj.fig2, 'Visible', 'off');
        end
        function setFigure(obj, fig)
           obj.myFigure = fig; 
        end
        function fig = getFigure(obj)
            fig = obj.myFigure;
        end
        % Functions available to call from controller function or other files
        function dist = checkRanges(obj,inDist)
            % Check range and reset if outside of (max,min)
            % dist = obj.checkRanges(inDist)
            if(inDist > obj.maxRange)
                dist = obj.maxRange;
            elseif(inDist < obj.minRange)
                dist = obj.minRange;
            else
                dist = inDist;
            end
        end
        
        function dt = getTimerPeriod(obj)
            % dt = obj.getTimerPeriod()
            % fprintf('timer period = %f\n',obj.timerPeriod);
            dt = obj.timerPeriod;
        end
 
        function currentTime = updateCurrentTime(obj,dt)
            % time = obj.updateCurrentTime(dt)
            % fprintf('current time = %d, update = %d\n',obj.currentTime,dt);
            obj.currentTime = obj.currentTime + dt;
            currentTime = obj.currentTime;
        end

        function dist = getCurrentDistance(obj)
            % obj.getCurrentDistance()
            % fprintf('current distance = %f\n',obj.distance);
            dist = obj.distance;
        end

        function setCurrentDistance(obj,dist)
            % obj.setCurrentDistance(dist)
            fprintf('current distance = %f, new value = %f\n',...
                obj.distance, dist);
            obj.distance = dist;
        end
        
        function doADReading(obj)
            % obj.doADReading()
            % pretend that the PIC does an A/D reading and
            % saves if for any queries over WiFLy
            rawdist = obj.distance + obj.spread*(randn-0.5);
            obj.lastADReading = obj.checkRanges(rawdist);
%             fprintf('Sensor: AD reading updated = %f\n',obj.lastADReading);
        end
        
        function dist = getSensorReading(obj)
            % dist = obj.getSensorReading()
            % returns the most recent AD reading
            dist = obj.lastADReading;
        end
    end
end

