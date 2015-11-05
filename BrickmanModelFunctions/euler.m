function [ T,Y ] = euler( ode,t,h,y,options)
%EULER Simple Euler ODE solver
%   [ T,Y ] = euler( ode,t,h,y,options) estimates y at t+h using the Euler
%   method: 
%   f(t,y) = dy(t)/dt 
%   y(t+h) = y(t) + h f(t,y). The step size h is applied directly.
%   the derivatives of y at t are given by the function ode, t is the time 
%   at which to evaluate the dervatives, h is the step and y is the inital 
%   condition y(t). This method is supplied to allow iterative solution 
%   and comparison to ode45 - it is not recommend to use this method to 
%   produce high quality estimates of a solution. Options is unused.
%   see: https://en.wikipedia.org/wiki/Euler_method

%   Copyright (c) [2015] [sams.ac.uk]
%   This content is released under a modified MIT License.
%   (https://opensource.org/licenses/MIT)
%   with the additional clause:
%   Except as contained in this notice, the name(s) of the above copyright 
%   holders shall not be used in advertising or otherwise to promote the 
%   sale, use or other dealings in this Software without prior written 
%   authorization.


a=ode(t,y);
%TODO annoying transpose - I am doing something wrong
Y=y+h*a;
T=t+h;
end

