clear all;
close all;
clc;
%% Create a recorder object
recorder = audiorecorder(16000,8,2);
%% Record user's voice for 5 sec
disp('Please Record your voice');
drawnow();
pause(1);
recordblocking(recorder,5);
play(recorder);
data = getaudiodata(recorder);
plot(data);
figure;
%% Feature extension
f = VoiceFeatures(data);

%% find out the closest features from database
load database
D=[];
for(i=1:size(F,1))
	d=sum(abs(F(i)-f));
	D=[D d];
end
%% Smallest distance 
sm=inf;
ind=-1;
for(i=1:length(D))
	if(D(i)<sm)
	    sm=D(i);	
		ind=i;
	end
end
detected_class=C(ind);
disp('The detected Class is: ');
detected_class