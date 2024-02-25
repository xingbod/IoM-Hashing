Ndimension = 50; % # of q
Nprojection = 300; % # of projection matrices

randum = randn(299,Ndimension,Nprojection);
% load('randnum.mat');
for i = 1:100
    for j = 4:8
%         file = strcat(pwd, '\data\', num2str(i), '_',num2str(j),'.mat');
%       Change proper path for the data
        file = strcat('C:\Users\Goi Bok Min\Documents\MATLAB\WTA fingerprint\data\',num2str(i),'_',num2str(j), '.mat');
        if exist(file,'file')==0
            continue;
        else
            load(file);
            vector = Ftemplate;
        end
        maxout_code = [];
        for counter = 1:300
            tmp = vector * randum(:,:,counter);
            
            [m ind] = max(tmp);
            maxout_code = [maxout_code, ind];
        end
        file2 = strcat(pwd, '\maxout\', num2str(i), '_',num2str(j),'.mat');
        save(file2,'maxout_code');
    end
end
EER = matching_IoM();