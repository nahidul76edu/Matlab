clc
clear
clear all

%%%%%%%%%%%Load data 1 and devide on cell%%%%%%%%%%

load('subject_1.mat');
Triger1=HDR.TRIG;
classlabel1=HDR.Classlabel;

for i=1:length(Triger1)

    data1{i,1}=s(Triger1(i)+750:Triger1(i)+1749,:);
    data1{i,2}=classlabel1(i);
end

%%%%%%%%%%%Load data 2 and devide on cell%%%%%%%%%%

load('subject_2.mat');
Triger2=HDR.TRIG;
classlabel2=HDR.Classlabel;

for i=1:length(Triger2)

    data2{i,1}=s(Triger2(i)+750:Triger2(i)+1749,:);
    data2{i,2}=classlabel2(i);
end

%%%%%%%%%%%Load data 3 and devide on cell%%%%%%%%%%

load('subject_3.mat');
Triger3=HDR.TRIG;
classlabel3=HDR.Classlabel;

for i=1:length(Triger3)

    data3{i,1}=s(Triger3(i)+750:Triger3(i)+1749,:);
    data3{i,2}=classlabel3(i);
end

%%%%%%split the subject 1 data on train and test set%%%%%%%%%%
k=0;
m=0;
for j = 1:length(Triger1)
    if isnan(data1{j,2})
        k=k+1;
        testdata1{k,1} = data1{j,1};
        testdata1{k,2}=data1{j,2};
    else
        m=m+1;
        traindata1{m,1}=data1{j,1};
        traindata1{m,2}=data1{j,2};
    end
end

%%%%%%split the subject 2 data on train and test set%%%%%%%%%%
k=0;
m=0;
for j = 1:length(Triger2)
    if isnan(data2{j,2})
        k=k+1;
        testdata2{k,1} = data2{j,1};
        testdata2{k,2}=data2{j,2};
    else
        m=m+1;
        traindata2{m,1}=data2{j,1};
        traindata2{m,2}=data2{j,2};
    end
end

%%%%%%split the subject 3 data on train and test set%%%%%%%%%%
k=0;
m=0;
for j = 1:length(Triger3)
    if isnan(data3{j,2})
        k=k+1;
        testdata3{k,1} = data3{j,1};
        testdata3{k,2}=data3{j,2};
    else
        m=m+1;
        traindata3{m,1}=data3{j,1};
        traindata3{m,2}=data3{j,2};
    end
end

finaltraindata123=vertcat(traindata1,traindata2,traindata3);
finaltestdata123=vertcat(testdata1,testdata2,testdata3);

%%%%%%%%%%%Fearute extraction for subject 1%%%%%%%%%%%%%

for i=1: length(finaltraindata123)
    %%%%%%%%%%%%%%%%%train data%%%%%%%%%%%%%
    Mean_train{i,1}=mean(finaltraindata123{i,1});
    Median_train{i,1}=median(finaltraindata123{i,1});
    Variance_train{i,1}=var(finaltraindata123{i,1});
    Standard_train{i,1}=std(finaltraindata123{i,1});
    Entropy_train{i,1}=entropy(finaltraindata123{i,1});
    Skewness_train{i,1}=skewness(finaltraindata123{i,1});
    Kartosis_train{i,1}=kurtosis(finaltraindata123{i,1});
    Maximum_train{i,1}=max(finaltraindata123{i,1});
    Munimum_train{i,1}=min(finaltraindata123{i,1});
    RMS_train{i,1}=rms(finaltraindata123{i,1});
    
        
    Mean_train{i,2}=finaltraindata123{i,2};
    Median_train{i,2}=finaltraindata123{i,2};
    Variance_train{i,2}=finaltraindata123{i,2};
    Standard_train{i,2}=finaltraindata123{i,2};
    Entropy_train{i,2}=finaltraindata123{i,2};
    Skewness_train{i,2}=finaltraindata123{i,2};
    Kartosis_train{i,2}=finaltraindata123{i,2};
    Maximum_train{i,2}=finaltraindata123{i,2};
    Munimum_train{i,2}=finaltraindata123{i,2};
    RMS_train{i,2}=finaltraindata123{i,2};
    
    %%%%%%%%%%%Test data%%%%%%%%%%%%%%%

    Mean_test{i,1}=std(finaltestdata123{i,1});
    Median_test{i,1}=median(finaltestdata123{i,1});
    Variance_test{i,1}=var(finaltestdata123{i,1});
    Standard_test{i,1}=std(finaltestdata123{i,1});
    Entropy_test{i,1}=entropy(finaltestdata123{i,1});
    Skewness_test{i,1}=skewness(finaltestdata123{i,1});
    Kartosis_test{i,1}=kurtosis(finaltestdata123{i,1});
    Maximum_test{i,1}=max(finaltestdata123{i,1});
    Munimum_test{i,1}=min(finaltestdata123{i,1});
    RMS_test{i,1}=rms(finaltestdata123{i,1});
    
        
    Mean_test{i,2}=finaltestdata123{i,2};
    Median_test{i,2}=finaltestdata123{i,2};
    Variance_test{i,2}=finaltestdata123{i,2};
    Standard_test{i,2}=finaltestdata123{i,2};
    Entropy_test{i,2}=finaltestdata123{i,2};
    Skewness_test{i,2}=finaltestdata123{i,2};
    Kartosis_test{i,2}=finaltestdata123{i,2};
    Maximum_test{i,2}=finaltestdata123{i,2};
    Munimum_test{i,2}=finaltestdata123{i,2};
    RMS_test{i,2}=finaltestdata123{i,2};
end

%%%%%%%%%cell to mat file creation%%%%%%%%%%
final_traindata1_mat=cell2mat(Mean_train);
final_traindata2_mat=cell2mat(Median_train);
final_traindata3_mat=cell2mat(Variance_train);
final_traindata4_mat=cell2mat(Standard_train);
final_traindata5_mat=cell2mat(Entropy_train);
final_traindata6_mat=cell2mat(Skewness_train);
final_traindata7_mat=cell2mat(Kartosis_train);
final_traindata8_mat=cell2mat(Maximum_train);
final_traindata9_mat=cell2mat(Munimum_train);
final_traindata10_mat=cell2mat(RMS_train);


final_testdata1_mat=cell2mat(Mean_test);
final_testdata2_mat=cell2mat(Median_test);
final_testdata3_mat=cell2mat(Variance_test);
final_testdata4_mat=cell2mat(Standard_test);
final_testdata5_mat=cell2mat(Entropy_test);
final_testdata6_mat=cell2mat(Skewness_test);
final_testdata7_mat=cell2mat(Kartosis_test);
final_testdata8_mat=cell2mat(Maximum_test);
final_testdata9_mat=cell2mat(Munimum_test);
final_testdata10_mat=cell2mat(RMS_test);

%%%%%%%%%%%%%classification%%%%%%%%%%%%%%%%

for i=1:length(final_testdata4_mat)
    yfit(i,1) = trainedClassifier.predictFcn(final_testdata4_mat(i,:));
end

yfit3 = trainedClassifier.predictFcn(final_testdata4_mat(1,:));

%%%%%%%%%.csv file creation%%%%%%%%%%%%%%%%%
%%csvwrite('final_traindata.csv',final_traindata);