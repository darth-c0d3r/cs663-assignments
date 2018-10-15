for i = 1:30
    for j = 1:30
        A = randi(1000, i, j);
        [U, S, V] = mySVD(A);
        B = U*S*V';
        if abs(sum(sum(A - B))) > 1e-8
            disp([num2str(i), ' ' ,num2str(j)]);
        end
    end
end