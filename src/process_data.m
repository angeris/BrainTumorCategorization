function [ classification ] = process_data(modal_pixels)
%PROCESS_DATA Inputs the modality of the pixels and outputs each pixel's classification.

K = 7;

disp(size(modal_pixels))

[classification, ~] = kmeans(modal_pixels, K);
end

