function y = Newton2(f,x0,tol)
    syms x;    
    df = diff(f);
    dfun = inline(df);
    fun = inline(f);
    count = 1;
    error = 1;
    
    while(error > tol)
        x1 = x0 - (fun(x0)/dfun(x0));
        error = abs((x1-x0));
        fprintf('Iteracion %d =  ',count)
        fprintf('%2.14f \t',x1);
        fprintf('%2.14f \t',fun(x1));
        fprintf('%2.14f \n',error);
        count = count +1;
        x0 = x1;
    end
    x1
end


