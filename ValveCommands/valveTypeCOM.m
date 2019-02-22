function valveType = valveTypeCOM(serialOBJ)

queryCOM = 'RJT';
fprintf(serialOBJ, queryCOM);
response = fscanf(serialOBJ, '%s');

switch response  % for T3B series
    
    case 'JT0'
        valveType = {0,'20 mm Direct Fcup'};
    case 'JT1'
        valveType = {1,'20 mm Direct Nonseal'};
    case 'JT2'
        valveType = {2,'20 mm Geared Fcup'};
    case 'JT3'
        valveType = {3,'20 mm Geared Nonseal'};
    case 'JT4'
        valveType = {4,'20 mm Geared O-ring'};
    case 'JT5'
        valveType = {5,'1” Direct Fcup'};
    case 'JT6'
        valveType = {6,'1” Direct Nonseal'};
    case 'JT7'
        valveType = {7,'1” Geared Fcup'};
    case 'JT8'
        valveType = {8,'1” Geared Nonseal'};
    case 'JT9'
        valveType = {9,'1” Geared O-ring'};
    case 'JT10'
        valveType = {10,'2” Direct Fcup'};
    case 'JT11'
        valveType = {11,'2” Direct Nonseal'};
    case 'JT12'
        valveType = {12,'2” Geared Fcup'};
    case 'JT13'
        valveType = {13,'2” Geared Nonseal'};
    case 'JT14'
        valveType = {14,'2” Geared O-ring'};
    case 'JT15'
        valveType = {15,'60 mm Direct Fcup'};
    case 'JT16'
        valveType = {16,'60 mm Direct Nonseal'};
    case 'JT17'
        valveType  = {17,'60 mm Geared Fcup'};
    case 'JT18'
        valveType = {18,'60 mm Geared Nonseal'};
    case 'JT19'
        valveType = {19,'60 mm Geared O-ring'};
    case 'JT20'
        valveType = {20,'3” Direct Nonseal'};
    case 'JT21'
        valveType = {21,'3” Geared Fcup'};
    case 'JT22'
        valveType = {22,'3” Geared Nonseal'};
    case 'JT23'
        valveType = {23,'4” Direct Nonseal'};
    case  'JT24'
        valveType = {24,'4” Geared Fcup'};
    case 'JT25'
        valveType = {25,'4” Geared Nonseal'};
    case 'JT26'
        valveType = {26,'6” Direct Nonseal'};
    case 'JT27'
        valveType = {27,'6” Geared Fcup'};
    case 'JT28'
        valveType = {28,'6” Geared Nonseal'};
    case 'JT29'
        valveType = {29,'8” Direct Nonseal'};
    case 'JT30'
        valveType = {30,'8” Geared Fcup'};
    case 'JT31'
        valveType = {31,'8” Geared Nonseal'};
    case 'JT32'
        valveType = {32,'10” Direct Nonseal'};
    case 'JT33'
        valveType = {33,'10” Geared Fcup'};
    case 'JT34'
        valveType = {34,'10” Geared Nonseal'};
    otherwise
        valveType = {-1,'Valve type not recognised'};
end
end