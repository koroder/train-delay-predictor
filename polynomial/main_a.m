%taking the input
f= 'C:\Users\Bharat\Desktop\ml\train.txt';
load(f);
f= 'C:\Users\Bharat\Desktop\ml\test.txt';
load(f);

%separating test and training data and their labels 
train_x= train(:,1:4);
train_y=train(:,5);

test_x=test(:,1:4);
test_y=test(:,5);

%taking polynomial powers, initialising training and testing error
d=[1,2,3,4,5,6,7,8,9,10];
j_theta_training=zeros(size(d));
j_theta_test=zeros(size(d));

for i=1:size(d,2)  
     i
     [j_theta_training(i),j_theta_test(i)] = pol_lin_reg(d(i),train_x,test_x,train_y,test_y);
end
plot(d,j_theta_test);
figure;
plot(d,j_theta_training);