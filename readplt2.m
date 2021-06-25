function [dataout]=readtec_dav(filename)

disp([' ']);
disp([' Reading ...']);
disp([' ' filename]);

dataout = 0;

fid=fopen([filename],'r');
[line1]=fgetl(fid);
[line2]=fgetl(fid);
col = length(strfind(line2,'"'))/2; %Count the number of variables
[line3]=fgetl(fid);
stri = strfind(line3,'I=');
strj = strfind(line3,'J=');
strk = strfind(line3,'K=');

if isempty(strk) %there is no k
	I = str2num(line3(stri+2:strj-3));
	J = str2num(line3(strj+2:end));
else
	I = str2num(line3(stri+2:strj-3));
	J = str2num(line3(strj+2:strk-3));
end

lin=I*J;


[A,count]=fscanf(fid,'%g',[col,lin]);
fclose(fid);

B=A';
for j=1:J
	for varnr = 1:col
		dataout(1:I,j,varnr) = B((1+(j-1)*I):(I+(j-1)*I),varnr);
	end
end;