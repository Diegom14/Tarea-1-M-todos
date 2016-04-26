function s = Newton6_3v(f,a,b,c,tol)
    funs = inline(f);
    jacob = jacobian(f);
    jaco = inline(jacob);
    dn = [999;999;999];
    count = 1;
    x0 = [a;b;c];
    while norm(dn)/norm(dn+x0)> tol % dn = x^(1) - x^(0) -> ||x^(1) - x^(0)|| / ||x^(1)||
        dn = -(jaco(a,b,c)^-1) * funs(a,b,c);
        x0 = x0+dn;
        a = x0(1);
        b = x0(2);
        c = x0(3)
        fprintf('%d \t',count);
        fprintf('%2.9f \t',a);
        fprintf('%2.9f \n',b);
        fprintf('%2.9f \n',c);
        fprintf('F(x,y) = %2.9f \n',funs(a,b,c));
        count = count+1;
    end
   s = [a;b;c];
end