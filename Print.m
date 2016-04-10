function Print(fid, data, varargin)
    % 0x01 0x02 0x04 0x08
    % 
    
    nVargin = length(varargin);
    [n, m] = size(data);
    i = 1;
    headflag = 0;
    outputflag = 0;
    
    while i <= nVargin
        switch lower(varargin{i})
            case 'head'
                Head = varargin{i+1};
                headflag = 1;
            case 'outputformat'
                OutputFormat = varargin{i+1};
                outputflag = 1;
            otherwise
                % error
        end
        i = i + 2;
    end
    if headflag == 0
        Head = cell(1, m);
        for i = 1:m
            Head{i} = ['Column ', int2str(i)];
        end
    end
    if outputflag == 0
        OutputFormat = 'Plant';
    end
    numberFormat = '%13.2f';
    stringFormat = '%13s';
    space = ' ';
    tspace = [space space];
    columnsep = '&';
    endline = ' \\\\\n';
    toprule = '\\toprule\n';
    midrule = '\\midrule\n';
    bottomrule = '\\bottomrule\n';
    newline = '\n';
    begintableprefix = '\\begin{tabular}[';
    begintablesuffix = ']\n';
    endtable = '\\end{tabular}\n';
    
    switch lower(OutputFormat)
        case 'plant'
            dataFormatStr =  [char(kron(ones(1, m), numberFormat)), newline];
            for i = 1:m
                fprintf(fid, stringFormat, Head{i});
            end
            fprintf(fid, newline);
            for i = 1:n
                fprintf(fid, dataFormatStr, data(i, :));
            end
        case 'transplant'
            formatStr =  [stringFormat, char(kron(ones(1, n), numberFormat)), newline];
            fprintf(fid, newline);
            data = data';
            for i = 1:m
                fprintf(fid, formatStr, Head{i}, data(i, :));
            end
        case 'latex'
            begintable = [begintableprefix, kron(ones(1, m), 'c'), begintablesuffix];
            dataFormatStr =  [numberFormat, char(kron(ones(1, m-1),...
                [space columnsep space numberFormat])), endline];
            fprintf(fid, begintable);
            fprintf(fid, [tspace toprule]);
            for i = 1:m
                if i ~= 1
                    fprintf(fid, [space columnsep space]);
                else
                    fprintf(fid, tspace);
                end
                fprintf(fid, stringFormat, Head{i});
            end
            fprintf(fid, endline);
            fprintf(fid, [tspace midrule]);
            for i = 1:n
                fprintf(fid, [tspace dataFormatStr], data(i, :));
            end
            fprintf(fid, [tspace bottomrule]);
            fprintf(fid, endtable);
        case 'translatex'
            data = data';
            formatStr =  [stringFormat,char(kron(ones(1, n),...
                [space columnsep space numberFormat])), endline];
            data = data';
            begintable = [begintableprefix, kron(ones(1, n), 'c'), begintablesuffix];
            fprintf(fid, begintable);
            fprintf(fid, [tspace toprule]);
            for i = 1:m
                fprintf(fid, [tspace formatStr], Head{i}, data(i, :));
                if i == 1 
                    fprintf(fid, [tspace midrule]);
                end
            end
            fprintf(fid, [tspace bottomrule]);
            fprintf(fid, endtable);
        otherwise
            % error
    end
end
