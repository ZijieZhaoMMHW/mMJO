function Yfit=harmonic(Y)
t = 1:length(Y);
x0 = ones(1,length(Y));
x1 = cos(2 * pi * t / 365.25);
x2 = sin(2 * pi * t / 365.25);
x3 = cos(4 * pi * t / 365.25);
x4 = sin(4 * pi * t / 365.25);
x5 = cos(6 * pi * t / 365.25);
x6 = sin(6 * pi * t / 365.25);

X = [x0(:) x1(:) x2(:) x3(:) x4(:) x5(:) x6(:)];
coeffs = X\(Y(:));
Yfit = X*coeffs;
end