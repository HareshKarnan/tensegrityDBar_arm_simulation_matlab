xT = 3;
yT = 15;
l = 10;
s1 = sqrt(xT^2 + yT^2);
alpha = 2 * acos((s1^2 + l^2 - l^2)/(2*s1*l));
beta = acos((l^2+l^2-s1^2)/(2*l*l));
th = atan(yT/xT);
th1 = th - alpha/2;
th2 = pi - beta;
th1*180/pi
th2*180/pi
