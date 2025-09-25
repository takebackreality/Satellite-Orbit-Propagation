% main.m - Satellite Orbit Propagation using Two-Body Dynamics
clear; clc; close all;

% Gravitational parameter (Earth) [km^3/s^2]
mu = 398600;

% Example Keplerian elements (semi-major axis, ecc, inc, RAAN, argPer, true anomaly)
a = 7000; % km
e = 0.01;
i = deg2rad(45); % radians
RAAN = deg2rad(30);
argPer = deg2rad(40);
theta0 = deg2rad(0);

% Convert to Cartesian state vector
[r0,v0] = keplerToCartesian(a,e,i,RAAN,argPer,theta0,mu);

% Propagate orbit for 2 hours
tspan = [0 7200];
[t,rv] = propagateOrbit(r0,v0,mu,tspan);

% Plot results
plotOrbit(rv);
