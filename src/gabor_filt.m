% Gabor Filters in MultiDimensions
function gb = gabor_filt(freqs, sigmas, theta, phi, roll, sz)
% freqs = [U, V, W] - U, V, W represent the 3D frequencies of the
%         complex sinusoids
% sigmas = [sx, sy, sz] - sx, sy, sz represent the standard deviations for
% the gaussian envelope
% sz - dimension of filter 
% R - Rotation Matrix
% theta, phi, roll - angles for rotation
% Gabor Filter - gb = gaussian.*sinusoid

%% Generate Parameters for Gabor Filter Function
if mod(sz,2)==0
    sz=sz+1;
end

[x y z]=meshgrid(-sz:sz, sz:-1:-sz, -sz:sz); % generates x, y, z coordinates (1 increment)
%R = [1,0,0;0,cos(theta), -sin(theta);0, sin(theta), cos(theta)]*[cos(psi), -sin(psi),0;sin(psi), cos(psi), 0;0,0,1];

% Rotation about z-axis
xp = x*cos(theta)+y*sin(theta);
yp = -x*sin(theta)+y*cos(theta);
zp = z;

% Rotation about y-axis
xp = xp*cos(phi)-zp*sin(phi);
yp = yp;
zp = xp*sin(phi)+zp*cos(phi);

% Rotation about x-axis
xp = xp;
yp = yp*cos(roll) + zp*sin(roll);
zp = -yp*sin(roll) + zp*cos(roll);

%% Define Gabor Filter Function
const_gaussian = 1/((2*pi)^(3/2)*sigmas(1)*sigmas(2)*sigmas(3));
gaussian = const_gaussian*exp(-0.5*(xp.^2/sigmas(1)^2+yp.^2/sigmas(2)^2+zp.^2/sigmas(3)^2));
sinusoid = exp(-1i*2*pi*(freqs(1)*x + freqs(2)*y + freqs(3)*z));
gb = real(gaussian.*sinusoid);

