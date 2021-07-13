function [Xpos,Ypos,Zpos]=local_maximum(A)
disp('           * Checking for local maxima ')
Temp_x                  =zeros(size(A));											
Temp_x(:,2:size(A,2)-1,:) =diff(sign(diff(A,1,2)),1,2);	
bufx                    =-0.5*Temp_x;
bufx                    =floor(bufx+abs(bufx));

Temp_y                  =zeros(size(A));
Temp_y(2:size(A,1)-1,:,:) =diff(sign(diff(A,1,1)),1,1);
bufy                    =-0.5*Temp_y;
bufy                    =floor(bufy+abs(bufy));


Temp_z                  =zeros(size(A));
Temp_z(:,:,2:size(A,3)-1) =diff(sign(diff(A,1,3)),1,3);
bufz                    =-0.5*Temp_z;
bufz                    =floor(bufz+abs(bufz));

peaks                   =bufx.*bufy.*bufz;


% [row_p,col_p,depth_p]           =find(peaks==8);                   %indices where local maximum
[row_p,col_p,depth_p] = ind2sub(size(peaks),find(peaks == 8))  ;                  %indices where local maximum
Ypos                    =row_p;
Xpos                    =col_p;
Zpos                    =depth_p;

npart                   =length(Xpos);

disp(['              -> ', num2str(npart),' local maxima detected']);
npartlocmax             =npart;