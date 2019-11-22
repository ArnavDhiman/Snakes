
function [E_external] = ExternalEnergyCal(I, w_line, w_edge, w_term)
    E_line = double(I);

    [gradient_x, gradient_y] = gradient(I);
    E_edge = -1 * (gradient_x.^2 + gradient_y.^2);

    c_x = imgaussfilt(I,[4, 1]);
    c_xx = imgaussfilt(c_x, [4, 1]);
    c_y = imgaussfilt(I,[1, 4]);
    c_yy = imgaussfilt(c_y, [1, 4]);
    c_xy = imgaussfilt(c_x, [1, 4]);


    E_term = ((c_yy.*(c_x.*c_x)) - (2.*c_xy.*c_xy.*(c_x.*c_y)) + (c_xx.*(c_y.*c_y)))./((c_x.*c_x)+(c_y.*c_y)).^ 1.5;
    E_external = w_line * E_line + w_term * E_term + w_edge * E_edge;    
    E_external = E_external / max(E_external(:));


end
