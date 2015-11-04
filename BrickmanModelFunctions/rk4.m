function [ T,Y ] = rk4( ode,t,h,yOfx,options)
%RK4 Summary of this function goes here
%   Detailed explanation goes here
ho2=h/2;
a=ode(t,yOfx); %a is in the space of dy(x)/dx
%TODO annoying transpose - I am doing something wrong
b=ode(t+ho2,yOfx'+ho2*a); %then ho2*a is in the space y(x) 
%TODO annoying transpose - I am doing something wrong
c=ode(t+ho2,yOfx'+ho2*b);
%TODO annoying transpose - I am doing something wrong
d=ode(t+h,yOfx'+h*c);
%TODO annoying transpose - I am doing something wrong
Y=yOfx'+h*(a+2*b+2*c+d)/6;
T=t+h;
end

