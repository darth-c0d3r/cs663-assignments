function eigORL(X_train, X_test)
    L = X_train' * X_train;
    [W, ~] = eig(L);
%     Optimal value as observed from Q1 resulting in best recognition rate
    k = 50;
    V = X_train*W(:,end+1-k:end);
    V = normc(V);
    X_projected_train = V'*X_train;
    X_projected_test = V'*X_test;

%     error = [];
    false_positive = 0;
    negative = 0;
% Defined a threshold which will differentiate between 'matched' and 'unmatched' faces. 
    threshold = 6000000;
    
    for i=1:size(X_projected_test,2)
        Z = X_projected_test(:,i)-X_projected_train(:,1:size(X_projected_train,2));
        [min_error, ~] = min(sum(Z.*Z));
        if min_error > threshold
%             Marking this as 'no matching face'
            if i <= 32*4
                negative = negative + 1;
            end    
        else
%             Marking this as a 'matching face'
            if i > 32*4
                false_positive = false_positive + 1;
            end
        end
%         error = [error min_error];
    end
%     Using plot to determine value of threshold
%     plot(1:size(X_projected_test,2), error);
    disp("False Positives: "+false_positive+", Negatives: "+negative);
    
end