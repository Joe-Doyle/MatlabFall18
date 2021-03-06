%Load and show image
MapImage = imread('Homework_GoogleMap.png');
imshow(MapImage)
hold on;

%pixel to mile calibration
%click both sides of scale
[xscale1,yscale1] = ginput(1)
plot(xscale1,yscale1,'g+')
[xscale2,yscale2] = ginput(1)
plot(xscale2,yscale2,'g+')
%calculate pixels in 5, 1 miles
FiveMilesInPixels = xscale2 - xscale1
OneMileInPixels   = FiveMilesInPixels/5;

%distance between lowell and boston in miles
%click lowell
[xLowell,yLowell] = ginput(1)
%click Boston
[xBOS,yBOS]       = ginput(1)
plot([xLowell xBOS],[yLowell yBOS],'g-d')
%change in x,y, to pixel distance
pixDistance = sqrt((xLowell - xBOS)^2 + (yLowell - yBOS)^2)
%pixels to miles
mileDistanceFlight = pixDistance/OneMileInPixels

%pixels between uml and boston driving 495 to 93
%unlimited points, exit with return key
[xroad,yroad] = ginput
plot(xroad,yroad,'r-o')
arrLen = length(xroad)
%iterate through all points and calculate cumulative distances
longDis = 0
for i = 2:arrLen
    longDis = longDis + sqrt((xroad(i) - xroad(i-1)).^2 + (yroad(i) - yroad(i-1)).^2);
end
mileDistanceDrive = longDis/OneMileInPixels

%get angle between lowell and boston
angle = atan((yBOS-yLowell)/(xBOS-xLowell));
angle = 90 + rad2deg(angle)

%helicopter flight time
fracHour = 160/mileDistanceFlight;
mins = 60/fracHour



