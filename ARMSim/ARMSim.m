
% ioARMSimWiFly = serial('COM4','BaudRate',57600);
filename = 'originalMap.txt';
% filename = 'Map1.txt';
[XY,Ramp_Center,Ramp_Entrance,Ramp_Exit,Target] = Read_Map_File(filename);
% h2 = figure(3);
% plotLegend(h2);
h = figure(2);

obj = SetGetCommand(serial('COM6','BaudRate',57600));
obj.saveFigure(h, h);
obj.storMap(XY,Ramp_Center,Ramp_Entrance,Ramp_Exit,Target);
state = 0;
obj.setDestinationState(state);
count = 0;
obj.setMessageCounter(count);
signal = 0;
obj.setTurnSignal(signal);
command = 10;
obj.setRoverCommand(command);
obj.setCurrentCommand(command);
myWifly = obj.getIoWiFly();
myWifly.BytesAvailableFcnCount = 1;
myWifly.BytesAvailableFcnMode = 'byte';
myWifly.BytesAvailableFcn = {@SensorDataReceiver, obj};
% myWifly.terminator = ' ';
fopen(myWifly);

ARMSimTimer = timer;
ARMSimTimer.Period         = 0.2;
ARMSimTimer.ExecutionMode  = 'fixedRate';
ARMSimTimer.TimerFcn       = {@CommandToRover,obj};
ARMSimTimer.BusyMode       = 'drop';
start(ARMSimTimer);

