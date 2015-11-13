function [ classification ] = process_data( modal_pixels, dims)
%PROCESS_DATA Inputs the modality of the pixels and outputs each pixel's classification.

K = 5;

[i, ~] = kmeans(modal_pixels, K);

image = reshape(i, dims);
imshow3D(image);

classification = image;
end

