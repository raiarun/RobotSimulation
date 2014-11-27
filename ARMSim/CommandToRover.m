function CommandToRover( obj, event, object)
ioWiFly = object.getIoWiFly();
% command = 2;
% if object.getTurn() == 1
%     command = uint8(1);
%     fprintf('Sending TURN commmand: %d \n', 1);
% elseif object.getTurn() == 2
%     fprintf('Sending NO TURN commmand: %d \n', 2);
%     command = uint8(2);
% end
plotSensorData(object, object.getFigure());
sendCommand = 10;
if object.getRoverCommand() ~= object.getCurrentCommand()
    fprintf('New Command: *********************************************************************** %d ', object.getRoverCommand());
    object.setCurrentCommand(object.getRoverCommand());
    sendCommand = object.getRoverCommand();
end
fwrite(ioWiFly, sendCommand);
end

