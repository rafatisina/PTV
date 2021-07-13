disp('--- Particle detection ---');
disp('------ Frame 1 ------');
        [Xpos_int_temp1,Ypos_int_temp1,Zpos_int_temp1] = Particle_detection(I1,Int_thresh);
       
disp('------ Frame 2 ------');      
        [Xpos_int_temp2,Ypos_int_temp2,Zpos_int_temp2] = Particle_detection(I2,Int_thresh);
        