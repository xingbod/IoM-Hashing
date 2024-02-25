function EER = calsimilarity_IoM()

gen = [];
for i = 1:100
   combination = nchoosek(4:8, 2);
    for j = 1:length(combination)
        files = combination(j,:);
        WTA_template1 = strcat(pwd, '\wta\', num2str(i), '_',num2str(files(1)),'.mat');

        if exist(WTA_template1,'file')==0  
            continue;
        else
            load(WTA_template1);
            template1 = binary_codes;
        end
        
        WTA_template2 = strcat(pwd, '\wta\', num2str(i), '_',num2str(files(2)),'.mat');
        if exist(WTA_template2,'file')==0  
            continue;
        else
            load(WTA_template2);
            template2 = binary_codes;
        end
        C2=abs(template1 - template2);
        totalnumbm=size(template1,2);
        CC=find(C2==0);
        totalnumbs=size(CC(),2);
        if totalnumbm == 0
            similiraty = NaN;
        else
            similiraty=totalnumbs/totalnumbm;
        end
        gen = [gen; similiraty];
    end
end

% impostor test
imp = [];
combination = nchoosek(1:100, 2);
for i = 1:length(combination)
    files = combination(i,:);
    WTA_template1 = strcat(pwd, '\wta\', num2str(files(1)), '_4.mat');
    if exist(WTA_template1,'file')==0
        continue;
    else
        load(WTA_template1);
        template1 = binary_codes;
    end
    
    WTA_template2 = strcat(pwd, '\wta\', num2str(files(2)), '_4.mat');
    if exist(WTA_template2,'file')==0
        continue;
    else
        load(WTA_template2);
        template2 = binary_codes;
    end
    
    C2=abs(template1 - template2);
    totalnumbm=size(template1,2);
    CC=find(C2==0);
    totalnumbs=size(CC(),2);
    if totalnumbm == 0
        similiraty = NaN;
    else
        similiraty=totalnumbs/totalnumbm;
    end
    imp = [imp; similiraty];
end
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.001);