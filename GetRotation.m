function T = GetRotation(d_yaw)
    
    c = cos(d_yaw);
    s = sin(d_yaw);
    T = [c, -s, 0;...
         s,  c, 0;...
         0,  0, 1];

end