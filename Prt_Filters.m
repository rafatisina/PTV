disp('------ Frame 1 ------'); 
[Xpos_int1,Ypos_int1,Zpos_int1]=filter_particles(Xpos_int_temp1,Ypos_int_temp1,Zpos_int_temp1,im,D_R,SR_Rad,I1,Xw,Yw,Zw);
disp('------ Frame 2 ------');
 [Xpos_int2,Ypos_int2,Zpos_int2]=filter_particles(Xpos_int_temp2,Ypos_int_temp2,Zpos_int_temp2,im,D_R,SR_Rad,I2,Xw,Yw,Zw);
                                