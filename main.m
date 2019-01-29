clear;
clc;

% hold on;
% DrawMap();

PI = 3.14159265;
dt = 0.2;
start_p = [2800, 3300]; 
goal_p = [5323, 8232];
% goal_p = [10000, 8232];
robot_config = [290, 1];

robot_figure_x = [480, -480,  480, -480,   0,    0];
robot_figure_y = [290,  290, -290, -290, 290, -290];

[path_x, path_y] = PathGenerate(start_p, goal_p);
% PlotPath(path_x, path_y);

pose = [0, -1, 0, start_p(1);...
        1, 0,  0, start_p(2);...
        0, 0,  1,          0;...
        0, 0,  0,          1];
yaw = PI / 2;

% PlotPose(pose, robot_figure_x, robot_figure_y);

figure;
while (1)
   
    [speed_left, speed_right] = PurePursuit(pose, path_x, path_y, robot_config);
    cur_yaw = yaw;
    [dx, dy, d_yaw, yaw] = GetDeltaPosi(speed_left, speed_right, dt, robot_config, cur_yaw);
    disp('=====================');
    [speed_left, speed_right, dx, dy, d_yaw]
    pose(1,4) = pose(1,end) + dx;
    pose(2,4) = pose(2,end) + dy;
    T = GetRotation(d_yaw);
    pose(1:3, 1:3) = pose(1:3, 1:3) * T;
    
    hold on;
    DrawMap();
    PlotPath(path_x, path_y);
    PlotPose(pose, robot_figure_x, robot_figure_y);
    pause(0.01);
    hold off;
    
    
end