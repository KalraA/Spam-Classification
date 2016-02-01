function sim = gaussianKernel(x1, x2)
% Turns into column vectors
x1 = x1(:); x2 = x2(:);

sigma = 1;

a = x1-x2; %why do this computation twice
sim = exp(-(a'*a)./(2*sigma*sigma));

end
