function units = pressureUnitsCOM(serialOBJ,opt,value)

% This function returns the measurement units configured in the system:
% opt = '0' --> query
%     = '1' --> write value
%     value range interpreted by the instrument is:
%     00 = Torr (default)
%     01 = mTOrr
%     02 = mBar
%     03 = uBar
%     04 = kPa
%     05 = Pa
%     06 = cmH2O
%     07 = inH2O
%     -1 = " Units not recognized"

queryCOM = 'R34';

valStr = num2str(value);
valFormat = strcat('0',valStr);

switch opt
    
    case 0 % QUERY
        fprintf(serialOBJ,queryCOM); 
        response = fscanf(serialOBJ,'%s');    
    case 1 % COMMAND
        
        command = strcat('F',num2str(valFormat));
        fprintf(serialOBJ,command);
        fprintf(serialOBJ,queryCOM);
        response = fscanf(serialOBJ,'%s');
end

switch response
    case 'F00'
        units = {0,'Torr'};
    case 'F01'
        units = {1,'mTorr'};
    case 'F02'
        units = {2,'mBar'};
    case 'F03'
        units = {3,'uBar'};
    case 'F04'
        units = {4,'kPa'};
    case 'F05'
        units = {5,'Pa'};
    case 'F06'
        units = {6,'cmH2O'};
    case 'F07'
        units = {7,'inH2O'};
    otherwise
        units = {-1,'Units not recognized!'};
end
end