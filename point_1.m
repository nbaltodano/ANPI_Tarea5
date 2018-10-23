%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#                           Tecnológico de Costa Rica                          #
#                       Análisis Numérico para Ingeniería                      #
#                                   Tarea 5                                    #
#                        Néstor Baltodano/Diego Granados                       #
#                               I Semestre 2018                                #
#                             Solución para punto 1                            #
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function funct = point_1()

  #Estableciendo parámetros iniciales
  f1 =@ (x,y) [x*y^(2)];
  xi = 0;
  xf = 1;
  y0 = 1;
  
  #Calculando los RungeKutta con diferentes valres de h
  [x8, y8] = RungeKutta4(f1, xi, xf, y0, 1/8);
  [x16, y16] = RungeKutta4(f1, xi, xf, y0, 1/16);
  [x32, y32] = RungeKutta4(f1, xi, xf, y0, 1/32);
  [x64, y64] = RungeKutta4(f1, xi, xf, y0, 1/64);
  [x128, y128] = RungeKutta4(f1, xi, xf, y0, 1/128);
  [x256, y256] = RungeKutta4(f1, xi, xf, y0, 1/256);
  [x512, y512] = RungeKutta4(f1, xi, xf, y0, 1/512);
  [x1024, y1024] = RungeKutta4(f1, xi, xf, y0, 1/1024);
  
  #Calculando los errores
  errors = zeros(1,8);
  errors(1) = abs(2-y8(length(y8)));
  errors(2) = abs(2-y16(length(y16)));
  errors(3) = abs(2-y32(length(y32)));
  errors(4) = abs(2-y64(length(y64)));
  errors(5) = abs(2-y128(length(y128)));
  errors(6) = abs(2-y256(length(y256)));
  errors(7) = abs(2-y512(length(y512)));
  errors(8) = abs(2-y1024(length(y1024)));
  
  # Graficando los resultados obtenidos con diferentes valores de h
  figure(1);
  plot(x8,y8,"k;h = 1/8;", 
  x16,y16,"k;h = 1/16;", 
  x32,y32,"g;h = 1/32;", 
  x64,y64,"b;h = 1/64;", 
  x128,y128,"c;h = 1/128;", 
  x256,y256,"r;h = 1/256;", 
  x512,y512,"m;h = 1/512;", 
  x1024,y1024,"y;h = 1/1024;"); 
  
  %Graficando los errores 
  figure(2);
  semilogy([1/8, 1/16, 1/32, 1/64, 1/128, 1/256, 1/512, 1/1024],errors,"-+k");
  
 endfunction
  
  