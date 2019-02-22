function encoderPos = encoderPositionQUERY(serialOBJ)

% This function returns the current position of the encoder in 
% terms of the Full Scale of valve open

queryCOM = 'REN';

fprintf(serialOBJ, queryCOM);
response = fscanf(serialOBJ,'%s');

respSplit = strsplit (response,'+');

encoderPos = {respSplit{2},'% of FS open'};
end