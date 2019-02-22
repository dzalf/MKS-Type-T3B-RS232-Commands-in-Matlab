function sensorZeroCOM(serialOBJ, opt, value)
    
% Function to zero the offset values of the sensor, via two ways:
% opt = '0' --> Corrects sensor zero offsets
% opt = '1' --> Zeros baseline pressure to the value expressed by 'value'

    queryCOM1 = 'Z1';
    queryCOM2 = 'Z2';
    
    switch opt
        case 1 % Corrects sensor zero offsets
           
        fprintf(serialOBJ,queryCOM1);
        
        case 2
        zeroFormat2 = strcat(queryCOM2,num2str(value));     
        fprintf(serialOBJ,zeroFormat2);
            
    end
    
end