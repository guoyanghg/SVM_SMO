function output = f(alpha,data,label,x,b)
%最终的线性分类器 xw+b
%其中w=\sum_1^row (alpha_i*label_i*data_i)^T
%x是行向量
%   此处显示详细说明
[row,col]=size(data);
w=zeros(col,1);
for i=1:row
    w=w+alpha(i)*label(i)*data(i,:)';
end

output=x*w+b;
end

