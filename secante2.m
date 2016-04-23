function y = secante2(f,x0,x1,tol)
   syms x;
   fun = inline(f);
   count=2;
   error = 1;   
   while error > tol
       x2 = (x0*fun(x1)-x1*fun(x0))/(fun(x1)-fun(x0));
       error = abs(x1-x0);
       fprintf('Iteracion %d =  ',count)
       fprintf('%2.14f \t',x2);
       fprintf('%2.14f \t',fun(x2));
       fprintf('%2.14f \n',error);
       count=count+1;
       x0=x1;
       x1=x2;
       
       
   end
   count
   x2
end

%secante2('x^2-2',1,3,0.001) funcion a probar, R:1.4141

