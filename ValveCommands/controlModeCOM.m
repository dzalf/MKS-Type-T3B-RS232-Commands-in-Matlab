function mode = controlModeCOM(serialOBJ,opt,val)

queryCOM = 'R51';

    switch opt
        case 0 % QUERY
            fprintf(serialOBJ,queryCOM);
            response = fscanf(serialOBJ,'%s');
            
        case 1 % COMMAND
		
		switch val
			case {0,1}
				command = strcat('V',num2str(val));
				fprintf(serialOBJ,command);
				response = fscanf(serialOBJ,'%s');
			otherwise
				response = 'Error';
		end
    end
     
    switch response
        case 'V0'
            mode = {0,'PID'};
        case 'V1'
            mode = {1,'Model based'};
        otherwise
            mode = {-1,'Mode not recognised!'};
    end
end