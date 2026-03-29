% x is our time
x = [ 0,  10,   20,   30,   40,   50,    60,    70,    80,    90,   100,   110,   120];

% y is our height
y = [-8, 241, 1244, 2872, 5377, 8130, 11617, 15380, 19872, 25608, 31412, 38309, 44726];

n = length(x);

% Preallocate the velocity
v = zeros(1, n);

% Preallocate the acceleration
a = zeros(1, n);

h = x(2) - x(1);

for i = 2:n-1
    v(i) = (y(i+1) - y(i-1))/(2*h);
    a(i) = (y(i-1) - 2*y(i) + y(i+1))/(h^2);
end

v(1) = (-3*y(1) + 4*y(2) - y(3))/(2*h);
a(1) = (2*y(1) - 5*y(2) + 4*y(3) - y(4))/(h^2);
v(n) = (y(n-2) - 4*y(n-1) + 3*y(n))/(2*h);
a(n) = (-y(n-3) + 4*y(n-2) - 5*y(n-1) + 2*y(n))/(h^2);

subplot(1, 3, 1);
plot(x, y, 'r');
title("Altitude");
xlabel("Time (s)");
ylabel("Altitude (m)");
axis tight;

subplot(1, 3, 2);
plot(x, v, 'b');
title("Altitude");
xlabel("Time (s)");
ylabel("Velocity (m/s)");
axis tight;

subplot(1, 3, 3);
plot(x, a, 'k');
title("Altitude");
xlabel("Time (s)");
ylabel("Accln (m/s2)");
axis tight;
