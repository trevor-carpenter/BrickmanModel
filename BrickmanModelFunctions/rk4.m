function [ T,Y ] = rk4( ode,t,h,yOfx,options)
%RK4  Simple Euler ODE solver
%   [ T,Y ] = rk4( ode,t,h,y,options) estimates y at t+h using the 4th 
%   order Runge-Kutta method: 
%   f(t,y) = dy(t)/dt 
%   a = f(t,y)
%   b = f(t+h/2,y+ha/2)
%   c = f(t+h/2,y+hb/2)
%   d = f(t+h,y+hc)
%   y(t+h) = y(t) + h/6 (a+2b+2c+d) 
%   The step size h is applied directly. The derivatives of y at t are 
%   given by the function ode, t is the time at which to evaluate the 
%   dervatives, h is the step and y is the inital condition y(t). 
%   This method is supplied to allow iterative solution and comparison 
%   to ode45 - it is not recommend to use this method to produce high 
%   quality estimates of a solution. Options is unused.
%   see: https://en.wikipedia.org/wiki/Runge-Kutta_methods

%   Copyright (c) [2015] [sams.ac.uk]
%   This content is released under a modified MIT License.
%   (https://opensource.org/licenses/MIT)
%   with the additional clause:
%   Except as contained in this notice, the name(s) of the above copyright 
%   holders shall not be used in advertising or otherwise to promote the 
%   sale, use or other dealings in this Software without prior written 
%   authorization.

   
ho2=h/2;
a=ode(t,yOfx); %a is in the space of dy(x)/dx
b=ode(t+ho2,yOfx+ho2*a); %then ho2*a is in the space y(x) 
c=ode(t+ho2,yOfx+ho2*b);
d=ode(t+h,yOfx+h*c);
Y=yOfx+h*(a+2*b+2*c+d)/6;
T=t+h;
end

