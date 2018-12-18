function [w,b] = train_svm(data,label,C)

tol=0.0001;
max_passes=100;
[alpha,b]=SMO(data,label,C,tol,max_passes);


%Í¨¹ýalpha¼ÆËãw
[row,col]=size(data);
w=zeros(col,1);
for i=1:row
    w=w+alpha(i)*label(i)*data(i,:)';
end

end

