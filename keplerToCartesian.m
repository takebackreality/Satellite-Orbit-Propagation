function [r,v] = keplerToCartesian(a,e,i,RAAN,argPer,theta,mu)
    % Compute distance
    p = a*(1-e^2);
    rPQW = (p/(1+e*cos(theta)))*[cos(theta); sin(theta); 0];
    vPQW = sqrt(mu/p)*[-sin(theta); e+cos(theta); 0];

    % Rotation matrix
    Rz_RAAN = [cos(RAAN) -sin(RAAN) 0; sin(RAAN) cos(RAAN) 0; 0 0 1];
    Rx_i = [1 0 0; 0 cos(i) -sin(i); 0 sin(i) cos(i)];
    Rz_argPer = [cos(argPer) -sin(argPer) 0; sin(argPer) cos(argPer) 0; 0 0 1];

    Q = Rz_RAAN*Rx_i*Rz_argPer;
    r = Q*rPQW;
    v = Q*vPQW;
end
