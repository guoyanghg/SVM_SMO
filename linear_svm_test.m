%ʾ���÷�
data=[1,2;
      1,3;
      2,1;
      3,1];
%label��+1��-1����ʽ
label=[1;1;-1;-1];
%ѵ���ĵ���������ΪC
[w,b]=train_svm(data,label,1);

%predict����Ϊ������
l=predict([1,4],w,b);

  