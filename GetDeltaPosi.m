function [dx, dy, d_yaw] = GetDeltaPosi(speed_left, speed_right, dt, robot_config)
    
    dist_l_delta = speed_left * dt;
    dist_r_delta = speed_right * dt;
    
    dist_delta = (dist_l_delta + dist_r_delta) / 2;
    yaw_delta = (dist_r_delta - dist_l_delta) / (2 * robot_config(1));
    
    d_yaw = yaw_delta;
    dx = cos(d_yaw) * dist_delta;
    dy = sin(d_yaw) * dist_delta;    

end