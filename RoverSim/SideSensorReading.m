function [RightSensor1, RightSensor2, LeftSensor1, LeftSensor2] = SideSensorReading(angle, pos11, pos2, xy, offset, ...
                                                                                        start, col, col2, counter, angleOne, angleThree)

LeftSensorList = zeros(1,50);
for i=1:length(LeftSensorList)
   LeftSensorList(i) = 500; 
end

RightSensorList = zeros(length(xy));
for i=1:length(RightSensorList)
   RightSensorList(i) = 500; 
end
for i=start:2:length(xy) - counter
   if xy(i,col) > xy(i+1, col)
       if pos11 < xy(i,col) + offset && pos11 > xy(i+1,col) - offset
           if angle == angleOne
               if pos2 > xy(i,col2)
                   LeftSensorList(i) = abs(pos2 - xy(i,col2));
               elseif pos2 < xy(i,col2) 
                   RightSensorList(i) = abs(pos2 - xy(i,col2));
               end
           elseif angle == angleThree
                if pos2 < xy(i,col2)
                   LeftSensorList(i) = abs(pos2 - xy(i,col2));
               elseif pos2 > xy(i,col2) 
                   RightSensorList(i) = abs(pos2 - xy(i,col2));
               end
           end
       end
   else
       if pos11 > xy(i,col) - offset && pos11 < xy(i+1,col) + offset
           if angle == angleOne
               if pos2 > xy(i,col2)
                   LeftSensorList(i) = abs(pos2 - xy(i,col2));
               elseif pos2 < xy(i,col2) 
                   RightSensorList(i) = abs(pos2 - xy(i,col2));
               end
           elseif angle == angleThree
                if pos2 < xy(i,col2)
                   LeftSensorList(i) = abs(pos2 - xy(i,col2));
               elseif pos2 > xy(i,col2) 
                   RightSensorList(i) = abs(pos2 - xy(i,col2));
               end
           end
       end
   end
end

LeftSensorList = sort(LeftSensorList, 'ascend');
RightSensorList = sort(RightSensorList, 'ascend');
LeftSensor1 = LeftSensorList(1);
% fprintf('Left sensor size: %d \n', length(LeftSensorList));
RightSensor1 = RightSensorList(1);
LeftSensor2 = LeftSensor1;
RightSensor2 = RightSensor1;
end