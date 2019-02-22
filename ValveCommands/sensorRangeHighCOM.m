function rangeHigh = sensorRangeHighCOM(serialOBJ,opt,val)

valStr = num2str(val);
valFormat = strcat('0',valStr);
queryCOM = 'R33';
echoQuery = strcat(queryCOM,'#'); %% CHECK IF I NEED TO ECHO THE COMMAND!

switch opt
    case 0 % QUERY
        fprintf(serialOBJ,queryCOM);
                                            %IS ECHOQUERY NECESSARY?
        response = fscanf(serialOBJ,'%s');
        
    case 1 % COMMAND
        command = strcat('EH',num2str(valFormat));
        fprintf(serialOBJ,command);
        response = fscanf(serialOBJ,'%s');
end

switch response
    case 'EH00'
        rangeHigh = {0,'0.1', 'Torr'};
    case 'EH01'
        rangeHigh = {1,'0.2', 'Torr'};
    case 'EH02'
        rangeHigh = {2,'0.5', 'Torr'};
    case 'EH03'
        rangeHigh = {3,'1.0', 'Torr'};
    case 'EH04'
        rangeHigh = {4,'2.0', 'Torr'};
    case 'EH05'
        rangeHigh = {5,'5.0', 'Torr'};
    case 'EH06'
        rangeHigh = {6,'10.0', 'Torr'}; 
    case 'EH21'
        rangeHigh = {21,'20.0', 'Torr'};
    case 'EH07'
        rangeHigh = {7,'50.0', 'Torr'};
    case 'EH08'
        rangeHigh = {8,'100.0', 'Torr'};
    case 'EH22'
        rangeHigh = {22,'200.0', 'Torr'};
    case 'EH09'
        rangeHigh = {9,'500.0', 'Torr'};
    case 'EH10'
        rangeHigh = {10,'1000.0', 'Torr'}; % DEFAULT VALUE
    case 'EH11'
        rangeHigh = {11,'5000.0', 'Torr'};
    case 'EH12'
        rangeHigh = {12,'10000.0', 'Torr'};
    case 'EH13'
        rangeHigh = {13,'1.33', 'mBar'};
    case 'EH14'
        rangeHigh = {14,'2.66', 'mBar'};
    case 'EH15'
        rangeHigh = {15,'13.33', 'mBar'};
    case 'EH16'
        rangeHigh = {16,'133.3', 'mBar'};
    case 'EH17'
        rangeHigh = {17,'1333.0', 'mBar'};
    case 'EH18'
        rangeHigh = {18,'6666.0', 'mBar'};
    case 'EH19'
        rangeHigh = {19,'13332.0', 'mBar'};
    case 'EH20'
        rangeHigh = {20,'0.1333', 'mBar'};
    case 'EH23'
        rangeHigh = {23,'0.001', 'mBar'};
    otherwise
        rangeHigh = {-1,'HIGH Limit not recognised!'};
end
end