function [ mat_fft ] = fft3d( mat )
%FFT4D Takes the three-dimensional fourier transform. Useful for
%convolution.

t_size = max(size(mat));

mat_fft = mat;

for i=1:3
    mat_fft = fft(mat_fft, t_size, i);
end

end

