%% 3D-PTV DaVis
%%%%%%%%%%%%%%%%%%%%%%%%% Mean and Reynolds stress %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
close all
%%

Ws=40;
Ov=75; %  in %

Ovn=1./(1-Ov/100);  

water_visc = 1.002e-3  ;                        % Kg/(m.s), dynamic viscosity of water at 30 C
water_density = 998 ;                               % Kg/m3
Fntsize=12;
Msize=4;
kapa=0.39;
Beta=5.3;

%  root_3dPTV_m=load('Data300_riblet_oct4.mat');
 root_3dPTV_m=load('cleaned_3dptv_JF_riblet_3mat');
%%
 wavg_3dptv_m=18;
brdfiltery_3DPTV_m=17; brdfilterx_3DPTV_m=25; brdfilterz_3DPTV_m=15;
brdfiltery_3DPTV_m2=80;
Nx_3DPTV_m=max(Xtotal); Ny_3DPTV_m=max(Ytotal); Nz_3DPTV_m=max(Ztotal);
d3ptv_uliM_3DPTV_m=16; d3ptv_vliM_3DPTV_m=2; d3ptv_wliM_3DPTV_m=2.5;
%%



close all
wall1_3DPTV_m=26.5;%84.5 31.5
wall2_3DPTV_m=970;

wall1_3DPTV_m_r=ceil(wall1_3DPTV_m); 
wall1_3DPTV_m_offset=wall1_3DPTV_m-wall1_3DPTV_m_r; 
wall2_3DPTV_m_r=ceil(wall2_3DPTV_m); 
wall2_3DPTV_m_offset=wall2_3DPTV_m-wall2_3DPTV_m_r; 


stl_3dptv_m='k+';
scale_3DPTV_m=0.0233058*1e-3; dt_3dptv_m=1200*1e-6;

u_ta_fr3dPIV_m=0.01508;
% 0.28;
friction_velocity_fr3dPTV_m=u_ta_fr3dPIV_m^2;
vector_dist_3dptv_m=scale_3DPTV_m*wavg_3dptv_m;

%% 3D PTV
PTV_post_calcs_3D_PTV_m
umean_3DPTV_mnmax=umean_3DPTV_m./max(umean_3DPTV_m);
umean_3DPTV_mnmean=umean_3DPTV_m./mean(umean_3DPTV_m);
%%
% rmv1=1;
% rmv2=0;
close all
 Ye_3dptv_m=((ymean_3DPTV_m-wall1_3DPTV_m_r).*scale_3DPTV_m*1000-vector_dist_3dptv_m*1e3*wall1_3DPTV_m_offset+vector_dist_3dptv_m*1e3*wall2_3DPTV_m_offset);
%  Yn_3dptv_mb=Ye_3dptv_m./abs((wall2_3DPTV_m_r-wall1_3DPTV_m_r).*scale_3DPTV_m*1000+vector_dist_3dptv_m*1e3*wall2_3DPTV_m_offset+vector_dist_3dptv_m*1e3*wall1_3DPTV_m_offset);
%  Ye_3dptv_mb=Ye_3dptv_m;
%   Ye_3dptv_m(rmv1)=[];umean_3DPTV_mnmax(rmv1)=[];up_3DPTV_m2(rmv1)=[];vp_3DPTV_m2(rmv1)=[];wp_3DPTV_m2(rmv1)=[];uvp_3DPTV_m(rmv1)=[];uwp_3DPTV_m(rmv1)=[];vwp_3DPTV_m(rmv1)=[];
%   Ye_3dptv_m(end-rmv2:end)=[];umean_3DPTV_mnmax(end-rmv2:end)=[];up_3DPTV_m2(end-rmv2:end)=[];vp_3DPTV_m2(end-rmv2:end)=[];wp_3DPTV_m2(end-rmv2:end)=[];uvp_3DPTV_m(end-rmv2:end)=[];uwp_3DPTV_m(end-rmv2:end)=[];vwp_3DPTV_m(end-rmv2:end)=[];
  Yn_3dptv_m=Ye_3dptv_m./abs((wall2_3DPTV_m_r-wall1_3DPTV_m_r).*scale_3DPTV_m*1000+vector_dist_3dptv_m*1e3*wall2_3DPTV_m_offset+vector_dist_3dptv_m*1e3*wall1_3DPTV_m_offset);
 
%  plot(Yn_3dptv_m,umean_3DPTV_mnmax,'.')
  %%
  up_3DPTV_m2n=up_3DPTV_m2/friction_velocity_fr3dPTV_m;
  vp_3DPTV_m2n=vp_3DPTV_m2/friction_velocity_fr3dPTV_m;
  wp_3DPTV_m2n=wp_3DPTV_m2/friction_velocity_fr3dPTV_m;
  uvp_3DPTV_mn=-uvp_3DPTV_m/friction_velocity_fr3dPTV_m;
  uwp_3DPTV_mn=-uwp_3DPTV_m/friction_velocity_fr3dPTV_m;
  vwp_3DPTV_mn=-vwp_3DPTV_m/friction_velocity_fr3dPTV_m;
%% log law 3D PTV code

vector_dist3dptv_m=scale_3DPTV_m.*wavg_3dptv_m;

U_sm_3dptv_m=umean_3DPTV_m.*scale_3DPTV_m./dt_3dptv_m; 
Y_sm_3dptv_m = (vector_dist3dptv_m)*(1:size(ymean_3DPTV_m,2))';  %%in m

y_plus_sm_3dptv_m= (u_ta_fr3dPIV_m.*Y_sm_3dptv_m)/(water_visc/water_density);
u_plus_sm_3dptv_m= U_sm_3dptv_m./u_ta_fr3dPIV_m;

wall_unit_3dptv_m=water_visc/(water_density*u_ta_fr3dPIV_m);
  %% DNS 
k_select=1; % 1-180 2-395  3-590
DNS_load
ydns=0.5*y_dns{k_select};
yplusdns=yplus_dns{k_select};
umeandns=umean_dns{k_select};
dudydns=dudy_dns{k_select};
up2dns=up2_dns{k_select};
vp2dns=vp2_dns{k_select};
wp2dns=wp2_dns{k_select};
uvpdns=uvp_dns{k_select};
uwpdns=uwp_dns{k_select};
vwpdns=vwp_dns{k_select};
umeandnsnmax=umeandns./(max(umeandns));
stldns='k--';
utawdns=(yplusdns(3)*(water_visc/water_density))/(ydns(3)*0.5);
uplusdns=umeandns;
%%

%%
close all
 plot(Yn_3dptv_m,up_3DPTV_m2n,'*')
grid on
xlabel('\it y/H','Fontsize',Fntsize,'FontName','Times New Roman')
  ylabel('\it <u_iu_j> / u_\tau ^2','Fontsize',Fntsize,'FontName','Times New Roman')
  hold on
 plot(Yn_3dptv_m,vp_3DPTV_m2n,'r<')
 plot(Yn_3dptv_m,wp_3DPTV_m2n,'g^')
  plot(Yn_3dptv_m,uvp_3DPTV_mn,'ks')
 
  legend('<u^2> / u_\tau ^2','<v^2> / u_\tau ^2','<w^2> / u_\tau ^2','<uv> / u_\tau ^2')
  
  hold on 
  plot(ydns+0.1,up2dns,'--k')
   plot(ydns+0.1,vp2dns,'--k')
    plot(ydns+0.1,wp2dns,'--k')
     plot(ydns+0.1,uvpdns,'--k')
%%
% figure(1)
% % plot(0.910-Yn_3dptv_m(end:-1:1),umean_3DPTV_mnmax(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% % plot(0.920-Yn_3dptv_m(end:-1:1),umean_3DPTV_mnmax(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %    plot(Yn_3dptv_m,umean_3DPTV_mnmax,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %    plot(Yn_3dptv_m(1:end),umean_3DPTV_mnmax(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %    plot(fliplr(Yn_3dptv_m(8:end)),umean_3DPTV_mnmax(8:end),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%       hold on
%       plot(ydns,umeandnsnmax,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
%     
%       xlabel('\it y / H','Fontsize',Fntsize,'FontName','Times New Roman')
%       ylabel('\it <u> / U_m_a_x','Fontsize',Fntsize,'FontName','Times New Roman')
%     
%    
%        xlabel('\it y / H','Fontsize',Fntsize,'FontName','Times New Roman')
%       ylabel('\it <U> / U_m_a_x','Fontsize',Fntsize,'FontName','Times New Roman')
%       
%       
% %       [hleg1, hobj1] = legend('2D-PIV','2D-PTV','3D-PIV','3D-PTV(Tri)','3D-PTV(Mart)','DNS Moser et al. (1999)',4);
% 
% % set(hleg1, 'EdgeColor', 'w')
%     grid on
% 
%       axis([0 0.5 0 1])
%       
%       set(gca,'XTick',[0:0.1:0.5])
%       set(gca,'YTick',[0:0.2:1])
%       set(gcf,'position',[700 550 450 400])
%  %%
%  figure(2)
% % plot(fliplr(Yn_3dptv_m(8:end)),up_3DPTV_m2n(8:end),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %  plot(Yn_3dptv_m,up_3DPTV_m2n,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% plot(0.93-Yn_3dptv_m(end:-1:1),up_3DPTV_m2n(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% 
% %   plot(Yn_3dptv_m(1:end),up_3DPTV_m2n,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%    hold on
% 
% 
%     plot(ydns,up2dns,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
% 
%    grid on      
%    
%    axis([0 0.5 0 10])
%    grid on  
%     xlabel('\it y/H','Fontsize',Fntsize,'FontName','Times New Roman')
%       ylabel('\it <uu> / u_\tau ^2','Fontsize',Fntsize,'FontName','Times New Roman')
% %       set(gca,'Fontsize',Fntsize,'FontName','Times New Roman')
%     axis([0 0.5 0 10])
%     
% %      set(gca,'XTick',[0:0.1:0.5])
%        set(gca,'YTick',[0:2:10])
%       set(gcf,'position',[700 550 450 400])
%  %%
%  figure(3)
% % plot(fliplr(Yn_3dptv_m(8:end)),vp_3DPTV_m2n(8:end),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% plot(0.93-Yn_3dptv_m(end:-1:1),vp_3DPTV_m2n(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% 
%  plot(Yn_3dptv_m,vp_3DPTV_m2n,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%      hold on
%    plot(ydns,vp2dns,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
% 
% axis([0 0.5 0 1.5])
% %    grid on
% 0.90-Yn_3dptv_m(end:-1:1),vp_3DPTV_m2n(end:-1:1)
%    %%
%      figure(4)
% 
% %      plot(Yn_3dptv_m,-uvp_3DPTV_mn,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% plot(0.93-Yn_3dptv_m(end:-1:1),uvp_3DPTV_mn(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%    hold on
%    plot(ydns,uvpdns,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
%    grid on
% 
%       axis([0 0.5 -1 0.1])
%       %%
%        figure(6)
% % plot(fliplr(Yn_3dptv_m(8:end)),vp_3DPTV_m2n(8:end),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %  plot(Yn_3dptv_m,wp_3DPTV_m2n,stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%  plot(0.90-Yn_3dptv_m(end:-1:1),wp_3DPTV_m2n(end:-1:1),stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%      hold on
%     
%    plot(ydns,wp2dns,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
% 
% axis([0 0.5 0 5.5])
%    grid on
%  %%
% 
% figure(11)     
%   semilogx(y_plus_sm_3dptv_m,u_plus_sm_3dptv_m',stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
%  hold on
%  %DNS
%   semilogx(yplusdns,uplusdns,stldns,'MarkerFaceColor',stldns(1),'MarkerSize',Msize,'LineWidth',1.5);
% 
%  grid on
%   hold on
%  semilogx(yplusdns(1:floor(end/3)),yplusdns(1:floor(end/3))','c--','LineWidth',1.5)
%  hold on
%  semilogx(yplusdns(floor(end/10):floor(end)),(log(yplusdns(floor(end/10):floor(end)))./kapa+Beta)','c--','LineWidth',1.5)
%  
% xlabel('\it y^+','Fontsize',Fntsize,'FontName','Times New Roman')
% ylabel('\it u^+','Fontsize',Fntsize,'FontName','Times New Roman')
% set(gca,'Fontsize',Fntsize,'FontName','Times New Roman') 
% grid on
%        axis([10^0 2*10^2 0 22])
% %%
% yfit_3dptv_m=2;
% 
% Y_to_fit_sm_3dptv_m= Y_sm_3dptv_m(yfit_3dptv_m); % in meters
% U_to_fit_sm_3dptv_m= U_sm_3dptv_m(yfit_3dptv_m);
% 
% P_sm_3dptv_m= polyfit ([0;0;Y_to_fit_sm_3dptv_m'],[0;0;U_to_fit_sm_3dptv_m'],1);
% 
%  Y_estim_3dptv_m=linspace(0,max(Y_to_fit_sm_3dptv_m)*3.5,10);
%  Y_estim_n_3dptv_m=Y_estim_3dptv_m;
%  U_estim_3dptv_m=polyval(P_sm_3dptv_m,Y_estim_3dptv_m);
%  U_estim_n_3dptv_m=U_estim_3dptv_m./u_ta_fr3dPIV_m;   
% %%
% % figure(12)
% %   plot(y_plus_sm_3dptv_m,u_plus_sm_3dptv_m',stl_3dptv_m,'MarkerFaceColor',stl_3dptv_m(1),'MarkerSize',Msize);
% %   hold on
% % plot(Y_estim_n_3dptv_m./wall_unit_3dptv_m,U_estim_3dptv_m./u_ta_fr3dPIV_m,'r')
% %  grid on
% %  axis([0 20 0 15])
% %%
% % plot(newy_3DPTV_m./(max(newy_3DPTV_m)),-newU_3DPTV_m./max(abs(newU_3DPTV_m)),'.')
% % hold on
% % plot(ymean_3DPTV_m./(max(ymean_3DPTV_m)),umean_3DPTV_m./max(abs(umean_3DPTV_m)),'r*')
% % hold on
% % plot(ydns,umeandnsnmax,'gs');