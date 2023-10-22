function Yd=rmenso(Y,enso)
X = [ones(length(enso),1) enso(:)];
coeffs = X \ (Y(:));
Yfit = X * coeffs;
Yd = Y(:) - Yfit;
end