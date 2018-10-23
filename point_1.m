%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                           Tecnológico de Costa Rica                          #
#                       Análisis Numérico para Ingeniería                      #
#                                   Tarea 5                                    #
#                        Néstor Baltodano/Diego Granados                       #
#                               I Semestre 2018                                #
#                             Solución para punto 1                            #
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function solv = point_1()
  f = @function1;
  xi = 0;
  xf = 1;
  y0 = 1;
  
  [x8, y8] = RungeKutta4(f, xi, xf, y0, 1/8);
  [x16, y16] = RungeKutta4(f, xi, xf, y0, 1/16);
  [x32, y32] = RungeKutta4(f, xi, xf, y0, 1/32);
  [x64, y64] = RungeKutta4(f, xi, xf, y0, 1/64);
  [x128, y128] = RungeKutta4(f, xi, xf, y0, 1/128);
  [x256, y256] = RungeKutta4(f, xi, xf, y0, 1/256;
  [x512, y512] = RungeKutta4(f, xi, xf, y0, 1/512);
  [x1024, y1024] = RungeKutta4(f, xi, xf, y0, 1/1024);
  
  # Graficando
  
  figure(1);
  plot(x8,y8,"k;1/8 Factor;",
  x16,y16,"r;1/16 Factor;",
  x32,y32,"g;1/32 Factor;",
  x64,y64,"b;1/64 Factor;",
  x128,y128,"y;1/128 Factor;",
  x256,y256,"m;1/256 Factor;",
  x512,y512,"c;1/512 Factor;",
  x1024,y1024,"k;1/1024 Factor;");
  
 endfunction
  
  