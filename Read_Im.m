
   
    Data=readimx(St);
    [lhs1,lhs2,lhs3]=showimx(Data);
    if (y_crop_end==0); y_crop_end=size(lhs3,1); end;
    if (x_crop_end==0); x_crop_end=size(lhs3,2); end;
    
    G_A=(Data.Data(1:Data.Nx,1:Data.Ny))';
    G_A=G_A(y_crop_begin:y_crop_end,x_crop_begin:x_crop_end);
    G_B=(Data.Data(1:Data.Nx,Data.Ny+1:end))';
    G_B=G_B(y_crop_begin:y_crop_end,x_crop_begin:x_crop_end);

    Xraw=lhs1(x_crop_begin:x_crop_end);
    Yraw=lhs2(y_crop_begin:y_crop_end);
 
    I1(:,:,k)=uint16(G_A); 
    I2(:,:,k)=uint16(G_B); 
    
%         I1{im}(:,:,k)=uint16(G_A); 
%         I2{im}(:,:,k)=uint16(G_B); 
%     