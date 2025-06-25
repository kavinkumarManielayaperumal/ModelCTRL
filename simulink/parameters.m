m=1600; % this mass of the car
r_R=0.291; % the radius of the wheel
A=1.7;  % the crossectional area
c_w=0.32; % drag coefficient
rho=1.2;  %density of air 
g= 9.81; % graviatational accelaration
F_R=160; %rolling resistance
eta=0.9; %degree of efficiency 
i_G5=1.3; %trasmission ratio 5ht gear
i_G4=2.1; %trasmission ratio 4th gear
i_A=4.06; %transmission ratio axle drive 
n_max=6500; % maximum ratational speed of engine
v_0=60;
%characteristic map for engine (row: throttle-position; column: rotational speed engine)
cm_engine = [
0   300     800     1000    2000    3000    4000    5000    6500    
0   110     27      0       -32     -51     -60     -63     -65
5   110     55      50      20      -25     -40     -50     -60
10  110     90      80      65      35      20      -10     -40
15  110     95      100     100     75      50      25      -20
20  110     100     105     125     110     95      70      40
30  110     105     110     130     150     155     160     140
40  110     106     115     140     160     165     175     155
90  110     110     125     140     170     185     200     190
];

%Calculation of maximum velocity in 5th gear
n_wheel_max = n_max/(i_G5*i_A);               % maximum rotational speed wheels in 5th gear (rpm)
omega_wheel_max = 2*pi*n_wheel_max/60;          % maximum angular velocity in 5th gear (rad/s)
v_max = r_R * omega_wheel_max;               % maximum velocity in 5th gear (without sliding) (m/s)
 