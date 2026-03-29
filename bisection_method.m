% End Points
a = 0;
b = 1;

% Tolerance
TOL = 10^-2;

% Polynomial
pol = [1, -7, 14, -6];

% Max iterations
N = 100;

FA = polyval(pol, a);
FB = polyval(pol, b);
found = false;


for i = 1:N
    xns = a + (b-a)/2; % Avoid overflows
    Fxns = polyval(pol, xns);
    tol = abs(b-a)/2;

       % Avoid Fxns == 0
    if abs(Fxns) < 1e-12 || tol < TOL
        fprintf('Root approx: %.6f (iter %d, err<=%.6g)\n', xns, i, tol);
        found = true;
        break;
    end

    if FA*Fxns > 0
        a = xns;
        FA = Fxns; % Update here to avoid calculating it later
    else
        b = xns;
        % FB = Fxns; % Optional
    end
end

if ~found
    print("Failed to find the root!")
end