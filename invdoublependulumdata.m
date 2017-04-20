[t,y] = ode45(@integ2,linspace(0,20,1000),[pi/2 0 pi/2 0]);

O = [0,0];
axis(gca,'equal');
axis([-2 2 -2 0.1])
grid on;

for i=1:length(t)
    p1 = 1*[sin(y(i,1)) -cos(y(i,1))];
    circ1 = viscircles(O,0.01);
    pend1 = line([O(1) p1(1)],[O(2) p1(2)]);
    ball1 = viscircles(p1,0.01);
    p2 = p1+[sin(y(i,3)) -cos(y(i,3))];
    pend2 = line([p1(1) p2(1)],[p1(2) p2(2)]);
    ball2 = viscircles(p2,0.01);
    pause(0.01);

    if i<length(t)
        delete(circ1);
        delete(pend1);
        delete(ball1);
        delete(pend2);
        delete(ball2);
    end
end
