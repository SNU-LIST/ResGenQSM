function resultimg = recover_resolution(img,matrixsize_to)
% k-space aliasing���� undersampling�� �̹����� ���ϴ� matrix size�� ��������
ksp = fft3c(img);
tmpksp = repmat(ksp,ceil(ceil(matrixsize_to./size(img))/2)*2+1);
matrixsize_from = size(img);
resultksp = tmpksp(end/2-matrixsize_to(1)/2+1:end/2+matrixsize_to(1)/2,end/2-matrixsize_to(2)/2+1:end/2+matrixsize_to(2)/2,end/2-matrixsize_to(3)/2+1:end/2+matrixsize_to(3)/2);
resultksp= resultksp /(matrixsize_from(1)/matrixsize_to(1)*matrixsize_from(2)/matrixsize_to(2)*matrixsize_from(3)/matrixsize_to(3));

resultimg = ifft3c(resultksp);

end