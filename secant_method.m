%% Theory
% End Points
x0 = 0.5;
x1 = pi/4;

% Tolerance
TOL = 10^-6;

% Polynomial
f = @(x) cos(x) - x;

% fplot(f);
% grid on;

% Max iterations
N = 100;

found = false;

q0 = f(x0);
q1 = f(x1);

for i = 1:N
    x = x1 - (q1*(x0-x1))/(q0 - q1);
    if abs((x-x1)/x1) < TOL
        found = true;
        fprintf("Root found %0.6f at iteration %d\n", x, i)
        break;
    end
    x0 = x1;
    x1 = x;
    q0 = q1;
    q1 = f(x);
end

if ~found
    print("Failed to find the root!")
end

%% Example
months = 240;
loan = 300000;
mpay = 1684.57;

TOL = 10^-6;

% Max iterations
N = 100;

f = @(rate) mpay*12*(1 - 1./(1 + rate/12).^months) - loan*rate;
% x = 0:0.01:0.05;
% plot(x,f(x));
% grid on;

% End Points
x0 = 0.02;
x1 = 0.04;

found = false;

q0 = f(x0);
q1 = f(x1);

for i = 1:N
    x = x1 - (q1*(x0-x1))/(q0 - q1);
    if abs((x-x1)/x1) < TOL
        found = true;
        fprintf("Root found %0.6f at iteration %d\n", x*100, i)
        break;
    end
    x0 = x1;
    x1 = x;
    q0 = q1;
    q1 = f(x);
end

if ~found
    print("Failed to find the root!")
end
