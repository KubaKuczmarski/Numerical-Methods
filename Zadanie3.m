
%%  Zadanie 3.Aproksymacja średniokwadratowa
% Używając funkcji polyfit,polyval

x=(-1:0.02:1);
f=2*x.^2./(x.^3.+5);
a = polyfit(x, f,2)
p=polyval(a,x);
e=(f - p);
ewz=e./max(f) *100;


%Używając funkcji z wykładu

g00=sum(x.^0.*x.^0);
g01=sum(x.^0.*x.^1);
g10=sum(x.^1.*x.^0);
g11=sum(x.^1.*x.^1);
g02=sum(x.^0.*x.^2);
g12=sum(x.^1.*x.^2);
g22=sum(x.^2.*x.^2);
A=[g00 g01 g02; g10 g11 g12 ; g02 g12 g22 ]
y0=sum(x.^0.*f);
y1=sum(x.^1.*f);
y2=sum(x.^2.*f);
B=[ y0; y1; y2]


X=linsolve(A,B) % to samo co niżej, tylko inaczej
row1=mtimes(inv(A),B)
fun=row1(3,1).*x.^2+row1(2,1).*x+row1(1,1);
ed=(f - fun);
ewzd=ed./max(f) *100;

%Używając funkcji z wykładu
subplot(2,2,1)
plot(x,f,x,p)
title('funkcja rzeczywista i aproksymacja Matlab')
legend('Rzeczywsita','Aproksymacja')

subplot(2,2,2)
plot(x,ewz) 
title('Wykres błędów')

subplot(2,2,3)
plot(x,f,x,fun)
title('funkcja rzeczywista i nasza aproksymacja')
legend('Rzeczywsita','Aproksymacja')

subplot(2,2,4)
plot(x,ewzd) 
title('Wykres błędów')
format long
A
B
row1
