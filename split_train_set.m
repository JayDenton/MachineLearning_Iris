% Get the data from the file
opts = detectImportOptions('iris.data','FileType','text');
T = readtable('iris.data',opts);
[Var1,Var2,Var3,Var4,Var5] = readvars('iris.data',opts);
% Digitalize the three classes with 1,3,5
is = ones(50,1);
ive = 3*ones(50,1);
ivi = 5*ones(50,1);
V5 = vertcat(is,ive,ivi);
% Get the full dataset
dataset = horzcat(Var1,Var2,Var3,Var4,V5);

% Shuffle index
indicesIs = crossvalind('Kfold',is,10);
indicesIve = crossvalind('Kfold',ive,10);
indicesIvi = crossvalind('Kfold',ivi,10);
dataIndex = vertcat(indicesIs,indicesIve,indicesIvi);
% Split 1-7 as training dataset and 8-10 as testing dataset
trainindex=1;
testindex=1;
for i=1:length(dataIndex)
    if dataIndex(i)<=7
        trainset(trainindex,:)=dataset(i,:);
        trainindex=trainindex+1;
    else
        testset(testindex,:)=dataset(i,:);
        testindex=testindex+1;
    end
end

% Write training dataset and testing dataset to files
csvwrite('trainset.csv',trainset);
csvwrite('testset.csv',testset);

% Linear Regression function testing
A = trainset(:,1:4);
Y = trainset(:,5);
B = ((A.')*A)\(A.')*Y;

% See the performance of parameter in testing dataset
t = (B.')*(testset(1,1:4).');