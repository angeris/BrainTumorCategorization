function [ c ] = conv3d( a, b )
%CONV3D Summary of this function goes here

a_max = max(size(a));
b_max = max(size(b));

s = a_max+b_max-1;

a_fft = a;
b_fft = b;

for i=1:3
    a_fft = fft(a_fft, s, i);
    b_fft = fft(b_fft, s, i);
end

conv_fft = a_fft.*b_fft;

c = conv_fft;
for i=1:3
    c = ifft(c, [], i);
end

end
