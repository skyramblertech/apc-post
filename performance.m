clear; clc; close all;

listing = dir('processed');
data = {};
for k = 1:length(listing)
    if listing(k).isdir == 0
        data = [data, { listing(k).name }]; 
    end
end
data = { 'PER3_15x55MR.dat', ...
     'PER3_16x4E.dat', ...
     'PER3_16x55MR.dat', ...
     'PER3_17x6E.dat', ...
     'PER3_18x55MR.dat', ...
     'PER3_20x8E.dat', ...
     'PER3_20x13E.dat', ...
     'PER3_19x8E.dat', ...
     'PER3_27x13E.dat', ...
     'PER3_155x12-4.dat', ...
     'PER3_22x8.dat' ... % 'PER3_24x12E.dat', 'PER3_26x13E.dat', 'PER3_27x13E.dat', 'PER3_13x65E.dat', 'PER3_13x55EP.dat'
     };
patterns = '+xosd^><v';





figure;
for k = 1:length(data)
    mat = dlmread(['processed/' data{k}]);
    name = strrep(data{k}, 'PER3_', '');
    name = strrep(name, '.dat', '');
    plot(mat(:,2), mat(:,3), ['-', patterns(mod(k,length(patterns))+1)] ...
        , 'DisplayName', name);
    hold on;
end
axis( [10, 60, 20, 80] );
legend('show');
xlabel('Static Thrust (lb_f)');
ylabel('Power Loading (N / kW)');
% ylabel('Static Thrust (lb_f)');
% xlabel('Tip Mach Number');
title('Efficiency vs. Thrust Magnitude');








figure;
for k = 1:length(data)
    mat = dlmread(['processed/' data{k}]);
    name = strrep(data{k}, 'PER3_', '');
    name = strrep(name, '.dat', '');
    plot(mat(:,1), mat(:,2), ['-', patterns(mod(k,length(patterns))+1)] ...
        , 'DisplayName', name);
    hold on;
end
axis( [0, 0.4, 0, 40] );
legend('show');
xlabel('Tip Mach number');
ylabel('Static Thrust (lb_f)');
title('Efficiency vs. Tip Mach Number');





% Hardware calculations for one test point
hardware_configuration(0.2093, 18, 10.43, 0.75, 68.59, ...
    400, 7, ...
    16, 0.8, 280);
hardware_configuration(0.2093, 18, 10.43, 0.75, 68.59, ...
    840, 7, ...
    12, 0.8, 280);
hardware_configuration(0.279, 16, 10.53, 0.75, 61.59, ...
    840, 6, ...
    16, 0.8, 280);
hardware_configuration(0.279, 16, 10.53, 0.75, 61.59, ...
    620, 6, ...
    16, 0.8, 195);
% hardware_configuration(0.2093, 18, 10.43, 0.75, 68.59, ...
%     370, 6, ...
%     16, 0.8, 270);
hardware_configuration(0.2093, 18, 10.43, 0.75, 68.59, ...
    460, 6, ...
    16, 0.8, 270);
% hardware_configuration(0.2093, 27, 24.44, 0.75, 55.44, ...
%     370, 6, ...
%     8, 0.8, 270);


