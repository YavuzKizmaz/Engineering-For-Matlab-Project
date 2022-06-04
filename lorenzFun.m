function [x,y,z] = lorenzFun(h)
    %%Coefficients and inital variables
    sigma = 10;  
    rho = 28; %Alfanumeric sayı
    beta = 8/3;
    x(1)=1;
    y(1)=1;
    z(1)=1;  
    tf=100;
    n=10000;
    t=0:h:101;
    f=@(t,x,y,z) sigma*(y-x); 
    g=@(t,x,y,z) x*rho-x.*z-y;
    p=@(t,x,y,z) x.*y-beta*z;
    i=2;
    for j = 0:h:tf 
        xfyt = f(t(i-1),x(i-1),y(i-1),z(i-1));
        yfyt = g(t(i-1),x(i-1),y(i-1),z(i-1));
        zfyt = p(t(i-1),x(i-1),y(i-1),z(i-1));

        xyt1 = x(i-1)+h*xfyt;
        yyt1 = y(i-1)+h*yfyt;
        zyt1 = z(i-1)+h*zfyt;


        x(i) = x(i-1) + h*(xfyt+f(t(i),xyt1,yyt1,zyt1))/2;
        y(i) = y(i-1) + h*(yfyt+g(t(i),xyt1,yyt1,zyt1))/2;
        z(i) = z(i-1) + h*(zfyt+p(t(i),xyt1,yyt1,zyt1))/2;
        i=i+1;
    end
end

