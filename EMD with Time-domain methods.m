clear;clc;
load('Competition_train.mat');

for i=1:278
    TRAIN{i,1}=squeeze(X(i,:,:))';
end


for i = 1:278
    for j = 1:64
        new_data_emd{i,j} = emd(TRAIN{i,1}(:,j));
        data_emd_1_4{i,j} = new_data_emd{i,j}(:,1:4);
    end
end

for i = 1:278
    MEN{i,1}=mean(cell2mat(data_emd_1_4(i,:)));
    STD{i,1}=std(cell2mat(data_emd_1_4(i,:)));
    VR{i,1}=var(cell2mat(data_emd_1_4(i,:)));
    KUR{i,1}=kurtosis(cell2mat(data_emd_1_4(i,:)));
    SKE{i,1}=skewness(cell2mat(data_emd_1_4(i,:)));
    ENT{i,1}=entropy(cell2mat(data_emd_1_4(i,:)));
    RMS{i,1}=rms(cell2mat(data_emd_1_4(i,:)));
    ENG{i,1}=norm(cell2mat(data_emd_1_4(i,:)),'fro')^2;
    POW{i,1}=norm(cell2mat(data_emd_1_4(i,:)).*conj(cell2mat(data_emd_1_4(i,:))));
end


train_data_MEN=horzcat(cell2mat(MEN),Y);
train_data_STD=horzcat(cell2mat(STD),Y);
train_data_VR=horzcat(cell2mat(VR),Y);
train_data_KUR=horzcat(cell2mat(KUR),Y);
train_data_SKE=horzcat(cell2mat(SKE),Y);
train_data_ENT=horzcat(cell2mat(ENT),Y);
train_data_RMS=horzcat(cell2mat(RMS),Y);
train_data_ENG=horzcat(cell2mat(ENG),Y);
train_data_POW=horzcat(cell2mat(POW),Y);

