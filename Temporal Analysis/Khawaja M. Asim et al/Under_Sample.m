function [ trainD, train_lbl ] = Under_Sample( trainD, train_lbl,Threshold )


      one = size(find(train_lbl(:,1)==1),1);
      one_ratio = one/size(trainD,1)
  
total = size(trainD,1);

Sample = find(train_lbl(:,1)==1);
   if Threshold==4.0
       S=2
   elseif Threshold==4.5
       S=3
   end
    n= size(Sample,1)*(S);
    d= randperm(total,n);
   drop=union(Sample,d);
   trainD = trainD(drop,:);
    train_lbl = train_lbl(drop,:);


    
end


