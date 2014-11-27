% stop the SensorSim timer
stop(sensorSimTimer);
% close the SensorSim WiFly
fclose(ioSensorSimWiFly);

% set(fig1, 'Visible', 'off');
% set(fig2, 'Visible', 'off');
clf(h);
% clear all state
clear all;