program listaempleados;
uses
  crt;

const
	total = 1000;
	anActual = 2022;
	mesActual = 06;
	diaActual = 01;

type
  empleados = Record
  nombreApellido : string;
  cedula : longint;
  anNac: integer;
	mesNac: integer;
	diaNac: integer;
  sueldo : longint;
	edad: integer;
	categoria : integer;
end;
 
var
  listado : array[1..total] of empleados;
  aux : empleados;
	cantidad:longint;
  i, t, r : integer;
 
procedure entradadatos;
  begin
    write('¿Cuántos empleados va a agregar esta vez? ');
    readln(cantidad);
     for i := 1 to cantidad do
     begin
        clrscr;
        writeln('  Ingrese los datos de los empleados : ',i, ' de: ', cantidad);
        writeln;
        write('Nombre y Apellido: ');
        readln(listado[i].nombreApellido);
        write('Cédula : ');
        readln(listado[i].cedula);
        write('Día de nacimiento: ');
        readln(listado[i].diaNac);
        if (listado[i].diaNac>31) or (listado[i].diaNac<1)  then
        begin
        repeat
        write('Incorrecto, ingrese un número del 1 al 31: ');
        readln(listado[i].diaNac);
        until (listado[i].diaNac<=31) and (listado[i].diaNac>=1) 
        end;
		write('Mes de nacimiento: ');
        readln(listado[i].mesNac);
        if (listado[i].mesNac>12) or (listado[i].mesNac<1)  then
        begin
        repeat
        write('Incorrecto, ingrese un número del 1 al 12: ');
        readln(listado[i].diaNac);
        until (listado[i].diaNac<=12) and (listado[i].diaNac>=1)
        end;
		write('Año de nacimiento: ');
        readln(listado[i].anNac); 
		listado[i].edad := anActual-listado[i].anNac;
		if (listado[i].mesNac>mesActual) or ((listado[i].mesNac=mesActual) and (listado[i].diaNac>diaActual)) then
        begin
            listado[i].edad := listado[i].edad-1;
        end;
        write('Sueldo: ');
        readln(listado[i].sueldo);
    if (listado[i].sueldo < 1000) or (listado[i].sueldo > 3000) then
      begin
      repeat
        write('Incorrecto, ingrese un sueldo entre 1000 y 3000: ');
        readln(listado[i].sueldo);
      until (listado[i].sueldo > 1000) and (listado[i].sueldo < 3000)
      end;

		case listado[i].sueldo of
		    		1000..2000 :
		    			begin
		    				listado[i].categoria:=1;
		    			end;
		    		2001..2500 :
		    			begin
		    				listado[i].categoria:=2;
		    			end;
		    		2501..3000 :
		    			begin
		    				listado[i].categoria:=3;
		    			end;
		    	end; {end-case}
    end;
  end;
 
   procedure ordenadatos;
   begin
       for t := 1 to cantidad do
         for r := i downto t + 1 do
         if listado[t].cedula > listado[r].cedula then
         begin
             aux := listado[t];
             listado[t] := listado[r];
             listado[r] := aux;
         end;
   end;
 
   procedure mostrardatos;
   var
      d: integer;
   begin
       
       gotoxy(30,1); writeln('.... Lista de empleados .....');
       writeln;
       gotoxy(1,3); writeln('N° de Cedula'); gotoxy(20,3); writeln('Nombre y Apellido');
	        gotoxy(45,3); writeln('Edad'); gotoxy(55,3); writeln('Categoria');
       for d := 1 to cantidad do
       writeln(listado[d].cedula, ' ':11, listado[d].nombreApellido, ' ':15, listado[d].edad, ' ':10, listado[d].categoria);
       writeln;
       writeln;
       writeln('*** Pulse [Enter] ***');
       readln;
   end;
 
   procedure menu;
   var
     tec : char;
   begin
      repeat
       clrscr;
       writeln('**** Menu General ****');
       writeln;
       writeln('  1 = Entrada Datos');
       writeln('  2 = Mostrar Resultados');
       writeln('  3 = Salir');
       writeln;
       writeln('<<< Indique una opción >>>');
       repeat
       tec := readkey;
       until tec in['1','2','3'];
    case tec of
  '1' : begin
        clrscr;
        entradadatos;
        ordenadatos;
        end;
  '2' : begin clrscr; mostrardatos; end;
    end;
      until tec = '3';
   end;
 
 
begin
  menu;
end
