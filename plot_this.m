function [ out ] = plot_this(F, a, b)
t = linspace(a,b,100);
y = F(t);
out(1) = F(a);
out(2) = F(b);
plot(t, y);
xlabel("t");
ylabel("f(t)");
end