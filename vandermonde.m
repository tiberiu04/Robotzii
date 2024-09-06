function coef = vandermonde(x, y)
    n = length(x); % Numărul de puncte de interpolare

    % Construirea matricei Vandermonde
    V = zeros(n, n);
    for i = 1:n
        V(:, i) = x.^(i-1); % Fiecare coloană reprezintă x la puterea i-1
    end

    % Rezolvarea sistemului de ecuații liniare pentru a găsi coeficienții
    coef = V \ y'; % Rezolvăm ecuația V * coef = y
end

