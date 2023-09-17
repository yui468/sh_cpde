#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <file_prefix> <file_extension> <number_of_files>"
  exit 1
fi

file_prefix="$1"      # ファイルのプレフィックス
file_extension="$2"   # ファイルの拡張子
num_files="$3"        # 生成するファイルの数

# 引数が数値でない場合はエラーメッセージを表示して終了
if ! [[ "$num_files" =~ ^[0-9]+$ ]]; then
  echo "Error: Number of files must be a positive integer."
  exit 1
fi

# ファイルを生成するループ
for ((i=0; i<=num_files; i++)); do
  filename="${file_prefix}_${i}${file_extension}"
  touch "$filename"
  echo "Created: $filename"
done

echo "files created in the current directory"