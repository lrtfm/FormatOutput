data = 1:20;
data = reshape(data, 4, 5);

Print(1, data, 'OutputFormat', 'Plain')
Print(1, data,'Head',{'M', 'L1', 'L2', 'L3', 'L4'},'OutputFormat', 'TPlain')
Print(1, data,'OutputFormat', 'Latex')
Print(1, data, 'Head',{'M', 'L1', 'L2', 'L3', 'L4'}, 'OutputFormat', 'TLatex')