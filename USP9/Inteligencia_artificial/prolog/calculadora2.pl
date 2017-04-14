% calculadora aritmetica.
calculadora:-
    write('1.sumar 2.restar 3.multiplicar, 4.dividir 5.salir'),
    read(Opcion),
    write('a='), read(A),
    write('a=b'),read(B),
    operador(Opcion,A,B).

operador(1,A,B):- C is A + B,
    format('la suma es: ~w',[C]).
operador(2,A,B):- C is A - B,
    format('la resta es: ~w',[C]).
operador(3,A,B):- C is A * B,
    format('la multiplicacion es: ~w',[C]).
operador(4,A,B):- C is A / B,
    format('la division es: ~w',[C]).
operador(5,_,_):-write('hasta luego').

