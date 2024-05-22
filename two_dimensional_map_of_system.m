clear all

a = 0.71;
b = 1.7;
r = 2.957;
g = 2.01;
f = 6.205;
c = 12.1;

init_conditions = [1 1 1];

startT = 0;
dt = 1e-2;
endT = 100;

startP1 = 2.2;
endP1 = 3.5;
stepP1 = 0.01;
stepinterval1 = startP1:stepP1:endP1;

startP2 = 5.3;
endP2 = 10;
stepP2 = 0.01;
stepinterval2 = startP2:stepP2:endP2;

lle_map = zeros(length(stepinterval1), length(stepinterval2));

lyapunovSpectrum = [];
parfor i = 1:length(stepinterval1)
    par1 = stepinterval1(i);
    lle = zeros(1,length(stepinterval2));
    Y0 = init_conditions';

    for j = 1:length(stepinterval2)
        par2 = stepinterval2(j);
        [~, lyap, Y0] = sim_n_lyap( ...
            @sys_of_equations, startT, endT, Y0', dt, 1, ...
            [par1 b r g par2 c]); 
        
        lle(j) = lyap;
    end

    lle_map(i,:) = lle;
end

figure();
h = imagesc(lle_full, [0 0.7]);
h.Colormap = parula;
h.xlim([4,13])
h.CellLabelColor = 'none';
h.GridVisible = 'off';
