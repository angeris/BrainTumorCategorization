function [ c ] = convnd( a, b, n )
%CONV3D convolves two n-dimensional arrays using the FFT.

a_max = max(size(a));
b_max = max(size(b));

s = a_max+b_max-1;
extra_dims(1:n) = {0};

a_fft = a;
b_fft = b;

for i=1:n
    a_fft = fft(a_fft, s, i);
    b_fft = fft(b_fft, s, i);
    extra_dims{i} = ceil((size(b, i)-1)/2) + (1:size(a, i));
end

conv_fft = a_fft.*b_fft;

c = conv_fft;
for i=1:n
    c = ifft(c, [], i);
end

c = c(extra_dims{:});

end
