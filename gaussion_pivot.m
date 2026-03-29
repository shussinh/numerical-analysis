a = [0  1 3 4 ; 
     0  0 5 7 ; 
     2 10 9 3];

[R, C] = size(a);

for j = 1:R-1
    if a(j,j) == 0
        for k = j+1:R
            if a(k,j) ~= 0
                % deal() takes inputs and distributes them
                % across multiple outputs.
                % [a, b] = deal(10, 20); makes a = 10 and b = 20
                %
                % We can swap 3 vars, 10 vars, rotate,
                % permute, whatever chaos we desire
                [a(j,:), a(k,:)] = deal(a(k,:), a(j,:));
                break;
            end
        end
    end
end
