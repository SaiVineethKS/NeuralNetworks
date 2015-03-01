function FINAL_NUMBER = Number_Isolate(x)
load('NN.mat');
load('testSet.mat');
ROI = ROI_function(x);
%ROI = imfill(ROI,'holes');

%imshow(ROI);
SE = strel('square',2);
ROI = imdilate(ROI, SE);

imshow(ROI)
%[y,u] = size(ROI);
%ROI = imfill(ROI,'holes');
[x_d y_d] = size(ROI);
% 
% for v=1:1:x_d
%     for z= 1:1:y_d
%         if(ROI(v,z)==0 && ROI(v,z-1)==1)
%             try
%                 if (ROI(v,z+20)==1)
%                     
%     end
% end

region = regionprops(ROI, 'BoundingBox');


max_width = 0;
max_height = 0;
number = 1;
sub_image1 = [];
for j = 1:(length(region))
    %disp(region)
    temp = region(j).BoundingBox;
    sub_image = imcrop(ROI,region(j).BoundingBox);
    %figure(j),imshow(sub_image);
    %disp(temp);


    if ((max_width*max_height) < (temp(3)*temp(4)))
        try
            if(sub_image == ROI)
                %disp('ENTERED');
                continue;
            end
        catch
                max_height = temp(4);
                max_width = temp(3);
        end
    end
end
%disp(max_height)
%disp(max_width)
number = 0;
broken = [];
position = [];
for k = 1:(length(region))
    %need to check for numbers going outside the border
    temp2 = region(k).BoundingBox;
    %sub_image = imcrop(ROI,region(k).BoundingBox);
    %figure(k),imshow(sub_image);
    %disp(k)
    %disp(temp2);

    if ( (abs(max_width - temp2(3)) < 80) && (abs(max_height - temp2(4)) < 50) )
        sub_image1 = [sub_image1 k];
        number = number + 1;
    else if ( (abs(max_width - temp2(3)) < 100) && (abs(max_height - temp2(4)) < 80) )
        %sub_image1 = [sub_image1 k];
        %sub_image1 = [sub_image1 k];
        broken = [broken k];
        position = [position number];
        disp('Entered')
        end
    end
end

%disp('Final Values');
%disp(sub_image1);

intersect = 0;
for m=1:(length(broken))
    intersect = 0;
    index_value = broken(m);
    temp3 = region(index_value).BoundingBox;
    temp3(1) = temp3(1)-10;
    temp3(2) = 0;
    temp3(3) = temp3(3)+50;
    temp3(4) = y_d; 
    region(index_value).BoundingBox = temp3;
    for z=1:(length(sub_image1))
        bounding_box_used = region(sub_image1(z)).BoundingBox;
        %sub_image = imcrop(ROI,region(k).BoundingBox);
        %figure(k),imshow(sub_image);
        %disp(temp3)
        %disp(bounding_box_used)
        %disp(DoBoundingBoxesIntersect(temp3,bounding_box_used))
        if (DoBoundingBoxesIntersect(temp3,bounding_box_used))
            sub_image1(z) = broken(m);
            %disp('INTERSECTED HAH!')
            intersect = 1;
        end
    end
    if (intersect == 1)
        continue;
    end
    sub_image_new = [sub_image1(1:position(m)) broken(m) sub_image1(position(m)+1:length(sub_image1))];
    %disp(sub_image_new)
    %sub_image1 = [sub_image1 broken(m)];
    sub_image1 = sub_image_new;
    %disp(sub_image1)
    
    %sub_image = imcrop(ROI,region(index_value).BoundingBox);
    %figure(m),imshow(sub_image);
    
end


%disp('Hi')
test_1 = [];
STRING = '';
for p = 1:(length(sub_image1))
    
    sub_image_test = imcrop(ROI,region(sub_image1(p)).BoundingBox);
%     [x,y] = size(sub_image_test);
%     x = int64(x);
%     y = int64(y);
%     z = max([x,y]);
%     if(z==x)
%         try
%             cushion = ((x-y)/2);
%             sub_image_test = padarray(sub_image_test,[0,cushion]);
%         catch
%             cushion = (x-y-1)/2;
%             sub_image_test = padarray(sub_image_test,[0,cushion]);
%         end
%     end
%     if(z==y)
%         try         
%             cushion = ((y-x)/2);  
%             sub_image_test = padarray(sub_image_test,[cushion,0]);
%         catch
%             cushion = (y-x-1)/2;
%             sub_image_test = padarray(sub_image_test,[cushion,0]);
%         end
%     end
    
    sub_image_test = padarray(sub_image_test,[40 40]);
    sub_image_test = imresize(sub_image_test, [28,28]);
    %figure(p),imshow(sub_image_test)
    data = reshape(sub_image_test,784,1);

    test = build(data);
    tempera = num2str(test);
    STRING = strcat(STRING,tempera);
    test_1 = [test_1 test];
    %output = check(finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftmaxTheta,data);
    %disp(output);

end
FINAL_NUMBER = str2num(STRING);
disp(FINAL_NUMBER)
%imshow(ROI);

end