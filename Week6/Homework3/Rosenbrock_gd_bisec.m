function [opt_path, conv_path] = Rosenbrock_gd_bisec(x0, y0, alpha_UB, epsilon, Nmax)
    xn = x0;
    yn = y0;
    opt_path = zeros(2, Nmax+1);
    conv_path = zeros(1, Nmax+1);
    for n = 1 : Nmax
        
        % call rosenbrock.m at (xn,yn) to get the current fn and gn
        [f,g] = rosenbrock(xn,yn);
        % store fn in nth entry of conv_path, and store xn,yn in nth column
        % of opt path
        conv_path(n) = f;
        opt_path(:,n) = [xn; yn];
        % check to see if norm of gradient is below epsilon tolerance - if
        % so, break the for loop.
        if norm(g) < epsilon
            break
        end
        % normalize the gradient to get \hat{g}, the unit vector in the
        % gradient direction
        gh = g/norm(g);
        %% use bisection algorithm to find step size
        % define p(alpha) for current iteration as described in main file
        p = @(a) dot([-2*(1-(xn-a*gh(1)))-4*(xn-a*gh(1))*((yn-a*gh(2))-(xn-a*gh(1))^2); 2*((yn-a*gh(2))-(xn-a*gh(1))^2)], -gh);
        % call bisection routine on p(alpha) to find optimal step size
        [an, ~] = bisection(p,0,alpha_UB,10^(-10),Nmax);
        % take gradient descent step with optimal step size alpha. Note
        % that you must use the normalized gradient here because that's
        % what we used to calculate the optimal step size
        xn = xn-an(end)*gh(1); % replace with update
        yn = yn-an(end)*gh(2); % replace with update

    end
    opt_path(:, n+1) = [xn; yn];
    conv_path(:, n+1) = rosenbrock(xn, yn);
    opt_path = opt_path(:, 1:n+1);
    conv_path = conv_path(:, 1:n+1);
end