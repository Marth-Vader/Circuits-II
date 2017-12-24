%part 1

%Create time vector from -5 to 5 seconds, incrimenting by .1, therefore
t = -5:.01:5;

%Create unit step vector with values of 0 to be replaced with 
%same size as t, height of 1
u1 = zeros(size(t));
u1(t>=0) = 1;

%creating time shifted unit step vectors u(t-1) and u(t-2)

u2 = zeros(size(t));
u2(t>=1) = 1;

u3 = zeros(size(t));
u3(t>=2) = 1;

graph
%create subplot for u1, u2, u3
subplot(2,2,1)
plot(t, u1)
title('Unit Step Function, u(t)')
xlabel('Time (s)')
ylabel('Magnitude')

subplot(2,2,2)
plot(t, u2)
title('Unit Step Function, u(t-1)')
xlabel('Time (s)')
ylabel('Magnitude')

subplot(2,2,3)
plot(t, u3)
title('Unit Step Function, u(t-2)')
xlabel('Time (s)')
ylabel('Magnitude')

%performing operations
y1 = u1 - u2;

y2 = u1 + u2 + u3;

y3 = u1.* u3;

y4 = u1 + u2 - 2*u3;

%new set of graphs
graph
%plotting y1, y2, y3, y4
subplot(2,2,1)
plot(t, y1)
title('u(t) - u(t-1)')
xlabel('Time (s)')
ylabel('Magnitude')

subplot(2,2,2)
plot(t, y2)
title('u(t) + u(t-1) + u(t-2)')
xlabel('Time (s)')
ylabel('Magnitude')


subplot(2,2,3)
plot(t, y3)
title('u(t)*u(t-2)')
xlabel('Time (s)')
ylabel('Magnitude')


subplot(2,2,4)
plot(t, y4)
title('u(t) + u(t-1) - 2*u(t-2)')
xlabel('Time (s)')
ylabel('Magnitude')


%part 2

%Create time vector from -2 to 2 seconds, incrementing by .1, therefore
t2 = -2:.01:2;

ut = zeros(size(t2))
ux(t2>=0) = 1;
%creating vectors

v0 = (cos(2*pi*t2)).*ux;

v1 = (cos(2*pi*t2 + (pi/4))).*ux;

v2 = (cos(0.5*pi*t2)).*ux;

v3 = v0.*v2;

v4 = (5*exp(-2*t2)).*v0;

%new set of graphs
graph
%v0 & v1
subplot(2,2,1)
plot(t2, v0, t2, v1)
title('Plot of v0 vs. v1')
xlabel('Time (s)')
ylabel('Voltage (V)')

%v0 & v2
subplot(2,2,2)
plot(t2, v0, t2, v2)
title('Plot of v0 vs. v2')
xlabel('Time (s)')
ylabel('Voltage (V)')

%v2 & v3
subplot(2,2,3)
plot(t2, v2, t2, v3)
title('Plot of v2 vs. v3')
xlabel('Time (s)')
ylabel('Voltage (V)')

%v0 & v4
subplot(2,2,4)
plot(t2, v0, t2, v4)
title('Plot of v0 vs. v4')
xlabel('Time (s)')
ylabel('Voltage (V)')


%part 3

num = [1]
den = [0 1 1]
h1 = tf(num,den)

num2 = [2 3 2]
den2 = [1 2 1]
h2 = tf(num2,den2)

h3 = h1 * h2


%part 4

%4.1
F1 = [1 5 6]
s = sym('s')
poly2str(F1,'s')
%expanded F1 polynomial
F1exp = expand(prod(s-rootsF1))

%evalutating the function at s = 1, answer = 12
polyval(F1,1)


%roots of the polynomial
rootsF1 = roots(F1);

%factored polynomial F1 = (s+3)(s+2)

%F2 = (s+1-2j)*(s+1+2j)*(s+1)*s^2

F2roots = [-1+2j -1-2j -1 0 0]
%expanded F2 polynomial
F2 = expand(prod(s-F2roots))


%resulting polynomial s^5 + 3*s^4 + 7*s^3 + 5*s^2
%coefficients of F2 polynomial
F2x = [1 3 7 5 0 0]


%convolution of F1 and F2
%since F1exp and F2 are in the frequency domain, can just multiply together
H = F1exp*F2
%expands the result
Hexp = expand(prod(H))

%convolve F1 and F2 coefficients
Hconv = conv(F1,F2x)
%prints out the result
Hs = poly2str(Hconv, 's') %output: s^7 + 8 s^6 + 28 s^5 + 58 s^4 + 67 s^3 + 30 s^2


%4.2

n = [1 1]
d = [1 4 0]
H3 = tf(n,d)

%r = roots, p = poles, k should be empty if function is proper rational
[r, p, k] = residue(n,d)

%r1 = 0.75, r2 = .25
%p1 = -4, p2 = 0

%calculate the inverse Laplace

n2 = [4 1 0 4]
d2 = [1 6 11 12 18 0 0 0]
H4 = tf(n2,d2)

%partial fracton decomposition of H4
[r, p, k] = residue(n2,d2)


%transfer function to be inverse laplaced
H4tf = poly2sym(n2,s)/poly2sym(d2,s);
%Inverse laplace this bitch
H4lap = ilaplace(H4tf)


