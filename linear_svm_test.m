%示例用法
data=[1,2;
      1,3;
      2,1;
      3,1];
%label是+1，-1的形式
label=[1;1;-1;-1];
%训练的第三个参数为C
[w,b]=train_svm(data,label,1);

%predict输入为行向量
l=predict([1,4],w,b);

  