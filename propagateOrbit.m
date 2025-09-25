function [t,rv] = propagateOrbit(r0,v0,mu,tspan)
    % Propagate orbit using ode45 and two-body equations
    y0 = [r0; v0];
    opts = odeset('RelTol',1e-8,'AbsTol',1e-8);
    [t,Y] = ode45(@(t,y) twoBodyODE(t,y,mu),tspan,y0,opts);
    rv = Y;
end

function dydt = twoBodyODE(~,y,mu)
    r = y(1:3);
    v = y(4:6);
    rnorm = norm(r);
    a = -(mu/rnorm^3)*r;
    dydt = [v; a];
end
