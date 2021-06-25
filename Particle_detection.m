function [Xpos,Ypos] = Particle_detection(A,Int_thresh);

A                       =max(0,double(A)-Int_thresh);

% LOCAL MAXIMA
%-------------
disp('           * Checking for local maxima ')
Temp_x                  =zeros(size(A));											
Temp_x(:,2:size(A,2)-1) =diff(sign(diff(A,1,2)),1,2);	
bufx                    =-0.5*Temp_x;
bufx                    =floor(bufx+abs(bufx));
Temp_y                  =zeros(size(A));
Temp_y(2:size(A,1)-1,:) =diff(sign(diff(A,1,1)),1,1);
bufy                    =-0.5*Temp_y;
bufy                    =floor(bufy+abs(bufy));
peaks                   =bufx.*bufy;
[row_p,col_p]           =find(peaks==4);                   %indices where local maximum

Ypos                    =row_p;
Xpos                    =col_p;

npart                   =length(Xpos);

disp(['              -> ', num2str(npart),' local maxima detected']);
npartlocmax             =npart;

% PLATEAUS
%---------
disp('           * Checking for plateaus ')
A_up                =zeros(size(A));
A_down              =zeros(size(A));
A_left              =zeros(size(A));
A_right             =zeros(size(A));
A_up(2:end,:)       =A(1:end-1,:);
A_down(1:end-1,:)   =A(2:end,:);
A_left(:,2:end)     =A(:,1:end-1);
A_right(:,1:end-1)  =A(:,2:end);

%the plateau must be spread over at least two pixels, must have an intensity different from zero and the intensity must be higher than the surrounding pixels
ind                 = find((A==A_up | A==A_down | A==A_left | A==A_right) & A~=0 & (A>=A_up & A>=A_down & A>=A_left & A>=A_right)); %these give the index of the plateaus

%identify plateaus : they are connected regions
map_part            =zeros(size(A));
map_part(ind)       =1;
L                   =bwlabel(map_part,4);
stats               =regionprops(L,'centroid');
vect                =round([stats.Centroid]); %Added round() operator 19/11/08 Ferry

Xpos_plat           =vect(1:2:end-1);
Ypos_plat           =vect(2:2:end);

disp(['              -> ', num2str(max(L(:))),' plateaus detected ']);
nplats             =max(L(:));
% COMBINE PLATEAUS AND LOCAL MAXIMA
%----------------------------------
Xpos                =[Xpos;Xpos_plat'];
Ypos                =[Ypos;Ypos_plat'];



%Xpos                =uint16([Xpos;Xpos_plat']);
%Ypos                =uint16([Ypos;Ypos_plat']);

%partpos = zeros(size(A));
%partpos_buf = full(sparse(double(Ypos),double(Xpos),1));
%partpos(1:size(partpos_buf,1),1:size(partpos_buf,2))=partpos_buf;

figure(101), clf
imagesc(A), hold on
plot(Xpos,Ypos,'y*')
colormap gray
caxis([0,200])
axis equal

figure(102), clf
imagesc(A), hold on
colormap gray
caxis([0,200])
axis equal

%pause


%concen = conv2(partpos,ones(21,21)/21^2,'same');

%figure(1)
%imagesc(A), axis equal, axis xy, axis tight, colormap gray, hold on;
%drawnow;% pause;

%figure(2)
%imagesc(concen), axis equal, axis xy, axis tight, colorbar, hold on;
%drawnow; %pause;


npmain              =length(Xpos);
disp(['           * Total number of particles detected :', num2str(npmain),' ']);
