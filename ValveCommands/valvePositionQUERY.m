function valvePosition = valvePositionQUERY(serialOBJ)

queryCOM = 'R6';

fprintf(serialOBJ,queryCOM);
response = fscanf(serialOBJ,'%s');

respSplit = strsplit(response,'+');
valvePosition = str2double(respSplit{2});
end