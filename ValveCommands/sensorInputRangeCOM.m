function inputRange = sensorInputRangeCOM(serialOBJ,opt,val)

switch opt
    case 0 % QUERY
        fprintf(serialOBJ,'R35');
        response = fscanf(serialOBJ,'%s');
        
    case 1 % COMMAND
        command = strcat('G',num2str(val));
        fprintf(serialOBJ,command);
        response = fscanf(serialOBJ,'%s');
end

switch response
    case 'G0'
        inputRange = {0,'1V'};
    case 'G1'
        inputRange = {1,'5V'};
    case 'G2'
        inputRange = {2,'10V'}; % * default value
    otherwise
        inputRange = {-1,'Range not recognised!'};
end
end