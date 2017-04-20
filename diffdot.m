function val = diffdot(x,y)
syms k real
x = subs(x,y,k);
x=diff(x,k);
val=subs(x,k,y);
end