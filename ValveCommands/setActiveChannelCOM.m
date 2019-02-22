function activeChan = setActiveChannelCOM(serialOBJ, val)

% val can be three possible values
% 0 = Auto
% 1 = High
% 2 = Low

switch val
    case 0 
        fprintf(serialOBJ,'LA');
         activeChan = {0,'Auto: dual channel operation'};
    case 1
        fprintf(serialOBJ,'LH');
        activeChan = {1, 'CH1, high range sensor'};
    case 2
        fprintf(serialOBJ,'LL');
        activeChan = {2,'CH2, low range sensor'};
    otherwise
        activeChan = {-1,'Channel not recognised'};
             
 end
        
end