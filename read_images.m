function [A_1]=read_images(rootdir,rootname,ndigits,fmt,x_crop_begin,x_crop_end,y_crop_begin,y_crop_end,im)

%Read images
if ndigits==3;
    if im<1000; nzeros=''; end;
    if im<100; nzeros='0'; end;
    if im<10; nzeros='00'; end;
elseif ndigits==4;
    if im<10000; nzeros=''; end;
    if im<1000; nzeros='0'; end;
    if im<100; nzeros='00'; end;
    if im<10; nzeros='000'; end;
end; %end of "if ndigits==3..."

A_name = [rootdir,rootname,nzeros,num2str(im),'.',fmt];

A_1    =flipud(double(imread(A_name)));   %Rotate the images such that what I see is the usual cartesian axis

%Crop Images
if (y_crop_end==0); y_crop_end=size(A_1,1); end;
if (x_crop_end==0); x_crop_end=size(A_1,2); end;

A_1    =A_1(y_crop_begin:y_crop_end,x_crop_begin:x_crop_end);

%Reduce Memory
A_1    =uint16(A_1);