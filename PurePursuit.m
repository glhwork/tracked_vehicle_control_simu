function [speed_left, speed_right] = PurePursuit(pose, path_x, path_y, robot_config)
    
    k_v = 500;
    k_ld = 13;
%     k_v = 200;
%     k_ld = 13;
    vThreshold = 200;
    
    L = robot_config(1) * 2;
    position = [pose(1,end), pose(2,end)];
    local_x_axis = pose(1:2,1);
    path_index = ClosestPoint(position, path_x, path_y);
    
    r_dist = ResidualDist(path_index, path_x, path_y);
    v = k_v * r_dist;
    
    if (v > vThreshold)
        v = vThreshold;
    end
    if (r_dist < 30)
        v = 0;
    end
    ld = k_ld * v;
    
    Threshold = 100000;
    for i = path_index:size(path_x, 2)
        cur_p = [path_x(i), path_y(i)];
        dist_diff = abs(CalcuDist(position, cur_p) - ld);
        if (dist_diff < Threshold)
            forward_index = i;
            Threshold = dist_diff;
        end
        
    end
    
    forward_p = [path_x(forward_index), path_y(forward_index)];
    ld = CalcuDist(position, forward_p);
    
    f_vector = [forward_p(1) - position(1),...
                forward_p(2) - position(2)];
    el_y = dot(local_x_axis, f_vector);
    el_x = sqrt(power(ld,2) - power(el_y,2));
    
    plot([position(1),forward_p(1)], [position(2),forward_p(2)], 'b', 'LineWidth', 2.0);
    
    if (forward_index == size(path_x,2))
        f_vector_1 = f_vector;
    else
        p = [path_x(forward_index+1),...
             path_y(forward_index+1)];
        f_vector_1 = [p(1) - position(1),...
                      p(2) - position(2)];
    end

    theta_pose = abs(acos(dot(local_x_axis, [1,0])))
    theta_forward = abs(acos(dot(f_vector_1, [1,0]) / norm(forward_p)))
    
    R = power(ld,2) / (2 * el_x);
   
%     value_1 = (1 - L/(2*R)) * v;
%     value_2 = (L/R + 2) * v * 0.5;
%     if (theta_pose >= theta_forward)        
%         speed_left = max(value_1, value_2);
%         speed_right = min(value_1, value_2);
%     elseif (theta_pose < theta_forward)
%         speed_left = min(value_1, value_2);
%         speed_right = max(value_1, value_2);
%     end
    speed_right = (1 - L/(2*R)) * v;
    speed_left = (L/R + 2) * v * 0.5;
                 

end