a = 0;
b = 1.2;
h = 0.4;
n = int32((b-a)/h);
m = 2;
alpha = [1, 2];

k = zeros(4, m);
t = zeros(1, n+1);
u = zeros(m, n+1);

t(1) = 0;

f{1} = @(~,x,y) 2*(x+y);
f{2} = @(~,x,y) 2*x - y;

for i = 1:m
    u(i,1) = alpha(i);
end
s = 0;
for i = 1:n
    % k1
    for j = 1:m
        k(1, j) = f{j}(t(i), u(1,1+s), u(2,1+s));
    end
    
    % k2
    for j = 1:m
        k(2, j) = f{j}(t(i) + h/2, u(1,1+s) + k(1,1)*h/2, u(2,1+s) + k(1,2)*h/2);
    end

    % k3
    for j = 1:m
        k(3, j) = f{j}(t(i) + h/2, u(1,1+s) + k(2,1)*h/2, u(2,1+s) + k(2,2)*h/2);
    end

    % k4
    for j = 1:m
        k(4, j) = f{j}(t(i) + h/2, u(1,1+s) + k(3,1)*h, u(2,1+s) + k(3,2)*h);
    end

    for j = 1:m
        u(j, i+1) = u(j, i) + (k(1,j) + 2*k(2,j) + 2*k(3,j) + k(4,j))*h/6;
    end
    t(i+1) = t(i) + h;
    s = s+1;
end

exact_x = (exp(-2*t) .* (8*exp(5*t)-3))/5;
exact_y = (2*exp(-2*t) .* (2*exp(5*t)+3))/5;
plot(t, exact_x, 'r');
hold on;
plot(t, exact_y, 'k');
plot(t, u(1,:), 'rs');
plot(t, u(2,:), 'ks');