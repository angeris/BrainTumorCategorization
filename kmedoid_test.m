load fisheriris
c = kmedoids(meas, 12);
figure()
scatter3(meas(:,1), meas(:,2), meas(:,3), 50, c)
title('kmedoid clustering')