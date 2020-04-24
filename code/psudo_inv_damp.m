function theta = psudo_inv_damp(J, damp, V, cur_alpha, theta)
delta_theta = J'*inv(J*J' + eye(3).*damp^2)*V;
for i=1:3
    if delta_theta(i) > cur_alpha
        delta_theta(i) = cur_alpha;
    elseif delta_theta(i) < -cur_alpha
        delta_theta(i) = -cur_alpha;
    end
end
theta = theta + delta_theta;
end