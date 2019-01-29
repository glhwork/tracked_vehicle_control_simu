function DrawMap()

%     hold on;
    %% show the wall
    wall_x = [4680, 4680, 5966,  5966,  6106, 6106, 4680];
    wall_y = [7075, 7232, 7232, 10313, 10313, 7075, 7075];
    plot(wall_x, wall_y, 'k', 'LineWidth', 2);

    %% show the border
    border_x = [0,     0,   460,   460,  7000, 7000, 0];
    border_y = [0, 10210, 10210, 11130, 11130,    0, 0];
    plot(border_x, border_y, 'k', 'LineWidth', 2.5);    
    
    axis([-1000, 12000, -1000, 12000]);
    axis equal;
%     grid on;

end