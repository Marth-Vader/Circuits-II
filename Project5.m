
clear all
close all
clc

%assign values to given variables
Vm = 1;
T = 1;
w0 = 2 * pi;

%create time interval for first half of piecewise fxn
t1= 0:.001:T/2;
%create function for first half of piecewise fxn
vt1 = (Vm * sin((4 * pi * t1) / T))

%create time interval for second half of piecewise fxn
t2 = T/2:.001:T;
%create function for second half of piecewise fxn
vt2 = (2*Vm * sin((4 * pi * t2) / T))

%append the function to repeat the period from -T to 3T
vt(1:501) = vt1;
vt(501:1001) = vt2;
vt(1001:1501) = vt1;
vt(1501:2001) = vt2;
vt(2001:2501) = vt1;
vt(2501:3001) = vt2;
vt(3001:3501) = vt1;
vt(3501:4001) = vt2;

%time interval from -T to 3T
t = -T:0.001:3 * T;

%plot the periodic function
plot(t, vt);
xlabel('t [s]');
ylabel('v(t) [V]');
title('v(t) vs. t');



%av is zero
av = 0;

%declare the fourier contruction of vt, and kick it off with the av value
fvt = 0;


for n = 1:5
    
    %no value at 4
    if (n == 4)
        %skip and don't compute or plot
        continue
    end

    %put the plots on a subplot
    if (n == 5)
        subplot(2, 2, n - 1)
    else
        subplot(2, 2, n)
    end
    
    %adding the components
    fvt = fvt + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
    
    %this represents each individual component
    fvtn = cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
    %plot each individual component
    plot(t, fvtn)

    
    hold on
    plot(t, vt)
    legend('Fourier Series', 'V(t)')
    xlabel('t [s]');
    ylabel('V(t) [V]');
    title (sprintf('Fourier component at n =%3.0d', n))
    hold off
    pause(1)
    
end



figure
plot(t, fvt)
%legend('Fourier Series', 'V(t)')
xlabel('t [s]');
ylabel('V(t) [V]');
title('Fourier series');

%plotting the different harmonics

%n = 3
fvt3 = 0;
for n = 1:3
    %adding the components
    fvt3 = fvt3 + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
end
figure
plot(t, fvt3)
hold on
plot(t, vt)
legend('Fourier Series', 'V(t)')
title('Harmonic at n = 3');
xlabel('t [s]');
ylabel('V(t) [V]');


%n = 5
fvt5 = 0;
for n = 1:5
    %adding the components
    fvt5 = fvt5 + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
end
figure
plot(t, fvt5)
hold on
plot(t, vt)
legend('Fourier Series', 'V(t)')
title('Harmonic at n = 5');
xlabel('t [s]');
ylabel('V(t) [V]');


%n = 10
fvt10 = 0;
for n = 1:10
    %adding the components
    fvt10 = fvt10 + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
end
figure
plot(t, fvt10)
hold on
plot(t, vt)
legend('Fourier Series', 'V(t)')
title('Harmonic at n = 10');
xlabel('t [s]');
ylabel('V(t) [V]');


%n = 50
fvt50 = 0;
for n = 1:50
    %adding the components
    fvt50 = fvt50 + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
end
figure
plot(t, fvt50)
hold on
plot(t, vt)
legend('Fourier Series', 'V(t)')
title('Harmonic at n = 50');
xlabel('t [s]');
ylabel('V(t) [V]');


%Percent error for n = 3 harmonic
ern3 = abs((fvt3 - vt) / Vm) * 100;
figure
plot(t, ern3);
xlabel('t [s]');
ylabel('% error');
title('Error vs Time for n = 3');


%Percent error for n = 5 harmonic
ern5 = abs((fvt5 - vt) / Vm) * 100;
figure
plot(t, ern5);
xlabel('t [s]');
ylabel('% error');
title('Error vs Time for n = 5');


%Percent error for n = 10 harmonic
ern10 = abs((fvt10 - vt) / Vm) * 100;
figure
plot(t, ern10);
xlabel('t [s]');
ylabel('% error');
title('Error vs Time for n = 10');


%Percent error for n = 50 harmonic
ern50 = abs((fvt50 - vt) / Vm) * 100;
figure
plot(t, ern50);
xlabel('t [s]');
ylabel('% error');
title('Error vs Time for n = 50');


%find the max error for each harmonic
%n = 3
max3 = max(ern3)
%n = 5
max5 = max(ern5)
%n = 10
max10 = max(ern10)
%n = 50
max50 = max(ern50)


%create an array of total error values
totErr = zeros(50, 1);
%array of n values
i = zeros(50, 1);
%initialize variables to 0
err = 0;
maxErr = 0;
fvt2 = 0;

%for loop to loop through all harmonics and error calculations 
%for each harmonic from n = 1 to n = 50
for n = 1:50
    fvt2 = fvt2 + cos(n * w0 * t) * ak(n) + sin(n * w0 * t) * bk(n);
    %calculate the error at n harmonic
    err = abs((fvt2 - vt) / Vm) * 100;
    %assign that value to the maxErr variable
    maxErr = max(err);
    %add that value to the totErr array
    totErr(n) = maxErr;
    i(n) = n;
end

%create a new plot
figure
%fit data 
data = fit(i, totErr, 'power2');
%plot data against fitted line
plot(data, i, totErr)
xlabel('n');
ylabel('Max % error');
title('Max Error');
%set the limit on the y axis
ylim([0 25]);



%gives the a'k values for different values of k
function a = ak(k)

    if (mod(k,2) == 0)
        a = 0;
    else
        a = 4 / (pi * ((k^2) - 4))
    end

end

%gives b/k values for different values of k
function b = bk(k)
    if (k == 2)
       b = 1.5;
    else
        b = 0;
    end
end

