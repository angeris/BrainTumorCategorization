function [ filter_banks ] = generate_filter_banks(param_var, param_var_angle)

% Define Parameters for filter banks
sigma_x = linspace(.1, 5, param_var); sigma_y = linspace(.1, 5, param_var); sigma_z = linspace(.1, 5, param_var);
freqx = linspace(0, 5, param_var); freqy = linspace(0, 5, param_var); freqz = linspace(0, 5, param_var);
sz = linspace(2, 4, param_var);

% Generate Filter Banks 
filter_banks = {};

theta = linspace(0, pi, param_var_angle);
phi = linspace(0, pi, param_var_angle);
roll = linspace(0, pi, param_var_angle);

for j = 1:param_var
    freqs = [freqx(j) freqy(j) freqz(j)];
    sigmas = [sigma_x(j) sigma_y(j) sigma_z(j)];
    for t = 1:param_var_angle
        for x = 1:param_var_angle
            for y = 1:param_var_angle
                for z = 1:param_var_angle
                    filter_banks{x+(y-1)*param_var_angle+(z-1)*param_var_angle^2+(t-1)*param_var_angle^3+(j-1)*param_var_angle^4} = gabor_filt(freqs, sigmas, theta(t), phi(z), roll(t), sz(j));
                end  
            end  
        end         
    end
end

end