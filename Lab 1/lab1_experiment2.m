try
    % First we will setup a serial port 
    % associated with the controller USB ? Change the 
    % COM port description in the single quotes as 
    % needed. 
    s = serial('/dev/tty.usbmodem14401')
    % Next we will setup the port communication speed
    % 	This may require some trial and error, but 
    %	115200 appears to be a good value (9600 may 
    % 	work too)
    set(s,'BaudRate',115200)
	% Now we actually open the serial port
    fopen(s)
    % We tell matlab to pause/wait  for 2 seconds to
    % make sure the controller connects to the
    % computer
    pause(2)
	% Now we start sending commands to the controller 
    % using the ?print? function 
    fprintf (s, 'G17 G20 G90 G94 G54')
    % The following commands simply move the motor to
    % a new x,y,z position with a feedrate = F. 
    %0.4585
    fprintf (s,'G1 x0.0917 y0.3668 F5')
    %fprintf (s,'G1 x0.05 F5')
    %pause
    %fprintf (s,'G1 y0.3668 F5')
    %fprintf (s,'G1 x0.00 F5')
    %out = fscanf(s)
    display('All Done!!!')
    % Close the connection to the GRBL controller
    fclose(s)
catch ME
	fclose(s)
    ME.message
end
