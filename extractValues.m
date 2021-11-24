function [Deposits,Loans] = extractValues(inputTable)

% This function receives table and returns values for item 1 and 
% item 110 

    %% GET TABLE COLUMN INDICES 
    %tableHeadings = inputTable.Properties.VariableNames;
    %colIndexItemNumber = find(strcmp(tableHeadings,'ItemNumber'));
    %colIndexTotal      = find(strcmp(tableHeadings,'TOTAL'));


    %% GET TABLE ROW INDICES 
    %rowIndexItemNumber = table(8,colIndexTotal)


    %% GET VALUES IN QUESTION 
    Deposits = inputTable(8,"TOTAL");
    Loans    = inputTable(127,"MoreThan1MonthTo6Months");


end 