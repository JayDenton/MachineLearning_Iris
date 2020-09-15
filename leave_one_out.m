% Import cross validation dataset for cross validation
loocv = readmatrix('trainset.csv');
[m,n] = size(loocv);

% Choose the parameter of the value of cverror
loocv_chosenB = zeros(4,1);
lowesterror = 100;
% Summation of all the cverror in folds
allcverror = 0;
% Iteration to generate cross validation
% At the meantime, calculate the cv-error
for i=1:m
    % Generate the A matrix and L matrix
    A = loocv;
    L = loocv(i,:);
    A(i,:)=[];
    
    % Calculte the B parameter by Linear Regression function
    Y = A(:,5);
    A = A(:,1:4);
    B = ((A.')*A)\(A.')*Y;
    
    % cverror of the left out element
    
    cvpredict = (B.')*(L(1:4).');
    cverror = (L(5)-cvpredict).^2;
    
    % Summation of K cverror
    allcverror = allcverror + cverror;
    
    % Maitain the parameter fo the lowest cverror
    if cverror < lowesterror
        loocv_chosenB = B;
        lowesterror = cverror;
    end
end

% The average of cverror
disp('CVErr of the model');
disp(allcverror/m);
% Display chosen B parameter
disp('Chosen B parameter');
disp(loocv_chosenB);
% Display lowest cverror
disp('Lowest CV-error in the folds');
disp(lowesterror);

