function [h] = phasePotrait4_3(funHandler,varargin)
    narginchk(1,5);
    [limits,axis,sample,dimension] = arguments(varargin);
    
    x = linspace(limits(1,1),limits(1,2),sample);
    y = linspace(limits(2,1),limits(2,2),sample);
    [x,y] = meshgrid(x,y);
    x = x(:).';
    y = y(:).';
    X = 1e-9*ones(dimension,length(x));
    X(axis(1),:) = x;
    X(axis(2),:) = y;
    Y = funHandler(0,X);
    u = Y(axis(1),:);
    v = Y(axis(2),:);
    
%     h = figure
%     quiver(x,y,u,v,'b');
%     xlim(limits(1,:))
%     ylim(limits(2,:))
    
%     x = linspace(limits(1,1),limits(1,2),ceil(sample/3));
    x = 1.5e-9;
%     y = linspace(limits(2,1),limits(2,2),ceil(sample/3));
    y = 2e-9;
    [x,y] = meshgrid(x,y);
    x = x(:).';
    y = y(:).';
    X =  1e-9*ones(dimension,length(x));
    X(axis(1),:) = x;
    X(axis(2),:) = y;
    
    tspan = [0,3];
    opts = odeset('Reltol',1e-12,'Abstol',1e-12);
    hold on
    for ii = X
        [~,Y] = ode15s(funHandler, tspan, ii, opts);
        plot(Y(:,axis(1))*1e9,Y(:,axis(2))*1e9,'r:')
%         scatter(Y(1,axis(1)),Y(1,axis(2)),'mo')
%         scatter(Y(end,axis(1)),Y(end,axis(2)),'m*')
    end
    hold off
end

function [limits,axis,sample,dimension] = arguments(varcell)
    limits = [-5 5;-5 5];
    axis = [1  2];
    sample = 20;
    dimension=2;
    check = 0;
    for ii = 1:length(varcell)
        dummy = cell2mat(varcell(ii));
        [row,clm] = size(dummy);
        if row == 1
            if clm == 1
                if (dummy == round(dummy)) .* (dummy > 0)
                    if check == 0
                        dimension = dummy;
                        check = 1;
                    else
                        sample = dummy;
                    end
                end
            elseif clm == 2
                if sum((dummy == round(dummy)) .* (dummy > 0)) == 2
                    axis = dummy;
                end
            end
        elseif row == 2
            if clm == 2
                limits = dummy;
            end
        end
    end
end
