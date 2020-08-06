function Hd = createFilter
%CREATEFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.5 and the Signal Processing Toolbox 7.0.
% Generated on: 30-Sep-2019 10:23:59

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in kHz.
Fs = 500;  % Sampling Frequency

Fstop1 = 3;               % First Stopband Frequency
Fpass1 = 4;               % First Passband Frequency
Fpass2 = 6;               % Second Passband Frequency
Fstop2 = 7;               % Second Stopband Frequency
Dstop1 = 0.001;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]