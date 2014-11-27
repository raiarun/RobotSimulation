function [XY,Ramp_Center,Ramp_Entrance,Ramp_Exit,Target] = Read_Map_File(filename);
%
% [XY,Ramp_Center,Ramp_Enterance,Ramp_Exit,Target] = Read_Map_File(filename);
% Routine opens and reads a Map text file named "filename" based on 
% the Fall 2014 specified format
% 
% Returns:
%    XY = size N x 2, where N is the number of Map points
%    Ramp_Center = size N_Ramps x 2, Ramp locations in Map
%    Ramp_Entrance = size N_Ramps x 2, unit entrance vector
%    Ramp_Exit = size N_Ramps x 2, unit exit vector
% Open map text file
fprintf('In Read_Map_File: Reading in Map text file %s\n\n',filename);
fid = fopen(filename);

% Read in the number of points
N = fscanf(fid,'%d',1);
% fprintf('Reading in %d points\n\n',N);

% Allocate space for the Map corners
XY = zeros(N,2);

% Read in the coordinates into my array
for i=1:N
    XY(i,:) = fscanf(fid,'%d %d',2);
%     fprintf('Read in coordinate %d as (%d,%d)\n',i,XY(i,1),XY(i,2));
end
fprintf('\n');

% Read in the number of Ramps
N_Ramps = fscanf(fid,'%d',1);
% fprintf('Reading in %d Ramp locations\n\n',N_Ramps);

% Allocate space for Ramp data
Ramp_Center = zeros(N_Ramps,2);
Ramp_Entrance = zeros(N_Ramps,2);
Ramp_Exit = zeros(N_Ramps,2);

% For each Ramp read in the center and the entrance and exit vector
for i=1:N_Ramps
    Ramp_Center(i,:) = fscanf(fid,'%d %d',2);
%     fprintf('Ramp %d located at (%d,%d)\n',i,Ramp_Center(i,1),Ramp_Center(i,2));
    Ramp_Entrance(i,:) = fscanf(fid,'%d %d',2);
%     fprintf('Ramp %d entrance vector is (%d,%d)\n',i,Ramp_Entrance(i,1),Ramp_Entrance(i,2));
    Ramp_Exit(i,:) = fscanf(fid,'%d %d',2);
%     fprintf('Ramp %d exit vector is (%d,%d)\n',i,Ramp_Exit(i,1),Ramp_Exit(i,2));
end
fprintf('\n');

% Read in the Target location
Target = fscanf(fid,'%d %d',2);
% fprintf('Target location is (%d,%d)\n\n',Target(1),Target(2));
    
fclose(fid);
end
