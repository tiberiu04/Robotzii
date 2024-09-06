function y_interp = P_spline(coef, x, x_interp)
    % Initializarea vectorului pentru ordonatele interpolate
    y_interp = zeros(length(x_interp), 1);

    % Numărul de segmente spline
    n = length(x) - 1;

    % Iterarea prin fiecare abscisă de interpolare
    for i = 1:length(x_interp)
        % Găsirea segmentului spline corespunzător abscisei de interpolare
        for j = 1:n
            if x(j) <= x_interp(i) && x_interp(i) <= x(j+1)
                % Calculul ordinatelor interpolate folosind coeficienții splinei cubice
                y_interp(i) = coef(4*(j-1)+1) + coef(4*(j-1)+2) * (x_interp(i) - x(j)) + coef(4*(j-1)+3) * (x_interp(i) - x(j))^2 + coef(4*(j-1)+4) * (x_interp(i) - x(j))^3;
                break;
            end
        end
    end
end

