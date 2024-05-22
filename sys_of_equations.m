function values = sys_of_equations(Y, var)
% a = 0.71;
% b = 1.7;
% % r = 2.957;
% g = 2.01;
% f = 6.205;
% c = 12.1;

a = var(1);
b = var(2);
r = var(3);
g = var(4);
f = var(5);
c = var(6);

values = zeros(3,1);
x = Y(1);
y = Y(2);
z = Y(3);

values(1) = -a * x + b * y^2;
values(2) = r * y - g * z;
values(3) = -f * z + c * x * y;