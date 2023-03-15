clear all; clc
A = xlsread('Cyprus_nM=50,dtp=15.xlsx');
                                    load('Cyprus_randomorder')
                                    A = A(randomorder,:);
                                    
input=A(:,1:60);
Actual_Mag = A(:,61);
Threshold = 4.5;
Actual_Out  = Output_Label( Actual_Mag, Threshold );
[ind]=size(input,1);
  
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
  
  
           %   x=1
          if Threshold == 4.5 || Threshold == 4.0
               x=1
            [ trainD, train_lbl ] = Under_Sample( trainD, train_lbl, Threshold );
           end
           
           one = size(find(train_lbl(:,1)==1),1);
           one_ratio_after_downsample = one/size(trainD,1)
  
  
  net = newff(trainD',train_lbl',{20},{'tansig'});
  trainFCN = 'trainlm';
  %[ net, Contengency_train1, Contengency_test1, Aux_trainNN, Aux_testNN ] = UseNN_Revision( trainD,testD,train_lbl,test_lbl,net,trainFCN );

  %%%%----------------------
  train_com=trainD';  test_com=testD';
    train_lbl=train_lbl';  test_lbl = test_lbl';      
%     net=newff(train,train_lbl,{neurons},{'tansig'},trainFCN);
    net.trainFcn = trainFCN 
%     net.divideFcn='divideind';dividerand
    net.performFcn='mse';
    net.divideParam.trainInd= 1:2*size(train_com,2)/3;             
    net.divideParam.valInd=  (2*size(train_com,2)/3)+1:size(train_com,2);      
%     net.divideParam.testInd=(2*size(train,2)/3)+1:size(train,2);     
    net.trainparam.max_fail=200;
    net.trainparam.epochs=400;
    net.trainparam.min_grad= 1.0000e-15;

    net=train(net,train_com,train_lbl);
    
    %%%%%%% ------- Simulate Output
    train_out = []; test_out = [];
    train_out= sim(net,train_com);
    test_out = sim(net, test_com);
    
    %%%%%% --------- Calculate contigency
%    Final result for Training
    Final_Results_train = [];
    for i=1:size(train_out,2)
        if train_out(1,i)> train_out(2,i)
            Final_Results_train = [Final_Results_train 1];
        end
        if train_out(1,i)<= train_out(2,i)
            Final_Results_train = [Final_Results_train 0];
        end
    end
 % Final Result for Testing
 Final_Results_test = []; 
    for i=1:size(test_out,2)
        if test_out(1,i)> test_out(2,i)
            Final_Results_test = [Final_Results_test 1];
        end
        if test_out(1,i)<= test_out(2,i)
            Final_Results_test = [Final_Results_test 0];
        end
    end
    
    
    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(train_lbl(1,:),Final_Results_train);
    Contengency_train = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
    
    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(test_lbl(1,:),Final_Results_test);
    Contengency_test = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
    
  