function theta = psudo_inv_damp_jointres(J, damp, V, alpha, theta, j_gains, bias_angle)
delta_theta = J'*inv(J*J' + eye(3).*damp^2)*V + (J'*inv(J*J'+ eye(3).*damp^2)*J - eye(3))*(j_gains.*((theta-(bias_angle).^2)));

for i=1:3
    if delta_theta(i) > alpha
        delta_theta(i) = alpha;
    elseif delta_theta(i) < -alpha
        delta_theta(i) = -alpha;
    end
end
theta = theta + delta_theta;
end
