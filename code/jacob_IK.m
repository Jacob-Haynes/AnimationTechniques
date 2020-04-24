function [J,V] = jacob_IK(s, t, P)
%% jacobian
e = [t;t;t] - s;
end_effector_vector = s - P;
end_effector_vector = [end_effector_vector, zeros(3,1)];
joint_axis = [0,0,1];
V = [e(3,:),0]'; % desired change to end effector
g = zeros(3);
for i = 1:3
    g(i,:) = cross(joint_axis, end_effector_vector(i,:));
end
J = g';
end