% function [sol_num, lyap, Y0] = sim_n_lyap(f, startT, endT, initial_conditions, dt, dim, var)
%     eps = 1e-14;
%     dIC = 0 * initial_conditions;    
%     dIC(dim) = eps;
%     sol_num = zeros(length(initial_conditions), length(startT:dt:endT));
%     sol_num2 = zeros(length(initial_conditions), length(startT:dt:endT));
%     
%     j = 1;
%     Y = initial_conditions';
%     for t = startT:dt:endT
%         Y = euler(f, Y, dt, var);
%         sol_num(:,j) = Y;
%         j = j + 1;
%     end
%     j = 1;
%     Y = (initial_conditions + dIC)';
%     for t = startT:dt:endT
%         Y = euler(f, Y, dt, var);
%         sol_num2(:,j) = Y;
%         j = j + 1;
%     end
%     
%     Y0 = sol_num(:, end);
% 
%     t = startT:dt:endT;
%     % check maximal lyapunov exponent
%     %     
%     e = abs(sol_num - sol_num2);
%     ef = medfilt1(e(dim,:), 20);
%     
%     % find one crossing
%     %     
%     ids = find(ef > mean(abs(sol_num(dim,:)))/2);
%     if ~isempty(ids)
%         V1 = ef(2); 
%         T2 = t(ids(1)); V2 = ef(ids(1)); 
%         lyap = (log(V2) - log(V1))/T2;
%     else
%         lyap = 0;
%     end
% end



function [sol_num, lyap, Y0] = sim_n_lyap(f, startT, endT, initial_conditions, dt, dim, var)
    eps = 1e-14;
    dIC = 0 * initial_conditions;
    dIC(dim) = eps;
    sol_num = zeros(length(initial_conditions), length(startT:dt:endT));
    sol_num2 = zeros(length(initial_conditions), length(startT:dt:endT));

    j = 1;
    Y = initial_conditions';
    for t = startT:dt:endT
        Y = eulerode(f, Y, dt, var);
        sol_num(:,j) = Y;
        j = j + 1;
    end
    j = 1;
    Y = (initial_conditions + dIC)';
    for t = startT:dt:endT
        Y = eulerode(f, Y, dt, var);
        sol_num2(:,j) = Y;
        j = j + 1;
    end

    Y0 = sol_num(:, end);

    t = startT:dt:endT;
    % Check maximal Lyapunov exponent
    e = abs(sol_num - sol_num2);
    ef = medfilt1(e(dim,:), 20);

    % Find crossings above certain threshold
    ids = find(ef > 1e-10); % Adjust threshold as needed
    if ~isempty(ids)
        V1 = ef(1); 
        T2 = t(ids(1)); V2 = ef(ids(1)); 
        lyap = (log(V2) - log(V1))/T2;
    else
        lyap = 0;
    end
end



