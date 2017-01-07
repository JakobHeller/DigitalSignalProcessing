%Exercise 2: Transfer function with FFT deconvolution

%a)
[xi,fs] = audioread('Emphasis_FFT18_48K.wav');
[xosys,xo] = sys(xi.',fs);

%b
XI = fft(xi);
XOSYS = fft(xosys);
XO = fft(xo);

[H_measurement,r1] = deconv(XI.',XOSYS);
[H_DUT,r2] = deconv(XOSYS,XO);

plot(abs(H_measurement))