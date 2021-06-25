function [X,Y,U,V,Xmatch,Ymatch,Imatch] = Particle_displacement(A_1,Xpos,Ypos,Ipos,Xpred,Ypred,Upred,Vpred,sr,Iratmin,Iratmax);

imt =  1;
infind = 0;
infindmax = length(Xpos);
%sr = 2; %Radius to search for matching particle
%Iratmin = 0.2;
%Iratmax = 5;

keepsearching = 1;

Uinterp = interp2(Xpred,Ypred,Upred,round(Xpos),round(Ypos),'linear',mean(Upred(:)));
Vinterp = interp2(Xpred,Ypred,Vpred,round(Xpos),round(Ypos),'linear',mean(Vpred(:)));

%Uinterp = griddata(Xpred,Ypred,Upred,Xpos,Ypos);
%Vinterp = griddata(Xpred,Ypred,Vpred,Xpos,Ypos);


figure(99)
imagesc(Xpred(1,:),Ypred(:,1),Upred), hold on
plot(Xpos,Ypos,'k*')

while(keepsearching>0)
	
	Xposa = Xpos(1);
	Yposa = Ypos(1);
	Iposa = Ipos(1);
	Xdisp = Uinterp(1);
	Ydisp = Vinterp(1);
	
	Xposb = Xposa + Xdisp;
	Yposb = Yposa + Ydisp;
	
	Xpos = Xpos(2:end); % Remove the particle from the list 
	Ypos = Ypos(2:end); % that we are looking at now
	Ipos = Ipos(2:end);
	Uinterp = Uinterp(2:end);
	Vinterp = Vinterp(2:end);
	
	idx = find(Xpos<(Xposb+sr) & Xpos>(Xposb-sr) & Ypos<(Yposb+sr) & Ypos>(Yposb-sr) & Ipos>(Iratmin*Iposa) & Ipos<(Iratmax*Iposa));
	
	if isempty(idx) %No matching particle found
		Xpos = [Xpos; Xposa]; %Add the particle back
		Ypos = [Ypos; Yposa]; %to the end of the list
		Ipos = [Ipos; Iposa];
		Uinterp = [Uinterp; Xdisp];
		Vinterp = [Vinterp; Ydisp];
		infind = infind + 1;
	else %Matching particle is found
		if length(idx)>1 %Take the value closest to the predictor
			[minval,minidx] = min((abs(Xpos(idx)-Xposa)-abs(Xdisp)).^2+(abs(Ypos(idx)-Yposa)-abs(Ydisp)).^2);
			idx = idx(minidx);
		end	
		Xfriend = Xpos(idx);
		Yfriend = Ypos(idx);
		Ifriend = Ipos(idx);
		Xpos = [Xpos(1:idx-1); Xpos(idx+1:end)]; %Remove the friend from the list
		Ypos = [Ypos(1:idx-1); Ypos(idx+1:end)];
		Ipos = [Ipos(1:idx-1); Ipos(idx+1:end)];
		Uinterp = [Uinterp(1:idx-1); Uinterp(idx+1:end)];
		Vinterp = [Vinterp(1:idx-1); Vinterp(idx+1:end)];
		Xmatch(:,imt) = [Xposa, Xfriend];
		Ymatch(:,imt) = [Yposa, Yfriend];
		Imatch(:,imt) = [Iposa, Ifriend];
		imt = imt + 1;
	end
	
	if infind > infindmax
		keepsearching = 0;
	end
		
	%whos
	%pause

end

disp(['           * Total number of particle pairs detected :', num2str(imt-1),' ']);
disp(['              -> ', num2str(infindmax-2*imt+2),' particles discarded (' num2str((round(infindmax-2*imt+2)/infindmax)*100) '% )'  ]);

%figure(301), clf
%imagesc(A_1), hold on
%colormap gray
%caxis([0,200])
%axis equal
%quiver(Xmatch(1,:),Ymatch(1,:),(Xmatch(2,:)-Xmatch(1,:)),(Ymatch(2,:)-Ymatch(1,:)),'y')
%pause

%figure(302), clf
%plot(Imatch(1,:),Imatch(2,:),'*')
%axis equal

%pause

X = (Xmatch(2,:)+Xmatch(1,:))/2;
Y = (Ymatch(2,:)+Ymatch(1,:))/2;
U = Xmatch(2,:)-Xmatch(1,:);
V = Ymatch(2,:)-Ymatch(1,:);
