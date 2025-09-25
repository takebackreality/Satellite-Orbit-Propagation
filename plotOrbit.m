function plotOrbit(rv)
    figure; plot3(rv(:,1),rv(:,2),rv(:,3),'b'); hold on;
    plot3(0,0,0,'ro','MarkerSize',8,'MarkerFaceColor','r');
    grid on; axis equal;
    xlabel('x [km]'); ylabel('y [km]'); zlabel('z [km]');
    title('Satellite Orbit Propagation');
end
