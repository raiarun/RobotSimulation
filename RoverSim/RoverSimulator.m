function RoverSimulator(timerSim, event, obj)
rad2deg = pi/180;
obj.updateCurrentTime(timerSim.Period);
obj.doADReading();
digits(2);
Radius = 1;
persistent rampCounter;
if isempty(rampCounter)
   rampCounter = 1;
end
center = obj.centerRamp();
% entrance = obj.entranceRamp();
% exit = obj.exitRamp();
target = obj.targetRamp();
% center(2,2)
% fprintf('center value X: %d ', LocalX + 1);
% fprintf('center value Y: %d ', (obj.getPositionValueX()));
POS1 = obj.getPositionValueX();
POS2 = obj.getPositionValueY();
a = -0.1;
b = 0.1;
r = (b-a).*rand(1,1) + a;
pos1 = POS1 + r;
pos2 = POS2 + r;
min = 0.01;
max = 5.01;
random1 = (max-min).*rand(1,1) + min;
FrontRandom = (max + 5 - min).*rand(1,1) + min;
max = 3.98;
random2 = (max-min).*rand(1,1) + min;
max = 4.06;
random3 = (max-min).*rand(1,1) + min;
max = 4.1;
random4 = (max-min).*rand(1,1) + min;
theta1 = 45;
theta2 = 15;
command = obj.getTurnCommand();
% calcualte the hypoteneous, h -> sqrt(p*p + b*b)
% x = 0.5, y = 0.5
h1 = sqrt((0.5)*(0.5) + (0.5)*(0.5));
% x = 0.5, y = 2
h2 = sqrt((0.0)*(0.0) + (2)*(2));

% Executing commands
if command == 3
    fprintf('New Command: RIGHT TURN *********************************************************************** %d \n',command)
    if obj.getToTurnInDirection() == 1
       if obj.getDirection() == 1
           if obj.getSmoothTurn9() == 1
              obj.setTurn(50); 
           end
           obj.setDirection(2);
           obj.setSmoothTurn9(0);
       elseif obj.getDirection() == 2
           if obj.getSmoothTurn9() == 1
              obj.setTurn(50); 
           end
           obj.setDirection(3);
           obj.setSmoothTurn9(0);
       elseif obj.getDirection() == 3
           if obj.getSmoothTurn9() == 1
              obj.setTurn(50); 
           end
           obj.setDirection(4);
           obj.setSmoothTurn9(0);
       elseif obj.getDirection() == 4
           if obj.getSmoothTurn9() == 1
              obj.setTurn(50); 
           end
           obj.setDirection(1);
           obj.setSmoothTurn9(0);
       end
       fprintf('counter value is %d ', obj.getCounter());
       obj.setToTurnInDirection(0);
       obj.setMovement(1);
    end
    
elseif command == 2
    fprintf('New Command: LEFT TURN *********************************************************************** %d ',command)
       if obj.getToTurnInDirection() == 1
          
           if obj.getDirection() == 1
               if obj.getSmoothTurn9() == 1
                  obj.setTurn(51); 
               end
               obj.setDirection(4);
               obj.setSmoothTurn9(0);
           elseif obj.getDirection() == 2
               if obj.getSmoothTurn9() == 1
                  obj.setTurn(51); 
               end
               obj.setDirection(1);
               obj.setSmoothTurn9(0);
           elseif obj.getDirection() == 3
               if obj.getSmoothTurn9() == 1
                  obj.setTurn(51); 
               end
               obj.setDirection(2);
               obj.setSmoothTurn9(0);
           elseif obj.getDirection() == 4
               if obj.getSmoothTurn9() == 1
                  obj.setTurn(51); 
               end
               obj.setDirection(3);
               obj.setSmoothTurn9(0);
           end
           fprintf('counter value is %d ', obj.getCounter());
           obj.setToTurnInDirection(0);
           obj.setMovement(1);
        end
end

% stop
if command == 0
    figure(obj.getFigure());
    hold on;
%     DESTINATION REACHED
    fprintf('TARGET REACHED !!!!!!!!!!!!!!!!!!!! %d ' , 0);
    str = sprintf('Finish Line!');
    text(target(1,1) - 4, target(2,1) + 4,str);
    hold off;
    obj.setTurn(60);
    obj.setToTurnInDirection(1);
    obj.setSmoothTurn9(1);
end

if command == 5
   % Move back 
   obj.setMovement(1);
   obj.setToTurnInDirection(1);
   obj.setSmoothTurn9(1);
end

if command == 10
    obj.setToTurnInDirection(1);
    obj.setSmoothTurn9(1);
end
% Turn commands
% 50 -> Right turn
% 51 -> Left turn
if obj.getTurn() == 50
    % Right turn
    obj.EraseFigure1();
    obj.EraseFigure2();
    obj.EraseFigures();
%     pos1 = obj.getPositionValueX();
%     pos2 = obj.getPositionValueY();

    counter = obj.getCounter();
    % Front Sensor
    fig1 = viscircles([pos1, pos2], Radius);
    fig2 = line([pos1, pos1 + (2 + FrontRandom)*cos(counter*rad2deg)], [pos2, pos2 + (2 + FrontRandom)*sin(counter*rad2deg)], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1, pos2], Radius);
    fig4 = line([pos1, pos1 + (2 + random1)*cos((counter-180)*rad2deg)], [pos2, pos2 + (2 + random1)*sin((counter-180)*rad2deg)], 'Color', 'g', 'LineWidth', 2);
    
    t1 = obj.getLeft1Angle1();
    t2 = obj.getLeft1Angle2();
    t3 = obj.getLeft2Angle1();
    t4 = obj.getLeft2Angle2();
    t5 = obj.getRight1Angle1();
    t6 = obj.getRight1Angle2();
    t7 = obj.getRight2Angle1();
    t8 = obj.getRight2Angle2();
    
    if t1 <= -270
       t1 = 90; 
    end
    if t2 <= -270
       t2 = 90; 
    end
    if t3 <= -270
       t3 = 90; 
    end
    if t4 <= -270
       t4 = 90; 
    end
    if t5 <= -270
       t5 = 90; 
    end
    if t6 <= -270
       t6 = 90; 
    end
    if t7 <= -270
       t7 = 90; 
    end
    if t8 <= -270
       t8 = 90; 
    end
    
    LeftSensor1 = line([pos1 , pos1 + (h2 + random1)*cosd(t2)], [pos2 , pos2 + (h2 + random1/8)*sind(t2)], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 + h1*cosd(t3), pos1 + (h2 + random1)*cosd(t4)], [pos2 + h1*sind(t3), pos2 + (h2 + random1/4)*sind(t4)], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 + h1*cosd(t5), pos1 + (h2 + random1)*cosd(t6)], [pos2 + h1*sind(t5), pos2 + (h2 + random1/4)*sind(t6)], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 + h1*cosd(t7), pos1 + (h2 + random1)*cosd(t8)], [pos2 + h1*sind(t7), pos2 + (h2 + random1/4)*sind(t8)], 'Color', 'g', 'LineWidth', 2);
    DecrementAngle = 15;
    obj.setCounter(counter - DecrementAngle);
    obj.setLeft1Angle1(t1 - DecrementAngle);
    obj.setLeft1Angle2(t2 - DecrementAngle);
    obj.setLeft2Angle1(t3 - DecrementAngle);
    obj.setLeft2Angle2(t4 - DecrementAngle);
    
    obj.setRight1Angle1(t5 - DecrementAngle);
    obj.setRight1Angle2(t6 - DecrementAngle);
    obj.setRight2Angle1(t7 - DecrementAngle);
    obj.setRight2Angle2(t8 - DecrementAngle);
    if (obj.getCurrentAngle - counter) == 90
        fprintf('angle counter ::::: % d', counter);
        if counter <= -270
            counter = 90;
        end
        obj.setCounter(counter);
        obj.setCurrentAngle(counter);
        obj.setTurnSignal(0);
        turn = 55;
        obj.setTurn(turn);
    end
    obj.figure1(fig1);
    obj.figure2(fig2);
    obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
%     rightTurn = 501;
%     obj.setEndByte(rightTurn);
elseif obj.getTurn() == 51
    % Left Turn
    obj.EraseFigure1();
    obj.EraseFigure2(); 
    obj.EraseFigures();
%     pos1 = obj.getPositionValueX();
%     pos2 = obj.getPositionValueY();

    counter = obj.getCounter();
    % Front Sensor
    fig1 = viscircles([pos1, pos2], Radius);
    fig2 = line([pos1, pos1 + (2 + FrontRandom)*cos(counter*rad2deg)], [pos2, pos2 + (2 + FrontRandom)*sin(counter*rad2deg)], 'Color', 'm', 'LineWidth', 2);
    % Back Sensor
    fig3 = viscircles([pos1, pos2], Radius);
    fig4 = line([pos1, pos1 + (2 + random1)*cos((counter+180)*rad2deg)], [pos2, pos2 + (2 + random1)*sin((counter+180)*rad2deg)], 'Color', 'g', 'LineWidth', 2);
    
    t1 = obj.getLeft1Angle1();
    t2 = obj.getLeft1Angle2();
    t3 = obj.getLeft2Angle1();
    t4 = obj.getLeft2Angle2();
    
    t5 = obj.getRight1Angle1();
    t6 = obj.getRight1Angle2();
    t7 = obj.getRight2Angle1();
    t8 = obj.getRight2Angle2();
    
    LeftSensor1 = line([pos1 , pos1 + (h2 + random1)*cosd(t2)], [pos2 , pos2 + (h2 + random1/8)*sind(t2)], 'Color', 'g', 'LineWidth', 2);
%     LeftSensor2 = line([pos1 + h1*cosd(t3), pos1 + (h2 + random1)*cosd(t4)], [pos2 + h1*sind(t3), pos2 + (h2 + random1/4)*sind(t4)], 'Color', 'g', 'LineWidth', 2);
    RightSensor1 = line([pos1 + h1*cosd(t5), pos1 + (h2 + random1)*cosd(t6)], [pos2 + h1*sind(t5), pos2 + (h2 + random1/4)*sind(t6)], 'Color', 'g', 'LineWidth', 2);
    RightSensor2 = line([pos1 + h1*cosd(t7), pos1 + (h2 + random1)*cosd(t8)], [pos2 + h1*sind(t7), pos2 + (h2 + random1/4)*sind(t8)], 'Color', 'g', 'LineWidth', 2);
    IncrementAngle = 15;
    obj.setCounter(counter + IncrementAngle);
    obj.setLeft1Angle1(t1 + IncrementAngle);
    obj.setLeft1Angle2(t2 + IncrementAngle);
    obj.setLeft2Angle1(t3 + IncrementAngle);
    obj.setLeft2Angle2(t4 + IncrementAngle);
    
    obj.setRight1Angle1(t5 + IncrementAngle);
    obj.setRight1Angle2(t6 + IncrementAngle);
    obj.setRight2Angle1(t7 + IncrementAngle);
    obj.setRight2Angle2(t8 + IncrementAngle);
    if (obj.getCurrentAngle - counter) == -90
        fprintf('angle counter ::::: % d', counter);
        if counter >= 270
            counter = -90;
        end
        obj.setCounter(counter);
        obj.setCurrentAngle(counter);
        obj.setTurnSignal(0);
        turn = 55;
        obj.setTurn(turn);
    end
    obj.figure1(fig1);
    obj.figure2(fig2);
    obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
%     leftTurn = 502;
%     obj.setEndByte(leftTurn);
elseif obj.getTurn() == 60
    fprintf('STOP ROVER: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ %d \n', 00);
    % do nothing
elseif obj.getTurn() == 55
    counter = 1;
    while(counter < 100000)
       counter = counter + 1; 
    end
    turn = 52;
    obj.setTurn(turn);
    % do nothing
    % stay in the state
    % Most likely the DESTINATION is reache at this moment.
else
    if obj.getMovement() == 1
        fprintf('GO FORWARD: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ %d \n', 1);
        angle = obj.getDirection();
        % angle 1 -> UP
        % angle 2 -> RIGHT
        % angle 3 -> Down
        % angle 4 -> LEFT
        if angle == 1
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1], [pos2, pos2 + FrontRandom + 2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1], [pos2, pos2 - random1 - 2], 'Color', 'g', 'LineWidth', 2);

            RightSensor1 = line([pos1 + 0.5, pos1 + random1 + 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 + 0.5,pos1 + random2 + 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            LeftSensor1 = line([pos1 - 0.5, pos1 - random3 - 2], [pos2 + 0.0, pos2 + 0.0], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 - 0.5, pos1 - random4 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(-180 - theta1);
            obj.setLeft1Angle2(-180 - theta2);
            obj.setLeft2Angle1(-180 + theta1);
            obj.setLeft2Angle2(-180 + theta2);
            obj.setRight1Angle1(theta1);
            obj.setRight1Angle2(theta2);
            obj.setRight2Angle1( -theta1);
            obj.setRight2Angle2( -theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueY(POS2 + 0.2);

        elseif angle == 2
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1 + FrontRandom + 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1 - random1 - 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);

            LeftSensor1 = line([pos1 + 0.0, pos1 + 0.0], [pos2 + 0.5, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + random2 + 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor1 = line([pos1 + 0.5,pos1 + 0.5], [pos2 - 0.5, pos2 - random3 - 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - random4 - 2], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(90 - theta1);
            obj.setLeft1Angle2(90 - theta2);
            obj.setLeft2Angle1(-180 - (90 - theta1));
            obj.setLeft2Angle2(-180 - (90 - theta2));
            obj.setRight1Angle1( -(90 - theta1));
            obj.setRight1Angle2( -(90 - theta2));
            obj.setRight2Angle1(-180 + (90 - theta1));
            obj.setRight2Angle2(-180 + (90 - theta2));
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueX(POS1 + 0.2);

        elseif angle == 3
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1], [pos2, pos2 - FrontRandom - 2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1], [pos2, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);

            LeftSensor1 = line([pos1 + 0.5,pos1 + random1 + 2], [pos2 + 0.0, pos2 + 0.0], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 + 0.5,pos1 + random2 + 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor1 = line([pos1 - 0.5, pos1 - random3 - 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5, pos1 - random4 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1( -theta1);
            obj.setLeft1Angle2( -theta2);
            obj.setLeft2Angle1(theta1);
            obj.setLeft2Angle2(theta2);
            obj.setRight1Angle1(-180 + theta1);
            obj.setRight1Angle2(-180 + theta2);
            obj.setRight2Angle1(-180 - theta1);
            obj.setRight2Angle2(-180 - theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueY(POS2 - 0.2);

        elseif angle == 4
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1 - random1 - 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1 + FrontRandom + 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);

            RightSensor1 = line([pos1 + 0.5, pos1 + 0.5], [pos2 + 0.5, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + random2 + 2], 'Color', 'g', 'LineWidth', 2);
            LeftSensor1 = line([pos1 + 0.0,pos1 + 0.0], [pos2 - 0.5, pos2 - random3 - 2], 'Color', 'g', 'LineWidth', 2);
    %         LefttSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - random4 - 2], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(-180 + (90 - theta1));
            obj.setLeft1Angle2(-180 + (90 - theta2));
            obj.setLeft2Angle1( -(90 - theta1));
            obj.setLeft2Angle2( -(90 - theta2));
            obj.setRight1Angle1(-180 - (90 - theta1));
            obj.setRight1Angle2(-180 - (90 - theta2));
            obj.setRight2Angle1(90 - theta1);
            obj.setRight2Angle2(90 - theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueX(POS1 - 0.2); 
        end
    else
        angle = obj.getDirection();
        fprintf('GO BACKWARD: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ %d \n', 0);
        % angle 1 -> UP
        % angle 2 -> RIGHT
        % angle 3 -> Down
        % angle 4 -> LEFT
        if angle == 1
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1], [pos2, pos2 + FrontRandom + 2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1], [pos2, pos2 - random1 - 2], 'Color', 'g', 'LineWidth', 2);

            RightSensor1 = line([pos1 + 0.5, pos1 + random1 + 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 + 0.5,pos1 + random2 + 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            LeftSensor1 = line([pos1 - 0.5, pos1 - random3 - 2], [pos2 + 0.0, pos2 + 0.0], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 - 0.5, pos1 - random4 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(-180 - theta1);
            obj.setLeft1Angle2(-180 - theta2);
            obj.setLeft2Angle1(-180 + theta1);
            obj.setLeft2Angle2(-180 + theta2);
            obj.setRight1Angle1(theta1);
            obj.setRight1Angle2(theta2);
            obj.setRight2Angle1( -theta1);
            obj.setRight2Angle2( -theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueY(POS2 - 0.2);

        elseif angle == 2
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1 + FrontRandom + 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1 - random1 - 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);

            LeftSensor1 = line([pos1 + 0.0, pos1 + 0.0], [pos2 + 0.5, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + random2 + 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor1 = line([pos1 + 0.5,pos1 + 0.5], [pos2 - 0.5, pos2 - random3 - 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - random4 - 2], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(90 - theta1);
            obj.setLeft1Angle2(90 - theta2);
            obj.setLeft2Angle1(-180 - (90 - theta1));
            obj.setLeft2Angle2(-180 - (90 - theta2));
            obj.setRight1Angle1( -(90 - theta1));
            obj.setRight1Angle2( -(90 - theta2));
            obj.setRight2Angle1(-180 + (90 - theta1));
            obj.setRight2Angle2(-180 + (90 - theta2));
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueX(POS1 - 0.2);

        elseif angle == 3
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1], [pos2, pos2 - FrontRandom - 2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1, pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1], [pos2, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);

            LeftSensor1 = line([pos1 + 0.5,pos1 + random1 + 2], [pos2 + 0.0, pos2 + 0.0], 'Color', 'g', 'LineWidth', 2);
    %         LeftSensor2 = line([pos1 + 0.5,pos1 + random2 + 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor1 = line([pos1 - 0.5, pos1 - random3 - 2], [pos2 + 0.5, pos2 + 0.5], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5, pos1 - random4 - 2], [pos2 - 0.5, pos2 - 0.5], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1( -theta1);
            obj.setLeft1Angle2( -theta2);
            obj.setLeft2Angle1(theta1);
            obj.setLeft2Angle2(theta2);
            obj.setRight1Angle1(-180 + theta1);
            obj.setRight1Angle2(-180 + theta2);
            obj.setRight2Angle1(-180 - theta1);
            obj.setRight2Angle2(-180 - theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueY(POS2 + 0.2);

        elseif angle == 4
            obj.EraseFigure1();
            obj.EraseFigure2();
            obj.EraseFigures();
            % Front Sensor
            fig1 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig2 = line([pos1 ,pos1 - random1 - 2], [pos2, pos2], 'Color', 'm', 'LineWidth', 2);
            % Back Sensor
            fig3 = viscircles([pos1,pos2], Radius, 'EdgeColor', 'r');
            fig4 = line([pos1 ,pos1 + FrontRandom + 2], [pos2, pos2], 'Color', 'g', 'LineWidth', 2);

            RightSensor1 = line([pos1 + 0.5, pos1 + 0.5], [pos2 + 0.5, pos2 + random1 + 2], 'Color', 'g', 'LineWidth', 2);
            RightSensor2 = line([pos1 - 0.5, pos1 - 0.5], [pos2 + 0.5, pos2 + random2 + 2], 'Color', 'g', 'LineWidth', 2);
            LeftSensor1 = line([pos1 + 0.0,pos1 + 0.0], [pos2 - 0.5, pos2 - random3 - 2], 'Color', 'g', 'LineWidth', 2);
    %         LefttSensor2 = line([pos1 - 0.5,pos1 - 0.5], [pos2 - 0.5, pos2 - random4 - 2], 'Color', 'g', 'LineWidth', 2);
            % set angle
            obj.setLeft1Angle1(-180 + (90 - theta1));
            obj.setLeft1Angle2(-180 + (90 - theta2));
            obj.setLeft2Angle1( -(90 - theta1));
            obj.setLeft2Angle2( -(90 - theta2));
            obj.setRight1Angle1(-180 - (90 - theta1));
            obj.setRight1Angle2(-180 - (90 - theta2));
            obj.setRight2Angle1(90 - theta1);
            obj.setRight2Angle2(90 - theta2);
            obj.figure1(fig1);
            obj.figure2(fig2);
            obj.saveFigures(RightSensor1, RightSensor2, LeftSensor1, LeftSensor1, fig3, fig4);
            obj.setPositionValueX(POS1 + 0.2); 
        end
    end
end


% if command == 2
%     if obj.getToTurnInDirection() == 0
%         if obj.getDirection() == 1
%             obj.setPositionValueY(obj.getPositionValueY() + 0)
%         elseif obj.getDirection() == 2
%             obj.setPositionValueX(obj.getPositionValueX() + 0)
%         elseif obj.getDirection() == 3
%             obj.setPositionValueY(obj.getPositionValueY() - 0)
%         elseif obj.getDirection() == 4
%             obj.setPositionValueX(obj.getPositionValueX() - 0)
%         end
%     end
%     obj.setToTurnInDirection(1);
%     if rampCounter <= length(center)
%         LocalX = center(obj.getRampCounter(), 1);
%         LocalY = center(obj.getRampCounter(), 2);
%         if (LocalX) == vpa(obj.getPositionValueX())
%             
%             if (LocalY) == vpa(obj.getPositionValueY())
%                    if rampCounter < length(center)
%                        rampCounter = rampCounter + 1;
%                        obj.setRampCounter(rampCounter);
%                    else
%                        rampCounter = rampCounter +  5;
%                    end
%             end 
%             if LocalY > vpa(obj.getPositionValueY())
%                 if obj.getSmoothTurn1() == 1
%                     if obj.getDirection() == 2
%                         obj.setTurn(51);
%                     elseif obj.getDirection() == 4
%                         obj.setTurn(50);
%                     end
%                 end
%                 obj.setDirection(1);
%                 obj.setSmoothTurn1(0)
%             else
%                 obj.setSmoothTurn1(1)
%             end
%             if LocalY < vpa(obj.getPositionValueY())
%                 if obj.getSmoothTurn2() == 1
%                     if obj.getDirection() == 2
%                         obj.setTurn(50);
%                     elseif obj.getDirection() == 4
%                         obj.setTurn(51);
%                     end
%                 end
%                 obj.setDirection(3);
%                 obj.setSmoothTurn2(0)
%             else
%                 obj.setSmoothTurn2(1)
%             end
%         end
%         if LocalX > vpa(obj.getPositionValueX())
%             if obj.getSmoothTurn3() == 1
%                 if obj.getDirection() == 1
%                     obj.setTurn(50);
%                 elseif obj.getDirection() == 3
%                     obj.setTurn(51);
%                 end
%             end
%             obj.setDirection(2);
%             obj.setSmoothTurn3(0)
%         else
%             obj.setSmoothTurn3(1)
%         end
%         if LocalX < vpa(obj.getPositionValueX())
%             if obj.getSmoothTurn4() == 1
%                 if obj.getDirection() == 1
%                     obj.setTurn(51);
%                 elseif obj.getDirection() == 3
%                     obj.setTurn(50);
%                 end
%             end    
%             obj.setDirection(4);
%             obj.setSmoothTurn4(0)
%         else
%             obj.setSmoothTurn4(1);
%         end
%     else
%         LocalX = target(1, 1);
%         LocalY = target(2, 1);
%         if LocalX == vpa(obj.getPositionValueX())
%             if LocalY == vpa(obj.getPositionValueY())
%                    if rampCounter < length(center)
%                        rampCounter = rampCounter + 1;
%                        obj.setRampCounter(rampCounter);
%                    else
%                        rampCounter = rampCounter +  5;
%                    end
%                    figure(obj.getFigure());
%                    hold on;
%                    % DESTINATION REACHED
%                    fprintf('TARGET REACHED !!!!!!!!!!!!!!!!!!!! %d ' , 0);
%                    str = sprintf('DESTINATION REACHED!');
%                    text(target(1,1) - 4, target(2,1) + 4,str);
%                    obj.setTurnCommand(3);
%                    hold off;
%                    obj.getTurn(53);
%             end
%             if LocalY > vpa(obj.getPositionValueY())
%                 if obj.getSmoothTurn5() == 1
%                     if obj.getDirection() == 2
%                         obj.setTurn(51);
%                     elseif obj.getDirection() == 4
%                         obj.setTurn(50);
%                     end
%                 end 
%                 obj.setDirection(1);
%                 obj.setSmoothTurn5(0);
%             else
%                 obj.setSmoothTurn5(1);
%             end
%             if LocalY < vpa(obj.getPositionValueY())
%                 if obj.getSmoothTurn6() == 1
%                     if obj.getDirection() == 2
%                         obj.setTurn(50);
%                     elseif obj.getDirection() == 4
%                         obj.setTurn(51);
%                     end
%                 end
%                 obj.setDirection(3); 
%                 obj.setSmoothTurn6(0);
%             else
%                 obj.setSmoothTurn6(1);
%             end
%         end
%         if LocalX > vpa(obj.getPositionValueX())
%             if obj.getSmoothTurn7() == 1
%                 if obj.getDirection() == 1
%                     obj.setTurn(50);
%                 elseif obj.getDirection() == 3
%                     obj.setTurn(51);
%                 end
%             end
%             obj.setDirection(2);
%             obj.setSmoothTurn7(0);
%         else
%             obj.setSmoothTurn7(1);
%         end
%         if LocalX < vpa(obj.getPositionValueX()) 
%             if obj.getSmoothTurn8() == 1
%                 if obj.getDirection() == 1
%                     obj.setTurn(51);
%                 elseif obj.getDirection() == 3
%                     obj.setTurn(50);
%                 end
%             end
%             obj.setDirection(4);
%             obj.setSmoothTurn8(0);
%         else
%             obj.setSmoothTurn8(1);
%         end
%     end
%     obj.setSmoothTurn9(1);
%     obj.setSmoothTurn10(1);
%     obj.setSmoothTurn11(1);
%     obj.setSmoothTurn12(1);
% end
