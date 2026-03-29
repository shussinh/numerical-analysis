% Use 2nd RK mid-pt to approximate the solution to IVP:
% y' = 1 + (y/x) ; 1 <= x <= 2 ; y(1) = 2 ; h = 0.25

a = 1;
b = 2;
h = 0.25;
alpha = 2;
n = (b-a)/h;

x = zeros(1, n+1);
y = zeros(1, n+1);

x(1) = a;
y(1) = alpha;

f = @(x, y) 1 + (y/x);

for i = 1:n
    k1 = f(x(i), y(i));
    k2 = f(x(i) + (h/2), y(i) + (k1*h)/2);
    k3 = f(x(i)+(h/2), y(i) + (k2*h)/2);
    k4 = f(x(i)+h, y(i)+k3*h);
    y(i+1) = y(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    x(i+1) = x(i) + h;
end

f_act = @(x) x.*log(x) + 2*x;

plot(x, y, 'ro');
hold on;
plot(x, f_act(x), 'b-.');
legend('RK4', 'Actual');