%in order to exit the game, please press escape key on the keyboard (ESC),
%do not press the pause and then quit debugging in the matlab menu
%this may cause the timer to malfunction the next time the game runs
function snake_game()

    fig=figure(345);
    fig.Color='w';
    set(fig,'KeyPressFcn',@keypress);
    t=timer;
    t.StartDelay=1;
    t.Period=1;
    t.TasksToExecute=1;
    t.ExecutionMode='fixedRate';
    t.TimerFcn=@timerBreak;
    start(t);

    %these two are for keypress action
    global key
    key = 'rightarrow';
    global key_press
    key_press=0;
    %this check if the game can continue
    game_over=0;
    %this set the direction for the snake
    dir=0;
    %this check if the snake has just eaten
    eat=0;
    %this is to keep track of the score
    score=0;
    %this is to check if newly-created food is already inside the snake
    qualify=0;
    %this initializes the position of the prey
    food=[10 10];
    %the initial size of the snake
    size=10;
    %this is to check if you have arrived in the passing gate
    pass=0;
    %this is the limit to pass the level
    limit=15;
    %this is to change color of the background
    col=[1 1 1];
    %this is for the time to blink in red and black
    status=0;
    %this is for the timer to ring
    global alarm
    alarm=0;
    %this is the time limit (only applied pass level 10)
    time_limit=35;
    %this is the time counter
    times=0;    
    %this indicates which level you are in
    level=0; %start with the entry level
    %this is to check if you win the game
    win=0;
    %initialize the position of the snake
    x=0:(size-1);
    y=zeros([1 size]);

    while (~game_over && ~win)
        while ~key_press
           %this is to draw the snake
           clf;
           cla('reset');
           if alarm
               alarm=0;
               times=times+1;
               start(t);
               %display(counter);
               if time_limit==times && level>10
                   title('\color{white}Out of time. Game over');
                   game_over=1; 
               end
               if time_limit-times<=30 && level>10
                   col=col-[0.025 0.025 0.025];
                   fig.Color=col;
                   status=1-status;
               end
           end
           if win
               title('Congratulation. You win the game.');
               axis off;
               stop(timer);
               delete(timer);
               break;
           end
           for i=1:(length(x)-1)
               if x(length(x))==x(i) && y(length(x))==y(i) && ~pass
                   title('You bite yourself. Game over.');
                   game_over=1;
                   break;
               end
           end
           display_snake(x,y,food,length(x)>=limit);
           %this is to print out the current score and level
           display_detail(level,times,time_limit,status,length(x)-size,limit-size);
           %text1.Color='r';
           axis([0 1000 -25 1025]);
           axis off;
           drawnow
           if level<10
               pause(0.03-level*0.003); %pause for a while
           else 
               pause(0.002);
           end
           %check if game is over
           if game_over
               stop(t);
               delete(t);
               break;
           end
           %if the snake just ate, then it lengthen its body by 1
           %and then the rest will move on one step
           [score, eat, x, y, pass] = snake_move(score, eat, x, y, pass, dir, limit);
           %check if it bites any part of itself
           %this is to set up for a new level
           if x(1)==-1
               pass=0;
               level=level+1;               
               x=0:(size-1);
               y=zeros([1 size]);
               dir=0;
               food=[10 10];
               times=0;
               col=[1 1 1];
               fig.Color=col;
               status=0;               
               if level==71
                   win=1;
               end
               if level>60
                   limit=80; 
                   time_limit=800-35*(level-60);
               end
               if level<=60 && level>50
                   limit=70;                   
                   time_limit=700-30*(level-50);
               end               
               if level<=50 && level>40
                   limit=60;                   
                   time_limit=600-25*(level-40);
               end
               if level<=40 && level>30
                   limit=50;                   
                   time_limit=500-20*(level-30);
               end
               if level<=30 && level>20
                   limit=40;                   
                   time_limit=400-15*(level-20);
               end
               if level<=20 && level>10
                   limit=30;                   
                   time_limit=300-10*(level-10);
               end
               if level<=10 && level>5
                   limit=30;
               end
               if level<=5
                   limit=20;
               end
           end
           %check if its head eats the food
           %if yes then create new food, mark it as eat to increase its
           %size. Finally check if the new food is already in its stomach
           [food,eat]=bypass(x,y,eat,food);
        end
        key_press=0; %reset the key_press after catching it
        %change direction accordingly to the key pressed
        %btw check if it turns around and bites itself
        if ~win
            if strcmp(key,'rightarrow')
                if dir==1
                    title('You bite yourself. Game over.');
                    game_over=1;
                else
                    dir=0;
                end
            end
            if strcmp(key,'leftarrow')
                if dir==0
                    title('You bite yourself. Game over.');
                    game_over=1;
                else
                    dir=1;
                end
            end
            if strcmp(key,'uparrow')
                if dir==3
                    title('You bite yourself. Game over.');
                    game_over=1;
                else
                    dir=2;
                end
            end
            if strcmp(key,'downarrow')
                if dir==2
                    title('You bite yourself. Game over.');
                    game_over=1;
                else
                    dir=3;
                end
            end
            if strcmp(key,'escape')
                stop(t);
                delete(t);
                return;
            end
        end
    end
       
end

function keypress(obj,~)
    %get the key pressed and pass to the main function
    global key
    key=get(obj,'CurrentKey');
    global key_press
    key_press=1;
end

function timerBreak(~,~)
    global alarm
    alarm = 1;
end
