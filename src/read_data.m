function [p, dims] = read_data(filepath)

[volCT1, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_Flair.54512'));
[volCT2, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1.54513'));
[volCT3, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1c.54514'));
[volCT4, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T2.54515'));

s = 50:200;

volCT1 = volCT1(s, s, :);
volCT2 = volCT2(s, s, :);
volCT3 = volCT3(s, s, :);
volCT4 = volCT4(s, s, :);

dims = size(volCT1);

N = numel(volCT1);

p1 = reshape(normalize_data(volCT1), N, 1, 1);
p2 = reshape(normalize_data(volCT2), N, 1, 1);
p3 = reshape(normalize_data(volCT3), N, 1, 1);
p4 = reshape(normalize_data(volCT4), N, 1, 1);

p = [p1, p2, p3, p4];

end