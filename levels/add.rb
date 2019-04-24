# -*- encoding : utf-8 -*-
difficulty 1
description "你已经创建了文件 README, 请把它加到Stage区，注意保持另一个文件file2不变。观察file2.txt在工作区-Stage-Head间有哪些变化。
Note: You start each level with a new repo. Don't look for files from the previous one."

setup do
  repo.init
  FileUtils.touch("README")
  FileUtils.touch("file2.txt")

  File.open("README", "w") do | f |
    f.write "Hello\n"
  end

  repo.add("file2.txt")

  File.open("file2.txt", "w") do | f |
    f.write "NEWlINE\n"
  end

end

solution do
  return false unless repo.status.files.keys.include?("README")
  return false if repo.status.files["README"].untracked
  return false if "1" == request("在工作区(Workspace）与Stage之间，file2.txt有哪些变化：
  	1. 无变化
  	2. 增加了一行：NEWLINE
  	")
  "2" == request("在HEAD与Stage之间，file2.txt有哪些变化：
  	1. 无变化
  	2. 新增了文件file2.txt
  	")
end

hint do
  puts "你需要使用`git add` 和`git diff`命令。必要时加上`--cached`参数."
end
