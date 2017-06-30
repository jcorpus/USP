% Autor:
% Fecha: 21/06/2015

conexion:- odbc_connect('NuevaConexion',_,[user('root'),password(''),alias(bd),open(once)]),
           odbc_prepare(bd,'SELECT cantidad FROM resumen where enfermedad =? and dolor=? and vomito=? and ppeso=?',
           [atom>char(2),atom>char(2),atom>char(2),atom>char(2)],
           Handle,
           [types([integer])]),
           abolish(odbc_handle/1),
           assert(odbc_handle(Handle)).



run_stmt(R,E,D,V,Pp):- odbc_handle(Handle),
              odbc_execute(Handle,[E,D,V,Pp],row(R)).


sistema:- conexion,
           writeln('Dolor:'),
           read(D),
           writeln('Vomito:'),
           read(V),
           writeln('Perdida de peso:'),
           read(Pp),
           run_stmt(R1,si,D,V,Pp),
           run_stmt(R2,no,D,V,Pp),
           Bayes is R1/(R1+R2),
           format('La probabilidad bayesiana de tener la enfermedad es ~w',[Bayes]).

