clear all
close all
clc

%declare inductor/capacitor/resistor values
L1 = 112.54e-9;
C1 = 37.806e-15;
L2 = 94.514e-12;
C2 = 45.016e-12;
R = 50

%define frequency array and the empty H(w) values array
f = linspace(1e9,3.5e9,2501);
w = f.*2*pi;
Hw = zeros(1,2501); %V2/Vg


for i = 1:2501
    %evaluate individual a-values
    AL1 = [1 j*w(i)*L1 ; 0 1];
    AC1 = [1 1/(j*w(i)*C1) ; 0 1];
    AL2 = [1 0 ; 1/(j*w(i)*L2) 1];
    AC2 = [1 0 ; j*w(i)*C2 1];
    %matrix multiply into the final array
    A = AL1*AC1*AL2*AC2;
    %use final array to calculate V2/Vg as this frequency
    Hw(i) = R / ( (A(1,1)+A(2,1)*R) * R + A(1,2) + A(2,2)*R);
end

%plot the graph
plot(f,(abs(Hw)))
grid on
xlabel('Frequency (Hz)')
ylabel('Gain (dB)')
title('Bandpass Filter: Frequency vs. Gain')