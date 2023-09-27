%bbbPrueba donde se obtiene la nota mi de la primera cuerda 330 Hz
[x,Fs]=audioread('Notas de guitarra.mp3');
sound(x,Fs)
x1=x(:,1);
figure 
plot(x1)
N=20000;
x1=x1(10000:(10000-1)+N);
X1=fft(x1);
N=length(x1);
n=0:N-1;
k=n;
fk=k*Fs/N;
figure
plot(fk(1:N/2),abs(X1(1:N/2)))
[mm, ii]=max(abs(X1(1:N/2)));
(ii-1)*Fs/N