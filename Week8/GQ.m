function I = GQ(func,d,n)
%GQ Compute the Gaussian quadrature rule for region Omega=[0,1]^d
%
%CALL:  I = GQ(func,d,n)
%  I = Gaussian quadrature approximation
%  func = function of interest
%  d = dimension of the region
%  n = number of abscissas along one dimension
assert(d==1|d==2,"Invalid dimension")

[x,w] = qrule(n);
x = 1/2*(x+1);
w = 1/2*w;

if d==1
    I = sum(w.*func(x));
else
    [x1, x2] = meshgrid(x,x);
    I = sum((w'*w).*func(x1,x2),'all');
end

end