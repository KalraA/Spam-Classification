function [C, sigma] = dataset3Params(X, y, Xval, yval)
C = 0;
sigma = 0;

%icking the best params for sigma and C
vals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
currLowest = 10000000000;
for cs = 1:8
	for ss = 1:8
		model = svmTrain(X, y, vals(cs), @(x1, x2) gaussianKernel(x1, x2, vals(ss)));
		pred = svmPredict(model, Xval);
		errorr = mean(double(pred ~= yval))
		if errorr < currLowest
			currLowest = errorr;
			C = vals(cs);
			sigma  = vals(ss);
			[vals(cs), vals(ss)]
		end
	end   
end

end
