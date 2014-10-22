%%
%load set
load('dataset.mat');

%%
[row,col]=size(feature);

%%
train_set=zeros(480,1595*40);
train_label=zeros(1,1595*40);

test_set=zeros(480,1595*8);
test_label=zeros(1,1595*8);

anchorlbs=randperm(1595*40,300);

%%
for i=1:1595
    train_set(:,(i-1)*40+1:i*40)=feature(:,(i-1)*48+1:(i-1)*48+40);
    test_set(:,(i-1)*8+1:i*8)=feature(:,(i-1)*48+41:i*48);
    
    train_label((i-1)*40+1:i*40)=i;
    test_label((i-1)*8+1:i*8)=i;
end

%%
%save data
save('train_data','train_set','train_label');
save('test_data','test_set','test_label');