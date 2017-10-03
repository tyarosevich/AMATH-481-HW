%% 1.)

A = [1 2;-1 1]; B = [2 0;0 2]; C = [2 0 -3;0 0 -1]; D = [1 2;2 3;-1 0];

x = [1;0]; y = [0; 1]; z = [1;2;-1];

A1 = A + B;
A2 = 3*x - 4*y;
A3 = A*x;
A4 = B*(x - y);
A5 = D * x;
A6 = D*y + z;
A7 = A*B;
A8 = B*C;
A9 = C*D;
save A1.dat A1 -ascii
save A2.dat A2 -ascii
save A3.dat A3 -ascii
save A4.dat A4 -ascii
save A5.dat A5 -ascii
save A6.dat A6 -ascii
save A7.dat A7 -ascii
save A8.dat A8 -ascii
save A9.dat A9 -ascii
%% 2.) a.)
clear all;clc;close all;
y_list = zeros(2,50001);
y_list(:,1) = [1;.05];
y0 = [1;.05];
delta_t = .002;
t = 0;
for n = 1:50000
    y1 = y_list(1, n); y2 = y_list(2, n);
    y_list(:,n+1) = y_list(:,n) + delta_t*[y2; .3*cos(t) - .2*y2 + 1 * y1 - y1^3];
    t = t + delta_t;
end

A10 = zeros(50001, 1);
A11 = zeros(50001, 1);

A10 = y_list(1,:);
A11 = y_list(2,:);
save A10.dat A10 -ascii
save A11.dat A11 -ascii

%% 2.) b.)
clear all;clc;close all;
N_list = [2500; 5000; 10000; 20000; 40000; 80000; 160000];
E_list = zeros(7,1);
f = @(y1, y2) .5*y2^2 - .5 * y1^2 + .25*y1^4;
counter = 1;
E0 = f(1, .05);
for n = 1:length(N_list)
    
    y0 = [1;.05];
    delta_t = 100/N_list(n);
    for n = 1:N_list(n)
        y1 = y0(1,1); y2 = y0(2,1);
        y0 = y0 + delta_t*[y2;y1 - y1^3];
    end
    E_list(counter) = (f(y0(1,1), y0(2,1)) - E0) / E0;
    counter = counter + 1;
end

save A12.dat E_list -ascii


    