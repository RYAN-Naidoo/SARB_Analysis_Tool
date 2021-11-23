function [readSuccess,outputTable] = readTable(month,bankCode,totals)

    % Flag variables 
    readFailure = false; 

    %% Auto-generated options for import 
    opts = delimitedTextImportOptions("NumVariables", 10);
    opts.DataLines = [1, Inf];
    opts.Delimiter = ",";
    opts.VariableNames = ["Description", "ItemNumber", "Chequej", "Savings", "UpTo1Day", "MoreThan1DayTo1Month", "MoreThan1MonthTo6Months", "MoreThan6Months", "TOTAL", "NCDsPNsIincludedInCol7"];
    opts.VariableTypes = ["string", "double", "double", "double", "double", "double", "double", "double", "double", "double"];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    opts = setvaropts(opts, "Description", "WhitespaceRule", "preserve");
    opts = setvaropts(opts, "Description", "EmptyFieldRule", "auto");


    %% FILTER BY MONTH 
    monthString = '';
    switch month
        case 1 
            monthString = append(monthString,'January');
        case 2 
            monthString = append(monthString,'February');
        case 3 
            monthString = append(monthString,'March');
        otherwise
            readFailure = true;
    end % end switch 


    %% FILTER BY BANK OR TOTAL 
    codeString = '';
    if ~readFailure && ~totals 
        % only filter by bank if input month was valid and not looking for
        % totals 
        switch bankCode
            case 333107 
                codeString = '333107';  % Capitech
            case 25054
                codeString = '25054';   % Investec 
            case 34118
                codeString = '34118';    % ABSA 
            case 416053
                codeString = '416053';   % FNB
            case 416061
                codeString = '416061';   % Standard Bank
            case 416088 
                codeString = '416088';   %  Nedbank 
            otherwise 
                readFailure = true;

        end % switch bankCode

    elseif totals
        % if boolean totals is set, here cater for that case 
        codeString = 'TOTAL';
    else 
        readFailure = true; 
    end 

    % Final String filename concatenation and read 
    if readFailure
        readSuccess = false;
        outputTable = 0;
    else
        filePath = append("C:\Users\ryann\Downloads\",monthString,"\",codeString,".csv");
        outputTable = readtable(filePath, opts);
        readSuccess = true;        
    end % if readFailure

       
end % end readTable