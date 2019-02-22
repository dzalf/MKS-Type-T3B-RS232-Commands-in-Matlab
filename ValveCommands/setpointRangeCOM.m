function setpointRange = setpointRangeCOM(serialOBJ,opt,val)

queryCOM = 'R24';
% echoQuery = strcat(queryCOM,'#');

switch opt
    case 0 % QUERY
        fprintf(serialOBJ,queryCOM); % Should I change it for echoquery?
        response = fscanf(serialOBJ,'%s');
        
    case 1 % COMMAND
        command = strcat('A',num2str(val));
        fprintf(serialOBJ,command);
        response = fscanf(serialOBJ,'%s');
end

switch response
    case 'A0'
        setpointRange = {0,'5VDC'};
    case 'A1'
        setpointRange = {1,'+/-10VDC'};
    otherwise
        setpointRange = {-1,'Range not recognized!'};
end
end