% Import cross validation dataset for cross validation
kfolddata = readmatrix('kfold5.csv');
% Reshape the fold data
k = 5;
kfolddata=reshape(kfolddata,[],5,k);

% Choose the parameter of the fold with lowest value of cverror
k5_chosenB = zeros(4,1);
lowesterror = 100;
% Summation of all the cverror in folds
allcverror = 0;
% Iteration to generate cross validation
% At the meantime, calculate the cv-error
for i=1:k
    if i == 1
        A = kfolddata(:,:,2);
    else
        A = kfolddata(:,:,1);
    end
    
    % Generate the A matrix and L matrix
    for j=1:k
        if j~=i
            if (i==1 && j==2) || (j==1 && i~=1)
                continue;
            end
            A = vertcat(A,kfolddata(:,:,j));
        else
            L = kfolddata(:,:,i);
            continue;
        end
    end
    
    % Calculte the B parameter by Linear Regression function
    Y = A(:,5);
    A = A(:,1:4);
    B = ((A.')*A)\(A.')*Y;
    %disp(B);
    
    % Summation of cverror in the fold
    cverror = 0;
    for element=1:length(L)
        cvpredict = (B.')*(L(element,1:4).');
        cverror = cverror + (L(element,5)-cvpredict).^2;
    end
    cverror = cverror / length(L);
    %disp(cverror);
    
    % Summation of K cverror
    allcverror = allcverror + cverror;
    
    % Maitain the parameter fo the lowest cverror
    if cverror < lowesterror
        k5_chosenB = B;
        lowesterror = cverror;
    end
end

% The average of cverror
disp('CVErr of the model');
disp(allcverror/length(L));
% Display chosen B parameter
disp('Chosen B parameter');
disp(k5_chosenB);
% Display lowest cverror
disp('Lowest CV-error in the folds');
disp(lowesterror);

