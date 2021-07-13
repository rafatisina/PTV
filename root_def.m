function [nzeros]=root_def(k,ndigits)
if ndigits==3;
    if k<1000; nzeros=''; end;
    if k<100; nzeros='0'; end;
    if k<10; nzeros='00'; end;
elseif ndigits==4;
    if k<10000; nzeros=''; end;
    if k<1000; nzeros='0'; end;
    if k<100; nzeros='00'; end;
    if k<10; nzeros='000'; end;
 elseif ndigits==5;
    if k<100000; nzeros=''; end;
    if k<10000; nzeros='0'; end;
    if k<1000; nzeros='00'; end;
    if k<100; nzeros='000'; end;  
    if k<10; nzeros='0000'; end; 
end; %end of "if ndigits==3..."