function dist = CalcuDist(x, y)

    dist = sqrt(power((x(1) - y(1)),2) +...
                power((x(2) - y(2)),2));

end