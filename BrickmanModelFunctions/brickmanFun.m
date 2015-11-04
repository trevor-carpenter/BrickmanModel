function [ dxdywrtt ] = brickmanFun(deltaT,currentPosition,x0,R,u0)
%BRICKMANFUN Helper function to wrap u and v velocities for the Brickman model
%   [ dxdywrtt ] = brickmanFun(deltaT,currentPosition,x0,R,u0) Uses 
%   getVelocity to return the u and v velocities for the Brickman penisula 
%   model (1) which is fully specified by the penisula radius R, 
%   x cordinate x0 and initial constant velocity u0. The values are 
%   returned in a column vector.
%
%   (1) Manual of recommended practices for modelling physical
%   – biological interactions during fish early life.
%   pg 9-16 ICES COOPERATIVE RESEARCH REPORT N0.295 


%deltaT is ignored but may be required by some solvers?
% is it more convient to return a row vector???
dxdywrtt=zeros(2,1);
[u,v]=getVelocity(currentPosition(1),currentPosition(2),x0,R,u0);
dxdywrtt(1)=u;
dxdywrtt(2)=v;
end

