function cur_steps = slow_IO(s, t, dist_to_targ, numSteps)
cur_dist_targ = norm(s(3,:)-t);
if cur_dist_targ > dist_to_targ/2
    cur_steps = numSteps*(cur_dist_targ/(dist_to_targ/2))*2;
else
    cur_steps = numSteps*((dist_to_targ/2)/cur_dist_targ);
end
if cur_steps < 30
    cur_steps = 30;
else if cur_steps > 100
        cur_steps = 100;
end
end