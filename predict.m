function label = predict(x,w,b)
%���ݸ����ж�

output=x*w+b;

if output>0
    label=+1;
else
    label=-1;
end

end

