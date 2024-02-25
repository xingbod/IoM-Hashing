function [ G_vecs ] = getGvec(K,G)

    G_vecs = zeros(G,K);
        for i = 1:G 
                G_vecs(i,:) = randperm(K,K);
        end
end