function [landing, dist_to_targ] = IK_GUI(L_u, L_l, L_h, start_x, start_y, t_x, t_y, alpha, damp, threshold, j_gains, bias_angle)
%% initilize
Length = [L_u, L_l, L_h]'; % column vector of lengths, [upper; lower; hand]
start = [start_x, start_y];
t = [t_x, t_y];
max_L = sum(Length); % max arm reach

% check to see if target is within reach
if max_L < (t_x^2 + t_y^2)^(1/2)
    msgID = 'Invrs_Kin:OutOfRange';
    msg = 'A target location that is out of reach of the arm has been chosen';
    baseException = MException(msgID,msg);
    throw(baseException)
end

%% move arms to start position
[s, P, theta, uparm, loarm, hand] = I_Kin_Start(start, Length, alpha, damp);
s_origin = s(3,:);
dist_to_targ = norm(s_origin - t);

%% create new simulation file
dlmwrite('frames.txt',0);
M = [uparm;loarm;hand];
dlmwrite('frames.txt',M,'-append', 'roffset',1);

%% set initial frame and axes
ax = gca;
cla
[~, ~, ~] = kin_plot(uparm, loarm, hand);
hold on
plttarget = scatter(t_x, t_y, 'MarkerEdgeColor', 'r');
axis([-max_L, max_L, -max_L, max_L]);
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold on

%% inverse kin
landing = IK(s, t, P, threshold, Length, alpha, damp, theta, j_gains, bias_angle);
end