clear; close all; clc;
folder_name = dir('subject*');
num_folder = length(folder_name);

results = cell(length(folder_name), 1);

j=1;
for i = 1:num_folder   
  if isfolder(folder_name(i).name)==1
        file_name = strcat(folder_name(i).name,'/M/');
        clear data;
        
        files = dir(strcat(file_name,'*.csv'));
        for k=1:length(files)
            data{k,1} = xlsread(strcat(file_name,files(k).name));
        end
        
        %finalData{1,j}=cell2mat(data);
        csvwrite(strcat(folder_name(i).name, '/all.csv'), cell2mat(data));
        
        fprintf(file_name)
      j=j+1;
  end
end 
