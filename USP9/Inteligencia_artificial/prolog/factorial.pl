%faltorial recursivo
%n! = n x (n-1)! forma recursiva
%APILMIENTO
%5! = 5 x  4!
%       4 x 3!
%        3 x 2!
%         2 x 1!
%           1.
%
%DESAPILAMIENTO
%         2
%        6
%       24
%      120
%facto(5) = 5 x fact(4).
%
mipredicado:-
    write('n='), read(N),
    fact(N,F),% N es de entrada F es de salida
    format('el factorial de ~w es:  ~w', [N,F]).

fact(1,1).
fact(N,F):-
    N1 is N -1,
    fact(N1,F1), % F1 es igual a N1.
    F is N * F1.




