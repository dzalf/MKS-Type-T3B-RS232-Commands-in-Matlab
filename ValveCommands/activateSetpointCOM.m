function [valveParams, error] = activateSetpointCOM(serialOBJ,opt, val)

% The function returns the valve parameters as: 
%

queryCOM = 'R7';
valStr = num2str(val);
comStr = strcat('D', num2str(val));
valveParams = cell(1,4);
switch opt
    
    case 0 % QUERY
        
        fprintf(serialOBJ,queryCOM);
        response = fscanf(serialOBJ,'%s');
        
        if ~isempty(response)
            error = 0;
        else 
            error = 1;
            valveParams = {'failure','failure','failure','failure'};
        end
    case 1 % ASSIGN SETPOINT
        
        if and(val >= 0,val <= 5)
          fprintf(serialOBJ,comStr);
          fprintf(serialOBJ,queryCOM);
          response = fscanf(serialOBJ,'%s');
          error = 0;
        else
            
            error = 1;
                 
        valveParams = {'failure','failure','failure','failure'};
        
        end
        
end

        chars = num2cell(response,1,ones(5,1));
    
        x = chars{2}; % ACTIVE SETPOINT
        switch x
            case '0'
                valveParams{1} = 'Analog Setpoint';
            case '1'
                valveParams{1} = 'Setpoint A';
            case '2'
                valveParams{1} = 'Setpoint B';
            case '3'
                valveParams{1} = 'Setpoint C';
            case '4'
                valveParams{1} = 'Setpoint D';
            case '5'
                valveParams{1} = 'Setpoint E';
            case '6'
                valveParams{1} = 'Valve OPEN';
            case '7'
                valveParams{1} = 'Valve CLOSED';
            case '8'
                valveParams{1} = 'Valve STOP';
            case '9'
                valveParams{1} = 'Valve LEARNING';
        end
        
        y = chars{3}; % VALVE STATUS
        switch y
            case '0'
                valveParams{2} = 'Controlling';
            case '2'
                valveParams{2} = 'Valve OPEN';
            case '4'
                valveParams{2} = 'Valve CLOSE';
        end
        
        
        z = chars{4}; % PRESSURE
        switch z
            case '0'
                valveParams{3} = '<= 10% Full Scale';
            case '1'
                valveParams{3} = '> 10% Full Scale';
            
        end
        
        w = chars{5}; % ACTIVE SENSOR/CHANNEL SELECT/ZERO ADJUST
        
        switch w
            case '0'
                valveParams{4} = {{'0'},{'LOW'},{'AUTO'},{'DISABLED'}};
            case '1'
                valveParams{4} = {{'1'},{'HIGH'},{'AUTO'},{'DISABLED'}};
            case '3'
                valveParams{4} = {{'3'},{'HIGH'},{'HIGH'},{'DISABLED'}};
            case '4'
                valveParams{4} = {{'4'},{'LOW'},{'AUTO'},{'ENABLED'}};
            case '5'
                valveParams{4} = {{'5'},{'HIGH'},{'AUTO'},{'ENABLED'}};
            case '7'
                valveParams{4} = {{'7'},{'HIGH'},{'HIGH'},{'ENABLED'}};
            case '8'
                valveParams{4} = {{'8'},{'LOW'},{'LOW'},{'DISABLED'}};
            case ':'
                valveParams{4} = {{':'},{'LOW'},{'LOW'},{'ENABLED'}};
           
        end
        
        
        
        
%System returns the format:

% M x y z w
% x: 
% Active Setpoint 
% 0 = Analog Setpoint
% 1 = Setpoint A
% 2 = Setpoint B
% 3 = Setpoint C
% 4 = Setpoint D
% 5 = Setpoint E
% 6 = Valve Open 
% 7 = Valve Closed 
% 8 = Valve Stop
% 9 = Valve Learning 
% y: 
% Valve Status
% 0 = Controlling 
% 2 = Valve open
% 4 = Valve close 
% z: 
% Pressure
% 0 = < 10% FS 
% 1 = > 10% FS
% w:  Active Sensor/Channel 
% Select/Zero Adjust
% 0 = L/A/D
% 1 = H/A/D
% 3 = H/H/D
% 4 = L/A/E
% 5 = H/A/E
% 7 = H/H/E
% 8 = L/L/D
% : = L/L/E 


    
end