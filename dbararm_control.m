xt = 2;
yt = 10;
l=6; % length of the bar is 6 inch
th = atan(yt/xt);
alpha = 2*acos((36 + xt^2+yt^2 - 36)/(2*6*sqrt(xt^2+yt^2)));
beta = acos((36+36-xt^2-yt^2)/(2*6*6));
th1 = th - alpha/2;
th2 = pi - beta;
th3 = pi - alpha - th1;
th4 = th2;
thT = [th1;th2;th3;th4]

thc = []

ddE = thc - thT
