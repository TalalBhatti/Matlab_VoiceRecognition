function [xPitch]=VoiceFeatures(data)
F = fft(data(:,1));
plot(real(F));
m=max(real(F));
xPitch=find(real(F)==m,1)