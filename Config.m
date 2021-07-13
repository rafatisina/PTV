%%%%%% config
%%%%%% config
Ws=40;
Ov=75; %  in %

Ovn=1./(1-Ov/100);  
Ovn=Ws/Ovn;
dt=1200*1e-6;  % in micro-second
M=0.0233058*1e-3;
%%
main_folder='V:\3D-PTV_code - Jianfeng';
%% Raw imag
% rootdir='I:\Tomo_Tests\All_Sets\Tomo_PIV_Smooth\Re_10000_Smooth\Diff\Mult\Div\ImgPreproc\FastMART_1_100\Data\';
rootdir='Z:\Tomo\Tomo test\run01_riblet(main)\Diff_01\Mult\Div\ImgPreproc\Diff_02\Reconstruction\Data\';
rootname        = 'B';     %Rootname of the image e.g. image_001a.tif -> rootname='image_';
ndigits         = 5;  %Number of digits e.g. image_001a.tif -> ndigits=3; image_0001a.tif -> ndigits=4;
format          = 'im7';  %File format;
rootname_rec        = 'S';     %Rootname of the image e.g. image_001a.tif -> rootname='image_';

im_in           = 1;  %Initial image number to be analyzed
im_en           = 10;     %Final image number to be analyzed
N=im_en-im_in+1;
Background      = 'none';   %['ensemble','moving','none'] To "remove" the background, a background image is constructed and subtracted from the original images.
                                %There are two options; 'ensemble' and 'moving'. 'ensemble' will construct a background image, containing the minimum intensity for 
                                %each pixel over the set of images from im_in till im_en. The option 'moving' calculates the minimum intensity for each image inside 
                                %a block with dimensions np_back x np_back. 'none' makes no background subtraction at all.
np_back         = 5;  %Dimensions of the moving block (in pixels) in which the minimum intensity is sought to construct a background image

Int_thresh=8500;       %Threshold for the particle identification. If the intensity (after background subtraction) is larger than this threshold, the pixel  
Int_filt=21;   %Threshold for the particle identification background removal (in case it is in use);

D_R=7;                % searching area for rejection of outlayers peak  
SR_Rad=8;            % searching radius for the global maximum   


sr		=7; %Search radius
Iratmin		= 0.3; %Minimum particle intensity ratio (Ia/Ib) > Iratmin
Iratmax		= 2;  %Maximum particle intensity ratio (Ia/Ib) < Iratmax

wall1_y=1;    % wall top  
wall2_y=0;   % wall bottom  %If 0, then the whole  range of the image will be analyzed.

Xlim1=1;    % left boundary
Xlim2=0;   % right boundary %If 0, then the whole  range of the image will be analyzed.

Zlim1=1;    % front boundary
Zlim2=0;   % back boundary %If 0, then the whole  range of the image will be analyzed.

Xw=[wall1_y,wall2_y];
Yw=[Xlim1,Xlim2];
Zw=[Zlim1,Zlim2];

%% Velocity field
%  vel_dir 	= 'I:\Tomo_Tests\All_Sets\Tomo_PIV_Smooth\Re_10000_Smooth\Diff\Mult\Div\ImgPreproc\FastMART_1_100\TomoPIV_DirectCorrelation_48x48x48_75%ov\Vector_Postproc_3D\Avg_StdDev\';
vel_dir 	=  'Z:\Tomo\DAT file\Mean_riblet_Tomo-PIV\';
vndigits         = 4;
vformat          = 'dat';
vrootname        = 'B0';    
% vname='B00001_Avg V';
vname='B00001';
%% saving 
saverootname	= 'B30';
savepath	= 'Z:\Tomo\Tomo test\PTV_results\';
zerostr='Riblet_30Sept_';
%% cropping 
x_crop_begin    = 300;                           %Start position for horizontal cropping (in pixels)
x_crop_end      = 1800;                           %If 0, then the whole horizantal range of the image will be analyzed. Otherwise, it indicates the end position for horizontal cropping

y_crop_begin    =50;  %112                           %Start position for vertical cropping (in pixels)
y_crop_end      = 1100;                           %If 0, then the whole vertical range of the image will be analyzed. Otherwise, it indicates the end position for vertical cropping

z_crop_begin    =1;  %112                           %Start position for vertical cropping (in pixels)
z_crop_end      = 0;                           %If 0, then the whole vertical range of the image will be analyzed. Otherwise, it indicates the end position for vertical cropping
%% range of valid displacement in pixel
mean_u_disp=12; dev_u_disp=15;
mean_v_disp=0; dev_v_disp=6;
mean_w_disp=0; dev_w_disp=6;
%%
brdfiltery_1=5;
brdfiltery_2=5;
brdfilterx_1=10;
brdfilterx_2=10;
Vlim=3;Wlim=3;