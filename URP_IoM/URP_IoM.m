clear all;
close all;

Nperm = 600;
Nkernel = 2;
Kwindow = 128;

for ii=1:Nperm
    G_vecs{ii} = getGvec(299,Nkernel);
end
for i = 1:100
    for j = 4:8
%         readfile = strcat(pwd, '\data\', num2str(i), '_',num2str(j),'.mat');
%       Change proper path for the data
        readfile = strcat('C:\Users\Goi Bok Min\Documents\MATLAB\WTA fingerprint\data\',num2str(i),'_',num2str(j), '.mat');
        if exist(readfile,'file')==0
            continue;
        else
            A = load(readfile);
            A = A.Ftemplate;
            [binary_codes,G_vecs] = WTA_hashing(A,G_vecs,Nkernel, Kwindow, Nperm);
            savefile = strcat(pwd, '\wta\', num2str(i), '_',num2str(j),'.mat');
            save(savefile,'binary_codes');
        end
    end
end
EER = calsimilarity_IoM();
