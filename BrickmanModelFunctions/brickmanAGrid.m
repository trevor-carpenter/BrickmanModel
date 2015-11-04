function [ s ] = brickmanAGrid(xMin,deltaX,xMax,yMin,deltaY,yMax,x0,R,u0)
%BRICKMANAGRID Return properties of the Brickman model on a regular grid
%   [ s ] = brickmanAGrid(xMin,deltaX,xMax,yMin,deltaY,yMax,x0,R,u0) 
%   Calculates x and y, u and v velocities and stream function for the 
%   Brickman model (1). The coordinates and function values rae at cell 
%   centres for a regular grid with bounding box given by 
%   xMin,xMax,yMin,yMax with rectgular elements of side lengths delatX and 
%   deltaY. The x and y coordinates, velocities u and v and stream function 
%   are evlauated at cell centres as specified for an A grid (2).
%   The Brickman penisula model is specifed by a penisula radius R located 
%   at x cordinate x0 and with the initial far field velocity u0.
%
%   (1) Manual of recommended practices for modelling physical
%   – biological interactions during fish early life.
%   pg 9-16 ICES COOPERATIVE RESEARCH REPORT N0.295
%   
%   (2) "Computational design of the basic dynamical processes of the UCLA 
%    general circulation model". 
%    Arakawa, A.; Lamb, V.R. (1977). pg 173–265 Methods of Computational 
%    Physics 17.

[xCoords,yCoords]=meshgrid(xMin+deltaX/2:deltaX:xMax-deltaX/2,yMin+deltaY/2:deltaY:yMax-deltaY/2);
    [rN,cN] = size(xCoords);
    s=zeros(rN,cN,5);
    s(:,:,1)=xCoords;
    s(:,:,2)=yCoords;
    for rowIndex=1:1:rN
        for colIndex=1:1:cN
            [u,v]=getVelocity(xCoords(rowIndex,colIndex),yCoords(rowIndex,colIndex),x0,R,u0);
            s(rowIndex,colIndex,3) = u;
            s(rowIndex,colIndex,4) = v;
            s(rowIndex,colIndex,5) = getStream(xCoords(rowIndex,colIndex),yCoords(rowIndex,colIndex),x0,R,u0);
        end
    end
end

