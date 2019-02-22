
%% ***************** ATOMIC-MECHANICS ****************************
%                       
%   Serial communication and control with an pressure system composed by a
%   MKS-T3B valve and a baratron sensor
%   Author: Daniel Alfonso Melendrez Armada
%   Date: October 2018
%   Version: 0.1
%   Copyright: Please contact the author for licensing information
%   Email: daniel.melendrez-armada@atomic-mechanics.com


%% This script comprises the sequential attempt to perform the tasks:
% 1. engage communication
% 2. Deploy the configuration parameters of the system
% 3. Acquire data on demand
% 4. Evaluate the performance of the serial communication with the instrument
% 5. Estimate the necessary time to acquire certain ammount of data points
% 6. Close the communication on demand

clc
close all
clear

% 1. Query serial ports

% [devices, comPort] = querySerialPortsV1();
cleanDevices = querySerialPortsV2();

comSelected = listdlg('Name','Select serialDevice ',...
        'PromptString', 'Select the serialdevice connected to the pressure system:',...
        'SelectionMode','single',...
        'InitialValue',1,...
        'ListString',cleanDevices,...
        'ListSize', [250 50]);
    if isempty(comSelected)
        comSelected = 1;
    end
% 2. Open serial port
comPort = cleanDevices{comSelected};
presCOM = startSerial (comPort);
serialOBJ = presCOM;

% 3. Handshake with device
valveType = valveTypeCOM(presCOM)

% 4. Read current parameters
valExist = exist("value",'var');
if isequal(valExist,0)
    value = 0;
end

systemStatus = systemStatusQUERY(serialOBJ)
setpointVal = setpointValuesCOM(serialOBJ,0,'ALL',0)
[pressure,absPressure,units] = pressureQUERY(serialOBJ)

% 5. Setup initial config for the valve
[valveParams, error] = activateSetpointCOM(serialOBJ,1, 1)
setpointVal = setpointValuesCOM(serialOBJ,1,'DEFAULT',value)

% 6. Read values
buildString = buildStringQUERY(serialOBJ)

% TODO
%plotPressure = figure;
%plotPressure.Name = 'Live Pressure Reading'
%while ishandle (plotPressure)

%plotPressure(serialOBJ);



%end
