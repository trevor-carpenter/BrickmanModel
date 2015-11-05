%Standard setup of Brickman penisula model

%   Copyright (c) [2015] [sams.ac.uk]
%   This content is released under a modified MIT License.
%   (https://opensource.org/licenses/MIT)
%   with the additional clause:
%   Except as contained in this notice, the name(s) of the above copyright 
%   holders shall not be used in advertising or otherwise to promote the 
%   sale, use or other dealings in this Software without prior written 
%   authorization.


%Length of domain (m)
L=100000;
%Width of doamin (m)
W=50000;
%grid cell size x
dx=1000;
%grid cell size y
dy=1000;
%Model Simulation Period (s)
T=24*60*60;
%Step Period (s)
dt=30;
%Intial x coordinate of particles (m)
startX=3000;
%Intial y coordinates of particles (m)
startY=450 + 45*(1:1:1000);
%centre of penisula (m)
x0=0.5*L;
%Radius of penisula (m)
R=0.32*W;
%initial velocity (m/s)
u0=1;

%solution method (uncomment PAIRS as required)
%method='EULER'; %Euler method
%options = [];

%method='RK4'; %fixed Runge-Kutta 4
%options = [];

method='ODE45'; %adaptive Runge-Kutta 4
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);

%display some graphical output
display=1;

%returns structure with model results
brickmanModel=BrickmanModelHelper(dx,L,dy,W,dt,T,startX,startY,x0,R,u0,method,options);

%tidy up
clear L W dx dy T dt startX startY x0 R u0;


