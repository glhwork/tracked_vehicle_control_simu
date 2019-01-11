clear;
clc;

hold on;
DrawMap();

dt = 0.5;
start_p = [2800, 3371]; 
goal_p = [5323, 8232];
robot_config = [290, 1];

robot_figure_x = [480, -480,  480, -480,   0,    0];
robot_figure_y = [290,  290, -290, -290, 290, -290];

[path_x, path_y] = PathGenerate(start_p, goal_p);
PlotPath(path_x, path_y);

pose = [0, -1, 0, start_p(1);...
        1, 0,  0, start_p(2);...
        0, 0,  1,          0;...
        0, 0,  0,          1];
PlotPose(pose, robot_figure_x, robot_figure_y);

while (1)
   
    [speed_left, speed_right] = PurePursuit(pose, path_x, path_y, robot_config);
    [dx, dy, d_yaw] = GetDeltaPosi(speed_left, speed_right, dt, robot_config);
    [speed_left, speed_right, dx, dy]
    pose(1,4) = pose(1,4) + dx;
    pose(2,4) = pose(2,4) + dy;
    T = GetRotation(d_yaw);
    pose(1:3, 1:3) = pose(1:3, 1:3) * T;
    PlotPose(pose, robot_figure_x, robot_figure_y);
    pause(0.5);
end