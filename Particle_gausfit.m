function [Xpos,Ypos,Ipos] = Particle_gausfit(A_1,Xpos_int,Ypos_int);

disp('--- Applying Gaussian fit ---');

for i = 1:length(Xpos_int)

	posx = Xpos_int(i);
	posy = Ypos_int(i);

	if posx == 1 | posx == size(A_1,2) | posy == 1 | posy == size(A_1,1)
		displx = 0;
		disply = 0;
		C = 0;
	else
		
		R(1)=double(A_1(posy,posx))+0.0001;	%Rcenter add a small epsilon to cope with plateaus
		R(2)=double(A_1(posy,posx-1))+0.00001;	%Rleft
		R(3)=double(A_1(posy,posx+1))+0.00001;	%Rright
		R(4)=double(A_1(posy-1,posx))+0.00001;	%Rtop
		R(5)=double(A_1(posy+1,posx))+0.00001;	%Rbottom
        	
		displx=.50*(log(R(2))-log(R(3)))/(log(R(2))-2*log(R(1))+log(R(3)));
		disply=+.50*(log(R(4))-log(R(5)))/(log(R(4))-2*log(R(1))+log(R(5)));
		sigmx=2/log((R(1)*R(1))/(R(2)*R(3))); %Calculate peak width in x-direction
		sigmy=2/log((R(1)*R(1))/(R(4)*R(5))); %Calculate peak width in y-direction
		C = R(1)*exp(-displx^2/sigmx-disply^2/sigmy); %Peak intensity
	end
	
	Xpos(i) = Xpos_int(i)+displx;
	Ypos(i) = Ypos_int(i)+disply;
	Ipos(i) = C;
	
	%figure(99)
	%imagesc(A_1(posy-1:posy+1,posx-1:posx+1)), colormap gray, hold on
	%axis xy
	%plot(displx+2,disply+2,'*y')
	%
	%pause
	
end

Xpos = Xpos';
Ypos = Ypos';
Ipos = Ipos';
