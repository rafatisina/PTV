function [Xpos,Ypos,Zpos,Ipos] = Particle_gausfit(A_1,Xpos_int,Ypos_int,Zpos_int,mean_u_disp,dev_u_disp,mean_v_disp,dev_v_disp,mean_w_disp,dev_w_disp)

disp('--- Applying Gaussian fit ---');

for i = 1:length(Xpos_int)

	posx = Xpos_int(i);
	posy = Ypos_int(i);  
    posz = Zpos_int(i);
    
	if posx == 1 | posx == size(A_1,2) | posy == 1 | posy == size(A_1,1)
		displx_xy = 0;
		disply_xy = 0;
		C_xy = 0;
    else
        if (posx<1)
            posx=1;
        end
        if (posx+1>size(A_1,2))
            posx=size(A_1,2)-1;
        end
        if (posy<1)
            posy=1;
        end
        if (posy+1>size(A_1,1))
            posy=size(A_1,1)-1;
        end
        		
		Rxy(1)=double(A_1(posy,posx,posz))+0.00001;	%Rcenter add a small epsilon to cope with plateaus
		Rxy(2)=double(A_1(posy,posx-1,posz))+0.00001;	%Rleft
		Rxy(3)=double(A_1(posy,posx+1,posz))+0.00001;	%Rright
		Rxy(4)=double(A_1(posy-1,posx,posz))+0.00001;	%Rtop
		Rxy(5)=double(A_1(posy+1,posx,posz))+0.00001;	%Rbottom
                
		displx_xy=.50*(log(Rxy(2))-log(Rxy(3)))/(log(Rxy(2))-2*log(Rxy(1))+log(Rxy(3)));
		disply_xy=.50*(log(Rxy(4))-log(Rxy(5)))/(log(Rxy(4))-2*log(Rxy(1))+log(Rxy(5)));
              
		sigmx_xy=2/log((Rxy(1)*Rxy(1))/(Rxy(2)*Rxy(3))); %Calculate peak width in x-direction
		sigmy_xy=2/log((Rxy(1)*Rxy(1))/(Rxy(4)*Rxy(5))); %Calculate peak width in y-direction
        
		C_xy = Rxy(1)*exp(-displx_xy^2/sigmx_xy-disply_xy^2/sigmy_xy); %Peak intensity
    end
    
    if posx == 1 | posx == size(A_1,2) | posz == 1 | posz == size(A_1,3)
		displx_xz = 0;
		displz_xz = 0;
		C_xz= 0;
    else
        if (posx<1)
            posx=1;
        end
        if (posx+1>size(A_1,2))
            posx=size(A_1,2)-1;
        end
        if (posz<1)
            posy=1;
        end
        if (posz+1>size(A_1,3))
            posz=size(A_1,3)-1;
        end
        		
		Rxz(1)=double(A_1(posy,posx,posz))+0.00001;	%Rcenter add a small epsilon to cope with plateaus
		Rxz(2)=double(A_1(posy,posx-1,posz))+0.00001;	%Rleft
		Rxz(3)=double(A_1(posy,posx+1,posz))+0.00001;	%Rright
		Rxz(4)=double(A_1(posy,posx,posz-1))+0.00001;	%Rback
		Rxz(5)=double(A_1(posy,posx,posz+1))+0.00001;	%Rfront
                
		displx_xz=.50*(log(Rxz(2))-log(Rxz(3)))/(log(Rxz(2))-2*log(Rxz(1))+log(Rxz(3)));
		displz_xz=.50*(log(Rxz(4))-log(Rxz(5)))/(log(Rxz(4))-2*log(Rxz(1))+log(Rxz(5)));
              
		sigmx_xz=2/log((Rxz(1)*Rxz(1))/(Rxz(2)*Rxz(3))); %Calculate peak width in x-direction
		sigmz_xz=2/log((Rxz(1)*Rxz(1))/(Rxz(4)*Rxz(5))); %Calculate peak width in y-direction
        
		C_xz = Rxz(1)*exp(-displx_xz^2/sigmx_xz-displz_xz^2/sigmz_xz); %Peak intensity
    end

    
     if posy == 1 | posy == size(A_1,1) | posz == 1 | posz == size(A_1,3)
		disply_yz = 0;
		displz_yz = 0;
		C_yz= 0;
    else
        if (posy<1)
            posy=1;
        end
        if (posy+1>size(A_1,1))
            posy=size(A_1,1)-1;
        end
        if (posz<1)
            posy=1;
        end
        if (posz+1>size(A_1,3))
            posz=size(A_1,3)-1;
        end
        		
		Ryz(1)=double(A_1(posy,posx,posz))+0.00001;	%Rcenter add a small epsilon to cope with plateaus
		Ryz(2)=double(A_1(posy-1,posx,posz))+0.00001;	%Rtop
		Ryz(3)=double(A_1(posy+1,posx,posz))+0.00001;	%Rbottom
		Ryz(4)=double(A_1(posy,posx,posz-1))+0.00001;	%Rback
		Ryz(5)=double(A_1(posy,posx,posz+1))+0.00001;	%Rfront
                
		disply_yz=.50*(log(Ryz(2))-log(Ryz(3)))/(log(Ryz(2))-2*log(Ryz(1))+log(Ryz(3)));
		displz_yz=.50*(log(Ryz(4))-log(Ryz(5)))/(log(Ryz(4))-2*log(Ryz(1))+log(Ryz(5)));
              
		sigmy_yz=2/log((Ryz(1)*Ryz(1))/(Ryz(2)*Ryz(3))); %Calculate peak width in x-direction
		sigmz_yz=2/log((Ryz(1)*Ryz(1))/(Ryz(4)*Ryz(5))); %Calculate peak width in y-direction
        
		C_yz = Ryz(1)*exp(-disply_yz^2/sigmy_yz-displz_yz^2/sigmz_yz); %Peak intensity
     end
    
 
    displx=(displx_xy+displx_xz)./2;
    disply=(disply_xy+disply_yz)./2;
    displz=(displz_xz+displz_yz)./2;
    Ipos(i) = (C_xy+C_xz)./2;
    
%     displx(isnan(displx)) =0;  disply(isnan(disply)) =0;  disply(isnan(disply)) =0;
   
    displx(abs(displx)>dev_u_disp) =0;
    disply(abs(disply)>dev_v_disp) =0;
    displz(abs(displz)>dev_w_disp) =0;
    
%     datacheck(i,:)=[displx_xy,displx_xz,disply_xy,displz_xz];

   Ipos(i) =C_xy;
	Xpos(i) = Xpos_int(i)+displx;
	Ypos(i) = Ypos_int(i)+disply;
    Zpos(i) = Zpos_int(i)+displz;
	Ipos(i) = (C_xy+C_xz)./3;
	
%     clear displx_xy displx_xz disply_xy disply_yz displz_xz displz_yz C_yz C_xz C_xy sigmz_yz sigmy_yz displz_yz disply_yz
%     clear displx_xz displz_xz sigmx_xz sigmz_xz displx_xy disply_xy sigmx_xy sigmy_xy
%     clear datacheck
	%figure(99)
	%imagesc(A_1(posy-1:posy+1,posx-1:posx+1)), colormap gray, hold on
	%axis xy
	%plot(displx+2,disply+2,'*y')
	%pause
             
			
end

Xpos = Xpos';
Ypos = Ypos';
Zpos = Zpos';
Ipos = Ipos';
