function valveControlCOM(serialOBJ,opt)

% Direct control of the valve: '0' (zero) closes the valve
%                              '1' (one) opens the valve
%                              '2' (two) holds the current valve position
    switch opt
        case 0 % closed
            fprintf(serialOBJ,'C');
        case 1 % open
            fprintf(serialOBJ,'O');
        case 2 % stop in current position
            fprintf(serialOBJ,'H');
    end
    
end