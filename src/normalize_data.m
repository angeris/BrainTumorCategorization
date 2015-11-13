function p = normalize_data( data )
%NORMALIZE_DATA Summary of this function goes here

len_total = numel(data);

mean = sum(sum(sum(data))) / len_total;
variance = sum(sum(sum((data - mean).^2))) / len_total;

std_d = sqrt(variance);

p = (data - mean) ./ std_d;

end

