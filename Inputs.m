function [p1, v1, roh, t1] = Inputs()
p1 = 2116;
v1 = (5280*5)/36;
roh = 0.002377;
t1 = Ideal_gas_law(p1, roh);
end