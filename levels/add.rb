difficulty 1
description "你已经创建了文件 README, 请把它加到Stage区.
Note: You start each level with a new repo. Don't look for files from the previous one."

setup do
  repo.init
  FileUtils.touch("README")
  FileUtils.touch("file2.txt")

  `echo "Hello" >> README`
  `git add file2.txt && echo "NEWlINE" >> file2.txt`

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
  puts "You can type `git` in your shell to get a list of available git commands."
end
