function [v2] = Velocity(t1, t2, v1)
cp = 6006;
v2 = sqrt(2*(cp*t1 + 0.5*(v1^2) - cp*t2));
end