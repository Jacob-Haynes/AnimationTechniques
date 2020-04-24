function landing = IK(s, t, P, threshold, Length, alpha, damp, theta, j_gains, bias_angle)
%% repeate as it closes in to threshold of target point
while any((s(3,:) > t+threshold) | (s(3,:) < t-threshold))==1
    %% Jacobian
    [J,V] = jacob_IK(s, t, P);
    
    %% pseudoinverse with dampening
    theta = psudo_inv_damp_jointres(J, damp, V, alpha, theta, j_gains, bias_angle);
    
    %% local coord calcs
    [X_global, Y_global] = local_coord(Length, theta);
    
    %% P, s update
    [P, s, uparm, loarm, hand] = arm_update(X_global, Y_global);
    
    %% save positions
    M = [uparm;loarm;hand];
    dlmwrite('frames.txt',M,'-append', 'roffset',1);
    
end
landing = s(3,:);
end