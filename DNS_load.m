% % %%
% clear all 
% clc
% close all
Msize=4;
%%
root_dns{1}='X:\DNS _ref\';
name_means_dns{1}='chan180.means.txt';
name_stress_dns{1}='chan180.reystress.txt';
name_vort_dns{1}='vort.txt';
stl_dns{1}='r.';

root_dns{2}='X:\DNS _ref\';
name_means_dns{2}='chan395.means.txt';
name_stress_dns{2}='chan395.reystress.txt';
name_vort_dns{2}='vort.txt';
stl_dns{2}='gs';

root_dns{3}='X:\DNS _ref\';
name_means_dns{3}='chan590.means.txt';
name_stress_dns{3}='chan590.reystress.txt';
name_vort_dns{3}='vort.txt';
stl_dns{3}='k_dnso';


for k_dns=1:3
data_meandns{k_dns}=importdata(strcat(root_dns{k_dns},name_means_dns{k_dns}));
data_stressdns{k_dns}=importdata(strcat(root_dns{k_dns},name_stress_dns{k_dns}));
data_vortdns{k_dns}=importdata(strcat(root_dns{k_dns},name_vort_dns{k_dns}));
y_dns{k_dns}=data_meandns{k_dns}(:,1);
yplus_dns{k_dns}=data_meandns{k_dns}(:,2);
umean_dns{k_dns}=data_meandns{k_dns}(:,3);
dudy_dns{k_dns}=data_meandns{k_dns}(:,4);
up2_dns{k_dns}=data_stressdns{k_dns}(:,3);
vp2_dns{k_dns}=data_stressdns{k_dns}(:,4);
wp2_dns{k_dns}=data_stressdns{k_dns}(:,5);
uvp_dns{k_dns}=data_stressdns{k_dns}(:,6);
uwp_dns{k_dns}=data_stressdns{k_dns}(:,7);
vwp_dns{k_dns}=data_stressdns{k_dns}(:,8);

y_vort_dns{k_dns}=data_vortdns{k_dns}(:,1);
yplus_vort_dns{k_dns}=data_vortdns{k_dns}(:,2);
vortxx_dns{k_dns}=data_vortdns{k_dns}(:,3);
vortyy_dns{k_dns}=data_vortdns{k_dns}(:,4);
vortzz_dns{k_dns}=data_vortdns{k_dns}(:,5);
vortxy_dns{k_dns}=data_vortdns{k_dns}(:,6);
vortxz_dns{k_dns}=data_vortdns{k_dns}(:,7);
vortyz_dns{k_dns}=data_vortdns{k_dns}(:,8);


end
