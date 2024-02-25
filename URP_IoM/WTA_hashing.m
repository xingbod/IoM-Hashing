function[binary_codes,G_vecs] = WTA_hashing(X,G_vecs,G, K,Gvm)

binary_codes=zeros(size(X,1),Gvm);
binary_codes2=zeros(size(X,1),1);
for ii=1:Gvm
    G_vecss=G_vecs{1,ii};
    segment=ones(size(X,1),K);
    for i = 1:G
        interest_segment= X(:,G_vecss(i,1:K));
        segment=segment.*interest_segment;
    end
    
    for j=1:size(X,1)
        D=segment(j,1);
        for k=2:K
            if segment(j,k)>D
                D=segment(j,k);
                binary_codes2(j)=k;
            else
                binary_codes2(j)=binary_codes2(j);
            end
        end
    end
    binary_codes(:,ii)=binary_codes2(:);
    binary_codes2=zeros(size(X,1),1);
end