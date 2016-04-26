function y = PuntoFijo4 (f,g,x0,iter)
    syms x;
    F = inline(f);
    G = inline(g);
    for i = 1:iter
        x1 = G(x0);
        fprintf('Iteracion %d =  ',i);
        fprintf('%2.8f \t',x1);
        fprintf('%2.8f \n',F(x1));
        x0 = x1;
    end
y = x1;
end