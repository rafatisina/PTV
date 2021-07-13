%%
Config
%%
for im=im_in:im_en
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
for k=1:numel(remove)
    nzeros=root_def(k,ndigits);
    St=strcat(St_c,'\',rootname,nzeros,num2str(k),'.',format);
    
    Read_Im;
    
end
end