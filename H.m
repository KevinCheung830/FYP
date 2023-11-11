close  all


% Parameters
N = 64;                                 % Number of antennas
d = 0.5;                               % Antenna separation distance in wavelengths
theta = pi/6;                          % Angle of arrival and departure in radians
P = 1;                                 % Power of the channel gain

% Constructing the channel matrix
H = zeros(N, N);                       % Initialize the channel matrix

for n = 1:N
    for m = 1:N
        % Calculate the path difference
        delta = d * pi * sin(theta);
        
        % Calculate the channel gain
        h = sqrt(P/2) * (randn + 1i * randn);
        
        % Apply phase shift for analog beamforming
        phase = exp(-1i * 2 * pi * (n - 1) * delta);
        
        % Apply digital precoding
        H(n, m) = h * phase;
    end
end

% Display the channel matrix
