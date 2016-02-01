% Extract Features
file_contents = readFile('emailSample1.txt');
word_indices  = processEmail(file_contents);
features      = emailFeatures(word_indices);

fprintf('Word Indices: \n');
fprintf(' %d', word_indices);
fprintf('\n\n');
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of non-zero entries: %d\n', sum(features > 0));

load('spamTrain.mat');

fprintf('\nTraining SVM \n')
%training both linear and gaussian svms
C = 0.1;
model = svmTrain(X, y, C, @linearKernel);
model2 = svmTrain(X, y, C, @gaussianKernel);
p = svmPredict(model, X);
p2 = svmPredict(model2, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Training Accuracy: %f\n', mean(double(p2 == y)) * 100);


% Load the test dataset
load('spamTest.mat');

fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')

p = svmPredict(model, Xtest);

fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);

fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')
p2 = svmPredict(model2, Xtest);
fprintf('Test Accuracy: %f\n', mean(double(p2 == ytest)) * 100);
pause;

