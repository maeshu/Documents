clc;    %コマンドウィンドウの消去
clear;  %変数を全消去
close all;%グラフの全消去

%t=[0:0.01:14];

sim('system4report');
y1=6*exp(-0.5*t)-11*exp(-3*t);
scrsz = get(groot,'ScreenSize');
yl = 18;
%set(gcf,'Position',[1,400,560,200])

for n = 1:6
    fig = figure;
    fig.Position = [0 0 640 320];
    fig.PaperPositionMode = 'auto';
    hold on%グラフの重ね書きの許可
    box on
    xlabel('$$t$$','interpreter','latex');
    if n==1
        %fig=figure('Name','results');
        fig.Name = 'results';
        ylabel('$$x(t)$$','interpreter','latex');
        axis([0 yl 0 1.5]);%x,y軸の範囲設定
        ref = results(1:yl,1);
        plot(t,results(:,1),'black')
        plot(t,results(:,2),'Color',[0 0.4470 0.7410])
        plot(t,results(:,3),'Color',[0.8500 0.3250 0.0980])
        plot(t,results(:,4),'Color',[0.9290 0.6940 0.1250])
        co = [0 0.4470 0.7410;
            0.8500 0.3250 0.0980;
            0.9290 0.6940 0.1250;
            0.4940 0.1840 0.5560];
        %plot(t,results,co)
        legend('refference model','\delta=1','\delta=10','\delta=100','Location','southeast')
    elseif n==2
        fig.Name = 'error';
        ylabel('$$\tilde{x}$$','interpreter','latex');
        %figure
        hold on
        axis([0 yl -1 1])
        plot(t,error)
    elseif n==3
        fig.Name = 'input';
        ylabel('$$u(t)$$','interpreter','latex');
        %figure
        hold on
        axis([0 yl 0 2.5])
        plot(t,input)
    elseif n==4
        fig.Name = 'alpha';
        ylabel('$$\hat{\alpha}$$','interpreter','latex');
        %figure
        hold on
        axis([0 yl -1 1])
        plot(t,alpha_hat)
    elseif n==5
        fig.Name = 'beta';
        ylabel('$$\hat{\beta}$$','interpreter','latex');
        %figure
        hold on
        axis([0 yl -1 1])
        plot(t,beta_hat)
    elseif n==6
        fig.Name = 'gamma';
        ylabel('$$\hat{\gamma}$$','interpreter','latex');
        %figure
        hold on
        axis([0 yl 0 1.5])
        plot(t,gamma_hat)
    end
    if n>1
        legend('\delta=1','\delta=10','\delta=100')
    end
    hold off
    filename = sprintf('/home/kazuhiro/Documents/院授業/車両制御特論/tominaga/report2/matlab/fig/%s.eps',fig.Name);
    %print(fig, '-r0','-depsc',filename);
end







