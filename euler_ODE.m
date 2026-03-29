% See notion 6.1 and notebook page 170
a = 0;
b = 2;
h = 0.2;
n = (b-a)/h;
alpha = 0.5;
f = @(t,y) y - t.^2 + 1;

t = zeros(1,n+1);
y = zeros(1,n+1);

t(1) = a;
y(1) = alpha;

for i = 1:n
    y(i+1) = y(i) + f(t(i), y(i))*h;
    t(i+1) = t(i) + h;
end

plot(t, y, 'ro');
hold on;
t_act = 0:0.2:2;
f_act = @(t) (t+1).^2 - 0.5*exp(t);

plot(t_act, f_act(t_act), 'b-.');
legend('Euler', 'Actual');