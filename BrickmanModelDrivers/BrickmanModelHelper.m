function [ brickmanModel ] = BrickmanModelHelper(dx,L,dy,W,dt,T,startX,startY,x0,R,u0,method,options)
%BRICKMANMODELHELPER Summary of this function goes here
%   Detailed explanation goes here
%contain
brickmanModel.numberOfTimeSteps=floor(T/dt)+1;
brickmanModel.numberOfParticles=length(startY);
brickmanModel.particlePositions=zeros(brickmanModel.numberOfParticles,brickmanModel.numberOfTimeSteps,3);
brickmanModel.aGridSamples=brickmanAGrid(0,dx,L,0,dy,W,x0,R,u0);
switch method
    case 'ODE45'
        for particle=1:1:brickmanModel.numberOfParticles
            [To,Yo] = brickmanSolveOde45(0,dt,T,startX,startY(particle),x0,R,u0,options);
            for timeStep=1:1:brickmanModel.numberOfTimeSteps
                brickmanModel.particlePositions(particle,timeStep,:)=[Yo(timeStep,:),To(timeStep)];
            end
        end
    case 'RK4'
        for particle=1:1:brickmanModel.numberOfParticles
            [To,Yo] = brickmanSolveRk4(0,dt,T,startX,startY(particle),x0,R,u0,options);
            for timeStep=1:1:brickmanModel.numberOfTimeSteps
                brickmanModel.particlePositions(particle,timeStep,:)=[Yo(timeStep,:),To(timeStep)];
            end
        end
    case 'EULER'
        for particle=1:1:brickmanModel.numberOfParticles
            [To,Yo] = brickmanSolveEuler(0,dt,T,startX,startY(particle),x0,R,u0,options);
            for timeStep=1:1:brickmanModel.numberOfTimeSteps
                brickmanModel.particlePositions(particle,timeStep,:)=[Yo(timeStep,:),To(timeStep)];
            end
        end
    otherwise
        disp('Unknown method.')
end

end

