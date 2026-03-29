% To estimate surface area S and volume V of a barrel, the diameter of a
% barrel is measured along various points. Use the data given to find S and
% V if
% S = 2*pi \int_0^L r dz ; V = pi* \int_0^L r^2 dz

format longG;

z = [-18,  -12,   -6,  0,    6,   12, 18];
d = [ 28, 30.2, 31.5, 32, 31.5, 30.2, 28];

S = @(r) r;
V = @(r) r.^2;

a = 1;
b = length(d);
n = length(z) - 1;
h = (z(b)-z(a))/n;

% Calculating SA
% Calculate the coeff 4 guy
c4 = 0;
for i = 1:2:n
    c4 = c4 + 4*S(d(a+i)/2);
end

% Calculate the coeff 2 guy
c2 = 0;
for i = 2:2:n-1
    c2 = c2 + 2*S(d(a+i)/2);
end

SA = 2*pi*(h * (S(d(1)/2) + c4 + c2 + S(d(b)/2))/3);

% Calculating V
% Calculate the coeff 4 guy
c4 = 0;
for i = 1:2:n
    c4 = c4 + 4*V(d(a+i)/2);
end

% Calculate the coeff 2 guy
c2 = 0;
for i = 2:2:n-1
    c2 = c2 + 2*V(d(a+i)/2);
end

V = pi*(h * (V(d(a)/2) + c4 + c2 + V(d(b)/2))/3);