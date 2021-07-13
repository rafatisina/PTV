disp('--- Particle gaussion fitting ---');
    disp('------ Frame 1 ------');      
	[Xpos_temp1,Ypos_temp1,Zpos_temp1,Ipos_temp1] = Particle_gausfit(I1,Xpos_int1,Ypos_int1,Zpos_int1,mean_u_disp,dev_u_disp,mean_v_disp,dev_v_disp,mean_w_disp,dev_w_disp);
    disp('------ Frame 2 ------');
    [Xpos_temp2,Ypos_temp2,Zpos_temp2,Ipos_temp2] = Particle_gausfit(I2,Xpos_int2,Ypos_int2,Zpos_int2,mean_u_disp,dev_u_disp,mean_v_disp,dev_v_disp,mean_w_disp,dev_w_disp);
   
    
    Xpos_T=[Xpos_temp1;Xpos_temp2];
    Ypos_T=[Ypos_temp1;Ypos_temp2];
    Ipos_T=[Ipos_temp1;Ipos_temp2];