function  [Back_A1] = Background_removal_moving(A_1,np_back);

if floor(np_back/2)*2==np_back; np_back = np_back+1; end;
A_1     = double(A_1);

Back_A1 = ones(size(A_1))*min(A_1(:));

x_pos  = [(np_back+1)/2:np_back:size(A_1,2)];
y_pos  = [(np_back+1)/2:np_back:size(A_1,1)];

for i=1:length(x_pos)
    for j=1:length(y_pos);
        i_in = max(1,x_pos(i)-(np_back+1)/2);
        i_en = min(size(A_1,2),x_pos(i)+(np_back+1)/2);
        j_in = max(1,y_pos(j)-(np_back+1)/2);
        j_en = min(size(A_1,1),y_pos(j)+(np_back+1)/2);
        
        Back_A1(j_in:j_en,i_in:i_en)  = min(min(A_1(j_in:j_en,i_in:i_en)));
    end;
end;

Back_A1 =  uint16(Back_A1);
