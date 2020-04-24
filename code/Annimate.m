function Annimate(t_x, t_y, dist_to_targ, frame_time, numSteps)
M = dlmread('frames.txt', ',', 1,0);
keynumber = size(M,1)/7;
t = [t_x, t_y];
for keyframe = 0 : keynumber-2
    %% get points out of CSV file
    Uj = [[M((keyframe*7)+2, 1);M((keyframe*7)+2,2)],[M(((1+keyframe)*7)+2,1);M(((1+keyframe)*7)+2,2)]];
    Lj = [[M((keyframe*7)+4, 1);M((keyframe*7)+4,2)],[M(((1+keyframe)*7)+4,1);M(((1+keyframe)*7)+4,2)]];
    Hj = [[M((keyframe*7)+6, 1);M((keyframe*7)+6,2)],[M(((1+keyframe)*7)+6,1);M(((1+keyframe)*7)+6,2)]];
    Ue = [[M((keyframe*7)+3, 1);M((keyframe*7)+3,2)],[M(((1+keyframe)*7)+3,1);M(((1+keyframe)*7)+3,2)]];
    Le = [[M((keyframe*7)+5, 1);M((keyframe*7)+5,2)],[M(((1+keyframe)*7)+5,1);M(((1+keyframe)*7)+5,2)]];
    He = [[M((keyframe*7)+7, 1);M((keyframe*7)+7,2)],[M(((1+keyframe)*7)+7,1);M(((1+keyframe)*7)+7,2)]];
    %% slow in slow out
    s = [Ue(1,1),Ue(2,1);Le(1,1),Le(2,1);He(1,1),He(2,1)];
    cur_Steps = slow_IO(s, t, dist_to_targ, numSteps);
    %% interp
    Ujtrajectory = interp(Uj(1,:), Uj(2,:), cur_Steps);
    Ljtrajectory = interp(Lj(1,:), Lj(2,:), cur_Steps);
    Hjtrajectory = interp(Hj(1,:), Hj(2,:), cur_Steps);
    Uetrajectory = interp(Ue(1,:), Ue(2,:), cur_Steps);
    Letrajectory = interp(Le(1,:), Le(2,:), cur_Steps);
    Hetrajectory = interp(He(1,:), He(2,:), cur_Steps);
    Utrajectory = [Ujtrajectory',Uetrajectory'];
    Ltrajectory = [Ljtrajectory',Letrajectory'];
    Htrajectory = [Hjtrajectory',Hetrajectory'];
    %% pass to plot
    [~,~,~]=makeKeyFrame(t_x, t_y, frame_time,Utrajectory,Ltrajectory,Htrajectory,cur_Steps);
end
end