% Function to draw the importance
function N = draw_imp(imp)
N = size(imp,1);
x = [1:size(imp,2)];
color = ['r' 'g' 'b' 'y' 'm' 'k'];

hold all;
for i=1:N
    y = imp(i,:);
    plot(x,y,'k');
end
hold off;
title('Class 1');
xlabel('Variable');
ylabel('Importance');
    
end