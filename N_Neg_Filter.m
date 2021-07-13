%% new removal filter
Gcheck=[Xpos_int_temp,  Ypos_int_temp, Zpos_int_temp ];
Gcheck_tmp=Gcheck;

newposx=[];
newposy=[];
newposz=[];
k=0;
for m=1:size(Gcheck,1)
    diff_Checkx=abs(Xpos_int_temp(:)-Xpos_int_temp(m));
    diff_Checky=abs(Ypos_int_temp(:)-Ypos_int_temp(m));
    diff_Checkz=abs(Zpos_int_temp(:)-Zpos_int_temp(m));
    
    [idxr,~]=find(diff_Checkx<D_R);
    [idyr,~]=find(diff_Checky<D_R);
    [idzr,~]=find(diff_Checkz<D_R);
    
    idxrtmp=idxr; idyrtmp=idyr; idzrtmp=idzr;
    
    idxrtmp(idxrtmp==m)=[];
    idyrtmp(idyrtmp==m)=[];
    idzrtmp(idzrtmp==m)=[];
    
     
      rm_id{m} = intersect(intersect(idxrtmp,idyrtmp),idzrtmp);
 
  if isempty(rm_id{m})~=1
      particle_id{m}=intersect(intersect(idxr,idyr),idzr);
     
      k=k+1;
    yylim1=ceil(Ypos_int_temp(m)-SR_Rad./2);
    yylim2=ceil(Ypos_int_temp(m)+SR_Rad./2);
    
    xxlim1=ceil(Xpos_int_temp(m)-SR_Rad./2);
    xxlim2=ceil(Xpos_int_temp(m)+SR_Rad./2);
    
    zzlim1=ceil(Zpos_int_temp(m)-SR_Rad./2);
    zzlim2=ceil(Zpos_int_temp(m)+SR_Rad./2);
    
    if (yylim1)<1
        yylim1=1;
    end
    if(yylim2)>size(I,1)
        yylim2=size(I,1);
    end
    if (xxlim1)<1
        xxlim1=1;
    end
    if (xxlim2)>size(I,2)  
        xxlim2=size(I,2);
    end
    
     if (zzlim1)<1
        zzlim1=1;
    end
    if (zzlim2)>size(I,3)  
        zzlim2=size(I,3);
    end
    
    Ar=I(yylim1:yylim2,xxlim1:xxlim2,zzlim1:zzlim2);
    
    idremoval{m}=[particle_id{m}; rm_id{m}];
    
    gl_id=find(Ar==(max(max(max(Ar)))));
    [r,c,o]=ind2sub(size(Ar),gl_id);
    
    r=round(mean(r)); c=round(mean(c)); o=round(mean(o));
    
    newposy=[newposy;(r+yylim1-1)];
    newposx=[newposx;(c+xxlim1-1)];
    newposz=[newposz;(o+zzlim1-1)];


  else
      idremoval{m}=[];
  end
  
 clear diff_Checkx diff_Checky diff_Checkz idxr idyr idzr idxrtmp idyrtmp idzrtmp 

end
%%
allids=[];
for  m=1:size(Gcheck,1)
   allids=[allids; idremoval{m}]; 
end
Gcheck_tmp(unique(allids),:)=[];
%%
    G_newp=[newposx,newposy,newposz];
    G_newp= unique(G_newp, 'rows');
    newposx=G_newp(:,1);
    newposy=G_newp(:,2);
    newposz=G_newp(:,3);
     
    newXp=Gcheck_tmp(:,1);
    newYp=Gcheck_tmp(:,2);
    newZp=Gcheck_tmp(:,3);
    
%     newXp=[newXp;newposx];
%     newYp=[newYp;newposy];
%     newZp=[newZp;newposz];
    
    Xpos_int=newXp;
    Ypos_int=newYp;
    Zpos_int=newZp;