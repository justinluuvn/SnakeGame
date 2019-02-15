function [score, eat, x, y, pass] = snake_move(score, eat, x, y, pass, dir, limit)

    if eat
        score=score+1;
        eat=0;
        x=[x(1) x];
        y=[y(1) y];
        x(2:(length(x)-1))=x(3:length(x));
        y(2:(length(x)-1))=y(3:length(x));
    else
        x(1:(length(x)-1))=x(2:length(x));
        y(1:(length(x)-1))=y(2:length(x));
    end
    %determine the next step by direction indicator
    %if wall is hit, it magically gets to the other side
    if ~pass
        if dir==0
            x(length(x))=x(length(x))+1;
        end
        if x(length(x))>19
            x(length(x))=0;
        end
        if dir==1
            x(length(x))=x(length(x))-1;
        end
        if x(length(x))<0
            x(length(x))=19;
        end
        if dir==2
            y(length(x))=y(length(x))+1;
        end
        if y(length(x))>19
            y(length(x))=0;
        end
        if dir==3
            y(length(x))=y(length(x))-1;
        end
        if y(length(x))<0
            y(length(x))=19;
        end
    end
    if length(x)>=limit && x(length(x))==0 && ...
            y(length(x))>=8 && y(length(x))<=11
        x(length(x))=-1;
        y(length(x))=-1;
        pass=1;
    end
end