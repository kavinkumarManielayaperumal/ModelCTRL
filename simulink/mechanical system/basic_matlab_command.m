tic
disp("hello world")
% here the for the print we are using the disp function
toc
x=5;
y=[1;2;3;4]; % this how we need to print the column vector 
e=[1,2,3,4];
M=[1,2;3,4];
disp(y)
disp(M)
% now we will do the dot product
dot_product=dot(y,e');
disp(dot_product)
v_squared=y.^2;% just like squaring the the vectors
disp(v_squared)

% we will the plotting here
time=0:0.1:10;
%disp(time)
j=sin(time);
plot(time,j);
hold on% this fuction we give change to give one more values in  the plot
% like ( plot(time,h);
xlabel("time(s)");
ylabel("Amplitude");
title("the sin wave");
grid on ;

% small problem 
for i = 1:10
   if mod(i,2)==0
       disp(["i=",num2str(i),"is even"]);
   else
        fprintf("the %d",i);
   end
end


% we need to hang of the fprintf here, its will be very useful
% this line clean up the before varible " clc ,clear all "

% this just power of the varible
l=5e2;
disp(l)
5e50;
% for the exponent
i=5*exp(2);
disp(i)

% this play with the 
sqrt(25)
pi*2;%6.28
sqrt(abs(-25)) %5

% inlinespace 
o=linspace(0,10,11);
disp(o)

clc,clear all
eye(3) % create the indentitcal matrix 

% the random values  like in numpy 
clc ,clear all
rng(42); % this dame the np.random.seed(42) , same thing for the reproducibility
x=rand(10,10); % random scaler values 
n=randi(1,4,5);
disp(x)
disp(n)

% usally statices
% mean , variances,max,like that 


% this everthing this basics
% now  plyfit() and polyvai()
clc, clear all, close all
rng(42);
x=rand(1,10);
y=rand(1,10);
disp(x)
disp(y)

a =polyfit(x,y,2);
x_fit=linspace(min(x),max(x),100);
y_fit=polyval(a,x_fit);


plot(x,y,'o');
hold on 
plot(x_fit,y_fit,'-r');
title("2nd degree Polynomial Fit");
legend("data","Polyfit curve")

clc,clear all,close all 

x=1:10;
y=rand(1,10);
k=linspace(0, 100,20);
disp(x)
disp(y)
disp(k)