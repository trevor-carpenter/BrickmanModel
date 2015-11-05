function [ brickmanModel ] = BrickmanModelHelper(dx,L,dy,W,dt,T,startX,startY,x0,R,u0,method,options)
%BRICKMANMODELHELPER runs Brickman penisula model
%   [ brickmanModel ] = BrickmanModelHelper(dx,L,dy,W,dt,T,startX,startY,x0,R,u0,method,options)
%   Run the Brickman model with the parameters and the output retuned in a
%   struct. The input parameters are as follows:
%       dx      aGrid element side length (m)
%       L       model domain length (m)
%       dy      aGrid element side length (m)
%       W       model domain width (m)
%       dt      time step size (s)
%       T       total time to simulate (s)
%       startX  start position x coordinate applied to all particles (m)
%       startY  array of start position y coordinates (m)
%       x0      centre of penisula (m)
%       R       radius of peninsula (m)
%       u0      initial velocity of particles t=0
%       method  string containing name of solution method
%       options used by some solution methods to control step size
%   The input parameters and the results are returned in a struct, in 
%   particular: 
%   brickmanModel.aGridSamples      see brickmanAGrid for details
%   brickmanModel.particlePositions array of particle position indexed as
%   (particle number index,time step index,[u,v,t])
%   

%   Copyright (c) [2015] [sams.ac.uk]
%   This content is released under a modified MIT License.
%   (https://opensource.org/licenses/MIT)
%   with the additional clause:
%   Except as contained in this notice, the name(s) of the above copyright 
%   holders shall not be used in advertising or otherwise to promote the 
%   sale, use or other dealings in this Software without prior written 
%   authorization.




brickmanModel.dx=dx;
brickmanModel.L=L;
brickmanModel.dy=dy;
brickmanModel.W=W;
brickmanModel.dt=dt;
brickmanModel.T=T;
brickmanModel.startX=startX;
brickmanModel.startY=startY;
brickmanModel.x0=x0;
brickmanModel.R=R;
brickmanModel.u0=u0;
brickmanModel.method=method;
brickmanModel.options=options;
brickmanModel.numberOfTimeSteps=floor(T/dt)+1;
brickmanModel.numberOfParticles=length(startY);
brickmanModel.particlePositions=zeros(brickmanModel.numberOfParticles,brickmanModel.numberOfTimeSteps,3);
brickmanModel.aGridSamples=brickmanAGrid(0,dx,L,0,dy,W,x0,R,u0);
switch method
    case 'ODE45'
            h = @brickmanSolveOde45;
    case 'RK4'
            h = @brickmanSolveRk4;
    case 'EULER'
            h = @brickmanSolveEuler;
    otherwise
        disp('Unknown method.')
end
for particle=1:1:brickmanModel.numberOfParticles
    [To,Yo] = h(0,dt,T,startX,startY(particle),x0,R,u0,options);
    for timeStep=1:1:brickmanModel.numberOfTimeSteps
        brickmanModel.particlePositions(particle,timeStep,:)=[Yo(timeStep,:),To(timeStep)];
    end
end

end

