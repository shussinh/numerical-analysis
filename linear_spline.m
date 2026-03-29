t = [  0, 2.02, 2.86, 3.5, 4.04, 4.51]; % x
h = [100,   80,   60,  40,   20,    0]; % y

n = length(t);

xint = 3;

for i = 2:n
    if xint < t(i)
        break;
    end
end

yint = ((xint - t(i))/(t(i-1)-t(i)))*h(i-1) + ...
       ((xint-t(i-1))/(t(i)-t(i-1)))*h(i);

plot(t, h, 'ro');
hold on;
plot(xint, yint, 'p');