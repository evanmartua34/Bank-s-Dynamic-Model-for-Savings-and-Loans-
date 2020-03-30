function [gd,w,gl,b,fmin] = spiral(buku,kd,kl,n,D,L)
%input local parameter
    m=50000;
    kmax=100;
    tetha = (pi/4);
    r = 0.95;        
%% choosing searching area%%
    if (buku ==1)
            j =2;
    elseif ((buku == 2) | (buku ==4) )
            j = 1;
    else
        j= 4;
    end

    %% Spiral Algorithm
    %% initiating m initial sobol sequences
        sob  = sobolset(4,'skip',1e1,'leap',1e3);
        x    = j*net(sob,m);
        nx = size(x);
        nx = nx(1);
    %% choose min x value 
    fmin =inf;
    k=0;
    for i=1:nx
         if ((x(i,1) > 0)& (x(i,2)> 0) &(x(i,3)> 0)& (x(i,4)> 0))
            f=MAPE(x(i,:),kd,kl,buku,n,D,L);
            if (f<fmin)
                xmin = x(i,:);
                imin = i;
                fmin=f;
            end
         end
    end
    %%
    S4      = Sn(r,tetha);
    while k<kmax
        % change x value
        for i=1:nx
             newxi1  = (S4*x(i,:)');
             newxi2  = ((S4-eye(4))*xmin');
             newxi   = newxi1 - newxi2;
             x(i,:) = newxi';
        end
        % evaluate x that minimize MAPE function
        for i=1:nx
            if ((x(i,1) > 0)& (x(i,2)> 0) &(x(i,3)> 0)& (x(i,4)> 0))
                f=MAPE(x(i,:),kd,kl,buku,n,D,L);
                if (f<fmin)
                    xmin = x(i,:);
                    imin = i;
                    fmin=f;
                end
            end
        end
        k=k+1;
    end
    gd  = xmin(1);
    w   = xmin(2);
    gl  = xmin(3);
    b   = xmin(4);
end