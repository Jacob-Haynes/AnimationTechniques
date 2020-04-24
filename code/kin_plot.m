function [plt1, plt2, plt3] = kin_plot(uparm, loarm, hand)
plt1 = plot(uparm(:,1), uparm(:,2),'LineWidth',1.5, 'Color', 'b');
hold on
plt2 = plot(loarm(:,1), loarm(:,2),'LineWidth',1.5, 'Color', 'b');
hold on
plt3 = plot(hand(:,1),hand(:,2),'LineWidth',1.5, 'Color', 'b');
end