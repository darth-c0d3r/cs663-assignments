function [U, S, V] = mySVD(A)
    [m, n] = size(A);
    left = A * A';
    right = A' * A;
    S = zeros(m, n);
    
    [U, eL] = eig(left);
    [~,ind] = sort(diag(eL));
    ind = fliplr(ind')';
    eL = eL(ind, ind);
    U = U(:,ind);
    
    [V, eR] = eig(right);
    [~,ind] = sort(diag(eR));
    ind = fliplr(ind')';
    eR = eR(ind, ind);
    V = V(:,ind);
    
    if(m > n)
        S(1:n, 1:n) = sqrt(eR);
    else
        S(1:m, 1:m) = sqrt(eL);
    end
    
    for i=1:min(m,n)
        t1 = A*V(:,i);
        t2 = U(:,i);
        if (dot(t1,t2) < 0)
            V(:,i) = -V(:,i);
        end
    end

end