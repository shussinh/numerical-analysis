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
% Calculate the summation
s = 0;
for i = 2:n
    s = s + S(d(i)/2);
end

SA = 2*pi*(h*(S(d(a)/2) + S(d(b)/2))/2 + h*s);

% Calculating V
% Calculate the summation
s = 0;
for i = 2:n
    s = s + V(d(i)/2);
end

Vol = pi*(h*(V(d(a)/2) + V(d(b)/2))/2 + h*s);

% Using unequal interval formula
s = 0;
for i = 1:n
    s = s + (S(d(i)/2) + S(d(i+1)/2))*(z(i+1) - z(i));
end

SA_ = 0.5*s*2*pi;

s = 0;
for i = 1:n
    s = s + (V(d(i)/2) + V(d(i+1)/2))*(z(i+1) - z(i));
end

Vol_ = 0.5*s*pi;

%% Example 2
% See notion 5.7 for full problem statement
U = (160*1000)/3600;
L = 3;
C = 0.5;
rho = 1.225;

f = @(x) x.^2 - 1;

x   = [0, 0.0125, 0.025, 0.0375,  0.05,   0.1,  0.15,   0.2,  0.25,   0.3,  0.35,   0.4, 0.45,  0.5];
uoU = [0,  0.969, 1.241,  1.279, 1.279, 1.286, 1.305, 1.314, 1.310, 1.201, 1.072, 0.948, 0.857, 0.804];

const = (rho * U*U * L)/2;

n = length(x)-1;

fx = f(uoU);

% Using unequal interval formula
s = 0;
for i = 1:n
    s = s + (fx(i) + fx(i+1))*(x(i+1)-x(i));
end

sol = const*(0.5*s)

% In built trapz
% const*trapz(x, fx)