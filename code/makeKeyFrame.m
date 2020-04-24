function [plt1, plt2, plt3] = makeKeyFrame(t_x, t_y, frame_time, Utrajectory, Ltrajectory, Htrajectory, numSteps)
for frameNum = 1 : numSteps
    cla;
    plttarget = scatter(t_x, t_y, 'MarkerEdgeColor', 'r');
    plt1 = plot([Utrajectory(frameNum,1);Utrajectory(frameNum,3)], [Utrajectory(frameNum,2);Utrajectory(frameNum,4)],'LineWidth',1.5, 'Color', 'b');
    hold on
    plt2 = plot([Ltrajectory(frameNum,1);Ltrajectory(frameNum,3)], [Ltrajectory(frameNum,2);Ltrajectory(frameNum,4)],'LineWidth',1.5, 'Color', 'b');
    hold on
    plt3 = plot([Htrajectory(frameNum,1);Htrajectory(frameNum,3)], [Htrajectory(frameNum,2);Htrajectory(frameNum,4)],'LineWidth',1.5, 'Color', 'b');
    pause(frame_time)
end
end