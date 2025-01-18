num_photon = 100;
bit = randi([0, 1], num_photon, 1); %[bit, Alice_H, Alice_V, Bob_H, Bob_V]
sim = zeros(num_photon, 5);
sim(:, 1) = bit; % Assign the bit column
detec = rand(num_photon, 1); % Generate random detection probabilities

for i = 1:num_photon
    if detec(i) > 0.5 % Under ideal conditions, detection rate is 50/50
        sim(i, 2) = 1; % Alice detected H
        sim(i, 3) = 0; % Alice detected V
        sim(i, 4) = 1; % Bob detected H
        sim(i, 5) = 0; % Bob detected V
    else
        sim(i, 2) = 0; % Alice detected H
        sim(i, 3) = 1; % Alice detected V
        sim(i, 4) = 0; % Bob detected H
        sim(i, 5) = 1; % Bob detected V
    end
end

T = array2table(sim, 'VariableNames', {'Bit', 'Alice_V', 'Alice_H', 'Bob_V', 'Bob_H'});
writetable(T, 'HH_VV_simulation_correlated.xlsx');
disp('Simulation results saved to HH_VV_simulation.csv');