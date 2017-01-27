%Exercise 2: Transfer function with FFT deconvolution

%a)
[xi_,fs] = audioread('Emphasis_FFT18_48K.wav');
N = length(xi_);
xi = [xi_ xi_];
[xosys,xo] = sys(xi,fs);


%b
XI = fft(xi_);
XOSYS1 = fft(xosys(:,1));
XOSYS2 = fft(xosys(:,2));
XO1 = fft(xo(:,1));
XO2= fft(xo(:,2));

H_measurement1=XOSYS1./XI;
H_measurement2=XOSYS2./XI;

h_measurement1 = ifft(H_measurement1);
h_measurement2 = ifft(H_measurement2);

H_dut1 = (XO1./XOSYS1);
H_dut2 = (XO2./XOSYS2);

h_dut1 = ifft(H_dut1);
h_dut2 = ifft(H_dut2);

%c
figure(1)
subplot(2,3,1)
semilogx(10*log10(abs(H_measurement1)))
xlabel('f/Hz');
ylabel('|H_{measurement1}| in dB');
title('FFT Measurement 1')

subplot(2,3,2) 
semilogx(unwrap(angle(H_measurement1)))
xlabel('\Omega');
ylabel('\phi(H_{measurement1})');
title('FFT Phase Measurement 1');

subplot(2,3,3) 
semilogx(abs(h_measurement1));
xlabel('k');
ylabel('|h_{measurement1}|');

subplot(2,3,4) 
semilogx(10*log10(abs(H_measurement2)))
xlabel('\Omega');
ylabel('|H_{measurement2}| in dB');
title('FFT Measurement 2');

subplot(2,3,5) 
semilogx(unwrap(angle(H_measurement2)))
xlabel('\Omega');
ylabel('\phi(H_{measurement2})');
title('Phase Measurement 2')

subplot(2,3,6)
semilogx(abs(h_measurement2));
xlabel('k');
ylabel('|h_{measurement2}|');
%Following these Figures we can conclude, that the measurement systems are
%alike
%sadly we could not find the group delays as we were not able to propperly extract the filter coefficients that 
%[gd,w] = grpdelay(b,a) demands as input
figure(2)
subplot(2,3,1)
semilogx(10*log10(abs(H_dut1)))
xlabel('\Omega');
ylabel('|H_{dut1}| in dB');
title('FFT DUT1')

subplot(2,3,2)
semilogx(unwrap(angle(H_dut1)))
xlabel('\Omega');
ylabel('\phi(H_{dut1})');
title('FFT Phase DUT1');

subplot(2,3,3)
semilogx(abs(h_dut1));
xlabel('k');
ylabel('|h_{dut1}|');
title('dut1');

subplot(2,3,4)
semilogx(10*log10(abs(H_dut2)))
xlabel('\Omega');
ylabel('|H_{dut2}| in dB');
title('FFT DUT2');

subplot(2,3,5)
semilogx(unwrap(angle(H_dut2)))
xlabel('\Omega');
ylabel('\phi(H_{dut2})');
title('FFT Phase DUT2');

subplot(2,3,6)
semilogx(abs(h_dut2));
xlabel('k');
ylabel('|h_{dut2}|');
title('DUT2');

%DUT1 is a low-pass filter for low frequencies
%DUT2 is a bandpass filter

