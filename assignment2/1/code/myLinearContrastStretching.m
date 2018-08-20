function img_out = myLinearContrastStretching(img_mat)

    [~,~,d] = size(img_mat);
    
    for k = 1:d
        max_n = max(max(img_mat(:,:,k)));
        min_n = min(min(img_mat(:,:,k)));
        img_out(:,:,k) = (255/(max_n - min_n))*(img_mat(:,:,k) - min_n);
    end
    
end