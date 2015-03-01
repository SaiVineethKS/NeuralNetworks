function image_final = ROI_function(x)

setting = .7;

%A = imread(x,'jpg');
Intensity = rgb2gray(x);
while(1)

     
    BW = im2bw(x, setting);
    %BW = imcomplement(BW2);
    
    BW = imcomplement(BW);
    region = regionprops(BW, 'BoundingBox');
    max_width = 0;
    max_height = 0;
    index = 0;
    for j = 1:(length(region))
        %disp(region)
        temp = region(j).BoundingBox;
%         sub_Image = imcrop(BW,region(j).BoundingBox);
%         figure(j),imshow(sub_Image);
        %disp(temp);
        
        if ((max_width*max_height) < (temp(3)*temp(4)))
                max_height = temp(4);
                max_width = temp(3);
                %sub_Image = sub_image;
                index = j;
        end

    end
    %disp(index)
    sub_Image = imcrop(BW,region(index).BoundingBox);
    %imshow(sub_Image)
    %Test_Image = imcrop(Intensity,region(index).BoundingBox);

    
    region3 = regionprops(sub_Image,'BoundingBox');
    max_height3 = 0;
    max_width3 = 0;

    for p = 1:(length(region3))
        temp3 = region3(p).BoundingBox;
        
        %figure(k),imshow(sub_Image2);

        if ((max_width3*max_height3) < (temp3(3)*temp3(4)))
            if (p == 1)
                continue;
            end
                max_height3 = temp3(4);
                max_width3 = temp3(3);
                index2 = p;
                
        end

    end 
    sub_Image5 = imcrop(sub_Image,region3(index2).BoundingBox);
    %Test_Image2 = imcrop(Test_Image,region3(index2).BoundingBox);
    sub_Image5 = imcomplement(sub_Image5);
    %imshow(sub_Image5);
    
    try 
        if(sub_Image5 == imcomplement(BW))
            %need to add logic to adjust level for BW image
            %disp('Hit Bad Threshold Setting');
            setting = setting + .02;
            continue;
        else
            break;
        end  
    catch
    end
    break;
end
    temp_blah = region3(index2).BoundingBox;
    temp_blah(1) = temp_blah(1) + 6;
    temp_blah(2) = temp_blah(2) + 7;
    temp_blah(3) = temp_blah(3) - 14;
    temp_blah(4) = temp_blah(4) - 14;
    
    sub_Image5 = imcrop(sub_Image,temp_blah);
    sub_Image5 = imcomplement(sub_Image5);
    %imshow(sub_Image5);
    image_final = sub_Image5;
    
    %imshow(image_final);
   
end