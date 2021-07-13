%% my own 3d PTV data loader 
  clear all
% clc

root='I:\PTV results\new_series\up-16july\';
cd(root) 
d = dir;


main_folder='C:\Users\rafati1\Dropbox\Alberta\3D Paper\data\Fina\modfication\code';

Xtotal=[];
Ytotal=[];
Ztotal=[];
Utotal=[];
Vtotal=[];
Wtotal=[];

%%
 for im=1:1:numel(d)-3
     load(strcat(num2str(im),'.mat'))
     Xtotal=[Xtotal,X_temp];
     Ytotal=[Ytotal,Y_temp];
     Ztotal=[Ztotal,Z_temp];
     Utotal=[Utotal,U_temp];
     Vtotal=[Vtotal,V_temp];
     Wtotal=[Wtotal,W_temp];
     data_ind{im}=[X_temp', Y_temp', Z_temp', U_temp', V_temp', W_temp'];
     im
 end
 cd(main_folder)
%%
% pnt_selection
%%
Xtotal_c1_3DPTV_m=Xtotal;
Ytotal_c1_3DPTV_m=Ytotal;
Ztotal_c1_3DPTV_m=Ztotal;
Utotal_c1_3DPTV_m=Utotal;
Vtotal_c1_3DPTV_m=Vtotal;
Wtotal_c1_3DPTV_m=Wtotal;

d_3DPTV_m=[Xtotal_c1_3DPTV_m;Ytotal_c1_3DPTV_m;Ztotal_c1_3DPTV_m;Utotal_c1_3DPTV_m;Vtotal_c1_3DPTV_m;Wtotal_c1_3DPTV_m];
dd_3DPTV_m=d_3DPTV_m';
dd_3DPTV_msort=sortrows(dd_3DPTV_m,2);
newx_3DPTV_m=dd_3DPTV_msort(:,1);
newy_3DPTV_m=dd_3DPTV_msort(:,2);
newz_3DPTV_m=dd_3DPTV_msort(:,3);
newU_3DPTV_m=dd_3DPTV_msort(:,4);
newV_3DPTV_m=dd_3DPTV_msort(:,5);
newW_3DPTV_m=dd_3DPTV_msort(:,6);
%%
figure(11)
 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
 
 %%
  brdfiltery_3DPTV_m=1; brdfilterx_3DPTV_m=20; brdfilterz_3DPTV_m=20; brdfiltery_3DPTV_m2=10;
% Nx_3DPTV_m=976; Ny_3DPTV_m=1291; Nz_3DPTV_m=1051;
d3ptv_uliM_3DPTV_m=17; d3ptv_vliM_3DPTV_m=5; d3ptv_wliM_3DPTV_m=5;
% % wavg_3dptv_m=12;  
Ny_3DPTV_m=max(newy_3DPTV_m);Nx_3DPTV_m=max(newx_3DPTV_m);Nz_3DPTV_m=max(newz_3DPTV_m);

%%
% filtering y1
 figure(12)
newU_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
newV_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
newW_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
newz_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
newx_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
newy_3DPTV_m(newy_3DPTV_m<brdfiltery_3DPTV_m)=[];
 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
%  pause
 %% filtering y2
  figure(13)
newU_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];
newV_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];
newW_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];
newz_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];
newx_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];
newy_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m))=[];

 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')

%% filtering x1
 figure(14)
%  brdfilterx_3DPTV_m=20
newU_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
newV_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
newW_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
newz_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
newy_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
newx_3DPTV_m((newx_3DPTV_m<brdfilterx_3DPTV_m))=[];
plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
%%  filtering x2
figure(15)
newU_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
newV_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
newW_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
newz_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
newy_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
newx_3DPTV_m((newx_3DPTV_m>Nx_3DPTV_m-brdfilterx_3DPTV_m))=[];
 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
%% filtering z1
 figure(16)
newU_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
newV_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
newW_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
newx_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
newy_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
newz_3DPTV_m((newz_3DPTV_m<brdfilterz_3DPTV_m))=[];
plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
%% filtering z2
 figure(17)
newU_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
newV_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
newW_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
newx_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
newy_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
newz_3DPTV_m((newz_3DPTV_m>Nz_3DPTV_m-brdfilterz_3DPTV_m))=[];
plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
%%
figure(18)
newV_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newW_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newx_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newy_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newz_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newU_3DPTV_m(-newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];

newV_3DPTV_m(-newU_3DPTV_m<0)=[];
newW_3DPTV_m(-newU_3DPTV_m<0)=[];
newx_3DPTV_m(-newU_3DPTV_m<0)=[];
newy_3DPTV_m(-newU_3DPTV_m<0)=[];
newz_3DPTV_m(-newU_3DPTV_m<0)=[];
newU_3DPTV_m(-newU_3DPTV_m<0)=[]; 


newU_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];
newW_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];
newx_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];
newy_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];
newz_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];
newV_3DPTV_m(newV_3DPTV_m>d3ptv_vliM_3DPTV_m)=[];

newU_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];
newW_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];
newx_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];
newy_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];
newz_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];
newV_3DPTV_m(newV_3DPTV_m<-d3ptv_vliM_3DPTV_m)=[];

newU_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];
newV_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];
newx_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];
newy_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];
newz_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];
newW_3DPTV_m(newW_3DPTV_m>d3ptv_wliM_3DPTV_m)=[];

newU_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];
newV_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];
newx_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];
newy_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];
newz_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];
newW_3DPTV_m(newW_3DPTV_m<-d3ptv_wliM_3DPTV_m)=[];

 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
 %
 data_mdf_3dptv_m=[newx_3DPTV_m,newy_3DPTV_m,newz_3DPTV_m,newU_3DPTV_m,newV_3DPTV_m,newW_3DPTV_m];
save ('cleaned_3dptv_matlab_data_august_7_2.mat','data_mdf_3dptv_m')
 %%
 clear all
 
 load ('cleaned_3dptv_matlab_data_august_7_2.mat')
 close all  
 lprmv=1; 

while  lprmv==1 
    close all
    plot(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,5),'.')

[xrc_2dptv,yrc_2dptv]=ginput(5);
xv_2dptv=[xrc_2dptv;xrc_2dptv(1)];
yv_2dptv=[yrc_2dptv;yrc_2dptv(1)];
hold on 
plot(xv_2dptv,yv_2dptv,'r')
[in,on] = inpolygon(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,5),xv_2dptv,yv_2dptv);
% hist(in)
hold on

plot(data_mdf_3dptv_m(in,2),-data_mdf_3dptv_m(in,5),'r+') % points inside
%  pause
data_mdf_3dptv_m(in,:)=[];
data_mdf_3dptv_m(on,:)=[];
lprmv=input('Continue removal? ');
end
 plot(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,5),'.')
  
%%
save ('cleaned_3dptv_matlab_data_august_7_4.mat','data_mdf_3dptv_m')
