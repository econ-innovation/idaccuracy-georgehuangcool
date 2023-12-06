#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  cat("请提供文件路径。\n")
  quit(status = 1)
}

mypath <- args[1]

file_names <- dir(mypath, all.files = TRUE)

container <- data.frame()

for (i in 3:length(file_names)) {
  file_path <- file.path(mypath, file_names[i])
  print(paste0("现在打开第", i, "个文件: ", file_path))
  file <- read_csv(file_path)
  container <- rbind(container, file)
}