% function which retrives squired error for a given training set and test
% set.
function [j_theta_training,j_theta_test] = pol_lin_reg(d,q3x,q3x_test,q3y,q3y_test)

%constructing phi(x) matrix
phi_x=zeros(size(q3x,1),size(q3x,2)*d);
for i=1:size(q3x,2)*d
   phi_x(:,i)=q3x(:,ceil(i/d)).^(i-(floor((i-0.1)/d))*d);
end
phi_x_test=zeros(size(q3x_test,1),size(q3x_test,2)*d);
for i=1:size(q3x_test,2)*d
   phi_x_test(:,i)=q3x_test(:,ceil(i/d)).^(i-(floor((i-0.1)/d))*d);
end

%%normalization using mean 0 sigma=1
all_x_data=[phi_x;phi_x_test]; 
for i=1:size(phi_x,2)
    mean_i=mean(all_x_data(:,i));
    std_i=std(all_x_data(:,i));
    phi_x(:,i)=(phi_x(:,i)-mean_i)/std_i;
    phi_x_test(:,i)=(phi_x_test(:,i)-mean_i)/std_i;  
end

%adding intercept term to phi(x)
intercept(size(phi_x,1),1)=1;
for i=1:size(phi_x,1)
intercept(i,1)=1;
end
phi_x=[intercept phi_x];

intercept1(size(phi_x_test,1),1)=1;
for i=1:size(phi_x_test,1)
intercept1(i,1)=1;
end
phi_x_test=[intercept1 phi_x_test];

%defining theta, alpha, and no. of iterration
theta=zeros(1,1+(size(q3x,2)*d));
alpha=0.01;

% applying stochastic gradient
m=size(q3x,1);
phi_x=phi_x';
j_theta_training=10000000;
j_theta_training_new=0;
diff=1000;
while diff>1
    for i=1:m
            theta=theta+alpha*(( q3y(i) - theta* (phi_x(:,i)))*phi_x(:,i))';
    end
    for i=1:m
    j_theta_training_new=j_theta_training_new+0.5*(( q3y(i) - theta* (phi_x(:,i)))^2);
    end
    diff=abs(j_theta_training-j_theta_training_new);
    j_theta_training=j_theta_training_new;
    j_theta_training_new=0;
end
theta
%error for test case
phi_x_test=phi_x_test';
m=size(q3x_test,1);
j_theta_test=0;
for i=1:m
    j_theta_test=j_theta_test+0.5*(( q3y_test(i) - theta* (phi_x_test(:,i)))^2);
end
end