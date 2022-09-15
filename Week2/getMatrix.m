function A = getMatrix(N, L)
    dx = L/N;
    A = diag(1/dx^2+zeros(N-2,1),-1)+diag(-2/dx^2+zeros(N-1,1))+diag(1/dx^2+zeros(N-2,1),1);
end