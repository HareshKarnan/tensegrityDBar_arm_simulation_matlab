function dy = integ(t,q)
   g = 9.8;
   l = 200;
   theta = q(1);
   thetadot = q(2);
   dy = zeros(2,1);
   dy(1) = thetadot;
   dy(2) = -(g*sin(theta))/l;
end