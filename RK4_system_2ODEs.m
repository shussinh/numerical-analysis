function [ est1,est2,t ] = RK4_system_2ODEs( a,b,h,alp1,alp2 )
%Solve a system of two 1st order ODEs using 4th order RK
N=(b-a)/h
t(1)=a;
est1(1)=alp1;
est2(1)=alp2;
w=[alp1;alp2];

for i=1:N+1
    k1=h*(deriv(w));
    k2=h*(deriv(w+.5*k1));
    k3=h*(deriv(w+.5*k2));
    k4=h*(deriv(w+k3));
    
    w=w+(k1+2*k2+2*k3+k4)/6;
    t(i+1)=a+i*h;
    est1(i+1)=w(1);
    est2(i+1)=w(2);
end
end

function [dx]=deriv(x)

dx(1,1)= 2*x(1)+2*x(2);
dx(2,1)= 2*x(1)-x(2);

end
