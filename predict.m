function label = predict(x,w,b)
%根据负号判定

output=x*w+b;

if output>0
    label=+1;
else
    label=-1;
end

end

