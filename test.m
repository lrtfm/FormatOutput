data = 1:40;
data = reshape(data, 8, 5);

FormatOutput.Print(1, data, 'OutputFormat', 'Plain')
FormatOutput.Print(1, data,'Head',{'M', 'L1', 'L2', 'L3', 'L4'},'OutputFormat', 'TPlain')
FormatOutput.Print(1, data,'OutputFormat', 'Latex')
FormatOutput.Print(1, data, 'Head',{'M', 'L1', 'L2', 'L3', 'L4'}, 'OutputFormat', 'TLatex')
Head = {'M', 'L1', 'L2', 'L3', 'L4'};
OutputFormat = 'TLatex';
DataFormat = {'%10g', '%10.2e', '%10g', '%10.4f', '%10.2f'};
FormatOutput.Print(1, data,'Head',Head,'OutputFormat', OutputFormat, 'DataFormat', DataFormat)
