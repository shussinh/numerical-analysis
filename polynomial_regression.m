%% Manual Approach
% Input:
% m (degree)
% data points (xi, yi)

x = [1815, 1845, 1875, 1905, 1935, 1965];
y = [8.3, 19.7, 44.4, 83.2, 127.1, 190.9];
m = 2;

n = length(x);

% Preallocate
xi = zeros(1, 2*m);
a = zeros(m+1, m+1);
b = zeros(m+1, 1);

% Get the xi powers
for i = 1:2*m
    xi(i) = sum(x.^i);
end

% Set the first element of first row
a(1,1) = n;

% Set the remaining first row
for j = 2:m+1
    a(1, j) = xi(j-1);
end

% Set the remaining A matrix
for i = 2:m+1
    for j = 1:m+1
        a(i,j) = xi(i+j-2);
    end
end

% Set the first element of b
b(1) = sum(y);

% Set the remaining elements of b
for i = 2:m+1
    b(i) = sum(x.^(i-1).*y);
end

x_ans = inv(a)*b;

plot(x, y, 'ro');
hold on;
f = @(x) x_ans(3)*x.^2 + x_ans(2)*x + x_ans(1);
plot(x, f(x));

%% polyfit
x = [1815, 1845, 1875, 1905, 1935, 1965];
y = [8.3, 19.7, 44.4, 83.2, 127.1, 190.9];
m = 2;

curve_fit = polyfit(x, y, m);

plot(x, y, 'ro');
hold on;
y_est = polyval(curve_fit,x);
plot(x, y_est);