%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                           Tecnológico de Costa Rica                          #
#                       Análisis Numérico para Ingeniería                      #
#                                   Tarea 5                                    #
#                        Néstor Baltodano/Diego Granados                       #
#                               I Semestre 2018                                #
#                        Implementación de RungeKutta4                         #  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [x, y] = RungeKutta4_1(f, xi, xf, y0, h)
  x = xi:h:xf;               #Vector X de salida va desde Xinicial de esntrada hasta Xfinal
  y = zeros(1, length(x));   #Vector y de salida es una matriz de ceros del mismo tamaño que x
  y(1) = y0;                 #El primer valor de la solución viene dado en los parámetros  
  for n = 2:length(x)
    k1 = f(x(n-1), y(n-1));
    k2 = f(x(n-1) + h/2, y(n-1) + k1 * h/2);
    k3 = f(x(n-1) + h/2, y(n-1) + k2 * h/2);
    k4 = f(x(n-1) + h, y(n-1) + h * k3);
    y(n) = y(n-1) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
   endfor
  end
