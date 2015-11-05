function [ s ] = getStream(x,y,x0,R,u0)
%   GETSTREAM Return stream function for the Brickman model
%   [ s ] = getVelocity(x,y,x0,R,u0) Calculates stream function at the 
%   specified location x,y for the Brickman penisula model see (1) with 
%   initial constant velocity u0 and penisula radius R and x cordinate x0.
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


    xTrans = x-x0;  % translated x coordiante
    xTransSq = xTrans^2;  % translated x coordiante
    denominator = xTransSq+y^2;
    s = u0*R^2*y/denominator-u0*y; %eq 11 pg 17
end