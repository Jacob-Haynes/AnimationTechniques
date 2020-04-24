function [P, s, uparm, loarm, hand] = arm_update(X_global, Y_global)
%% joints
P(1,:) = [0,0];
P(2,:) = [X_global(1), Y_global(1)];
P(3,:) = [X_global(2), Y_global(2)];

%% end effectors
s = [X_global', Y_global'];
%% arm positions
uparm = [P(1,:);s(1,:)];
loarm = [P(2,:);s(2,:)];
hand = [P(3,:);s(3,:)];
end