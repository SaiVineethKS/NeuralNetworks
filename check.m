function output = check(finalB1L1, finalB1L2, finalW1L1, finalW1L2, finalSoftmaxTheta,data)

% load('NN.mat');
% load('testSet.mat');
% 
% data = testData(:,x);
    %data is 784 x 1
  
i = 0;
temp = 0;

%for i = 1:200
%loop demonstrating what we need to do
%    temp = dot(finalW1L1(i,:), data);
%    temp = temp + finalB1L1(i);
%    secondLayer(i) = temp;
%end  
secondLayer = finalW1L1*data;
    %Mat mult of weights times data; size is 200x1
secondLayer = secondLayer + finalB1L1;
    %adds the bias

 secondLayer = 1./(1+exp(-secondLayer));



thirdLayer = finalW1L2*secondLayer;
    %Mat mult of weights times second layer; size is 200x1;
thirdLayer = thirdLayer + finalB1L2;
 
thirdLayer = 1./(1+exp(-thirdLayer));



finalLayer = finalSoftmaxTheta*thirdLayer;
    %is a 10x1 matrix of positive numbers
finalLayer = 1./(1+exp(-finalLayer));

%finalLayer(1:10);
    
%now output index that is max of final layer

highest_prob = max(finalLayer);
output = find(finalLayer==highest_prob);

%testLabels(x)
  
end