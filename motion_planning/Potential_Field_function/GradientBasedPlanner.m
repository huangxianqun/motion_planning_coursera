function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

%%% All of your code should be between the two lines of stars.
% *******************************************************************
route = start_coords;
count = 1;
FLAG = true;
current_coords = start_coords;
x_sum = 0;
y_sum = 0;
product = (end_coords(2) - start_coords(2)) / (end_coords(1) - start_coords(1));
while(count <=max_its &&  FLAG)
    x = current_coords(1);
    y = current_coords(2);
    x_sum = x_sum +2*gx(y, x);
    y_sum = y_sum + 2*gy(y, x);
    x_add = sign(x_sum) * ceil(abs(x_sum));
    y_add = sign(y_sum) * ceil(abs(y_sum));
    %%disp(x_sum); disp(y_sum);
    current_coords(1) = start_coords(1) + x_add ;
    current_coords(2) = start_coords(2) + y_add ;
    if(current_coords(1) >400)
        current_coords(1) = 400;
    elseif ( current_coords(1) <1)
            current_coords(1) = 1;
    end
     if(current_coords(2) >600)
        current_coords(2) = 600;
    elseif ( current_coords(2) <1)
            current_coords(2) = 1;
    end
        
    disp(x_add); disp(y_add);
    if(current_coords ==end_coords)
        FLAG = false;
    end
    count = count +1;
    route(count, 1) = current_coords(1);
    route(count, 2) = current_coords(2);

end
disp(count);
% *******************************************************************
end
