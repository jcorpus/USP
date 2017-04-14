% calculadora aritmetica con recursividad.
% colocamos  el predicado(0) primero para ahorrar memoria.
mipredicado:- calculadora(1).
calculadora(0).
calculadora(1):-
    write('1.sumar 2.restar 3.multiplicar, 4.dividir 5.salir '),
    read(Opcion),
    write('a='), read(A),
    write('a=b'),read(B),
    operador(Opcion,A,B,Estado),
    calculadora(Estado).

operador(1,A,B,1):- C is A + B,
    format('la suma es: ~w ~n',[C]).
operador(2,A,B,1):- C is A - B,
    format('la resta es: ~w ~n',[C]).
operador(3,A,B,1):- C is A * B,
    format('la multiplicacion es: ~w ~n',[C]).
operador(4,A,B,1):- C is A / B,
    format('la division es: ~w ~n',[C]).
operador(5,_,_,0):-write('hasta luego').

