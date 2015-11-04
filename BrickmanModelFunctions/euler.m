function [ T,Y ] = euler( ode,t,h,y,options)
%EULER Summary of this function goes here
%   Detailed explanation goes here
a=ode(t,y);
Y=y'+h*a;
T=t+h;
end

