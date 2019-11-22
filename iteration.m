function [new_x, new_y]= iteration(a_inverse, x, y, external_energy, gamma, fx, fy)
  global a_x
  global a_y
  global fix_point
  global first_click
  global index_new_point
  global click_x
  global click_y
  global click
  if(first_click==1)
      new_x = a_inverse * (gamma * x - 0.15*interp2(fx, x, y));
      new_y = a_inverse * (gamma * y - 0.15*interp2(fy, x, y));


      max_x = max(x);
      max_y = max(y);
      new_y(new_y < 1) = 1;
      new_y(new_y > max_y) = max_y;
      new_x(new_x < 1) = 1;
      new_x(new_x > max_x) = max_x;

      a_x = new_x;
      a_y = new_y;

      a_x(index_new_point) = click_x;
      a_y(index_new_point) = click_y;
      single_fix_point = [a_x(index_new_point); a_y(index_new_point); index_new_point];
      fix_point = [fix_point single_fix_point];


      for k = 1:size(fix_point,2)
          i = fix_point(3, k);
          t_x = fix_point(1, k);
          t_y = fix_point(2, k);
          new_x(i) = t_x;
          new_y(i) = t_y;
      end
  else
      new_x = a_inverse * (gamma * x - 0.15*interp2(fx, x, y));
      new_y = a_inverse * (gamma * y - 0.15*interp2(fy, x, y));
      max_x = max(x);
      max_y = max(y);
      new_y(new_y < 1) = 1;
      new_y(new_y > max_y) = max_y;
      new_x(new_x < 1) = 1;
      new_x(new_x > max_x) = max_x;
  end


  click = 0;

end
