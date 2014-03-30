syms x f(x)
%% Prepare data
a = [
    -14.4621;  -10.2374; -19.7997;
     -5.5796;   9.57496;  20.2374;
     38.4621;  -13.3667;  2.65804;
     -6.4951;    9.9296;   6.0951;
    ];
b = [
     60.6959;  -91.2105;   28.9378;
    -193.022;  -243.672;  -131.210;
    364.594;    39.8645;  -28.0640;
    -31.2543;   17.8390;  -35.3942;
    ];
c = [
    -70.9238;   492.560;   562.833;
    -633.105;    773.65;  -843.923;
     914.196;  -20.6282;   21.9032;
     23.1782;  -24.4532;  -25.7283;
    ];
f = x^3 - a*x^2 + b*x - c;
left  = -10;
right =  10;
variant = mod(16, length(f));

%% Tests
for i = 1:length(f)
    y = sym2poly(f(i));
    L = Shturm(y, -30, 30);
    R = sort(roots(y));
    
    assert(all(L(:, 1) <= R(:)) && all(R(:) <= L(:, 2)));
end

%% Part 1
pretty(f(variant));
disp('Count of roots:')
disp(length(Shturm(sym2poly(f(variant)), left, right)));

%% Part 2
pretty(f(variant));
disp('Separation of roots:');
disp(Shturm(sym2poly(f(variant)), left, right));

%% Part 3
pretty(f(variant));
poly = sym2poly(f(variant));
L = Shturm(poly, left, right);

disp('Bisection method:');
[X, iteration] = Bisection(poly, L, 10^(-4));
disp([X iteration]);

disp('Newtons method:');
[X, iteration] = Newton(poly, L, 10^(-4));
disp([X iteration]);