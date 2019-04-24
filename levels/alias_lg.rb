# -*- encoding : utf-8 -*-
difficulty 1
description "使⽤`git lg`来查看带有树形结构的提交记录. 使用`git fl`查看单个文件的提交记录和变更历史。"

setup do
  repo.init

  FileUtils.touch "file1"
  repo.add        "file1"
  repo.commit_all "committed changes on master"

  # add another file.
  FileUtils.touch "file2"
  repo.add        "file2"
  repo.commit_all "add another file: file2"

  `git checkout -b other_branch --quiet`
  # add another file
  FileUtils.touch "file3"
  repo.add        "file3"
  # `echo "hello" >> file2`
  # repo.add        "file2"  
  repo.commit_all "add another file: file3"

  # `git checkout -b test_branch --quiet`

  # FileUtils.touch "file4"
  # repo.add        "file4"
  # repo.commit_all "committed change on test_branch"

  `git checkout master`

  FileUtils.touch "file5"
  repo.add        "file5"
  repo.commit_all "add another file: file5"

  `git merge other_branch -m "merge other_branch"`
  # `git merge test_branch`
  
end

solution do
  valid = true

  config_alias_lg = repo.config["alias.lg"]
  config_alias_filelg = repo.config["alias.fl"]

  return false unless "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'" == config_alias_lg
  return false unless "log -M --follow --stat --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'" == config_alias_filelg

  valid
end

hint do
  puts "增加两个别名：git lg 和git fl，分别如下：
  lg: log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'
  fl: log -M --follow --stat --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'

  "
end
