function ADStatus = checksumStatusQUERY(serialOBJ)

queryCOM = 'R52';

fprintf(serialOBJ,queryCOM);
response = fscanf(serialOBJ,'%s');

switch response
    
    case 'CS1'
        ADStatus = {0, 'A/D converter calibration FAILED'};
    case 'CS0'
        ADStatus = {1, 'A/D converter calibration SUCEEDED'};
        
end

end