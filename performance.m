% Import testing dataset for performance
testing = readmatrix('testset.csv');
[m,n] = size(testing);

disp('K-fold with K=5 performance');
disp(performance_b(k5_chosenB, testing, m));
disp('Leave-one-out performance');
disp(performance_b(loocv_chosenB, testing, m));


function Pcorrect = performance_b(b_parameter, testing, m)
    % Summation of correct predictions
    correct = 0;
    % Iterate through each row
    for i = 1:m
        elements = testing(i,1:4);
        predict = (b_parameter.')*(elements(1:4).');
        if predict<2
            predict = 1;
        elseif predict>4
            predict = 5;
        else
            predict = 3;
        end

        % Check the prediction
        if predict == testing(i,5)
            correct = correct + 1;
        end
    end
    Pcorrect = correct / m;
end


