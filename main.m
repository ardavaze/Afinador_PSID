clc; 
close all;
[x,Fs]=audioread('audio_mi.wav');
sound(x,Fs)
x1=x(:,1);
%señal captada en el dominio del tiempo
figure 
plot(x1)
N=20000;
x1=x1(10000:(10000-1)+N);
%transformada
X1=fft(x1);
N=length(x1);
n=0:N-1;
k=n;
fk=k*Fs/N;
%señal en el dominio de la frecuencia
figure
plot(fk(1:N/2),abs(X1(1:N/2)))
% [mm, ii]=max(abs(X1(1:N/2)));
% (ii-1)*Fs/N;
%potencia espectral 
pot=abs(X1).^2;
[a,b]=max(pot);
fo=fk(b);
figure
plot(fk,pot)
xlabel('frecuencia')
ylabel('pot espectral')
c=linspace(0,5);

%instrumento =0 ->guitarra
%instrumento =1 ->violin

Instrumento = 0;
Nota=1;
if Instrumento == 0
    switch Nota
        case 1 % E
            freq_afin = 329.6 ; 
            figure
            d=329.6*ones(size(c));
            plot(d,c,'r','lineWidth',2)
            e=fo*ones(size(c));
            hold on 
            plot(e,c,'b','lineWidth',2)
        case 2 % B
            freq_afin = 246.9;
        case 3 % G
            freq_afin = 196;
        case 4 % D
            freq_afin = 146.8;
        case 5 % A
            freq_afin = 110;
        case 6 % E
            freq_afin = 82.4;
        otherwise
            disp('seleccionar nota')
    end
else    
    switch Nota
        case 1 % E
            freq_afin = 659.3;
        case 2 % A
            freq_afin = 440;
        case 3 % D
            freq_afin = 293.7;
        case 4 % G
            freq_afin = 196;
        otherwise
            disp('seleccionar nota')
    end
end



