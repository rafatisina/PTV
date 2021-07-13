%% reading the velocity fields (the velocity should be in pixel)  option 2 mean
    fid=fopen(strcat(vel_dir,vname,'.',vformat),'r');
         line1=fgetl(fid); line2=fgetl(fid); line3=fgetl(fid);
         col=length(findstr(line2,'"'))/2;
         I=str2num(line3(findstr(line3,'I=')+2:findstr(line3,'I=')+5));
         J=str2num(line3(findstr(line3,'J=')+2:findstr(line3,'J=')+4));
         K=str2num(line3(findstr(line3,'K=')+2:findstr(line3,'K=')+3));

         [A,count]=fscanf(fid,'%g',[col,I*J*K]);
         B=A'; fclose(fid);
         X1dum=((reshape(B(:,1),I,J,K)));
         Y1dum=((reshape(B(:,2),I,J,K)));
         Z1dum=((reshape(B(:,3),I,J,K)));
         U1dum=((reshape(B(:,4),I,J,K))); 
         V1dum=((reshape(B(:,5),I,J,K)));
         W1dum=((reshape(B(:,6),I,J,K)));
    %%
    Xpr=Ovn:Ovn:size(X1dum,1)*Ovn;
    Ypr=Ovn:Ovn:size(X1dum,2)*Ovn;
    Zpr=Ovn:Ovn:size(X1dum,3)*Ovn;
    %%
    Xprx=meshgrid(Xpr,1:size(Ypr,2),1:size(Zpr,2));
    Yprx_in=meshgrid(Ypr,1:size(Xpr,2))';
    Zprx=zeros(size(Xprx,1),size(Xprx,2),size(Xprx,3));
    Uprx=zeros(size(Xprx,1),size(Xprx,2),size(Xprx,3));
    Vprx=zeros(size(Xprx,1),size(Xprx,2),size(Xprx,3));
    Wprx=zeros(size(Xprx,1),size(Xprx,2),size(Xprx,3));
    for mm=1:size(Zpr,2)
        Yprx(:,:,mm)=Yprx_in;
        Zprx(:,:,mm)=1.*mm;
        Uprx_int=U1dum(:,:,mm);
        Vprx_int=V1dum(:,:,mm);
        Wprx_int=W1dum(:,:,mm);
        
        Uprx(:,:,mm)=Uprx_int';
        Vprx(:,:,mm)=Vprx_int';
        Wprx(:,:,mm)=Wprx_int';
    end
    
             
     Uprx=(dt)./(abs(M)).*Uprx;
     Vprx=(dt)./(abs(M)).*Vprx;
     Wprx=(dt)./(abs(M)).*Wprx;
    if (z_crop_end==0); z_crop_end=size(Uprx,3); end;
    
%     z_crop_end=z_crop_end.*12;
%     z_crop_begin=z_crop_begin.*12;
    %%
    Xpred=Xprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    Ypred=Yprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    Zpred=Zprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    
    Upred=Uprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    Vpred=Vprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    Wpred=Wprx(ceil(y_crop_begin/Ovn):ceil(y_crop_end/Ovn),ceil(x_crop_begin/Ovn):ceil(x_crop_end/Ovn),ceil(z_crop_begin/Ovn):ceil(z_crop_end/Ovn));
    
    velprofile_2d=mean(Upred,3);
    velprofile_1d=mean(velprofile_2d,2);