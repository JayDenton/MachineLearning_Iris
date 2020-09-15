% Import training dataset for cross validation
cvdata = readmatrix('trainset.csv');
% Index of three classes from training dataset is equally distributed
is_t = zeros(35,1);
ive_t = zeros(35,1);
ivi_t = zeros(35,1);


% Get the shuffle index with suctomized function  
k_5_index = k_fold_index(is_t,ive_t,ivi_t,5);
% Split the training dataset to K datasets, here, K = 5
k = 5;
k_index=ones(1,k);
for i=1:length(k_5_index)
    cvkdata(k_index(k_5_index(i)),:,k_5_index(i))=cvdata(i,:);
    k_index(k_5_index(i))=k_index(k_5_index(i))+1;
end

% Write k-fold dataset to file
csvwrite('kfold5.csv',cvkdata);

% Shuffle index with K-fold
function kDataIndex = k_fold_index(is,ive,ivi,k)
    indicesIs = crossvalind('Kfold',is,k);
    indicesIve = crossvalind('Kfold',ive,k);
    indicesIvi = crossvalind('Kfold',ivi,k);
    kDataIndex = vertcat(indicesIs,indicesIve,indicesIvi);
end