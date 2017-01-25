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

H_dut1 = XO1./XOSYS1;
H_dut2 = XO2./XOSYS2;

h_dut1 = ifft(H_dut1);
h_dut2 = ifft(H_dut2);

%[h_measurement1,r1] = deconv(xosys(:,1),xi(:,1));
%[h_measurement2,r2] = deconv(xosys(:,2),xi(:,2));

%H_measurement1 = fft(h_measurement1);
%H_measurement2 = fft(h_measurement2);

%[h_dut1,r1] = deconv(xosys(:,1),xo(:,1));
%[h_dut2,r2] = deconv(xosys(:,2),xo(:,2));

%H_dut1 = fft(h_dut1);
%H_dut2 = fft(h_dut2);

%c
figure(1)
semilogx(10*log10(abs(H_measurement1)))
xlabel('f/Hz');
ylabel('|H_{measurement1}| in dB');
figure(2)
semilogx(unwrap(angle(H_measurement1)))
xlabel('\Omega');
ylabel('\phi(H_{measurement1})');
figure(3)
semilogx(abs(h_measurement1));
xlabel('k');
ylabel('|h_{measurement1}|');

figure(4)
semilogx(10*log10(abs(H_measurement2)))
xlabel('\Omega');
ylabel('|H_{measurement2}| in dB');
figure(5)
semilogx(unwrap(angle(H_measurement2)))
xlabel('\Omega');
ylabel('\phi(H_{measurement2})');
figure(6)
semilogx(abs(h_measurement2));
xlabel('k');
ylabel('|h_{measurement2}|');

figure(7)
semilogx(10*log10(abs(H_dut1)))
xlabel('\Omega');
ylabel('|H_{dut1}| in dB');
figure(8)
semilogx(unwrap(angle(H_dut1)))
xlabel('\Omega');
ylabel('\phi(H_{dut1})');
figure(9)
semilogx(abs(h_dut1));
xlabel('k');
ylabel('|h_{dut1}|');

figure(10)
semilogx(10*log10(abs(H_dut2)))
xlabel('\Omega');
ylabel('|H_{dut2}| in dB');
figure(11)
semilogx(unwrap(angle(H_dut2)))
xlabel('\Omega');
ylabel('\phi(H_{dut2})');
figure(12)
semilogx(abs(h_dut2));
xlabel('k');
ylabel('|h_{dut2}|');

[gd,w]=grpdelay(h_measurement1);
semilogx(w,gd);

% semilogx(20*log10(abs(fftshift(XOSYS1))))
% hold on
% semilogx(20*log10(abs(fftshift(XO1))))
% 
% semilogx(20*log10(abs(fftshift(XOSYS2))))
% hold on
% semilogx(20*log10(abs(fftshift(XO2))),'black')
