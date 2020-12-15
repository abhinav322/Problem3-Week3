if ~exist('ABS_output','var')
    disp('Did not find ABS_output dataset to plot results.');
    disp('Please run simulation on the ABS model.');
elseif isa(ABS_output,'Simulink.SimulationData.Dataset')
    h = findobj(0, 'Name', 'ABS Speeds');
    if isempty(h),
      h=figure('Position',[26   239   452   257],...
               'Name','ABS Speeds',...
               'NumberTitle','off');
    end

    figure(h)
    set(h,'DefaultAxesFontSize',8)

    % data is logged in sldemo_absbrake_output
    % this prevents the main workspace from getting cluttered

    % plot wheel speed and car speed
    plot(ABS_output.get('yout').Values.Vs.Time, ...
         ABS_output.get('yout').Values.Vs.Data, ... 
         ABS_output.get('yout').Values.Ww.Time, ...
         ABS_output.get('yout').Values.Ww.Data);
    legend('Vehicle Speed \omega_v','Wheel Speed \omega_w','Location','best'); 
    title('Vehicle speed and wheel speed'); ylabel('Speed(rad/sec)'); xlabel('Time(sec)');

    h = findobj(0, 'Name', 'ABS Slip');
    if isempty(h),
      h=figure('Position',[486    239   452   257],...
               'Name','ABS Slip',...
               'NumberTitle','off');
    end

    figure(h);
    plot(ABS_output.get('slp').Values.Time, ...
         ABS_output.get('slp').Values.Data);
    title('Slip'); xlabel('Time(sec)'); ylabel('Normalized Relative Slip');

end

Time_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Time; % Save the ABS results
Stop_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Data;
ctrl=0;
Time_no_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Time; %save the non-ABS results
Stop_no_ABS = sldemo_absbrake_output.get('yout').Values.Sd.Data;
plot(Time_ABS, Stop_ABS, Time_no_ABS, Stop_no_ABS); %code not shown in example
xlabel('Slip Time (sec)'); 
ylabel('Stopping Distance (ft)');
legend('With ABS','Without ABS','Location','SouthEast');
title('Stopping distance for hard braking with and without ABS');
