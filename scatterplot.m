%% scatter
%  close all
% %figure(5)
Nx=size(I1,2);
Ny=size(I1,1);
Nz=size(I1,3);
%%
%figure(11)
ddsort=sortrows(dd,2);
newx=ddsort(:,1);
newy=ddsort(:,2);
newz=ddsort(:,3);
newU=ddsort(:,4);
newV=ddsort(:,5);
newW=ddsort(:,6);
% newXfrineds=ddsort(:,7:8);
% newYfrineds=ddsort(:,9:10);
% newZfrineds=ddsort(:,11:12);
% newU_det=ddsort(:,13);
% newV_det=ddsort(:,14);
% newW_det=ddsort(:,15);

%plot(newy,-newU,'.r')

%% filtering 
%figure(12)
newU(newy<brdfiltery_1)=[];
newV(newy<brdfiltery_1)=[];
newW(newy<brdfiltery_1)=[];
newx(newy<brdfiltery_1)=[];
newz(newy<brdfiltery_1)=[];

% newXfrineds(newy<brdfiltery_1,:)=[];
% newYfrineds(newy<brdfiltery_1,:)=[];
% newZfrineds(newy<brdfiltery_1,:)=[];
% newU_det(newy<brdfiltery_1)=[];
% newV_det(newy<brdfiltery_1)=[];
% newW_det(newy<brdfiltery_1)=[];

newy(newy<brdfiltery_1)=[];
 %plot(newy,-newU,'.r')
%  %size(newx)
%%
%figure(13)
newU(newy>Ny-brdfiltery_2)=[];
newV(newy>Ny-brdfiltery_2)=[];
newW(newy>Ny-brdfiltery_2)=[];
newx(newy>Ny-brdfiltery_2)=[];
newz(newy>Ny-brdfiltery_2)=[];

% newXfrineds(newy>Ny-brdfiltery_2,:)=[];
% newYfrineds(newy>Ny-brdfiltery_2,:)=[];
% newzfrineds(newy>Ny-brdfiltery_2,:)=[];
% newU_det(newy>Ny-brdfiltery_2)=[];
% newV_det(newy>Ny-brdfiltery_2)=[];
% newW_det(newy>Ny-brdfiltery_2)=[];

newy(newy>Ny-brdfiltery_2)=[];
 
%  %size(newx
 %plot(newy,-newU,'.r')

%%
%figure(14)
newU((newx<brdfilterx_1))=[];
newV((newx<brdfilterx_1))=[];
newW((newx<brdfilterx_1))=[];
newz((newx<brdfilterx_1))=[];
newy((newx<brdfilterx_1))=[];

% newXfrineds(newx<brdfilterx_1,:)=[];
% newYfrineds(newx<brdfilterx_1,:)=[];
% newZfrineds(newx<brdfilterx_1,:)=[];
% newU_det(newx<brdfilterx_1)=[];
% newV_det(newx<brdfilterx_1)=[];
% newW_det(newx<brdfilterx_1)=[];

newx((newx<brdfilterx_1))=[];
%plot(newy,-newU,'.r')
% %size(newx)
%%
%figure(15)
newU((newx>Nx-brdfilterx_2))=[];
newV((newx>Nx-brdfilterx_2))=[];
newW((newx>Nx-brdfilterx_2))=[];
newz((newx>Nx-brdfilterx_2))=[];
newy((newx>Nx-brdfilterx_2))=[];

% newXfrineds(newx>Nx-brdfilterx_2,:)=[];
% newYfrineds(newx>Nx-brdfilterx_2,:)=[];
% newZfrineds(newx>Nx-brdfilterx_2,:)=[];
% newU_det(newx>Nx-brdfilterx_2)=[];
% newV_det(newx>Nx-brdfilterx_2)=[];
% newW_det(newx>Nx-brdfilterx_2)=[];

newx(newx>Nx-brdfilterx_2)=[];

 %plot(newy,-newU,'.r')
%  pause
% %size(newx)


%%
%figure(16)
newU(newV>Vlim)=[];
newW(newV>Vlim)=[];
newz(newV>Vlim)=[];
newy(newV>Vlim)=[];
newx(newV>Vlim)=[];
% newXfrineds(newV>Vlim,:)=[];
% newYfrineds(newV>Vlim,:)=[];
% newZfrineds(newV>Vlim,:)=[];
% newU_det(newV>Vlim)=[];
% newV_det(newV>Vlim)=[];
% newW_det(newV>Vlim)=[];
newV((newV>Vlim))=[];


newU(newV<-Vlim)=[];
newW(newV<-Vlim)=[];
newz(newV<-Vlim)=[];
newy(newV<-Vlim)=[];
newx(newV<-Vlim)=[];
% newXfrineds(newV<-Vlim,:)=[];
% newYfrineds(newV<-Vlim,:)=[];
% newZfrineds(newV<-Vlim,:)=[];
% newU_det(newV<-Vlim)=[];
% newV_det(newV<-Vlim)=[];
% newW_det(newV<-Vlim)=[];
newV(newV<-Vlim)=[];

newU(newW>Wlim)=[];
newz(newW>Wlim)=[];
newy(newW>Wlim)=[];
newx(newW>Wlim)=[];
% newXfrineds(newW>Wlim,:)=[];
% newYfrineds(newW>Wlim,:)=[];
% newZfrineds(newW>Wlim,:)=[];
% newU_det(newW>Wlim)=[];
% newV_det(newW>Wlim)=[];
% newW_det(newW>Wlim)=[];
newV(newW>Wlim)=[];
newW(newW>Wlim)=[];

newU(newW<-Wlim)=[];
newz(newW<-Wlim)=[];
newy(newW<-Wlim)=[];
newx(newW<-Wlim)=[];
newV(newW<-Wlim)=[];
% newXfrineds(newW<-Wlim,:)=[];
% newYfrineds(newW<-Wlim,:)=[];
% newZfrineds(newW<-Wlim,:)=[];
% newU_det(newW<-Wlim)=[];
% newV_det(newW<-Wlim)=[];
% newW_det(newW<-Wlim)=[];
newW(newW<-Wlim)=[];



