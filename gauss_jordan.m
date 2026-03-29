%% Way 1
% Form a
a = [ 2 -2  1 ; 
      3  2 -5 ; 
     -1  2  3];

% Form b
b = [ 10 ; 
     -16 ; 
       8];

% Form a|b
ab = [a,b];

% Find rows and columns
[R, C] = size(ab);

% This is Gaussian Elimination - we get the upper triangular matrix
for j = 1:R-1
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C) - (ab(i,j)/ab(j,j))*ab(j,j:C);
    end
end

% This creates the diagonal matrix we're looking for
for j = R:-1:2
    for i = j-1:-1:1
        ab(i, j:C) = ab(i, j:C) - (ab(i,j)/ab(j,j))*ab(j,j:C);
    end
    ab(j,:) = ab(j,:)/ab(j,j);
end
ab(j-1,:) = ab(j-1,:)/ab(j-1,j-1);

x = ab(:, end);

%% Way 2
% Form a
a = [ 2 -2  1 ; 
      3  2 -5 ; 
     -1  2  3];

% Form b
b = [ 10 ; 
     -16 ; 
       8];

% Form a|b
ab = [a,b];

for j = 1:R
    ab(j,:) = ab(j,:)/ab(j,j);
    for i = 1:R
        if i ~= j
            ab(i,j:C) = ab(i,j:C) - ab(i,j)*ab(j,j:C);
        end
    end
end

x = ab(:, end);