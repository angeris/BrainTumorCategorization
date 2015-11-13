function [ classification ] = process_data( modal_pixels, size_hor, size_ver )
%PROCESS_DATA Inputs the modality of the pixels and outputs each pixel's classification.

K = 7;
modal_pixels_t = modal_pixels'; % Classification is column-major.

[i, ~] = kmeans(modal_pixels_t, K);

image = reshape(i, size_hor, size_ver);
imshow(image==1);

classification = i;
end

