function setpointVal = setpointValuesCOM(serialOBJ,opt,sp,value)

% Function to query and write setpoint values for the valve
% 
% opt = 0 --> query the values from the setpoint indicated by 'sp':
%       sp = 'A' to 'E' individually queries the values from such setpoints
% setpointVal returns a cell with ONE setpoint value (sp)
%       sp = 'ANALOG' queries the analog setpoint
%       sp = 'ALL' queries all setpoints in one shot
% setpointVal returns a cell with ALL setpoint values ('A' to 'E')
%       value does not affect this option
% opt = 1 ---> writes the setpoint given by 'sp'
%       sp = 'A' to 'E' individually writes the values indicated by 'value'
%       sp = 'DEFAULT' loads [10, 30, 50, 70, 90] to setpoints 'A' to 'E'
% setpointVal returns a cell with ALL the writen setpoint values
%       sp = 'ANALOG' writes the value indicated by 'value'
%       value = must be {0,100} or percentage of FS open for 'A' to 'E'
%       value = percent of the analog setpoint FS voltage range      
% setpointVal has the format: {{sp},{spVal},{string:}}

error = 0;
% Query cell  ALL values
allSetPoints = {'1','2','3','4','10'};
setPoints = {'A','B','C','D','E'};
% Write cell DEFAULT values
defaultLabels = {'1','2','3','4','5'};
defaultValues = {'10','30','50','70','90'};

switch opt
    
    case 0 % QUERY
        
        queryCOM = 'R';
        switch sp
            case {'A','a'}
                xQuery = '1';
            case {'B','b'}
                xQuery = '2';
            case {'C','c'}
                xQuery = '3';
            case {'D','d'}
                xQuery = '4';
            case {'E','e'}
                xQuery = '10';
            case {'ANALOG','analog', 'Analog'}
                xQuery = '0';
            case {'ALL','All','all'}
                xQuery = 'ALL';
            otherwise
                error = 1;
                
        end
        
        if ~isequal(error,1)
            
            if ~isequal(xQuery, 'ALL') %if query is different from 'ALL'  
			
                queryFormat = strcat(queryCOM,xQuery);
                fprintf(serialOBJ,queryFormat);
                response = fscanf(serialOBJ,'%s');
                
                valSplit = strsplit(response, '+');
                spValStr = valSplit{2};
%                 spNumber = str2double(spValStr);
                
                
                if isequal(xQuery, '1') || isequal(xQuery, '2') || ...
                        isequal(xQuery, '3') ||isequal(xQuery, '4') ...
                        || isequal(xQuery, '10')
                    
                    setpointVal = {sp,spValStr,'%Pressure / %Open'};
                end
                
                if isequal(xQuery, '0')
                    setpointVal = {sp,spValStr,'% Analog setpoint FS range'};
                end
				
            else
                
                if isequal(xQuery, 'ALL')
                    
                    col = 1;
					
                    for ren = 1:5
                        queryFormat = strcat(queryCOM,allSetPoints{col});
                        fprintf(serialOBJ,queryFormat);
                        response = fscanf(serialOBJ,'%s');
                        
                        valSplit = strsplit(response, '+');
                        spValStr = valSplit{2};
%                         spNumber = str2double(spValStr);
                        setpointVal{ren} = {char(setPoints{col}),spValStr,'%Pressure / %Open'};
                        
                        col = col +1;
                    end
                end
                
            end
            
        else
            setpointVal = {'Error!','0.0','Wrong setpoint selected'};
        end
        
    case 1 % ASSIGN SETPOINT
        
        writePrefix = 'S';
        
        switch sp
            case {'A','a'}
                xWrite = '1';
                
            case {'B','b'}
                xWrite = '2';
                
            case {'C','c'}
                xWrite = '3';
                
            case {'D','d'}
                xWrite = '4';
                
            case {'E','e'}
                xWrite = '5';
                
            case {'ANALOG','analog', 'Analog'}
                xWrite = '6';
                
            case {'DEFAULT','default', 'Default'}
                xWrite = 'DEFAULT';
            otherwise
                error = 1;
                
        end
        
        if ~isequal(error,1)
            if ~isequal(xWrite, 'DEFAULT')
			
                Sx = strcat(writePrefix, num2str(xWrite));
                
                if or(str2double(xWrite) >= 1,str2double(xWrite) <= 5)
                    SxValAtoE = strcat(Sx, num2str(value));
                    fprintf(serialOBJ,SxValAtoE);
                end
                
                if isequal(str2double(xWrite),6)
                    if value >= 1
                        valAnalog = value;
                    else
                        valAnalog = value;
                    end
                    SxValAnalog = strcat(Sx, num2str(valAnalog));
                    fprintf(serialOBJ,SxValAnalog);
                end

                setpointVal = setpointValuesCOM(serialOBJ,0,sp,value);
                
            else
			
                for i=1:5
                    
                    Sx = strcat(writePrefix, defaultLabels{i});
                    SxValAtoE = strcat(Sx, defaultValues{i});
                    fprintf(serialOBJ,SxValAtoE);
                end
                
                setpointVal = setpointValuesCOM(serialOBJ,0,'ALL',value);
            end
            
        else
            setpointVal = {'Error!','0.0','Wrong setpoint selected!'};
        end
end