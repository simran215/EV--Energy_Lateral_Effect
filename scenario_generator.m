lane_angle=0;head_coeff=[];fitcoeff=[];

scenario = drivingScenario('SampleTime',0.1','StopTime',60);
%% curved driving
% scenario = drivingScenario('SampleTime',0.1','StopTime',60);
x_ego=0;
y_ego=0;
angs = [0:5:360]';
R = 250;
roadcenters = R*[cosd(angs) sind(angs) zeros(size(angs))]-[R 0 0];
roadwidth = 10;
road(scenario,roadcenters,roadwidth);
car = vehicle(scenario,'ClassID',1,'Position',[x_ego y_ego 0], 'Yaw' ,pi/2,...
    'Length',3,'Width',2,'Height',1.6); 
ref_generator;
vx_ego=0.1;
psi_ego=pi/2;
%% straight driving
%% yref for y-refernce
L=30000;
threshld=50;
x_ego=0;
y_ego=3.2;
x_start=x_ego+L+threshld;
roadcenters = [x_ego y_ego 0;x_ego+100 y_ego 0;x_start y_ego 0]
roadwidth = 5;
laneMark = laneMarking('Solid');
laneSpecification = lanespec(2,'Width',5,Marking=laneMark);

road(scenario,roadcenters,'Lanes',laneSpecification);

car = vehicle(scenario,'ClassID',1,'Position',[x_ego y_ego 0], 'Yaw' ,0,...
    'Length',3,'Width',2,'Height',1.6);


% plot(scenario,'Centerline','on','RoadCenters','on');
ref_generator;
vx_ego=0.1;
psi_ego=0;
Regen_on=1;

