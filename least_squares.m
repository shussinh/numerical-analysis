% Form T = mh + b

% h is our x
h = [-1000, 0, 3000, 8000, 15000, 22000, 28000];

% t is our y
t = [213.9, 212, 206.2, 196.2, 184.4, 172.6, 163.1];

Sx = sum(h);
Sxx = sum(h.*h);
Sy = sum(t);
Sxy = sum(h.*t);
n = length(h);

% our a0 is b
b = (Sxx*Sy - Sxy*Sx)/(n*Sxx - Sx^2);
% and a1 is m
m = (n*Sxy - Sx*Sy)/(n*Sxx - Sx^2);

% Let's see the actual points first
plot(h, t, 'ro');

hold on;

% Now we check our line
plot(h, m*h+b);
