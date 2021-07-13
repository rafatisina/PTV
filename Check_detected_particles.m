% %% original detected
figure(1)
scatter3(Xpos_int_temp1,Ypos_int_temp1,Zpos_int_temp1,'MarkerFaceColor',[0 .75 .75])
hold on
scatter3(Xpos_int_temp2,Ypos_int_temp2,Zpos_int_temp2,'MarkerFaceColor',[0 .25 .25])
xlabel('X')
ylabel('Y')
zlabel('Z')
legend('1','2')
title('Original detected particles')
set(gcf,'units','normalized','outerposition',[0 0 1 1])
axis([0 size(I1,2) 0 size(I1,1) 0 size(I1,3)])
 %% after filtering
figure(2)
scatter3(Xpos_int1,Ypos_int1,Zpos_int1,'MarkerFaceColor',[0 .75 .75])
hold on
scatter3(Xpos_int2,Ypos_int2,Zpos_int2,'MarkerFaceColor',[0 .25 .25])

xlabel('X')
ylabel('Y')
zlabel('Z')
legend('1','2')
title('filtered detected particles')
set(gcf,'units','normalized','outerposition',[0 0 1 1])
axis([0 size(I1,2) 0 size(I1,1) 0 size(I1,3)])
%% gaussian
figure(3)
scatter3(Xpos_temp1,Ypos_temp1,Zpos_temp1,'MarkerFaceColor',[0 .75 .75])
hold on
scatter3(Xpos_temp2,Ypos_temp2,Zpos_temp2,'MarkerFaceColor',[0 .25 .25])

xlabel('X')
ylabel('Y')
zlabel('Z')
legend('1','2')
title('gaussion filter')
set(gcf,'units','normalized','outerposition',[0 0 1 1])
axis([0 size(I1,2) 0 size(I1,1) 0 size(I1,3)])
%% final pairs
figure(4)

for kk=1:numel(Xfriends)
    X1=Xfriends{im}(1,:);
    X2=Xfriends{im}(2,:);
    
    Y1=Yfriends{im}(1,:);
    Y2=Yfriends{im}(2,:);
    
    Z1=Zfriends{im}(1,:);
    Z2=Zfriends{im}(2,:);
end
scatter3((Xpart(2,:)+Xpart(1,:))./2,(Ypart(2,:)+Ypart(1,:))./2,(Zpart(2,:)+Zpart(1,:))./2,'MarkerFaceColor','b')
hold on
scatter3(Xpart(1,:),Ypart(1,:),Zpart(1,:),'MarkerFaceColor','g')
hold on
scatter3(Xpart(2,:),Ypart(2,:),Zpart(2,:),'MarkerFaceColor','y')

quiver3((Xpart(2,:)+Xpart(1,:))./2,(Ypart(2,:)+Ypart(1,:))./2,(Zpart(2,:)+Zpart(1,:))./2,Utotal_det{im},Vtotal_det{im},Wtotal_det{im},100,'k')
% quiver3(Xtotal_det{im},Ytotal_det{im},Ztotal_det{im},Utotal_det{im},Vtotal_det{im},Wtotal_det{im},0.1,'k')

xlabel('X')
ylabel('Y')
zlabel('Z')
legend('vector','laser-1','laser-2')
title('paired particles')
axis([0 size(I1,2) 0 size(I1,1) 0 size(I1,3)])
camproj(gca,'perspective')
set(gcf,'units','normalized','outerposition',[0 0 1 1])
view(3)
view(00,-60);