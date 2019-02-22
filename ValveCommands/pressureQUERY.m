function [pressure,absPressure,units, error] = pressureQUERY(serialOBJ)
    
    % This function returns the pressure readout as RAW pressure and
    % absolute pressure. The units given by the high range function
    % are returned as well.
    
    queryCOM = 'R5';
    
    fprintf(serialOBJ, queryCOM);
    response = fscanf(serialOBJ, '%s');
    
    respSplit = strsplit(response,'+');
    
	pressure = str2double(respSplit{2});
	
	rangeHighStr = sensorRangeLowCOM(serialOBJ,0,0);
	
	if ~isequal(rangeHighStr{1},-1)
	
		rH = str2double(rangeHighStr{2});
		absPressure = (pressure/100)*rH;
		units = rangeHighStr{3};
		error = 0;
        
	else
		
		error = 1;
		
		pressure = NaN;
		absPressure = NaN;
		units = ' ';
	
	end
    
    % Response has the format: P+XX.XXXX
    
end