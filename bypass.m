function [food,eat]=bypass(x,y,eat,food)

    if (food(1)==x(length(x))) && (food(2)==y(length(x)))
        eat = 1;
        qualify=0;
        while ~qualify
            food = [floor(20*rand(1,1)) floor(20*rand(1,1))];
            qualify=1;
            for i=1:length(x)
                if food(1)==x(i) && food(2)==y(i)
                    qualify=0;
                    break;
                end
            end
        end
    end
    
end