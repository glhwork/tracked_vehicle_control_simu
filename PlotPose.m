function PlotPose(pose, figure_x, figure_y)

    hold on;
    f_x = figure_x;
    f_y = figure_y;
    
    p_tmp = zeros(4, size(f_x, 2));
    for i = 1:size(f_x,2)
        p_tmp(1,i) = f_x(i)
        p_tmp(2,i) = f_y(i)
        p_tmp(4,i) = 1
    end
    
    for j = 1:size(p_tmp, 2)
        p_tmp(:,j) = pose * p_tmp(:,j)
    end
    
    line1_x = [p_tmp(1,1), p_tmp(1,2)];
    line1_y = [p_tmp(2,1), p_tmp(2,2)];
    
    line2_x = [p_tmp(1,3), p_tmp(1,4)];
    line2_y = [p_tmp(2,3), p_tmp(2,4)];
    
    line3_x = [p_tmp(1,5), p_tmp(1,6)];
    line3_y = [p_tmp(2,5), p_tmp(2,6)];
    
    plot(line1_x, line1_y, 'Color', 'k');
    plot(line2_x, line2_y, 'Color', 'k');
    plot(line3_x, line3_y, 'Color', 'k');
     

end