x = [     8.3,      8.6,      8.7];
y = [17.56492, 18.50515, 18.82091];

% Hardcoding for now
n = 3;

% This needs to be a symbolic variable
% syms xsym;
% But I don't have money to buy that toolbox
xsym = 8.4;

% Preallocate L
L = zeros(1, n);

% Σ
for i = 1:n
    % Π
    L(i) = 1;
    for j = 1:n
        if j ~= i
            L(i) = L(i)*((xsym-x(j))/(x(i) - x(j)));
        end
    end
end

fprintf("The value at xsym is: %0.5f\n", sum(y.*L));