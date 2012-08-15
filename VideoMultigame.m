
%%%%% Video Hawk-Dove Dynamic
C=[-0.2:-0.05:-4];
T=[0.1:0.05:5];
N=length(C);
% Get the handle of the figure
h= figure();
%%%%% STANG AND HUNT CHANGE IN POWER (F) C=3 T=-2
C=3;
T=-2;
F=0.1:0.01:0.9;
N=length(F);
% Get the handle of the figure
h= figure();
% Prepare the new file.
aviobj= avifile('CURRENCY WARS STAG-HUNT Power Variable.avi');
for i=1:N;
z=10*ones(21,21);
[x,y]=meshgrid(0:.05:1,0:.05:1);
dy  = y*(1-y)*(T*F(i)+(C-T)*F(i)*y+C*(1-F(i))+(T-C)*(1-F(i))*x);
dx =  x*(1-x)*(T*(1-F(i))+ C*F(i)+(C-T)*(1-F(i))*x+(T-C)*F(i)*y);
dyu = dy./sqrt(dx.^2+dy.^2);
dxu = dx./sqrt(dx.^2+dy.^2);
imagesc(0:.05:1,0:.05:1,z)
colormap(gray)
hold on;
quiver(x,y,dxu,dyu)
hold off;
title(['STAG AND HUNT T= -2',' C=3 ',' F= ',num2str(F(i))])
ylabel('PROPORTION OF COOPERTIVE PRINTERS ')
xlabel('PROPORTION OF COOPERATIVE CURRENCY CONTROLERS')
Frame = getframe(h);
aviobj = addframe(aviobj,Frame);
end
close(h)
aviobj = close(aviobj);