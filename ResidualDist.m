function dist = ResidualDist(index, path_x, path_y)

    dist = 0;
    for i = index:size(path_x,2)
        if (i ~= size(path_x,2))
            cur = [path_x(i), path_y(i)];
            next = [path_x(i+1), path_y(i+1)];
            dist = dist + CalcuDist(cur, next);
        end
    end

end