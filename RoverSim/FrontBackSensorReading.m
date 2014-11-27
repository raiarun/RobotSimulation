function [FrontValue, BackValue] = FrontBackSensorReading(angle, pos1, pos2, xy, offset, start, col1, col2, counter, angleOne, angleThree)
FrontSensorList = zeros(1,50);
BackSensorList = zeros(1,50);
for i=1:length(FrontSensorList)
   FrontSensorList(i) = 500; 
   BackSensorList(i) = 500;
end
for i=start:2:length(xy) - counter    
   if xy(i,col1) > xy(i+1, col1)
       if pos1 < xy(i,col1) + offset && pos1 > xy(i+1,col1) - offset
           if angle == angleThree
               if pos2 > xy(i,col2)
                   FrontSensorList(i) = abs(pos2 - xy(i,col2));
               else
                   BackSensorList(i) = abs(pos2 - xy(i,col2));
               end
           elseif angle == angleOne
               if pos2 < xy(i,col2)
                   FrontSensorList(i) = abs(pos2 - xy(i,col2));
               else
                   BackSensorList(i) = abs(pos2 - xy(i,col2));
               end
           end
       end
   else
       if pos1 > xy(i,col1) - offset && pos1 < xy(i+1,col1) + offset
          if angle == angleThree
               if pos2 > xy(i,col2)
                   FrontSensorList(i) = abs(pos2 - xy(i,col2));
               else
                   BackSensorList(i) = abs(pos2 - xy(i,col2));
               end
           elseif angle == angleOne
               if pos2 < xy(i,col2)
                   FrontSensorList(i) = abs(pos2 - xy(i,col2));
               else
                   BackSensorList(i) = abs(pos2 - xy(i,col2));
               end
          end
       end
   end
end
SortedFrontSensorList = sort(FrontSensorList, 'ascend');
FrontValue = SortedFrontSensorList(1);
SortedBackSensorList = sort(BackSensorList, 'ascend');
BackValue = SortedBackSensorList(1);
end
