function trajectory = interp(x, y, numSteps)
trajectory = [linspace(x(1), x(2), numSteps); linspace(y(1), y(2), numSteps)];
end