%%creatdataset.m

%%
%load data

load('data.mat');
[row ,col]=size(database.feature);

dfeature=database.feature;
dlabel=database.label;

%%
%find index
index=zeros(1,1595);
label_tmp=0;
j=1;
index(1)=1;

for i=1:col
    if(label_tmp~=dlabel(i))
        label_tmp=dlabel(i);
        j=j+1;
        index(j)=index(j-1)+1;
    else
        index(j)=index(j)+1;
    end
end
%%
tmp=index(2)-index(1);
for i=1:1595
    if(tmp>index(i+1)-index(i))
        tmp=index(i+1)-index(i);
    end
    a=tmp;
end

%%
%create data
feature=zeros(480,a*1595);
label=zeros(1,a*1595);

%%
%copy data
for i=1:1595
    feature(:,(i-1)*48+1:i*48)=dfeature(:,index(i):index(i)+47);
    label((i-1)*48+1:i*48)=i;
end

save('dataset.mat','feature','label');



