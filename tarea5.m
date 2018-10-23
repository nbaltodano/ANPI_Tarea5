#function [x,y] = RungeKutta4(f, xi, xf, y0, h)
#  x  = xi:h:xf;            #Vector X de salida va desde x inicial hasta 
#                           #un x final con tamano de paso h
#  y  = zeros(1,length(x)); #Vector de salida de ceros del mismo tamano de x.
#  y(1) = y0;               #Primer solucion dado dentro de los parametros.
#  for m = 1:1000            #Mil iteraciones para pulir la solucion.
#    for n = 1:length(x)    #Actualizacion de cada paso de la solucion con paso h.
#      k1 = f(x(n),y(n));
#      k2 = f(x(n)+h/2,y(n)+k1*h/2);
#      k3 = f(x(n)+h/2,y(n)+k2*h/2);
#      k4 = f(x(n)+h  ,y(n)+k3*h);
#      y(n+1) = y(n) + (1/6)*(k1+2*k2+2*k3+k4)*h;
#    endfor
#   endfor
#endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#_XO=zeros(1,2);
#_X0(1) = 0;
#_X0(2) = 1;
#_TF = 1;
#_FG =@ (T,X) [X(1)*(X(2))^2];
#[X, Y] = rungekutta4(_FG, 0, 1, 1, 1/8);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ODE23

%condiciones iniciales en el vector x0
x0=zeros(1,2);
x0(1)=0;      #x0
x0(2)=5;      #y0
tf=200;

tspan=[0 tf]; 
fg=@(t,x) [100- x(2)];    #f(t,x)
tic();
[t,x]=ode23(fg,tspan,x0); #Find the solution of the ecuation.
timeODE23 = toc();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ODE45
%condiciones iniciales en el vector x0
X0=zeros(1,2);
X0(1)=0;      #x0
X0(2)=5;      #y0
TF=200;

TSPAN=[0 TF]; 
FG=@(T,X) [100- X(2)];         #f(t,x)
tic();
[T,X]=ode45(FG,TSPAN,X0);      #Find the solution of the ecuation.
timeODE45 = toc();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RungeKutta4
%condiciones iniciales en el vector x0
RKX0=zeros(1,2);
RKX0(1)=0;      #x0
RKX0(2)=5;      #y0
RKTF=200;

RKTSPAN=[0 RKTF]; 
RKFG=@(RKT,RKX) [100- RKX(2)];         #f(t,x)
tic();
[RKT,RKX]=ode45(RKFG,RKTSPAN,RKX0);    #Find the solution of the ecuation.
timeRK4 = toc();

plot(t,x(:,2),'r',T,X(:,2),'g',RKT,RKX(:,2),'b')#Plot the solution.
xlabel('t')
ylabel('y');
title('dy/dt=100-y')

disp("The time elapsed with ODE23 is:"), disp(timeODE23);
disp("Points used with ODE23 is:")     , disp(rows(x));
disp("The time elapsed with ODE45 is:"), disp(timeODE45);
disp("Points used with ODE45 is:")     , disp(rows(X));
disp("The time elapsed with Runge Kutta  is:") , disp(timeRK4);
disp("Points used with Runge Kutta is:")     , disp(rows(RKX));