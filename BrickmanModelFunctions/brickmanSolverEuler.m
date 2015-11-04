function [ T,Y ] = brickmanSolverEuler(startTime,deltaT,endTime,startX,startY,x0,R,u0,options)
%BRICKMANSOLVEREULER Resolve particle positions for the Brickman penisula model using fixed step size Euler method
%   [ T,Y ] = brickmanSolverEuler(startTime,deltaT,endTime,startX,startY,x0,R,u0,options)
%   Resolve particle positions for the Brickman penisula model using fixed 
%   step size Euler method implemented in the euler function. The positions 
%   are estimated starting at time startTime and ending at or before time 
%   endTime using a fixed step length deltaT. The initial position of the 
%   particle is given by startX and startY. The evaluation times are 
%   returned in T with the estimated position coordinates in Y. To obatin a
%   position estimate at endTime, endTime must be exactly divisible by 
%   deltaT, otherwise the final evaluation will be at 
%   deltaT*floor(endTime/deltaT). The Brickman penisula model (1) is fully 
%   specified by the penisula radius R, x cordinate x0 and initial constant 
%   velocity u0. options is currently unused.
%
%   (1) Manual of recommended practices for modelling physical
%   – biological interactions during fish early life.
%   pg 9-16 ICES COOPERATIVE RESEARCH REPORT N0.295

    nSteps=floor((endTime-startTime)/deltaT);
    T=zeros(nSteps,1);
    T(1)=startTime;
    Y=zeros(nSteps,2);
    Y(1,:)=[startX,startY];
    for step=1:1:nSteps    
        [T(step+1,:),Y(step+1,:)]= euler(@(t,y) brickmanFun(t,y,x0,R,u0),T(step,:),deltaT,Y(step,:),options);
    end
end





