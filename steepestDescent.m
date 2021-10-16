Q = [11, 3 ; 3, 21];
d = [14 ; 14];

syms x1 x2 g1 g2 a1 a2
x = [x1; x2];
f=@(x)(1/2*x'*Q*x - x'*d);
x0 = [0 ; 0];

i = 0;

while(i<4) 
    g1 = Q(1,:)*x0 - d(1,1);
    g2 = Q(2,:)*x0 - d(2,1);
    g =[g1 ; g2];
    g=round(g,3);
    
    fprintf('x%d:\n',i);
    disp(x0);
    fprintf('gradient%d:\n',i);
    disp(g);
    fprintf('function%d: %.4f\n',i,f(x0));
    fprintf('\n')
    
    
    a1 = (g')*g;
    a2 = (g')*Q*g;
    alfa = a1/a2;
    alfa=round(alfa,3);
    fprintf('alfa%d: %.3f\n',i, alfa);
    
    x0 = x0 - alfa*g;  
    i = i+1;
    x0=round(x0,3);
end