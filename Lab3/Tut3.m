%%% TUTORIAL 3 %%%

output_file_directory = ""; % Insert output file directory here (.wav)
input_file_directory = "";  % Insert input file directory here (.wav)
output_text_file_directory = ""; % Insert output text file directory here(.txt) used to store FIR filter coefficients

%%% Read the unfiltered sounds %%%
[x,fs] = audioread(input_file_directory);

L = length(x);
NFFT = 2^nextpow2(L);
X = fft(x,NFFT)/fs;

fs
% Sampling Rate is 8000

f = fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(X(1:NFFT/2+1)));

fkill = 1/2; %frequqency is 2000, but is normalized by fs/2 --> 2000 / (8000/2) = 1/2

coeff = firgr(60,[0,fkill-0.1,fkill,fkill+0.1,1],[1,1,0,1,1], {'n','n','s','n','n'});
freqz(coeff,1);
coeff*32768

fid = fopen(output_text_file_directory,"w");

for i =1:length(coeff)
    fprintf(fid,'coeff[%3.0f]=%10.0f;\n',i-1,32768*coeff(i));
end

fclose(fid);
y = filtfilt(coeff,1,x);

Y = fft(y,NFFT)/L;

%%% Play the unfiltered and filtered .wav files to see affects of FIR Filter
sound(3*x,fs);
pause(5);
sound(3*y,fs);

subplot(2,1,1);

plot(f,2*abs(X(1:NFFT/2+1)));
xlabel('Frequency (Hz)');
ylabel('|X(f)|');


subplot(2,1,2);

plot(f,2*abs(Y(1:NFFT/2+1)));
xlabel('Frequency (Hz)');

audiowrite(output_file_directory,y,fs);


