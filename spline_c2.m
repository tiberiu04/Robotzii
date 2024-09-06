function coef = spline_c2 (x, y)
    n = length(x) - 1;

    % Calculul diferențelor dintre abscise
    h = diff(x);

    % Inițializarea matricei A și vectorului b
    A = zeros(n+1, n+1);
    b = zeros(n+1, 1);

    % TODO 1: s0(xi) = yi, i = 1 : n
    for i = 1:n
        A(i, i) = h(i);
        A(i, i+1) = 2 * (h(i) + h(i+1));
        A(i, i+2) = h(i+1);
        b(i) = 3 * ((y(i+2) - y(i+1)) / h(i+1) - (y(i+1) - y(i)) / h(i));
    end

    % TODO 2: s_n-1(xn) = yn
    A(n+1, 1) = 1;
    b(n+1) = 0;

    % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 1 : n-1
    for i = 1:n-1
        A(n+1+i, i) = h(i);
        A(n+1+i, i+1) = 2 * (h(i) + h(i+1));
        A(n+1+i, i+2) = h(i+1);
        b(n+1+i) = 3 * ((y(i+3) - y(i+2)) / h(i+1) - (y(i+2) - y(i+1)) / h(i));
    end

    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 1 : n-1
    for i = 1:n-1
        A(2*n+1+i, i) = 1;
        A(2*n+1+i, i+1) = -1;
        b(2*n+1+i) = 0;
    end

    % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 1 : n-1
    for i = 1:n-1
        A(3*n+i, i) = 1 / h(i+1);
        A(3*n+i, i+1) = -2 * (1 / h(i+1) + 1 / h(i+2));
        A(3*n+i, i+2) = 1 / h(i+2);
        b(3*n+i) = 0;
    end

    % TODO 6: s0''(x0) = 0
    A(4*n, 1) = 2;
    A(4*n, 2) = -1;

    % TODO 7: s_n-1''(x_n) = 0
    A(4*n+1, n) = 1;
    A(4*n+1, n+1) = -1;

    % Rezolvarea sistemului de ecuații liniare
    coef = A \ b;
end

