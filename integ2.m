function dy = integ2(t,y)
    g=9.8*0.6;
    l=10;
    theta1 = y(1);
    theta1dot = y(2);
    theta2 = y(3);
    theta2dot = y(4);
    
    dy = zeros(4,1);
    dy(1) = theta1dot;
    dy(2) = -(g*sin(theta1 + theta2) + 2*g*sin(theta1))/l;
    
    dy(3) = theta2dot;
    dy(4) = -(g*sin(theta1 + theta2))/l;
end