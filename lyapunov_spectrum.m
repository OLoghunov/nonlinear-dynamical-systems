clear all

a = 0.71;
b = 1.7;
r = 2.957;
g = 2.01;
f = 6.205;
c = 12.1;

startT = 0;
dt = 1e-2;
endT = 150;
N = length(startT:dt:endT);
j = 1;

init_conditions = [1 1 1];
Y0 = init_conditions';
sol_num = zeros(length(init_conditions), length(startT:dt:endT));
func = @(Y0, var)sys_of_equations(Y0, var); %пока только для переменной a

startP = 0.5;
endP = 1;
stepP = 0.0001;
stepinterval = startP:stepP:endP;
M = NaN*zeros(1200, length(stepinterval));
pos = 0;

lyapunovSpectrum = [];

for var=stepinterval
    disp(var)
    j = 1;
    pos = pos+1;

    [sol1, lyap, Y0] = sim_n_lyap(func, startT, endT, Y0', dt, 1, [var b r g f c]);
    
    lyapunovSpectrum = [lyapunovSpectrum, lyap];

    t = startT:dt:endT;
    index = t>25;
    X = sol1(:,index);
    l = length(X);
    
    p = 1;
    for i = 2:l
        if X(2, i) < -1 && X(2, i - 1) > -1
            M(p, pos) = X(3, i);
            p = p + 1;
        end
    end
end

figure()
subplot(2,1,1)
plot(stepinterval,M,'.k','MarkerSize',2)
grid on;
xlabel('\alpha')
ylabel('x_3')
xlim([startP, endP])

subplot(2,1,2)
semilogy(stepinterval,lyapunovSpectrum)
grid on;
xlabel('\alpha')
ylabel('LLE')
xlim([startP, endP])