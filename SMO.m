function [alpha,b] = SMO(data,label,C,tol,max_passes)
%SMO���svm��ż���� 
%����
%data,label Ϊѵ������
%C ���򻯲���
%tol ��ֵ����
%max_pass ����n�ε��� �ⲻ��Ĵ��� ��Ϊֹͣ����
%���
%alpha �������ճ���
%b sulution of b(ԭ�����е�b)

[row,~]=size(data);
alpha=zeros(row,1);
b=0;
%��ʼ��alphaΪ0������bΪ0

passes=0;

while passes<max_passes
     num_changed_alphas = 0;
     for i=1:row
         x_i=data(i,:);
         y_i=label(i);
         E_i=f(alpha,data,label,x_i,b)-y_i;
         if((y_i*E_i<-tol && alpha(i)<C)||(y_i*E_i>tol && alpha(i)>0))
             %���ѡ��j neq i
             j=unidrnd(row);
             while j==i
                  j=unidrnd(row);
             end
             x_j=data(j,:);
             y_j=label(j);
             E_j=f(alpha,data,label,x_j,b)-y_j;
             
             %����ɵ�alpha i,jֵ
             old_alpha_i=alpha(i);
             old_alpha_j=alpha(j);
             
             %����L,H
             if y_i==y_j
                 L=max(0,alpha(i)+alpha(j)-C);
                 H=min(alpha(i)+alpha(j),C);
             else
                 L=max(0,alpha(j)-alpha(i));
                 H=min(C+alpha(j)-alpha(i),C);
             end
             
             if L==H
                 continue;
             end
             %����nta
             nta=2*x_i*x_j'-x_i*x_i'-x_j*x_j';
             if nta>=0
                 continue;
             end
             
             %����alpha(j)
             alpha(j)= alpha(j)-y_j*(E_i-E_j)/nta;
             if alpha(j)>H
                 alpha(j)=H;
             elseif alpha(j)<L
                 alpha(j)=L;
             end
             
             if abs(alpha(j)-old_alpha_j)<0.000001
                 continue;
             end
             
             alpha(i)=alpha(i)+y_i*y_j*(old_alpha_j-alpha(j));
             
             %����b
             b_1=b-E_i-y_i*(alpha(i)-old_alpha_i)*(x_i*x_i')-y_j*(alpha(j)-old_alpha_j)*(x_i*x_j');
             b_2=b-E_j-y_i*(alpha(i)-old_alpha_i)*(x_i*x_j')-y_j*(alpha(j)-old_alpha_j)*(x_j*x_j');
             
             if(alpha(i)>0 && alpha(i)<C)
                 b=b_1;
             elseif(alpha(j)>0 && alpha(j)<C)
                 b=b_2;
             else
                 b=(b_1+b_2)/2;
             end
        
             num_changed_alphas=num_changed_alphas+1;
             
         end        
     end
     if  num_changed_alphas==0
         passes=passes+1;
     else
         passes=0;
     end
end


end

