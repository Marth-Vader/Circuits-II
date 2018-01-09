Project 3: Signals and Transfer Functions

1. Unit Step Functions  
A unit step function u(t) with K = 1 is created, along with time shifted functions u(t-1) and u(t-2). The three functions are then plotted and displayed in a figure that contains all three subplots in a 3x1 configuration.

The following functions were then plotted and displayed in a figure with the graphs in a 2x2 configuration:

y1 = u(t) - u(t-1)  
y2 = u(t) + u(t-1) + u(t-2)  
y3 = u(t)u(t-2)  
y4 = u(t) + u(t-1) - 2u(t-2)  

2. Signals in Time-Domain  
Vectors were created for the following functions:

v0(t) = cos(2πt)u(t)  
v1(t) = cos(2πt + π/4)u(t)  
v2(t) = cos(0.5πt)u(t)  
v3(t) = v0(t)v2(t)  
v4(t) = 5e^(-2t)v0(t)  

The vectors were plotted in the following pairs, four graphs, each with two traces:

1. v0(t) and v1(t)  
2. v0(t) and v2(t)  
3. v2(t) and v3(t)  
4. v0(t) and v4(t)  


3. Transfer Functions  
Two transfer functions were defined:  
H1(s) = 1/(s+1)  
H2(s) = (2s^2 + 3s + 2)/(s^3 + 2s + 1)   

The two functions were then multiplied together.

4. Partial Fraction Expansion and Laplace Transform  
4.1) Basic polynomial functions  
A vector with polynomial coefficients was created and then the polynomial was generated from those coefficients.
The value of the polynomial at a particular s value was evaluated.
The polynomial was then factored to obtain the roots.  

A polynomial was created given the roots F2 = (s+1-2j)(s+1+2j)(s+1)s^2  
The two polynomials were convolved to create a new polynomial.  

4.2) Partial fraction expansion for simplifying Laplace transform  
Two polynomials were created, where one was the numerator and the other was the denominator of the function:  
H3(s) = (s+1)/(s(s+4))  
The function was viewed and then expanded using partial fraction decomposition with the residue method to find the roots, poles, and k.  
The inverse Laplace transform was used to transform the function into the time domain.  

The residue method was then used to perform the partial fraction expansion of the function:  
H4(s) = (4s^3 + s^2 + 4)/(s^3 (s+3)^2 (s^2 + 2))  
