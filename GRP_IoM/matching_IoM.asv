function [EER] = matching_IoM()
gen = [];
for i = 1:100
    combination = nchoosek(4:8, 2);
    
    for j = 1:length(combination)
        file1 = combination(j,:);

        maxoutfile1 = strcat(pwd, '\maxout\', num2str(i), '_',num2str(file1(1)),'.mat');
        load(maxoutfile1);
        template1 = maxout_code;
        
        maxoutfile2 = strcat(pwd, '\maxout\', num2str(i), '_',num2str(file1(2)),'.mat');
        load(maxoutfile2);
        template2 = maxout_code;
        
        C2=abs(template1 - template2);
%         totalnumbm=size(template1,2);
        CC=find(C2==0);
        totalnumbs=size(CC(),2);
        similiraty= totalnumbs/(length(template1)+length(template2)-totalnumbs);
%         similiraty=totalnumbs/totalnumbm;
        gen = [gen; similiraty];
    end
end

imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    
    maxoutfile1 = strcat(pwd, '\maxout\', num2str(files(1)), '_4.mat');
    load(maxoutfile1);
    template1 = maxout_code;
    
    maxoutfile2 = strcat(pwd, '\maxout\', num2str(files(2)), '_4.mat');
    load(maxoutfile2);
    template2 = maxout_code;
    
    C2=abs(template1 - template2);
%     totalnumbm=size(template1,2);
    
    CC=find(C2==0);
    totalnumbs=size(CC(),2);
    similiraty= totalnumbs/(length(template1)+length(template2)-totalnumbs);
%     similiraty=totalnumbs/totalnumbm;
    imp = [imp; similiraty];
end
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.001);