[readSucess,outputTable] = readTable(1,1,true);


if readSucess
    [deposits,loans] = extractValues(outputTable);
else
    disp('Table read failed')
end
