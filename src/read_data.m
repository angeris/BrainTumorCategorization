function out_struct = read_data(filepath)

vols = struct([]);
vols_g = struct([]);

[vols{1}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_Flair.54512'));
[vols{2}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1.54513'));
[vols{3}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1c.54514'));
[vols{4}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T2.54515'));

s = 50:200;


s_c = 1:5;
sigma_2 = .01;
[X, Y, Z] = meshgrid(s_c, s_c, s_c);

K = exp(X.^2 + Y.^2 + Z.^2)./sigma_2;
K = K./sum(sum(sum(K)));

for i=1:4
    vols_g{i} = convn(vols{i}, K, 'same');
    vols_g{i} = vols_g{i}(s,s,:);
    vols{i} = vols{i}(s,s,:);
end

N = numel(vols{1});

vols_p = struct([]);
vols_g_p = struct([]);

for i=1:4
    vols_p{i} = reshape(normalize_data(vols{i}), N, 1, 1);
    vols_g_p{i} = reshape(normalize_data(vols_g{i}), N, 1, 1);
end

out_struct = {};


out_struct{1} = vols;
out_struct{2} = vols_g;

p_vals = [];

disp(size(vols_p{1}))
disp(size(vols_g_p{1}))

for i=1:4
    p_vals = [vols_p{i}, vols_g_p{i}, p_vals];
end

out_struct{3} = p_vals;
out_struct{4} = size(vols{1});

end