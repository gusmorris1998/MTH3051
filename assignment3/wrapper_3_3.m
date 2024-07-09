clear 
clc

disp('Hi! This is wrapper_3_3. I am a close relative of wrapper_3_2.');
disp('I will test your composite quadrature rules on the sine function');
disp('on the interval [0,pi].');
disp(' ');

N=2.^[0:10];
err_T=zeros(size(N));
err_S=zeros(size(N));
for k=1:length(N)
    err_T(k)=abs(2-myCompTrapezoidal(@sin,0,pi,N(k)));
    err_S(k)=abs(2-myCompSimpson(@sin,0,pi,N(k)));
end
h=1./N;

loglog(h,err_T,'-',h,err_S,'-.')
legend('error Q_T','error Q_S')
title('testing composite quadrature rules on sine funtion')
xlabel('step-size h')
ylabel('numerical errors of both methods')

