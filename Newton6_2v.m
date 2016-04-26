function s = Newton6_2v(f,a,b,tol)
    funs = inline(f);
    jacob = jacobian(f);
    jaco = inline(jacob);
    dn = [999;999];
    count = 1;
    x0 = [a;b];
    while norm(dn)/norm(dn+x0)> tol % dn = x^(1) - x^(0) -> ||x^(1) - x^(0)|| / ||x^(1)||
        dn = -(jaco(a,b)^-1) * funs(a,b);
        x0 = x0+dn;
        a = x0(1);
        b = x0(2);
        fprintf('%d \t',count);
        fprintf('%2.9f \t',a);
        fprintf('%2.9f \n',b);
        fprintf('F(x,y) = %2.9f \n',funs(a,b));
        count = count+1;
    end
   s = [a;b];
end