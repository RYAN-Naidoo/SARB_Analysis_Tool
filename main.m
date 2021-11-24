
%% set constants 
numMonths = 3; 

%% initialise storage 
capitecValues = cell(3,2); % store as Deposits Loans per row


% for each month 
for j = 1:numMonths
    [readSucess,outputTable] = readTable(j,333107,false);
     if readSucess
        [deposits,loans] = extractValues(outputTable);
        capitecValues(j,:) = table2cell([deposits(1,1) loans(1,1)]);
     else
        disp('Table read failed');
     end 
end



