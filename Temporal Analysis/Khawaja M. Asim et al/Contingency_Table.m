function [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(targets,outputs)
% Where the input targets refers to the actual targets
%Where 1s represent Yes and 0 represent NO.... 
% sens, spec, ppv and npv stand for sensitivity, specificity,
% positive predictive value, and negative predictive value

% True positives
TP = outputs(targets == 1);
TP = length(TP(TP == 1));

% False positives
FP = outputs(targets == 0);
FP = length(FP(FP == 1));

% False negatives
FN = outputs(targets == 1);
FN = length(FN(FN == 0));

% True negatives
TN = outputs(targets == 0);
TN = length(TN(TN == 0));

% Sensitivity
sens = TP/(TP+FN);

% Specificity
spec = TN/(FP+TN);

% Positive predictive value
ppv = TP/(TP+FP);

% Negative predictive value
npv = TN/(FN+TN);

%Accuracy
Acc = (TP+TN)/(TP+TN+FP+FN);

%Mathew's Coorelation Coefficient
MCC = (TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));

%R Score
RScore = ((TP*TN)-(FP*FN))/((TP+FN)*(FP+TN));

