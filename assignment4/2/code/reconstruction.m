function reconstruction(X_train, X_mean, r, c)
    [W, ~, ~] = svd(X_train-X_mean, 0);
    for k = [2,10,20,50,75,100,125,150,175]
        V = W(:,1:k);
        X_projected = V'*X_train(:,1);
        X_reconstructed = X_mean + V*X_projected;
%         Images to be plotted for k:
        img = reshape(X_reconstructed, r, c);
%         figure, imshow(mat2gray(img));
    end
    
%     25 eigenfaces
    for i=1:25
        img = reshape(W(:,i),r,c);
        figure, imshow(mat2gray(img));
    end    
end