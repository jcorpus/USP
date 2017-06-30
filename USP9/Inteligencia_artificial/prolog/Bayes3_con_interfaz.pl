% Autor:
% Fecha: 21/06/2015

conexion:- odbc_connect('NuevaConexion',_,[user('root'),password(''),alias(bd),open(once)]),
           odbc_prepare(bd,'SELECT cantidad from resumen where enfermedad=? and dolor=? and vomito=? and ppeso=?',
           [atom>char(2),atom>char(2),atom>char(2),atom>char(2)],
           Handle,
           [types([integer])]),
           abolish(odbc_handle/1),
           assert(odbc_handle(Handle)).



run_stmt(R,E,D,V,Pp):- odbc_handle(Handle),
              odbc_execute(Handle,[E,D,V,Pp],row(R)).


sistema:-  conexion,
	   new(V, dialog('Sistema experto probabilistico')),
	   new(P1,menu('dolor?')),
	   send_list(P1,append, [si,no]),
	   new(P2,menu('perdida de peso?')),
	   send_list(P2,append, [si,no]),
	   new(P3,menu('vomito?')),
	   send_list(P3,append, [si,no]),
	   send_list(V,append,[
		       P1,P2,P3,
		       button(aceptar,message(@prolog,
					     inferencia,
					     P1?selection,
					     P2?selection,
					     P3?selection))]),
	   send(V,open).


inferencia(D,Pp,V):- conexion,
	     run_stmt(R1,si,D,V,Pp),
             run_stmt(R2,no,D,V,Pp),
             Bayes is R1/(R1+R2),
	     new(W,dialog('Teorema de Bayes')),
	     new(E,label(l,Bayes)),
	     send(W,append,E),
	     send(W,open).
