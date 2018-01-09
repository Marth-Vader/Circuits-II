Project 5: Fourier Series

1. Fourier Series
A periodic function v(t) is given:
v(t) = Vm * sin(4πt/T) for 0 <= t <= T/2
v(t) = 2Vm * sin(4πt/T) for T/2 <= t <= T
where Vm = 1 and T = 1 second.

The Fourier series of the function was derived and then the first four non-zero terms along with the actual function was plotted.
The first four non-zero terms were added together to create v(t) and the resulting waveform was plotted.

v(t) was plotted for the following harmonics: n = 3, 5, 10, 50.

The error was found as a function of n:
%error = abs((vF(t) - v(t))/Vm) * 100%
and then plotted vs time for n = 3, 5, 10, 50. The maximum error was found for each case.

A vector containing the maximum error as a function of n was created. A power series was then used to fit the maximum error. The number of terms needed to achieve less than 5% error was solved analytically. The maximum-error vector was plotted on the same plot as the fitted function.
