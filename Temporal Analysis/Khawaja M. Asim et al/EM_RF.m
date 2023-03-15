clc;clear all;
A = xlsread('Cyprus_nM=50,dtp=15.xlsx');
                                   
                                    load('Cyprus_randomorder')
                                    A = A(randomorder,:);
                                    
input=A(:,1:60);
Actual_Mag = A(:,61);
Threshold = 4.5;
Actual_Out  = Output_Label( Actual_Mag, Threshold );
[ind]=size(input,1);
Actual_Out = Actual_Out(:,1);

%%%%%%%%%%---------- Divide Train and Test
  %%%%    Dataset
  trainD = input(1:ceil(ind*(3/4)),:);
  testD = input(ceil(ind*(3/4))+1:end,:);
  %%%%    Lable
  train_lbl = Actual_Out(1:ceil(ind*(3/4)),:);
  test_lbl = Actual_Out(ceil(ind*(3/4))+1:end,:);
  %%%%    Actual Mag Lable
  train_actual_lbl = Actual_Mag(1:ceil(ind*(3/4)),:);
  test_actual_lbl = Actual_Mag(ceil(ind*(3/4))+1:end,:);
 
  clearvars -except trainD testD ind test_lbl train_lbl train_actual_lbl test_actual_lbl Threshold
  
%%%% ---------- Under Sampling.
           if Threshold == 4.5 || Threshold == 4.0
               x=1
            [ trainD, train_lbl ] = Under_Sample( trainD, train_lbl, Threshold );
           end
           
           one = size(find(train_lbl(:,1)==1),1);
           one_ratio_after_downsample = one/size(trainD,1)
  
  % --------------- RandomForest    
b = TreeBagger(20,trainD,train_lbl,'OOBPrediction','on')
% view(b.Trees{1},'Mode','graph')
% plot(oobError(b))
%        xlabel('number of grown trees')
%        ylabel('out-of-bag classification error')
       
train_out = predict(b,trainD);
test_out = predict(b,testD); 
     
            y1 = cell2mat(train_out);
            train_out = str2num(y1);
            y2 = cell2mat(test_out);
            test_out = str2num(y2);
            
[TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(train_lbl,train_out);
Contengency_train = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
    
 [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(test_lbl,test_out);
 Contengency_test = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
                
