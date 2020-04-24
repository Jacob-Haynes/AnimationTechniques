function [X_global, Y_global] = local_coord(Length, theta)
X_local = Length .* cos(theta);
Y_local = Length .* sin(theta);
% global
X_global(1) = X_local(1); Y_global(1) = Y_local(1);
X_global(2) = X_local(1) + X_local(2); Y_global(2) = Y_local(1) + Y_local(2);
X_global(3) = X_global(2) + X_local(3); Y_global(3) = Y_global(2) + Y_local(3);
end