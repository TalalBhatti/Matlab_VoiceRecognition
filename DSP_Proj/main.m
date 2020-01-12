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
