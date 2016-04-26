function y = Whittaker5 (f,x0,tol)
    syms x;
    df = diff(f);
    ddf = diff(df);
    Lf = ((f*ddf)/(df^2));
    fun = inline(f);
    dfun = inline(df);
    lf = inline(Lf);
    count = 1;
    error = 1;
    % Xerror = []
    
    while (error > tol)
        x1 = x0 - (fun(x0)/dfun(x0))*(2-lf(x0))*(1/2);
        error = abs((x1-x0)/x1);
        fprintf('Iteracion %d =  ',count)
        fprintf('%2.14f \t',x1);
        fprintf('%2.14f \t',fun(x1));
        fprintf('%2.14f \n',error);
        count = count +1;
        % Xerror(end+1) = error
        x0 = x1;
    end
y = x1;
% large = 1:1:count-1;
% plot(large,Xerror);
end