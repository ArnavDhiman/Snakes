
function [new_x, new_y]= iteration(a_inverse, x, y, external_energy, gamma, fx, fy)
    new_x = a_inverse * (gamma * x - 0.15*interp2(fx, x, y));
    new_y = a_inverse * (gamma * y - 0.15*interp2(fy, x, y));
    
    max_x = max(x);
    max_y = max(y);
    new_y(new_y < 1) = 1;
    new_y(new_y > max_y) = max_y;
    new_x(new_x < 1) = 1;
    new_x(new_x > max_x) = max_x;
    
end