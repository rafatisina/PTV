%%
clear all
close all
clc
Config


%%
Vel_Read;
figure
plot(velprofile_1d)
%%
close all
Xtotal=[]; Ytotal=[];  Ztotal=[]; Utotal=[]; Vtotal=[]; Wtotal=[]; Xmatchtotal=[]; Ymatchtotal=[]; Zmatchtotal=[]; Imatchtotal=[];
%%
tic 
% for im=im_in:im_en
 for im=1:300
 Config
     nzeros=root_def(im,ndigits);
     St_c=strcat(rootdir,rootname_rec,nzeros,num2str(im));
cd(St_c)

d = dir;
remove=[];
for i = 1:length(d)
   found = 0;
   searchString = 'im7';
   found = strcmp(d(i),searchString);
   if found ==0
       remove = [remove i];
   end
end

cd(main_folder)
for k=1:numel(remove)-2
% for k=1:500 
    nzeros=root_def(k,ndigits);
    St=strcat(St_c,'\',rootname,nzeros,num2str(k),'.',format);
    Read_Im;
    k
end
clc
 disp(['Image: ',num2str(im)])
Prt_detection;   % Particle detection

%     no_filter_particles;


disp('--- Filter Particles ---');

Prt_Filters; % Particle filters 

Prt_Gaussian_Flt;  % Gaussian fit for particles 
%  No_Prt_Gaussian_Flt
 Prt_displacement;   %Particle displacement
 Check_detected_particles;

save([savepath,zerostr,'.mat'],'ddd')
end
toc

%%

pointselection
%% output
% for im=im_in:im_en
%     
%     init_part=data2{im}(:,1:6);
% end
% field1 = 'header';  value1 = {'x_pos'}; value2 ={'y_pos'}; value3 ={'z_pos'}; value4 ={'u_comp'}; value5 ={'v_comp'}; value6 ={'w_comp'};
% field2 = 'data';  value7= init_part;
% s = struct(field1,value1,value2,value3,value4,value5,value6,field2,value7);
%%
 saving