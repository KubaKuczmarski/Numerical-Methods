%% Zadanie 4
% Kwadratura Gaussa-Laguerr'a
%%
%Wyznaczanie całki przy zastosowaniu Kwadratury Gaussa-Laguerre'a
format long
tic
w0= 0.603154 * 0.322548^2;
w1= 0.357419 * 1.745761^2;
w2= 0.038888 * 4.536620^2;
w3 =0.000539 * 2.395071^2;
sumw= w0+w1+w2+w3
toc
Dokvar=2;

% Użycie Symbolic Math Toolbox

tic
syms x
s=x^2* exp(-x);
value=double(int(s,x,0,Inf)) % Wartosc wyznaczona przez funkcje Matlab 
toc

diff=double(value-sumw) % Wyznaczona różnica 