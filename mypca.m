load USPS.mat
A2 = reshape(A(2,:), 16, 16);
imshow(A2');
%define the number of pc
p = [10,50,100,200];
%obtain the svd
[U,D,V]=svd(A);
%calculation of error
err = zeros(1,size(p,2));
for i = 1
    U_new = U(:,1:p(i));
    D_new = D(1:p(i),1:p(i));
    V_new = V(:,1:p(i));
    
    A_new = U_new*D_new*V_new';
    err(i) = norm(A-A_new,'fro');

A_1=reshape(A(1,:),16,16);
A_new_1=reshape(A_new(1,:),16,16); 
A_2=reshape(A(2,:),16,16);
A_new_2=reshape(A_new(2,:),16,16);
end

figure 
subplot(2,5,1);
imshow(A_1');                   
title('original image');    

subplot(2,5,2);
imshow(A_new_1');
title(strcat('PC p= ',num2str(p(1))));
subplot(2,5,3);
imshow(A_new_1');
title(strcat('PC p= ',num2str(p(2))));
subplot(2,5,4);
imshow(A_new_1');
title(strcat('PC p= ',num2str(p(3))));
subplot(2,5,5);
imshow(A_new_1');
title(strcat('PC p= ',num2str(p(4))));

subplot(2,5,6);
imshow(A_2');
title('original image');

subplot(2,5,7);
imshow(A_new_2');
title(strcat('PC p= ',num2str(p(1))));
subplot(2,5,8);
imshow(A_new_2');
title(strcat('PC p= ',num2str(p(2))));
subplot(2,5,9);
imshow(A_new_2');
title(strcat('PC p= ',num2str(p(3))));
subplot(2,5,10);
imshow(A_new_2');
title(strcat('PC p= ',num2str(p(4))));
figure
plot(err);