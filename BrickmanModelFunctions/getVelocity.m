function [ u,v ] = getVelocity(x,y,x0,R,u0)
%GETVELOCITY Return u and v velocities for the Brickman model
%   [ u,v ] = getVelocity(x,y,x0,R,u0) Calculates u and v at the specified 
%   location x,y for the Brickman penisula model see (1) with initial 
%   constant velocity u0 and penisula radius R and x cordinate x0.
%
%   (1) Manual of recommended practices for modelling physical
%   – biological interactions during fish early life.
%   pg 9-16 ICES COOPERATIVE RESEARCH REPORT N0.295
    if getStream(x,y,x0,R,u0)>=0.0 
        u=0;
        v=0;
    else
        xTrans = x-x0;  % translated x coordiante
        xTransSq = xTrans^2;  % translated x coordiante
        denominator = (xTransSq+y^2)^2;
        u = u0 - u0*R^2*(xTransSq-y^2)/denominator; %eq 12 pg 17
        v = -2*u0*R^2*xTrans*y/denominator; %eq 13 pg 17
    end
end

