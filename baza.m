function r = baza(sursa,b1,b2)

#include <string.h>

%aflam lungimea sursei
l=length(sursa);
%schimbam numarul in baza 10
%daca este numar, facem conversia in int prin scaderea cu '0'
if sursa(l) >= '0' && sursa(l) <= '9'
  t=sursa(l)-'0';
else
%daca este litera, facem conversia in int prin scaderea cu 'a' si mai adunam 10
  t=sursa(l)-'a'+10;
endif
 %parcurgem sursa si facem suma caracter cu caracter
if l > 1
  for i=1:(l-1)
    if sursa(l-i) >= '0' && sursa(l-i) <= '9'
      t=t+b1^i*(sursa(l-i)-'0');
    else
      t=t+b1^i*(sursa(l-i)-'a'+10);
   endif
  endfor
endif

aux=t;
nr=0;
%aflam din cate caractere va fi format numarul final
while aux > 0
  aux=floor(aux/b2);
  nr=nr+1;
endwhile

f='';
alf='abcdefghijklmnopqrst';

%folosim o repetitiva care va merge pana la numarul de caractere pe care
%il va avea numarul final
for i=nr:-1:1
%aflam restul impartirii numarul in baza 10 la baza in care vrem sa trecem
  m=mod(t,b2);
  if m < 10
  %daca e < 10 putem sa il adaugam direct
    m=num2str(m);
    f(i)=m;
  else
  %altfel inseamna ca trebuie sa adaugam o litera
    m=m-9;
    f(i)=alf(m);
  endif
  %impartim numarul in baza 10 la baza in care vrem sa trecem
  t=floor(t/b2);
endfor

disp(f)

endfunction