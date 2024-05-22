function y = eulerode(f, x, h, var)
dx = f(x, var);
y = x + dx * h;