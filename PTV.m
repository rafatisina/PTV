function PTV(datafile)


fid=fopen(datafile); %Read datafile
	while 1
		tline = fgetl(fid);
		if ~ischar(tline), break, end
		eval(tline)
	end
fclose(fid);

%rootdir         = '~/Projects/ShockTest/acor_piv/Run_Ti30_hot/images/';                             %Directory where to find the images
%rootname        = 'B0';                          %Rootname of the image e.g. image_001a.tif -> rootname='image_';
%ndigits         = 4;                           %Number of digits e.g. image_001a.tif -> ndigits=3; image_0001a.tif -> ndigits=4;
%format          = 'tif';                       %File format;

x_crop_begin    = 1;                           %Start position for horizontal cropping (in pixels)
x_crop_end      = 0;                           %If 0, then the whole horizantal range of the image will be analyzed. Otherwise, it indicates the end position for horizontal cropping
y_crop_begin    = 1;                           %Start position for vertical cropping (in pixels)
y_crop_end      = 0;                           %If 0, then the whole vertical range of the image will be analyzed. Otherwise, it indicates the end position for vertical cropping

%im_in           = 1;                           %Initial image number to be analyzed
%im_en           = 200;                           %Final image number to be analyzed

%Background      = 'ensemble';                    %['ensemble','moving','none'] To "remove" the background, a background image is constructed and subtracted from the original images.
                                               %There are two options; 'ensemble' and 'moving'. 'ensemble' will construct a background image, containing the minimum intensity for 
                                               %each pixel over the set of images from im_in till im_en. The option 'moving' calculates the minimum intensity for each image inside 
                                               %a block with dimensions np_back x np_back. 'none' makes no background subtraction at all.
%np_back         = 5;                           %Dimensions of the moving block (in pixels) in which the minimum intensity is sought to construct a background image
%Int_thresh      = 120;                         %Threshold for the particle identification. If the intensity (after background subtraction) is larger than this threshold, the pixel
                                               %will be identified as a particle
%sr		= 2;				%Search radius
%Iratmin		= 0.2;				%Minimum particle intensity ratio (Ia/Ib) > Iratmin
%Iratmax		= 5;				%Maximum particle intensity ratio (Ia/Ib) < Iratmax

%plt_filename 	= '~/Projects/ShockTest/acor_piv/Run_Ti30_hot/data/acor2_sc2_6.plt'; %Directory where to find the predictor field data
%saverootname	= 'B30';
%savepath	= '~/Projects/ShockTest/acor_piv/Run_Ti30_hot/data/'; %Path where to store the data files


[datapred] = readplt2(plt_filename);
Xpred = datapred(:,:,1)';
Ypred = datapred(:,:,2)';
Upred = datapred(:,:,3)';
Vpred = datapred(:,:,4)';

% Perform particle counting
for im=im_in:im_en
    %Read images
        disp(' ');
        disp(['                      --- Reading Image ',num2str(im),' ---']);
        disp(' ');
		[A_1] = read_images(rootdir,rootname,ndigits,fmt,x_crop_begin,x_crop_end,y_crop_begin,y_crop_end,im);

	%Construct background image
        if (strcmp(Background,'ensemble')==1 && im==im_in)
            disp(['--- Removing background using minimum pixel intensity in ensemble of ',num2str(im_en-im_in+1),' images ---']);
            [Back_A1] = Background_removal_ensemble(rootdir,rootname,ndigits,fmt,x_crop_begin,x_crop_end,y_crop_begin,y_crop_end,im,im_in,im_en);
        elseif strcmp(Background,'moving')==1
            disp(['--- Removing background using minimum intensity in ',num2str(np_back),'x',num2str(np_back),' stencil ---']);
            [Back_A1] = Background_removal_moving(A_1,np_back);
        elseif strcmp(Background,'none')==1;
            disp('--- No background subtraction ---');
            Back_A1 = uint8(zeros(size(A_1)));
        end;
    
    %Background subtraction
        A_1 = uint16(max(0,double(A_1)-double(Back_A1)));


    %Particle detection
	disp('--- Particle detection ---');
    	[Xpos_int,Ypos_int] = Particle_detection(A_1,Int_thresh);
	[Xpos,Ypos,Ipos] = Particle_gausfit(A_1,Xpos_int,Ypos_int);
	[X,Y,U,V,Xmatch,Ymatch,Imatch] = Particle_displacement(A_1,Xpos,Ypos,Ipos,Xpred,Ypred,Upred,Vpred,sr,Iratmin,Iratmax);
	
	figure(302), clf
	plot(Imatch(1,:),Imatch(2,:),'.')
	xlabel('Intensity particle A')
	ylabel('Intensity particle B')
	axis equal
	
	if im == im_in
		Xtab = X;
		Ytab = Y;
		Utab = U;
		Vtab = V;
	else
		Xtab = [Xtab, X];
		Ytab = [Ytab, Y];
		Utab = [Utab, U];		
		Vtab = [Vtab, V];
	end		
	
	zerostr = ['0000'];
	numstr = num2str(im);
	savename = [pathsave saverootname zerostr(1:end-length(numstr)) numstr '.mat']
	disp('--- Saving data ---');
	disp(['              -> ' savename]);
	save(savename,'X','Y','U','V','Xmatch','Ymatch','Imatch');
	
end;        

vbmin = 8; vbmax = 16; vbins = 40;
xbmin = 1; xbmax = 1300; xbins = 80;

vbstep = (vbmax-vbmin)/vbins;
xbstep = (xbmax-xbmin)/xbins;

i = 1;
j = 1;

for xb = xbmin:xbstep:xbmax
	j = 1;
	for vb = vbmin:vbstep:vbmax
		histo(j,i) = length(find( Xtab>(xb-xbstep/2) & Xtab<(xb+xbstep/2) & Utab>(vb-vbstep/2) & Utab<(vb+vbstep/2) ));
		j = j + 1;
	end
	i = i + 1;
end

figure(23), clf
imagesc([xbmin:xbstep:xbmax],[vbmin:vbstep:vbmax]',histo), colorbar
axis xy
%pause


 