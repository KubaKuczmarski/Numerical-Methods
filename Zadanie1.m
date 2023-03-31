%% Zadanie 1
% Interpolacja Lagrange'a
format short
x0=[ 0.0 0.1 0.3 0.6 1.0];
y0=[-6  -5.89483 -5.65014 -5.17788 -4.28172];
x1=[ 0.0 0.1 0.3 0.6 1.0 1.1];
y1=[-6  -5.89483 -5.65014 -5.17788 -4.28172 -3.99583];

[fun1 fun2]=lagrange(x0,y0,x1,y1);
wynik1=vpa(subs(fun1, 0.2))
wynik2=vpa(subs(fun2, 0.2))
makeplot(x0,x1,y0,y1,fun1,fun2)


%wywołanie algorytmu interpolacji i pomiar czasu wykonania obliczeń
function [a,b]=lagrange(x0,y0,x1,y1)

tic 
a=fun(x0,y0);
czas1=toc 
tic 
b=fun(x1,y1);
czas2=toc 
end

% Tworzenie wykresu na podstawie wyniku interpolacji
function [xplot, diff]=makeplot(x0,x1,y0,y1,y4, y5)
y1plot=[];
y2plot=[];
xplot=[];
for i=0:0.01:1.2
y1plot=[y1plot, vpa(subs(y4,i))];
y2plot=[y2plot, vpa(subs(y5,i))];
xplot=[xplot,i];
end
diff=abs(y2plot-y1plot);
st=std(diff)
%---------------------------------------
figure(1)
subplot(2,1,1);
plot(xplot,y1plot);
hold on 
plot(x0,y0,'+');
title('Wynik Interpolacji 4-go stopnia')
xlabel('x') 
ylabel('y') 
%----------------------------------------
subplot(2,1,2);
plot(xplot,y2plot);
hold on 
plot(x1,y1,'+');
title('Wynik Interpolacji 5-go stopnia')
xlabel('x') 
ylabel('y') 
%----------------------------------------
figure(2)
plot(xplot,diff)
title('Przebieg różnicy wyników interpolacji')
xlabel('x') 
ylabel('difference') 
end


%Funkcja wykonująca interpolację
function [F]=fun(xin,yin)
len=length(yin);
F=0;
syms x;
for j=1:1:len
    fi=1;
    for i =1:1:len
        if( j == i)
            continue
        end
        a=x-xin(i);
        fi=expand(fi*a/(xin(j)-xin(i)));
            
    end
    F=expand(F+fi*yin(j));
   
end
end