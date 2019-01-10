function [path_x, path_y] = PathGenerate(position, goal)

    inter_point = [position(1), goal(2)];
    
    seg1_num = 50;
    seg2_num = 30;
    
    %% set value of the first segment of path
    seg1_step = abs(inter_point(2) - position(2)) / seg1_num;
    path_y_seg1 = position(2):seg1_step:inter_point(2);
    for i = 1:seg1_num
        path_x_seg1(i) = position(1);
    end
    
    %% set value of the second segment of path
    seg2_step = abs(inter_point(1) - goal(1)) / seg2_num;
    path_x_seg2 = (inter_point(1) + seg2_step):seg2_step:goal(1);
    for i = 1:seg2_num - 1
        path_y_seg2(i) = goal(2);
    end
    
    %% add two segments
    path_x = [path_x_seg1, path_x_seg2];
    path_y = [path_y_seg1, path_y_seg2];
    

end