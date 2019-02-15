function display_detail(level,times,time_limit,status,length,limit)
    text(0, 1025,sprintf('Score %d/%d', length,limit));
    if level<10
        text(900, 1025,sprintf('Level %d', level));
    else
        text(880, 1025,sprintf('Level %d', level));
    end
    if times/60>=10 && mod(times,60)>=10
        h=text(0,-25,sprintf('Times elapsed %d:%d', floor(times/60),mod(times,60)));
    end
    if times/60<10 && mod(times,60)>=10
        h=text(0,-25,sprintf('Times elapsed 0%d:%d', floor(times/60),mod(times,60)));
    end
    if times/60>=10 && mod(times,60)<10
        h=text(0,-25,sprintf('Times elapsed %d:0%d', floor(times/60),mod(times,60)));
    end
    if times/60<10 && mod(times,60)<10
        h=text(0,-25,sprintf('Times elapsed 0%d:0%d', floor(times/60),mod(times,60)));
    end
    if status
        h.Color = [1 0 0];
    else
        h.Color = [0 0 0];
    end
    if level<=10
        text(780,-25,'Time limit 00:00');
    else
        if time_limit/60>=10 && mod(time_limit,60)>=10
            text(780,-25,sprintf('Time limit %d:%d', floor(time_limit/60),mod(time_limit,60)));
        end
        if time_limit/60>=10 && mod(time_limit,60)<10
            text(780,-25,sprintf('Time limit %d:0%d', floor(time_limit/60),mod(time_limit,60)));
        end
        if time_limit/60<10 && mod(time_limit,60)>=10
            text(780,-25,sprintf('Time limit 0%d:%d', floor(time_limit/60),mod(time_limit,60)));
        end
        if time_limit/6<10 && mod(time_limit,60)<10
            text(780,-25,sprintf('Time limit 0%d:0%d', floor(time_limit/60),mod(time_limit,60)));
        end
    end
end