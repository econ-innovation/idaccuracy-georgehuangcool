

# 2023.12.6

# 1. 使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出。
# 2. 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
# 3. 使用apply家族函数替代上述步骤中的for循环
# 4. 将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。

getwd()
mypath = "D:/OneDrive - University of Sussex/应用经济学中的大数据/test/Aminer"
# 为了确保路径存在，可以先查看其是否存在
file.exists(mypath)
# 设定mypath为⼯作路径
setwd(mypath)

file_name <- dir(mypath,all.files=TRUE)
container <- data.frame()
for (i in 3: (length(file_name)) ) {
  print(paste0("现在打开第",i,"个文件夹"))
  file <- read_csv(file_name[i])
  container <- rbind(container, file)
}

# 使用apply家族

file_list <- lapply(file_name[3:length(file_name)], function(file) {
  print(paste0("现在打开第 ", file, " 个文件夹"))
  read_csv(file)
})

container <- do.call(rbind, file_list)

