function func( x )
%Function that will select and then display a digit for the testData
%matrix.
% Uses basic load to import the 784x10000 matrix of data. Then using the
% user selection the function selects one column, which corresponds to one
% refrence image, resizes it to be square and then displays the image of the number.
load testSet.mat;
data = testData(:,x);
data = reshape (data, 28,28);
imshow (data);
end