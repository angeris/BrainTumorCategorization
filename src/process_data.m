function [ classification ] = process_data(modal_pixels)
%PROCESS_DATA Inputs the modality of the pixels and outputs each pixel's classification.

K = 6;

disp(size(modal_pixels))

% k-means clustering
[classification, ~] = kmeans(modal_pixels, K);

% k-medoids clustering
% [classification, ~] = kmedoids(modal_pixels, K);

% hierarchical clustering 1 - Unweighted average distance
% classification = cluster(linkage(modal_pixels, 'average', 'euclidean'), 'maxclust', K);

% hierarchical clustering 2 - complete-linkage clustering
% classification = cluster(linkage(modal_pixels, 'complete', 'euclidean'), 'maxclust', K);

% hierarchical clustering 3 - single-linkage clustering
% classification = cluster(linkage(modal_pixels, 'single', 'euclidean'), 'maxclust', K);

% gaussian mixture models
% classification = cluster(fitgmdist(modal_pixels, K), modal_pixels);

end

