function out_struct = read_data(filepath)

vols = struct([]);
vols_g = struct([]);

[vols{1}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_Flair.54512'));
[vols{2}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1.54513'));
[vols{3}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T1c.54514'));
[vols{4}, ~, ~, ~] = readMHA(strcat(filepath, 'VSD.Brain.XX.O.MR_T2.54515'));

p_doctor = readMHA('data/brats_2013_pat0001_1/VSD.Brain_3more.XX.O.OT.54517');

s = 50:200;


s_c = -5:5;
sigma_2 = 2;
[X, Y, Z] = meshgrid(s_c, s_c, s_c);

K = exp(X.^2 + Y.^2 + Z.^2)./sigma_2;
K = K./sum(sum(sum(K)));

filter_banks = generate_filter_banks(2, 2);
FILT_SIZE = length(filter_banks);

disp('Done reading and generating banks');

for i=1:4
    i
    vols{i} = vols{i}.*(p_doctor > 0);
%     vols_g{i} = convn(vols{i}, K, 'same');
    for j=1:FILT_SIZE
        idx = (j-1)*4+i;
        vols_g{idx} = convn(vols{i}, filter_banks{j}, 'same');
        vols_g{idx} = vols_g{idx}(s,s,:);
        j
    end
    vols{i} = vols{i}(s,s,:);
end

save vols;
save vols_g;

disp('Done with bank convolution');

N = numel(vols{1});

vols_p = struct([]);
vols_g_p = struct([]);

for i=1:4
    vols_p{i} = reshape(normalize_data(vols{i}), N, 1, 1);
end

for i=1:(4*FILT_SIZE)
    vols_g_p{i} = reshape(normalize_data(vols_g{i}), N, 1, 1);
end

disp('Finished reshaping')

out_struct = {};


out_struct{1} = vols;
out_struct{2} = vols_g;

p_vals = [];

disp(size(vols_p{1}))
disp(size(vols_g_p{1}))

for i=1:4
    p_vals = [vols_p{i}, p_vals];
end

for i=1:(4*FILT_SIZE)
    p_vals = [vols_g_p{i}, p_vals];
end

out_struct{3} = p_vals;
out_struct{4} = size(vols{1});

end