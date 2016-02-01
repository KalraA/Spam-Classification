function x = emailFeatures(word_indices)

n = 1899; %total words in set

x = zeros(n, 1); %create a zero vector of that size

x(word_indices) = 1; %wherever we find a match make it a one

end
