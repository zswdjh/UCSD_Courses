
x=1:1:30;
result1=(2.^x)./(2.^x+(-1).^x)
x1=ones(1,30)
figure
stem(x,result1);
hold on;
plot(x,x1,'r');
hold off;
%%
z=-10:0.01:10
fz=1./(1+exp(-z))
figure
plot(z,fz)