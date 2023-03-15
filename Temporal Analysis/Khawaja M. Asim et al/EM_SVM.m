clear all; clc
addpath('E:\Dropbox\Office Work\TEC (Arslan)\Anomaly\libsvm-mat-2.88-1-64bit\')
A = xlsread('Cyprus_nM=50,dtp=15.xlsx');
                                   
                                    load('Cyprus_randomorder')
                                    A = A(randomorder,:);
                                    
input=A(:,1:60);
Actual_Mag = A(:,61);
Threshold = 4.5;
                       % Actual_Mag = Under_Sample(Actual_Mag,Threshold);
Actual_Out  =   Output_Label( Actual_Mag, Threshold );
[ind]=size(Actual_Out,1);
  
  %%%%%%%%%%---------- Divide Train and Test
  %%%%    Dataset
  trainD = input(1:ceil(ind*(3/4)),:);
  testD = input(ceil(ind*(3/4))+1:end,:);
  %%%%    Lable
  train_lbl = Actual_Out(1:ceil(ind*(3/4)),:);
  test_lbl = Actual_Out(ceil(ind*(3/4))+1:end,:);
  %%%%    Actual Mag Lable
%   train_actual_lbl = Actual_Mag(1:ceil(ind*(3/4)),:);
%   test_actual_lbl = Actual_Mag(ceil(ind*(3/4))+1:end,:);
%  
  clearvars -except trainD testD ind test_lbl train_lbl train_actual_lbl test_actual_lbl Threshold 

   %--- USE SVR----- NORMALIZE...
   
           for i=1 : size(trainD,2)
                a=[]; s=[];
                a = trainD(:,i) - mean(trainD(:,i));
                s = std(trainD(:,i));
                trainD(:,i) = a/s;
           end
           for i=1 : size(testD,2)
                a=[]; s=[];
                a = testD(:,i) - mean(testD(:,i));
                s = std(testD(:,i));
                testD(:,i) = a/s;
           end
           
           %%%% ---------- Under Sampling.
           if Threshold == 4.5 || Threshold == 4.0
               x=1
            [ trainD, train_lbl ] = Under_Sample( trainD, train_lbl, Threshold );
           end
           
           one = size(find(train_lbl(:,1)==1),1);
           one_ratio_after_downsample = one/size(trainD,1)
  

   MODEL=svmtrain(train_lbl(:,1), trainD,'-s 1 -t 2 -g 2 -c 0.1');
  
   [PL_train, Acc_train, DV_train]=svmpredict(train_lbl(:,1), trainD, MODEL);
   [PL_test, Acc_test, DV_test]=svmpredict(test_lbl(:,1), testD, MODEL);
  
     Acc_train
    
     Acc_test

 SVR_train_binary = PL_train;            %Output_Label(PL_train,Threshold); 
 SVR_test_binary =  PL_test;                        %Output_Label(PL_test,Threshold);
%  train_lbl = Output_Label(train_lbl,Threshold);
%  test_lbl = Output_Label(test_lbl,Threshold);
 
 [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(train_lbl(:,1),PL_train);
   SVR_Contengency_train = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
  
 
 [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(test_lbl(:,1),PL_test);
   SVR_Contengency_test = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
  
