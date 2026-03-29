x = [ 14,  22,  30,  38,  46];

% This is also our f[xi]
y = [320, 490, 540, 500, 480];

n = length(x);

xsym = 26;

% Preallocate
ai = zeros(1, n);
F = zeros(n-1, n-1);

ai(1) = y(1);

% Build our f[xi, xi-1]
for i = 1:n-1
    F(i,1) = (y(i+1)-y(i))/(x(i+1)-x(i));
end

% Fill the remaining columns
for j = 2:n-1
    for i = 1:n-j
        F(i,j) = (F(i+1,j-1) - F(i,j-1))/(x(j+i) - x(i));
    end
end

% Collect the ai
for j = 2:n
    ai(j) = F(1, j-1); 
end

% Find the final f(x)
yint = ai(1);
xn = 1;

for k = 2:n
    xn = xn*(xsym - x(k-1));
    yint = yint + ai(k)*xn;
end

F
yint