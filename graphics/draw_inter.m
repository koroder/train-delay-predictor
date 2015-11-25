% Function to draw the interaction matrix
function im = draw_inter(inter)
M = size(inter,1);
im = zeros(M*100);
mx = max(max(inter));
mn = min(min(inter));
inter = (inter-mn)/(mx-mn);
inter = 255 - floor(inter*255);
for i=1:M
    for j=1:M
        val = inter(i,j);
        i_start = (i-1)*100+1;
        j_start = (j-1)*100+1;
        for iter1 = i_start:i_start+100
            for iter2 = j_start:j_start+100
                im(iter1,iter2) = val;
            end
        end
    end
end

im = uint8(im);
imshow(im);

end