function resetCOM(serialOBJ)
    % Function to power cycle the device
    fprintf(serialOBJ, 'IX');
end