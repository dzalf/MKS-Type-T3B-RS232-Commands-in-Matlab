function buildString = buildStringQUERY(serialOBJ)
    
queryCOM = 'R66';

fprintf(serialOBJ, queryCOM);
buildString = fscanf(serialOBJ, '%s');

end