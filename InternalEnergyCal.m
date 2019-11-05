function [a_inverse] = InternalEnergyCal(points, alpha, beta, gamma, snake)
    a = zeros(points, points);
    a_row = zeros(1, points);
    
    a_row(1) = 2 * alpha + 6 * beta;
    a_row(2) = -alpha - 4 * beta;
    a_row(3) = beta;
    a_row(points-1) = beta;
    a_row(points) = -alpha - 4 * beta;
    
    for i = 1: points
        a(i,:) = a_row;
        a_row = [a_row(points) a_row(1:points-1)];
    end
    
    if snake == "Open"    
        a(1,1) = alpha + beta;
        a(1,2) = -alpha - 2 * beta;
        a(2,1) = -alpha - 2 * beta;
        a(2,2) = 2*alpha + 5 *beta;
        
        a(points - 1 , 1) = 0;
        a(points, 1) = 0;
        a(points-1 , 2) = 0;
        a(points, 2) = 0;
        
        a(points,points) = alpha + beta;
        a(points-1, points) = -alpha - 2 * beta;
        a(points,points - 1) = -alpha - 2 * beta;
        a(points-1, points-1) = 2*alpha + 5 * beta;
        
        a(1, points - 1) = 0;
        a(1, points) = 0;
        a(2, points-1) = 0;
        a(2, points) = 0;

    end

    a_inverse = inv(a + gamma * eye(points, points));
    
end
