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

    % data is logged in ABS_output
    % this prevents the main workspace from getting cluttered

    % plot wheel speed and car speed
    plot(ABS_output.get('yout').Values.Vs.Time, ...
         ABS_output.get('yout').Values.Vs.Data, ... 
         ABS_output.get('yout').Values.Ww.Time, ...
         ABS_output.get('yout').Values.Ww.Data);
    legend('Vehicle Speed \omega_v','Wheel Speed \omega_w','Location','best'); 
    title('Vehicle speed and wheel speed for signal1'); ylabel('Speed(rad/sec)'); xlabel('Time(sec)');

    h = findobj(0, 'Name', 'ABS Slip');
    if isempty(h),
      h=figure('Position',[486    239   452   257],...
               'Name','ABS Slip',...
               'NumberTitle','off');
    end

    figure(h);
    plot(ABS_output.get('slip').Values.Time, ...
         ABS_output.get('slip').Values.Data);
    title('Slip for signal1'); xlabel('Time(sec)'); ylabel('Normalized Relative Slip'); 

end

if ~exist('ABS_output','var')
    disp('Did not find ABS_output dataset to plot results.');
    disp('Please run simulation on the ABS model.');
elseif isa(ABS_output,'Simulink.SimulationData.Dataset')
    h = findobj(0, 'Name', 'ABS Speeds1');
    if isempty(h),
      h=figure('Position',[26   239   452   257],...
               'Name','ABS Speeds1',...
               'NumberTitle','off');
    end

    figure(h)
    set(h,'DefaultAxesFontSize',8)

    % data is logged in ABS_output
    % this prevents the main workspace from getting cluttered

    % plot wheel speed and car speed
    plot(ABS_output.get('yout1').Values.Vs.Time, ...
         ABS_output.get('yout1').Values.Vs.Data, ... 
         ABS_output.get('yout1').Values.Ww.Time, ...
         ABS_output.get('yout1').Values.Ww.Data);
    legend('Vehicle Speed \omega_v','Wheel Speed \omega_w','Location','best'); 
    title('Vehicle speed and wheel speed for signal2'); ylabel('Speed(rad/sec)'); xlabel('Time(sec)');

    h = findobj(0, 'Name', 'ABS Slip1');
    if isempty(h),
      h=figure('Position',[486    239   452   257],...
               'Name','ABS Slip1',...
               'NumberTitle','off');
    end

    figure(h);
    plot(ABS_output.get('slip1').Values.Time, ...
         ABS_output.get('slip1').Values.Data);
    title('Slip for signal2'); xlabel('Time(sec)'); ylabel('Normalized Relative Slip'); 

end