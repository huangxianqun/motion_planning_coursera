function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
flag =true;
flag1=0;
flag2=0;
result1=zeros(1,size(P2,1));
result2=zeros(1,size(P2,1));
for i=1:size(P1,1)
        P11=P1;
        P11(i,:)=[];
        if (P11(2,1)-P11(1,1)==0)
            x=P11(2,1);
            x1=P2(1,1)-x;
            x2=P2(2,1)-x;
            x3=P2(3,1)-x;
            y1=P1(i,1)-x;
        else
        a=(P11(2,2)-P11(1,2))./(P11(2,1)-P11(1,1));
        b=P11(1,2)-a*P11(1,1);
        x1=a*P2(1,1)-P2(1,2)+b;
        x2=a*P2(2,1)-P2(2,2)+b;
        x3=a*P2(3,1)-P2(3,2)+b;
        y1=a*P1(i,1)-P1(i,2)+b;
       
        end
         if ((x1*x2>=0)&&(x1*x3>=0)&&(x2*x3>=0))&&((x1*y1<=0)&&(x2*y1<=0)&&(x3*y1<=0))
            result1(i)=1;
        end
end
if any(result1)
    flag1=1;
end
for j=1:size(P2,1)
        P22=P2;
        P22(j,:)=[];
        if (P22(2,1)-P22(1,1)==0)
            x=P22(2,1);
            x1=P1(1,1)-x;
            x2=P1(2,1)-x;
            x3=P1(3,1)-x;
            y1=P2(j,1)-x;
        else
        a=(P22(2,2)-P22(1,2))./(P22(2,1)-P22(1,1));
        b=P22(1,2)-a*P22(1,1);
        x1=a*P1(1,1)-P1(1,2)+b;
        x2=a*P1(2,1)-P1(2,2)+b;
        x3=a*P1(3,1)-P1(3,2)+b;
        y1=a*P2(j,1)-P2(j,2)+b;
        end
        if ((x1*x2>=0)&&(x1*x3>=0)&&(x2*x3>=0))&& ((x1*y1<=0)&&(x2*y1<=0)&&(x3*y1<=0))
            result2(j)=1;
        end
end
if any(result2)
    flag2=1;
end
if (flag1==1)||(flag2==1)
    flag=false;
end
        
        

        
% *******************************************************************
end