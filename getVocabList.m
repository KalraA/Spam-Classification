function vocabList = getVocabList()

%% Read the fixed vocabulary list
fid = fopen('vocab.txt');

n = 1899;  % Total number of words in the dictionary
%turns it into an array of words and 1s.
vocabList = cell(n, 1);
for i = 1:n
    fscanf(fid, '%d', 1);
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
