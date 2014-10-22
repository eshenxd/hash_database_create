
fidin=fopen('fileName.txt','r');

nline=0;

i=1;

% feature1=zeros(480,621126);


 while ~feof(fidin)

    tline=fgetl(fidin);
    Data_tmp=load(tline);
    
    nline=nline+1;
    
    tline=fgetl(fidin);
    Data_label=tline;
    nline=nline+1;
    
    n=Data_tmp.VID_DESCS_CSLBP;
    [row,col]=size(n);
    
    for j=1:col
    database.feature(:,i)=Data_tmp.VID_DESCS_CSLBP(:,j);
    database.label(:,i)=str2num(Data_label);
    i=i+1;
    end
   
end



save('data.mat','database');

% save('label.mat','DataBaselabel');
% M=load('fileName.txt');