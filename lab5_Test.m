function lab5_Test()
    for k=1:1:100
        text = num2str(k);
        string1 = strcat('Image Number',text);
        disp(string1);
        string = strcat('C:\Users\Lindsey\Desktop\Senior_Design\EEC_181_lab5\image',text,'.jpg');
        tic
        Number_Isolate(string);
        toc
        timerVal = toc;
    end
end