%create function
 function y = pbola(x);
 y = 2* x.^2 - 3*x + 1;
 
 %create x vector
 xvec = -1:1:2;
 end

%type plot(xvec, pbola(xvec)) in command line to get graph

 function line = line(h, q, x)
 line = h.*x + q;
 
 end

%x = -10:1:10


function line2 = Project42(h, q, x, on, off)
%if (x >= on && x <= off);
line2 = h.*x + q;

end

%i take it back i hate matlab fuck fxns