function[] = display_snake(x,y,food,pass)
    hold on;
    %draw the border of the drawing area
    plot([0 0 1000 1000 0],[0 1000 1000 0 0], 'k');
    %if pass the level
    if pass
        plot([0 0 50 50 0],[400 600 600 400 400], 'k');
    end
    %draw prey for the snake
    fill([food(1)*50+26 food(1)*50+51 food(1)*50+26 food(1)*50+1]...
        ,[food(2)*50+1 food(2)*50+26 food(2)*50+51 food(2)*50+26],'r');
    %draw the snake except its head
    for i=1:(length(x)-1)
        fill([x(i)*50+1 x(i)*50+51 x(i)*50+1 x(i)*50+51]...
            ,[y(i)*50+1 y(i)*50+1 y(i)*50+51 y(i)*50+51],'b');
    end
    %draw the snake's head
    i=0:(pi/500):(2*pi);
    X=x(length(x))*50+25+25*cos(i);
    Y=y(length(x))*50+25+25*sin(i);
    fill(X,Y,'b');
    
    hold off;
end