function [s, P, theta, uparm, loarm, hand] = I_Kin_Start(start, Length, alpha, damp)
theta = [0;0;0]; % column vector of joint angles
P = zeros(3, 2); % column vector of joint positions (x,y)
max_L = sum(Length); % max arm reach
threshold = [0.01, 0.01];
% check if start location is within reach
if max_L < (start(1)^2 + start(2)^2)^(1/2)
    msgID = 'Invrs_Kin:OutOfRange';
    msg = 'A start location that is out of reach of the arm has been chosen';
    baseException = MException(msgID,msg);
    throw(baseException)
end
%% local coord calcs
[X_global, Y_global] = local_coord(Length, theta);

%% arm update 
[P, s, uparm, loarm, hand] = arm_update(X_global, Y_global);

%% repeate as it closes in to threshold of target point
while any((s(3,:) > start+threshold) | (s(3,:) < start-threshold))==1
    %% jacobian
    [J,V] = jacob_IK(s, start, P);
        
    %% pseudoinverse with dampening
    theta = psudo_inv_damp(J, damp, V, alpha, theta);
    
    %% local coord calcs
    [X_global, Y_global] = local_coord(Length, theta);
    
    %% arm update
    [P, s, uparm, loarm, hand] = arm_update(X_global, Y_global);

end
end