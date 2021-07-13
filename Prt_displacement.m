 disp('--- Particle displacement ---');
    


    [X_temp,Y_temp,Z_temp,U_temp,V_temp,W_temp,Xmatch_temp,Ymatch_temp,Zmatch_temp,Imatch_temp,Xpart,Ypart,Zpart] = Particle_displacement(Xpos_temp1,Xpos_temp2,Ypos_temp1,Ypos_temp2,Zpos_temp1,Zpos_temp2,Ipos_temp1,Ipos_temp2,Xpred,Ypred,Zpred,Upred,Vpred,Wpred,sr,Iratmin,Iratmax);	
     
     Xpos{im}=X_temp;
     Ypos{im}=Y_temp;
     Zpos{im}=Z_temp;
     
     Upos{im}=U_temp;
     Vpos{im}= V_temp;
     Wpos{im}= W_temp;
     
  
    
    Xtotal=[Xtotal X_temp];
    Ytotal=[Ytotal Y_temp];
    Ztotal=[Ztotal Z_temp];
    
    Utotal=[Utotal U_temp];
    Vtotal=[Vtotal V_temp];
    Wtotal=[Wtotal W_temp];
    
    Xmatchtotal=[Xmatchtotal Xmatch_temp];
    Ymatchtotal=[Ymatchtotal Ymatch_temp];
    Zmatchtotal=[Zmatchtotal Zmatch_temp];
    
    Xfriends{im}=Xmatch_temp; Yfriends{im}=Ymatch_temp; Zfriends{im}=Zmatch_temp;

    Imatchtotal=[Imatchtotal Imatch_temp];
    
    
    %%
    Xtotal_det{im}=X_temp;
    Ytotal_det{im}=Y_temp;
    Ztotal_det{im}=Z_temp;
    
    Utotal_det{im}=U_temp;
    Vtotal_det{im}=V_temp;
    Wtotal_det{im}=W_temp;
    
    data{im}=[X_temp',Y_temp',Z_temp',U_temp',V_temp',W_temp'];
    ddd=data{im};
    velmag{im}=sqrt(V_temp.^2+U_temp.^2+W_temp.^2);
    
    
    
   
   