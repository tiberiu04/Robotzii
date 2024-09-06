function [x, y] = parse_data(filename)
    fid = fopen(filename, 'r'); % deschide fișierul pentru citire
    n = str2double(fgetl(fid)); % citește primul rând și converteste la număr
    x = fscanf(fid, '%d', [1, n+1]); % citește abscisele
    y = fscanf(fid, '%d', [1, n+1]); % citește ordonatele
    fclose(fid); % închide fișierul
    x = x'; % transpune într-un vector coloană
    y = y'; % transpune într-un vector coloană
end
