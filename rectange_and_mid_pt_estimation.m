% Here's our limits of integration
a = 0;
b = 2;

% Our f(x)
f = @(x) x.^2 + 3;

% We're given to use 4 rectangles, i.e. n = 4
n = 4;

% Calculate h
h = (b-a)/n;

% We'll use est_rec to calculate the estimate via rectangle method
est_rec = 0;
x = a;
for i = 1:n
    est_rec = est_rec + h*f(x);
    x = x + h;
end

% Expected 7.75
est_rec;

% Now we'll use est_mid to calculate the estimate using mid point method
est_mid = 0;
xi = a;
xi_1 = xi+h;
for i = 1:n
    est_mid = est_mid + h*f((xi+xi_1)/2);
    xi = xi_1;
    xi_1 = xi_1+h;
end

% Expected 8.625
est_mid;

% Now, we'll calculate the actual value

% Create the polynomial
poly = [1 0 3];
% Integrate the polynomial
int_poly = polyint(poly);
% Evaluate the integrated polynomial at a and b
int_poly_val = polyval(int_poly, [a b]);

% Expecting 8.667 - we do f(b) - f(a)
act = int_poly_val(2) - int_poly_val(1);