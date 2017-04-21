syms m t l th(t) g real
syms d2q q real

p = [l;0;0];
w = [0;0;diff(th,t)];
v = diff(p,t) + cross(w,p);
KE = 0.5*m*v.'*v;
PE = m*g*l*cos(th);
L = KE-PE;
Lag = diff(diffdot(L,diff(th,t)),t) - diffdot(L,th);
Lg = subs(Lag,[diff(th,t,t) th],[d2q q]);
d2q = solve(Lg,d2q)
%{
t = linspace(0,200,1000);
[t,y] = ode45(@integ,t,[pi/2;0]);
plot(t,y(:,1)*180/pi)

O = [0,0];
axis(gca,'equal');
axis([-1.2 1.2 -1.2 0.2])
grid on;

for i=2:length(t)
    p = [sin(y(i,1)) -cos(y(i,1))];
    circ = viscircles(O,0.01);
    pend = line([O(1) p(1)],[O(2) p(2)]);
    ball = viscircles(p,0.01);
    pause(0.001);

    if i<length(t)
        delete(circ);
        delete(pend);
        delete(ball);
    end
end
%}