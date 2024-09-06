function y_interp = P_vandermonde(coef, x_interp)
    n = length(coef) - 1; % Gradul polinomului

    % Inițializarea vectorului pentru ordonatele interpolate
    y_interp = zeros(length(x_interp), 1);

    % Calculul ordinatelor interpolate folosind coeficienții polinomului
    for i = 1 : length(x_interp)
        y_interp(i) = sum(coef .* (x_interp(i).^(0:n)')); % Calculul valorii polinomului pentru fiecare x_interp
    end
end

