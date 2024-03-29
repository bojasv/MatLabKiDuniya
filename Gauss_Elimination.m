%Change Log: 2020, Jan 07
%let the matrix eqn be AX=B
%A - variable matrix (or square matrix or coefficient matrix)
%B - constant matrix (or column matrix)

clc
A = [5 3 4;3 0 1;6 3 6];
B = [-18;-7;-27]

[n,~] = size(A); %no. of rows; and not of column
x= zeros(n,1); %initialize x

%for forward elimination
%convert the coeff. matrix to upper triang. matrix
for i = 1:n-1
    m = A(i+1:n,i)/A(i,i);
    A(i+1:n,:) = A(i+1:n,:)-m*A(i,:);
    B(i+1:n,:) = B(i+1:n,:)-m*B(i,:);
end

%for back substitution

x(n,:) = b(n,:)/A(n,n);

for i = n-1:-1:1
    x(i,:) = (B(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
