function svdORL(X_train, X_test)
    [W, ~, ~] = svd(X_train);
    rate = [];
    for k = [1,2,3,5,10,15,20,30,50,75,100,150,170]
        V = W(:,1:k);
        X_projected_train = V'*X_train;
        X_projected_test = V'*X_test;

        correct = 0;
        for i=1:size(X_projected_test,2)
            actual_id = ceil(i/4);
            Z = X_projected_test(:,i)-X_projected_train(:,1:size(X_projected_train,2));
            [~, predict_id] = min(sum(Z.*Z));
            predict_id = ceil(predict_id/6);
            if actual_id == predict_id
                correct = correct+1;
            end
        end

        rate = [rate correct/size(X_projected_test,2)];
    end    
    disp(rate);
end