clear
clf 
clc

disp('This is wrapper_3_2. I hope you got your difference quotients right,');
disp('because I want to show you something. Let us use your code to approximate');
disp('the derivative of sin at x=1. We do this for many different values of h');
disp('and create a loglog plot of the errors.');
disp(' ');

h=10.^(-0.25*[0:50]);
e_F=zeros(size(h));
e_C=zeros(size(h));
for k=1:length(h)
    e_F(k)=abs(cos(1)-myForwardDQ(@sin,1,h(k)));
    e_C(k)=abs(cos(1)-myCentralDQ(@sin,1,h(k)));
end

loglog(h,e_F,'-',h,e_C,'-.')
legend('error FDQ(sin;1,h)','error CDQ(sin;1,h)')
title('testing the forward and the central difference quotient')
xlabel('step-size h')
ylabel('numerical errors of both methods')

disp('Every error curve has a wriggly part, a minimum, and a straight part.');
disp('What theory does this correspond to?');