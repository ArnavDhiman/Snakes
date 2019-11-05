function [x, y] = InitializeSnake(I, snake)
    % here is to show the snake in the space
    fig = figure;
    imshow(I);
    max_len = max(size(I)) - 1;
    axis([0 1 0 1]);
    imshow(I);
    [x, y] = getpts();
    hold on;
    x = transpose(x);
    y = transpose(y);
    
    if(snake =="Closed")
        x = [x, x(1)];
        y = [y, y(1)];
        knots = [x ; y];
        number_of_points = length(x);
        distance_points = 1:number_of_points;
        final_distance_points = 1:0.05:number_of_points;
        closed_curve = spline(distance_points, knots, final_distance_points);
        closed_curve(closed_curve < 1) = 1;
        closed_curve(closed_curve > max_len) = max_len;
        x_new = closed_curve(1,:);
        y_new = closed_curve(2,:);
        plot(x ,y, 'o', x_new, y_new, '--');
        x = x_new;
        y = y_new;
    
    else
        knots = [x ; y];
        number_of_points = length(x);
        distance_points = 1:number_of_points;
        final_distance_points = 1:0.09:number_of_points;
        Open_Curve = spline(distance_points, knots, final_distance_points);
  
         Open_Curve(Open_Curve < 1) = 1;
         Open_Curve(Open_Curve > max_len) = max_len;
         x_new = Open_Curve(1,:);
         y_new = Open_Curve(2,:);
         plot(x ,y, 'o', x_new, y_new, '--');
         x = x_new;
         y = y_new;
         
    end
    
    hold on;
end