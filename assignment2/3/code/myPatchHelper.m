function res = myPatchHelper(window, h)
    center_patch = window(13:21,13:21);
    g = @(X) exp(-sum(sum((X-center_patch).^2))/(h*h));  
%     weights = nlfilter(window, [9 9], g);
    for i=5:29
        for j=5:29
            weights(i,j) = g(window(i-4:i+4,j-4:j+4));
        end
    end
%     Removing boundaries
    weights(1:4,:) = 0;
    weights(30:33,:) = 0;
    weights(:,1:4) = 0;
    weights(:,30:33) = 0;

%     Removing center pixel
    weights(17,17) = 0;
    
    res = sum(sum(weights.*window))/sum(sum(weights));
end