%% Algorithm
% Form a
a = [1  1  0  3 ; 
     2  1 -1  1 ; 
     3 -1 -1  2 ; 
    -1  2  3 -1];

% Form b
b = [4 ; 
     1 ; 
    -3 ; 
     4];

% Form a|b
ab = [a,b];

% Find rows and columns
[R, C] = size(ab);
n = R;

for j = 1:R-1
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C) - (ab(i,j)/ab(j,j))*ab(j,j:C);
    end
end

x = zeros(R,1);

% Set xn for back substitution
x(n) = ab(n,n+1)/ab(n,n);

for i = R-1:-1:1
    x(i) = (ab(i,C)-(ab(i,i+1:R)*x(i+1:R)))/ab(i,i);
end
x
%% Example
% Be careful with matrix being upper triangular
% Better way would be to convert this to a function
% Form a
a = [2  3  3  4;
     4  0 0.5  -1 ;
     0  1  -2  0 ; 
     0  0  1  -1 ; 
     
     ];

% Form b
b = [20;
     0 ; 
     0 ; 
     -1];

% Form a|b
ab = [a,b];

% Find rows and columns
[R, C] = size(ab);
n = R;

for j = 1:R-1
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C) - (ab(i,j)/ab(j,j))*ab(j,j:C);
    end
end

x = zeros(R,1);

% Set xn for back substitution
x(n) = ab(n,n+1)/ab(n,n);

for i = R-1:-1:1
    x(i) = (ab(i,C)-(ab(i,i+1:R)*x(i+1:R)))/ab(i,i);
end
x