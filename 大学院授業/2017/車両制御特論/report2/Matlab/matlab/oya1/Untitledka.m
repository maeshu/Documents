clc ;
clear ;
clf ;

sim ('model') % s i m u l i n k の読み込み

figure (1);
xlim ([0 ,40]);
ylim ([ -0.5 ,3.5])
xlabel ('t');
ylabel ('x');

orange = [241/255 ,98/255 ,2/255];
green = [0/255 ,179/255 ,104/255];

y_a = sin (x);
hold on;

plot (x,y,'Color ',green ); % s i m u l i n k によって出力された値
plot (x, y_a ,'Color ',orange ); % 解析的解