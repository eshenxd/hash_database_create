%%setCreate by Ethan
%%create train_set and test_set

load('data.mat');

Anchorlbs=zeros(1,300);

[row ,col]=size(database.feature);

m=col;

label_tmp=0;

count=ones(1,1595); %ÿ���˵�������
count_train=zeros(1,1595);%����ѵ����������
count_test=zeros(1,1595);%����������

index=zeros(1,1595);%��Ӧÿ���˵��������

j=0;

for i=1:m
    if(label_tmp~=database.label(i))
        label_tmp=database.label(i);
        j=j+1;
     else
        count(j)=count(j)+1;

    end
   
end  %%���forѭ����������ͳ�ƶ�Ӧÿ���˵���������

for i=1:1595
   count_train(i)=ceil(count(i)*0.8);
   count_test(i)=count(i)-count_train(i);
end

sum_train=sum(count_train(1:1595));

sum_test=sum(count_test(1:1595));

index(1)=85;

for i=2:1595
   index(i)=index(i-1)+count(i); 
end

train_set=zeros(480,sum_train);
train_label=zeros(1,sum_train);

test_set=zeros(480,sum_test);
test_label=zeros(1,sum_test);



train_set(:,1:68)=database.feature(:,1:68);

test_set(:,69:85)=database.feature(:,69:85);

train_index=68;

test_index=17;

for i=1:1595
    train_set(:,train_index:(train_index+count_train(i)))=database.feature(:,index(i):(index(i)+count_train(i)));
end


