figure(4)

for kk=1:numel(Xfriends)
    X1=Xfriends{im}(1,:);
    X2=Xfriends{im}(2,:);
    
    Y1=Yfriends{im}(1,:);
    Y2=Yfriends{im}(2,:);
    
    Z1=Zfriends{im}(1,:);
    Z2=Zfriends{im}(2,:);
end
scatter3(Xtotal_det{im},Ytotal_det{im},Ztotal_det{im},'MarkerFaceColor','b')
hold on
scatter3(Xpart(1,:),Ypart(1,:),Zpart(1,:),'MarkerFaceColor','g')
hold on
scatter3(Xpart(2,:),Ypart(2,:),Zpart(2,:),'MarkerFaceColor','y')

quiver3(Xtotal_det{im},Ytotal_det{im},Ztotal_det{im},Utotal_det{im},Vtotal_det{im},Wtotal_det{im},0.1,'k')
xlabel('X')
ylabel('Y')
zlabel('Z')
legend('vector','laser-1','laser-2')
title('paired particles')
axis([0 size(I1,2) 0 size(I1,1) 0 size(I1,3)])
camproj(gca,'perspective')

view(3)

%% Data cursor
close all
clear all
clc
h=figure(1)
plot3(rand(5,1),rand(5,1)*20,rand(5,1)*5,'.'), view(3)

  datacursormode on
 dcmObj = datacursormode(h);
%  set(dcmObj,'SnapToDataVertex','off','Enable','on')
waitforbuttonpress
%%
loop = 1
while loop == 1
    
    lw=waitforbuttonpress;
    point1 = getCursorInfo(dcmObj);
     x = point1.Position(1)
    y = point1.Position(2)
    z = point1.Position(3)
    loop=lw

end
%%
loop = 1
while loop == 1
    waitforbuttonpress;
    point1 = getCursorInfo(dcmObj);
   
    % Write exit option
    loop==0
end