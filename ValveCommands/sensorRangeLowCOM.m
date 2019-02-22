function rangeLow = sensorRangeLowCOM(serialOBJ,opt,val)

valStr = num2str(val);
valFormat = strcat('0',valStr);
queryCOM = 'R55';
echoQuery = strcat(queryCOM,'#'); %% CHECK IF I NEED TO ECHO THE COMMAND!

switch opt
    case 0 % QUERY
        fprintf(serialOBJ,queryCOM);
        
        response = fscanf(serialOBJ,'%s');
        
    case 1 % COMMAND
        command = strcat('EL',num2str(valFormat));
        fprintf(serialOBJ,command);
        response = fscanf(serialOBJ,'%s');
end

switch response
    case 'EL00'
        rangeLow = {0,'0.1', 'Torr'};
    case 'EL01'
        rangeLow = {1,'0.2', 'Torr'};
    case 'EL02'
        rangeLow = {2,'0.5', 'Torr'};
    case 'EL03'
        rangeLow = {3,'1.0', 'Torr'};
    case 'EL04'
        rangeLow = {4,'2.0', 'Torr'};
    case 'EL05'
        rangeLow = {5,'5.0', 'Torr'};
    case 'EL06'
        rangeLow = {6,'10.0', 'Torr'}; % DEFAULT VALUE
    case 'EL21'
        rangeLow = {21,'20.0', 'Torr'};
    case 'EL07'
        rangeLow = {7,'50.0', 'Torr'};
    case 'EL08'
        rangeLow = {8,'100.0', 'Torr'};
    case 'EL22'
        rangeLow = {22,'200.0', 'Torr'};
    case 'EL09'
        rangeLow = {9,'500.0', 'Torr'};
    case 'EL10'
        rangeLow = {10,'1000.0', 'Torr'};
    case 'EL11'
        rangeLow = {11,'5000.0', 'Torr'};
    case 'EL12'
        rangeLow = {12,'10000.0', 'Torr'};
    case 'EL13'
        rangeLow = {13,'1.33', 'mBar'};
    case 'EL14'
        rangeLow = {14,'2.66', 'mBar'};
    case 'EL15'
        rangeLow = {15,'13.33', 'mBar'};
    case 'EL16'
        rangeLow = {16,'133.3', 'mBar'};
    case 'EL17'
        rangeLow = {17,'1333.0', 'mBar'};
    case 'EL18'
        rangeLow = {18,'6666.0', 'mBar'};
    case 'EL19'
        rangeLow = {19,'13332.0', 'mBar'};
    case 'EL20'
        rangeLow = {20,'0.1333', 'mBar'};
    case 'EL23'
        rangeLow = {23,'0.001', 'mBar'};
    otherwise
        rangeLow = {-1,'LOW Limit not recognized!'};
end
end