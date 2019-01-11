function index = ClosestPoint(position, path_x, path_y)

    distance = 1000000;
    for i = 1:size(path_x, 2)
        path_p = [path_x(i), path_y(i)];
        dist = CalcuDist(position, path_p);
        if (dist < distance)
            index = i;
            distance = dist;
        end
    end

end

