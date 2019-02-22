function systemStatus = systemStatusQUERY(serialOBJ)


% The controller responds with the message:
% M x y z
% where x: Type of Operation
% 0 = Local
% 1 = Remote
%  y:
% State of the LEARN Function
% 0 = Not learning
% 2 = Learning
% valve
%  z: Valve Control
% 0 = Open
% 1 = Close
% 2 = Stop
% 3 = Setpoint
% A
% 4 = Setpoint B
% 5 = Setpoint C
% 6 = Setpoint D
% 7 = Setpoint E
% 8 = Analog setpoint

queryCOM = 'R37';

% QUERY
fprintf(serialOBJ,queryCOM); % echoQuery instead?
response = fscanf(serialOBJ,'%s');

if ~isempty(response)
    
    chars = mat2cell(response,1,ones(4,1));
    
    x = chars{2};
    y = chars{3};
    z = chars{4};
    
    switch x
        case '0'
            chunk{1} = 'LOCAL Operation.';
        case '1'
            chunk{1} = 'REMOTE Operation.';
    end
    
    switch  y
        case '0'
            chunk{2} = 'NOT learning valve.';
        case '2'
            chunk{2} = 'LEARNING valve.';
    end
    
    switch z
        case '0'
            chunk{3} = 'Valve OPEN.';
        case '1'
            chunk{3} = 'Valve CLOSED.';
        case '2'
            chunk{3} = 'Valve STOPPED.';
        case '3'
            chunk{3} = 'Setpoint A.';
        case '4'
            chunk{3} = 'Setpoint B.';
        case '5'
            chunk{3} = 'Setpoint C.';
        case '6'
            chunk{3} = 'Setpoint D.';
        case '7'
            chunk{3} = 'Setpoint E.';
        case '8'
            chunk{3} = 'Analog setpoint.';
    end
    
    systemStatus = {chunk{1},chunk{2},chunk{3}};
else
    systemStatus = 'Status NOT identified';
end
    
end