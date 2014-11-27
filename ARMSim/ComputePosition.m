
function pos = ComputePosition(f, b, x1, x2)
pos = 0;
if x1 < 0 && x2 < 0
    if x1 < x2
        if abs(abs(b) - abs(x1)) == abs(abs(f) - abs(x2))
            pos = -abs(abs(f) - abs(x2));
        elseif abs(abs(f) - abs(x1)) == abs(abs(b) - abs(x2))
            pos = -abs(abs(f) - abs(x1));
        end
    elseif x1 > x2
         if abs(abs(b) - abs(x2)) == abs(abs(f) - abs(x1))
            pos = -abs(abs(f) - abs(x1));
        elseif abs(abs(f) - abs(x2)) == abs(abs(b) - abs(x1))
            pos = -abs(abs(f) - abs(x2));
        end
    end
elseif x1 > 0 && x2 > 0
    if x2 > x1
        if abs(abs(x2) - abs(b)) == abs(abs(x1) + abs(f))
            pos = abs(abs(x1) + abs(f));
        elseif abs(abs(x2) - abs(f)) == abs(abs(x1) + abs(b))
            pos = abs(abs(x1) + abs(b));
        end
    elseif x1 > x2
        if abs(abs(x1) - abs(b)) == abs(abs(x2) + abs(f))
            pos = abs(abs(x2) + abs(f));
        elseif abs(abs(x1) - abs(f)) == abs(abs(x2) + abs(b))
            pos = abs(abs(x2) + abs(b));
        end
    end
    
elseif x1 < 0 && x2 > 0
    fprintf(' x1 < 0 && x2 > 0: %d \n', 1);
    if f < abs(x1)
        if b > abs(x2)
            pos = x1 + f;
        end
    elseif f > abs(x1)
        if b < abs(x2)
            pos = b - x2;
        end
    end
elseif x1 > 0 && x2 < 0
     if f < abs(x2)
        if b > abs(x1)
            pos = x2 + f;
        end
    elseif f > abs(x2)
        if b < abs(x1)
            pos = b - x1;
        end
    end
end
end