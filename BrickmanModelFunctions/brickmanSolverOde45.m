function [T,Y] = brickmanSolveOde45(startTime,deltaT,endTime,startX,startY,x0,R,u0,options)
%BRICKMANSOLVERODE45 Resolve particle positions for the Brickman penisula model using the adpative 4th order Runge-Kutta method
%   [T,Y] = brickmanSolveOde45(startTime,deltaT,endTime,startX,startY,x0,R,u0,options) 
%   Resolve particle positions for the Brickman penisula model using the 
%   adpative 4th order Runge-Kutta method implemented in the ode45 function. 
%   The positions are estimated starting at time startTime and ending at 
%   time endTime using an adaptive step length deltaT. The initial position 
%   of the particle is given by startX and startY. Options is used to 
%   specify the Absolute and relative errors (see ode45 for more details). 
%   The evaluation times are returned in T which will be separated by 
%   deltaT regardless of what steps are used internally by ode45. The 
%   estimated position coordinates are in Y. The Brickman penisula 
%   model (1) is fully specified by the penisula radius R, x cordinate x0 
%   and initial constant velocity u0. 
%
%   (1) Manual of recommended practices for modelling physical
%   – biological interactions during fish early life.
%   pg 9-16 ICES COOPERATIVE RESEARCH REPORT N0.295

%   Copyright (c) [2015] [sams.ac.uk]
%   This content is released under a modified MIT License.
%   (https://opensource.org/licenses/MIT)
%   with the additional clause:
%   Except as contained in this notice, the name(s) of the above copyright 
%   holders shall not be used in advertising or otherwise to promote the 
%   sale, use or other dealings in this Software without prior written 
%   authorization.

    T=startTime:deltaT:endTime;
    [T,Y] = ode45(@(t,y) brickmanFun(t,y,x0,R,u0),T,[startX,startY],options);
end