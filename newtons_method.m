%% Section 1
% End Points
% (not needed for the method itself)
a = 0;
b = 1;

% Tolerance
TOL = 10^-2;

% Polynomial
f = [1, -7, 14, -6];
df = [3, -14, 14];

% Max iterations
N = 100;

x_0 = 0;

found = false;


for i = 1:N
    x = x_0 - (polyval(f, x_0)/polyval(df, x_0));

    if abs((x-x_0)/max(eps, abs(x_0))) < TOL
        found = true;
        fprintf("Found the root %.6f at iteration %d\n", x, i);
        break;
    end

    x_0 = x;
end

if ~found
    print("Failed to find the root!\n")
end

%% Section 2: Example

% Tolerance
TOL = 10^-6;

% Constants
h = 4;
r = 1.1;
V = 28.875/3;

% Polynomial
f = @(H) pi*((r^2 * h)/3 + (r^2 * H)/2 + (H^3)/6) - V;
df = @(H) pi*((r^2)/2 + (H^2)/2);

% % Use the graph to check the nearest value for zero
% % We'll see that 1 is the nearest value
% fplot(f);
% grid on;

% Max iterations
N = 100;

x_0 = 1;

found = false;

for i = 1:N
    
    x = x_0 - (f(x_0)/df(x_0));

    % Since we're given absolute tolerance -
    % we're using absolute error
    if abs(x-x_0) < TOL
        found = true;
        fprintf("Found the root %.6f at iteration %d\n", x, i);
        break;
    end

    x_0 = x;
end

if ~found
    print("Failed to find the root!\n")
end