function serialOBJ = startSerial(comPort)
    
    serialOBJ = serial(comPort);
    serialOBJ.InputBufferSize = 50;
    set(serialOBJ,'DataBits',8);
    set(serialOBJ,'StopBits',1);
    set(serialOBJ,'BaudRate',19200);
    set(serialOBJ,'Parity','none');
    set(serialOBJ, 'Terminator', 'CR/LF'); % the order is important to keep a good speed
%     set(serialOBJ, 'Timeout',15); % Check this value!
    
    try
        fopen(serialOBJ);
    catch err
        fclose(instrfind);
        error('Make sure you select the correct COM Port where the RS-232 cable is connected.');
    end
    
end