function y = FalsaPosicion1(f, a, b, tol)
fun = inline(f);
fa = fun(a);
fb = fun(b);
count = 1;
error = 1 ;
Xerror = [];

while (error > tol)
    c = (b*fa-a*fb)/(fa-fb);
    fc = fun(c);
    error = abs(fc);
    
    fprintf('Iteracion %d =  ',count)
    fprintf('%2.8f \t',c);
    fprintf('%2.8f \n',error);

    if (fa*fc < 0)
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    count = count+1; 
    Xerror(end+1) = error;
end
y = c;

large = 1:1:count-1;
plot(large,Xerror);
grid on;
end
    