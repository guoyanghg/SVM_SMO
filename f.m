function output = f(alpha,data,label,x,b)
%���յ����Է����� xw+b
%����w=\sum_1^row (alpha_i*label_i*data_i)^T
%x��������
%   �˴���ʾ��ϸ˵��
[row,col]=size(data);
w=zeros(col,1);
for i=1:row
    w=w+alpha(i)*label(i)*data(i,:)';
end

output=x*w+b;
end

