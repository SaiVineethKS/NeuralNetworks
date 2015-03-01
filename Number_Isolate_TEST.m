function FINAL_NUMBER = Number_Isolate_TEST(x)
load('NN.mat');
load('testSet.mat');
ROI = ROI_function(x);
%ROI = imfill(ROI,'holes');

imshow(ROI);
%SE = strel('square',2);
%ROI = imdilate(ROI, SE);

%imshow(ROI)
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
disp(x_d);
disp(y_d);
num = round(y_d / x_d);
disp(num);
if (num == 3)
    
    bounding_box1 = [0, 0, y_d, y_d];
    bounding_box2 = [y_d, 0, 2*(y_d), 2*(y_d)];
    bounding_box3 = [2*(y_d), 0, 3*(y_d),3*(y_d)];
    
end 

if (num == 4)
    bounding_box1 = [0, 0, y_d, y_d];
    bounding_box2 = [y_d, 0, 2*(y_d), 2*(y_d)];
    bounding_box3 = [2*(y_d), 0, 3*(y_d),3*(y_d)];
    bounding_box3 = [3*(y_d), 0, 4*(y_d),4*(y_d)];
end



disp('Hi')
test_1 = [];
STRING = '';
for p = 1:(num)
    if (p == 1)
        sub_image_test = imcrop(ROI,bounding_box1);
    end 
    
    if (p == 2)
        sub_image_test = imcrop(ROI,bounding_box2);
    end 
    
    if (p == 3)
        sub_image_test = imcrop(ROI,bounding_box3);
    end 
    
    if (p == 4)
        sub_image_test = imcrop(ROI,bounding_box4);
    end 
    
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
    
    %sub_image_test = padarray(sub_image_test,[40 40]);
    sub_image_test = imresize(sub_image_test, [28,28]);
    figure(p),imshow(sub_image_test)
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