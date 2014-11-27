
fprintf('\n***** Running MapExample Script ****\n\n');

% Filename
filename = 'Map1.txt';

% Read the Map
[XY, Ramp_Center, Ramp_Entrance, Ramp_Exit, Target] = Read_Map_File(filename);

% Use figure 1
h = figure(1);
clf(h);

% Plot the Map outline
Plot_Map(h, XY);

% Plot the Ramps on the Map
Plot_Ramps(h, Ramp_Center, Ramp_Entrance, Ramp_Exit);

% Show the Target
Plot_Target(h, Target);