%% Running the Simulation in ABS Mode
%
% On the Simulation tab, click *Run* to run the simulation. You can also
% run the simulation by executing the |sim('sldemo_absbrake')| command in
% MATLAB. ABS is turned on during this simulation.

evalc('sim(''ABS'')'); %this code is not shown in the example
%%
%
% * Note: The model logs relevant data to MATLAB workspace in a structure
% called |sldemo_absbrake_output|. Logged signals have a blue indicator. In
% this case |yout| and |slp| are logged.  Read more about Signal Logging in
% Simulink Help.

Time_ABS = ABS_output.get('yout').Values.Sd.Time; % Save the ABS results
Stop_ABS = ABS_output.get('yout').Values.Sd.Data;

%% 
%
% The plots above show the ABS simulation results (for default parameters).
% The first plot shows the wheel angular velocity and corresponding vehicle
% angular velocity. This plot shows that the wheel speed stays below
% vehicle speed without locking up, with vehicle speed going to zero in
% less than 15 seconds.
%

%% Running the Simulation Without ABS
%
% For more meaningful results, consider the vehicle behavior without
% ABS. At the MATLAB command line, set the model variable |ctrl = 0|.  This
% disconnects the slip feedback from the controller, resulting in
% maximum braking.
%
%  ctrl = 0;

ctrl=0;

%%
%
% Now run the simulation again. This will model braking without ABS. 

evalc('sim(''ABS'')'); %this code is not shown in the example

%% 
Time_no_ABS = ABS_output.get('yout').Values.Sd.Time; %save the non-ABS results
Stop_no_ABS = ABS_output.get('yout').Values.Sd.Data;
%% Braking With ABS Versus Braking Without ABS
%
% In the plot showing vehicle speed and wheel speed, observe that the wheel
% locks up in about seven seconds. The braking, from that point on, is
% applied in a less-than-optimal part of the slip curve. That is, when
% |slip = 1|, as the slip plot shows, the tire is skidding so much on the
% pavement that the friction force has dropped off.
% 
% This is, perhaps, more meaningful in terms of the comparison shown below.
% The distance traveled by the vehicle is plotted for the two cases.
% Without ABS, the vehicle skids about an extra 100 feet, taking about
% three seconds longer to come to a stop.
%

plot(Time_ABS, Stop_ABS, Time_no_ABS, Stop_no_ABS); %code not shown in example
xlabel('Slip Time (sec)'); 
ylabel('Stopping Distance (ft)');
legend('With ABS','Without ABS','Location','SouthEast');
title('Stopping distance for hard braking with and without ABS');

%% Closing the Model
%
% Close the model.  Close the 'Wheel Speed' subsystem. Clear logged data.
close_system('ABS', 0);
clear ABS_output Stop_ABS Stop_no_ABS Time_ABS Time_no_ABS;
clear mex;