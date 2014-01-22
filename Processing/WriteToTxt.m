function [  ] = WriteToTxt( DataSet, FileName )
%WriteToTxt: Write each line of the DataSet to a textfile of FileName

%Make sure to include .txt at the end of FileName

TextFile = fopen(FileName,'w');
[col,row] = size(DataSet);

for y = 1:col
    for x = 1:row
        fprintf(TextFile,'%d',DataSet(y,x));
    end
    if (y ~= col)
        fprintf(TextFile,',',DataSet(y,x));
    end
end
fclose(TextFile);
        
end

