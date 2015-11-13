function [ classification ] = process_data( modal_pixels, dims)
%PROCESS_DATA Inputs the modality of the pixels and outputs each pixel's classification.

K = 7;

[i, ~] = kmeans(modal_pixels, K);

classification = reshape(i, dims);
end

