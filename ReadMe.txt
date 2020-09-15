The .m files has to run in the following orders:


1. split_train_set.m

Output(two files): 'trainset.csv' and 'testset.csv'

Explaination: This file shuffles and seperate the data to 7:3, (training set) : (testing set).
              These two files are different from time to time, because it refreshes the shuffle.
	      My files that contributes to the Results section in the project report has been attached:
	      'trainset1.csv' and 'testset1.csv'.

2. split_k_5.m

Output(five files): 'kfold5.csv'.

Explaination: This file shuffles and seperate the training data to K=5 folds, with same ratio between classes.
              These five files are different from time to time, because it refreshes the shuffle.
	      My files that contributes to the Results section in the project report has been attached:
	      'kfold5_1.csv'.

3. k_5_cv.m

Output: display of 'CVErr of the model', 'Lowest CV-error in the folds' and 'Chosen B parameter'

Explaination: 'CVErr of the model' is the average cv-error of the K-fold cross-validation model.
	      'Lowest CV-error in the folds' is the lowest cv-error among the iterations.
	      'Chosen B parameter' is the B parameter of the lowest cv-error fold and will be applied to the testset
	       to show the performance.

4. leave_one_out.m

Output: display of 'CVErr of the model', 'Lowest CV-error in the folds' and 'Chosen B parameter'

Explaination: 'CVErr of the model' is the average cv-error of the leave-one-out cross-validation model.
	      'Lowest CV-error in the folds' is the lowest cv-error among the iterations.
	      'Chosen B parameter' is the B parameter of the lowest cv-error fold and will be applied to the testset
	       to show the performance.

5. performance.m

Output: displays the performance of the cross-validated models on the testing sataset.



!!!To show the Results as same as in the report, follow the procedures below:

change the second line in "k_5_cv.m" to 'kfolddata = readmatrix('kfold5_1.csv');'
change the second line in "leave_one_out.m" to 'loocv = readmatrix('trainset1.csv');'
change the second line in "performance.m" to 'testing = readmatrix('testset1.csv');'

Then, only run steps 3-5.