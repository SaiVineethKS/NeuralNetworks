function boolean = DoBoundingBoxesIntersect(box1,box2)

    %first box
    x_left_1 = box1(1);
    y_left_1 = box1(2);
    x_right_1 = box1(1)+box1(3);
    y_right_1 = box1(2)+box1(4);
    
%     disp([x_left_1, y_left_1]);
%     disp([x_right_1, y_right_1]);
    
    %second box
    x_left_2 = box2(1);
    y_left_2 = box2(2);
    x_right_2 = box2(1)+box2(3);
    y_right_2 = box2(2)+box2(4);
%     disp([x_left_2, y_left_2])
%     disp([x_right_2, y_right_2])
%     disp('---------------')
%     
    temp_x = abs(x_left_1 + x_right_1 - x_left_2 - x_right_2);
    temp_y = abs(y_left_1 + y_right_1 - y_left_2 - y_right_2);
    
    rex_Prbx = x_right_1 - x_left_1 + x_right_2 - x_left_2;
    rex_Prby = y_right_1 - y_left_1 + y_right_2 - y_left_2;
    
%     disp(rex_Prbx);
%     disp(rex_Prby);
    if ((temp_x <= rex_Prbx) && (temp_y <= rex_Prby))
        boolean = 1;
    else
        boolean = 0;
    end
    
end