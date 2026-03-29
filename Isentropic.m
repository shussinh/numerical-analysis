function [t2] = Isentropic(t1, p1, p2)
t2 = t1 * (p2/p1).^(2/7);
end