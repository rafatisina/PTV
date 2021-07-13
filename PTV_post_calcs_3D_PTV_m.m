 kapa=.41;
B=5.5;

water_visc = 1.002e-3  ;                        % Kg/(M_3DPTV_m.s), dynaM_3DPTV_mic viscosity of water at 30 C
water_density = 998 ;                        % Kg/M_3DPTV_m3
% 
% M_3DPTV_m=0.0022831; dt_3DPTV_m=26;
% scale_3DPTV_m=M_3DPTV_m*1e-3; dtsPTV_m=dt_3DPTV_m*1e-6;
% 
% brdfiltery_3DPTV_m=30;
% brdfilterx_3DPTV_m=120;
% brdfilterz_3DPTV_m=15;
% Nx_3DPTV_m=976;
% Ny_3DPTV_m=1291;
% Nz_3DPTV_m=1051;
% 
% d3ptv_uliM_3DPTV_m=17; d3ptv_vliM_3DPTV_m=2; d3ptv_wliM_3DPTV_m=2;
% 
% wavg_3dptvm=12;
%%

% load(root_3dPTV_m)
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
 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')
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
 %% filtering y2
  figure(13)
newU_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];
newV_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];
newW_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];
newz_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];
newx_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];
newy_3DPTV_m((newy_3DPTV_m>Ny_3DPTV_m-brdfiltery_3DPTV_m2))=[];

 plot(newy_3DPTV_m,-newU_3DPTV_m,'.r')

%% filtering x1
 figure(14)
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
newV_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newW_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newx_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newy_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newz_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
newU_3DPTV_m(newU_3DPTV_m>d3ptv_uliM_3DPTV_m)=[];
plot(newy_3DPTV_m,newU_3DPTV_m,'.r')
%%
newV_3DPTV_m(newU_3DPTV_m<0)=[];
newW_3DPTV_m(newU_3DPTV_m<0)=[];
newx_3DPTV_m(newU_3DPTV_m<0)=[];
newy_3DPTV_m(newU_3DPTV_m<0)=[];
newz_3DPTV_m(newU_3DPTV_m<0)=[];
newU_3DPTV_m(newU_3DPTV_m<0)=[]; 
plot(newy_3DPTV_m,newU_3DPTV_m,'.r')

%%
newU_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
newW_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
newx_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
newy_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
newz_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
newV_3DPTV_m(abs(newV_3DPTV_m)>d3ptv_vliM_3DPTV_m)=[];
plot(newy_3DPTV_m,newU_3DPTV_m,'.r')
%%

newU_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];
newV_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];
newx_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];
newy_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];
newz_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];
newW_3DPTV_m(abs(newW_3DPTV_m)>d3ptv_wliM_3DPTV_m)=[];


 plot(newy_3DPTV_m,newU_3DPTV_m,'.r')
 %%
  data_mdf_3dptv_m=[newx_3DPTV_m,newy_3DPTV_m,newz_3DPTV_m,newU_3DPTV_m,newV_3DPTV_m,newW_3DPTV_m];
%   save ('cleaned_3dptv_JF_riblet_1.mat','data_mdf_3dptv_m')
 %%
%    load('cleaned_3dptv_JF_riblet_1.mat')
%  lprmv=1;
% 
% while  lprmv==1 
%     close all
%     plot(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,4),'.')
% 
% [xrc_2dptv,yrc_2dptv]=ginput(5);
% xv_2dptv=[xrc_2dptv;xrc_2dptv(1)];
% yv_2dptv=[yrc_2dptv;yrc_2dptv(1)];
% hold on 
% plot(xv_2dptv,yv_2dptv,'r')
% [in,on] = inpolygon(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,4),xv_2dptv,yv_2dptv);
% % hist(in)
% hold on
% 
% plot(data_mdf_3dptv_m(in,2),-data_mdf_3dptv_m(in,4),'r+') % points inside
% %  pause
% data_mdf_3dptv_m(in,:)=[];
% data_mdf_3dptv_m(on,:)=[];
% lprmv=input('Continue removal? ');
% end
%
% save ('cleaned_3dptv_JF_riblet_2.mat','data_mdf_3dptv_m')


%%
% wavg_3dptv_m=16;scale_3DPTV_m=0.0075*1e-3; dt_3dptv_m=72*1e-6;

%   load('cleaned_3dptv_matlab_data_1_7.mat')
  load('cleaned_3dptv_JF_riblet_2.mat')
%     load('cleaned_3dptv_matlab_data_august_7_3.mat')
close all

    newx_3dptv_m=data_mdf_3dptv_m(:,1);
    newy_3DPTV_m=data_mdf_3dptv_m(:,2);
    newz_3DPTV_m=data_mdf_3dptv_m(:,3);
    newU_3DPTV_m=data_mdf_3dptv_m(:,4);
    newV_3DPTV_m=data_mdf_3dptv_m(:,5);
    newW_3DPTV_m=data_mdf_3dptv_m(:,6);
% pause(1)
close all
yl=min(newy_3DPTV_m):wavg_3dptv_m:max(newy_3DPTV_m);
m=1;
num=1;
for m=1:numel(yl)-1  
       ybin_3DPTV_m{num}=   newy_3DPTV_m(newy_3DPTV_m>=yl(m)&newy_3DPTV_m<=yl(m+1));
       ubin_3DPTV_m{num}=-1*newU_3DPTV_m(newy_3DPTV_m>=yl(m)&newy_3DPTV_m<=yl(m+1));
       vbin_3DPTV_m{num}=   newV_3DPTV_m(newy_3DPTV_m>=yl(m)&newy_3DPTV_m<=yl(m+1));
       wbin_3DPTV_m{num}= -1*newW_3DPTV_m(newy_3DPTV_m>=yl(m)&newy_3DPTV_m<=yl(m+1));
       num=num+1;
end
%        M_3DPTV_m=nuM_3DPTV_mel(yl)-1 ;
%        ybin{nuM_3DPTV_m}=   newy_3DPTV_m(newy_3DPTV_m>=yl(M_3DPTV_m+1));
%        ubin_3DPTV_m{nuM_3DPTV_m}=-1*newU_3DPTV_m(newy_3DPTV_m>=yl(M_3DPTV_m+1));
%        vbin_3DPTV_m{nuM_3DPTV_m}=   newV_3DPTV_m(newy_3DPTV_m>=yl(M_3DPTV_m+1));

%% M_3DPTV_mean flow
for k=1:numel(ybin_3DPTV_m)
    ymean_3DPTV_m(k)=mean(ybin_3DPTV_m{k});
    umean_3DPTV_m(k)=mean(ubin_3DPTV_m{k});
    vmean_3DPTV_m(k)=mean(vbin_3DPTV_m{k});
    wmean_3DPTV_m(k)=mean(wbin_3DPTV_m{k});
    num_bin_3DPTV_m(k)=numel(vbin_3DPTV_m{k});
end


%% turbulence

for k=1:numel(ybin_3DPTV_m)
    up_3DPTV_m{k}=ubin_3DPTV_m{k}-umean_3DPTV_m(k);
    vp_3DPTV_m{k}=vbin_3DPTV_m{k}-vmean_3DPTV_m(k);
    wp_3DPTV_m{k}=wbin_3DPTV_m{k}-wmean_3DPTV_m(k);
end


%% filter

for k=1:numel(ybin_3DPTV_m) 
    buff1_3DPTV_m=(vp_3DPTV_m{k}>-3 & vp_3DPTV_m{k}<3);
    buff2_3DPTV_m=(up_3DPTV_m{k}>-5 & up_3DPTV_m{k}<5);
    buff3_3DPTV_m=(wp_3DPTV_m{k}>-3 & wp_3DPTV_m{k}<3);
    
    up_3DPTV_mf{k}=buff1_3DPTV_m.*buff2_3DPTV_m.*buff3_3DPTV_m.*up_3DPTV_m{k};
    up_3DPTV_mf{k}(up_3DPTV_mf{k}==0)=[];
    
    vp_3DPTV_mf{k}=buff1_3DPTV_m.*buff2_3DPTV_m.*buff3_3DPTV_m.*vp_3DPTV_m{k};
    vp_3DPTV_mf{k}(vp_3DPTV_mf{k}==0)=[];
    
    wp_3DPTV_mf{k}=buff1_3DPTV_m.*buff2_3DPTV_m.*buff3_3DPTV_m.*wp_3DPTV_m{k};
    wp_3DPTV_mf{k}(wp_3DPTV_mf{k}==0)=[];
    
    %vp_3DPTV_m{k}=vbin_3DPTV_m{k}-vM_3DPTV_mean(k);
%     up_3DPTV_mf{k}=up_3DPTV_mf{k}.*M_3DPTV_m2d_ptv/dtPTV_m2d_ptv;
%     vp_3DPTV_mf{k}=vp_3DPTV_mf{k}.*M_3DPTV_m2d_ptv/dtPTV_m2d_ptv;
end

  
  

%% turbulence

for k=1:numel(ybin_3DPTV_m) 
    up_3DPTV_m2(k)=mean((up_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^2);       
    vp_3DPTV_m2(k)=mean((vp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^2); 
    wp_3DPTV_m2(k)=mean((wp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^2); 
    uvp_3DPTV_m(k)=mean((up_3DPTV_mf{k}.*vp_3DPTV_mf{k}.*(scale_3DPTV_m/(dt_3dptv_m)).^2));   
    uwp_3DPTV_m(k)=mean((up_3DPTV_mf{k}.*wp_3DPTV_mf{k}.*(scale_3DPTV_m/(dt_3dptv_m)).^2));    
    vwp_3DPTV_m(k)=mean((vp_3DPTV_mf{k}.*wp_3DPTV_mf{k}.*(scale_3DPTV_m/(dt_3dptv_m)).^2));    
end

for k=1:numel(ybin_3DPTV_m) 
    up_3DPTV_m3(k)=mean((up_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^3);       
    vp_3DPTV_m3(k)=mean((vp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^3);    
    wp_3DPTV_m3(k)=mean((wp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^3);  
end

for k=1:numel(ybin_3DPTV_m) 
    up_3DPTV_m4(k)=mean((up_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^4);    
    vp_3DPTV_m4(k)=mean((vp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^4); 
    wp_3DPTV_m4(k)=mean((wp_3DPTV_mf{k}.*scale_3DPTV_m/(dt_3dptv_m)).^4);    
end

skewness_u=up_3DPTV_m3./(up_3DPTV_m2.^1.5);
skewness_v=vp_3DPTV_m3./(vp_3DPTV_m2.^1.5);
skewness_w=wp_3DPTV_m3./(wp_3DPTV_m2.^1.5);

kurtosis_u_3DPTV_m4=up_3DPTV_m4./(up_3DPTV_m2.^2);
kurtosis_v_3DPTV_m4=vp_3DPTV_m4./(vp_3DPTV_m2.^2);
kurtosis_w_3DPTV_m4=wp_3DPTV_m4./(wp_3DPTV_m2.^2);
%%
% close all
% inil=3; finil=1;
% %plot(ymean_3DPTV_m(inil:end-finil)./max(ymean_3DPTV_m(inil:end-finil)),umean_3DPTV_m(inil:end-finil)./max(umean_3DPTV_m(inil:end-finil)))
% axis([0 0.5 0 1])
% grid on 
% %%
% close all
% inil=3; finil=1;
% %plot(ymean_3DPTV_m(inil:end-finil)./max(ymean_3DPTV_m(inil:end-finil)),up_3DPTV_m2(inil:end-finil))
% axis([0 0.5 0 5])
% grid on 
% %%
% plot(data_mdf_3dptv_m(:,2),-data_mdf_3dptv_m(:,4),'.')
% hold on
% plot(ymean_3DPTV_m(1:end), umean_3DPTV_m(1:end),'r*')
% % hold on
% plot(ymean_3DPTV_m(5:end),up_3DPTV_m2(5:end),'g+')
% % hold on
% plot(ymean_3DPTV_m(5:end),vp_3DPTV_m2(5:end),'y^')

%%
% nr=2;
% scale_3DPTV_m=0.0075*1e-3; dt_3dptv_m=72*1e-6;
% vector_dist_3dptv_m=scale_3DPTV_m*wavg_3dptv_m; 
% close all
% wall1_3DPTV_m=15.5;%84.5 31.5
% wall2_3DPTV_m=870;
% 
% wall1_3DPTV_m_r=ceil(wall1_3DPTV_m); 
% wall1_3DPTV_m_offset=wall1_3DPTV_m-wall1_3DPTV_m_r; 
% wall2_3DPTV_m_r=ceil(wall2_3DPTV_m); 
% wall2_3DPTV_m_offset=wall2_3DPTV_m-wall2_3DPTV_m_r; 
% 
% 
%  Ye_3dptv_m=((ymean_3DPTV_m-wall1_3DPTV_m_r).*scale_3DPTV_m*1000-vector_dist_3dptv_m*1e3*wall1_3DPTV_m_offset+vector_dist_3dptv_m*1e3*wall2_3DPTV_m_offset);
%  Yn_3dptv_m=Ye_3dptv_m./abs((wall2_3DPTV_m_r-wall1_3DPTV_m_r).*scale_3DPTV_m*1000+vector_dist_3dptv_m*1e3*wall2_3DPTV_m_offset+vector_dist_3dptv_m*1e3*wall1_3DPTV_m_offset);
% plot(Yn_3dptv_m(nr:end), umean_3DPTV_m(nr:end)./max(umean_3DPTV_m),'r*')
% hold on
%  plot(ydns,umeandnsnmax,stldns,'MarkerFaceColor','k','LineWidth',1.5);