function  [Back_A1] = Background_removal_ensemble(rootdir,rootname,ndigits,format,x_crop_begin,x_crop_end,y_crop_begin,y_crop_end,im,im_in,im_en);

for im=im_in:im_en
    [A_1] = read_images(rootdir,rootname,ndigits,format,x_crop_begin,x_crop_end,y_crop_begin,y_crop_end,im);

    if im==im_in
        Back_A1 = A_1;
    else
        Back_A1 = min(Back_A1,A_1);
    end; %end of "if im==im_in"
end; %end of "if im==im_in:im_en"

Back_A1 =  uint16(Back_A1);

