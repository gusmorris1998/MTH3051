clear
clc

disp('This is wrapper_2_3.');
disp(' ');
disp('Let us test your code for Newton method on Example 3.23 from the');
disp('lecture notes:');

f=@(x)[4*x(1)^2+9*x(2)^2-36;16*x(1)^2-9*x(2)^2-36];
Df=@(x)[8*x(1),18*x(2);32*x(1),-18*x(2)];

disp('We know that this function has four roots. Instead of discussing the');
disp('rate of convergence again, let us see whether we can find them all.');
disp(' ');
disp('I run your code with many initial points on a grid. If you programmed');
disp('your code correctly, you should see that each quadrant gets mapped to');
disp('the solution it contains. (For more complicated functions, you will');
disp('of course get a more complicated geometry.)') 
disp(' ');
disp('The straight blue lines join initial and terminate iterate of Newton');
disp('scheme. Intermediate iterates are not shown.');
disp(' ');

%prepare figure

figure(1)
clf
hold on

warning('off')

for i=-3.5:0.5:3.5
    for j=-3.5:0.5:3.5
        x=[i;j];

        %Since the Newton algorithm might run into trouble during the
        %computation, we use a try-catch-end structure. It allows us
        %to try to compute something (try), and do something else in case
        %this fails (catch). 
        
        try
            z=myNewton(f,Df,x,0.001,Inf);
            plot(i,j,'bo')
            plot(z(1),z(2),'bx')
            plot([i,z(1)],[j,z(2)],'b-')
        catch
            plot(i,j,'ro')
        end
    end
end

warning('on')

title('blue lines connect initial guesses on grid with approximate solution')
xlabel('x_1')
ylabel('x_2')

disp('As you see, your initial guess matters. Depending on where you start,');
disp('you find one of the four zeros - or you get stuck and dont go anywhere.');
        