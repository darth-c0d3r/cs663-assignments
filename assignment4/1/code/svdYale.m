function svdYale(X_train, X_test)
    [W, ~, ~] = svd(X_train);
    a_rate = [];
    b_rate = [];
    for k = [1,2,3,5,10,15,20,30,50,60,65,75,100,200,300,500,1000]
        V = W(:,1:k);
        X_projected_train = V'*X_train;
        X_projected_test = V'*X_test;

        correct1 = 0;
        correct2 = 0;
        for i=1:size(X_projected_test,2)
            actual_id = ceil(i/24);
            Z = X_projected_test(:,i)-X_projected_train(:,1:size(X_projected_train,2));
            [~, predict_id1] = min(sum(Z.*Z));
            Z = X_projected_test(4:end,i)-X_projected_train(4:end,1:size(X_projected_train,2));
            [~, predict_id2] = min(sum(Z.*Z));
            predict_id1 = ceil(predict_id1/40);
            predict_id2 = ceil(predict_id2/40);
            if actual_id == predict_id1
                correct1 = correct1+1;
            end
            if actual_id == predict_id2
                correct2 = correct2+1;
            end
        end

        a_rate = [a_rate correct1/size(X_projected_test,2)];
        b_rate = [b_rate correct2/size(X_projected_test,2)];
    end    
    disp(a_rate);
    disp(b_rate);
end