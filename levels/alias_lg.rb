# -*- encoding : utf-8 -*-
difficulty 1
description "本关不做考核，仅用于提示您增加两个查看日志的别名，以方便查看日志。
增加两个别名：git lg 和git fl，命令分别如下：
  git config --global alias.lg \"log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'\"
  git config --global alias.fl \"log -M --follow --stat --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'\"

  之后，您可以通过`git lg` 查看日志，或者 `git lg -p`查看包括变更内容的日志。
  通过`git fl <filename>` 或 `git fl -p <filename> 查看某个文件的日志。

"

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

  `git checkout master --quiet`

  FileUtils.touch "file5"
  repo.add        "file5"
  repo.commit_all "add another file: file5"

  `git merge other_branch -m "merge other_branch"`
  # `git merge test_branch`
  
end

solution do
  valid = true

  # config_alias_lg = repo.config["alias.lg"]
  # config_alias_filelg = repo.config["alias.fl"]
  # valid = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'" == config_alias_lg
  # valid2 = "log -M --follow --stat --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'" == config_alias_filelg

  # valid && valid2
end

hint do
  puts "增加两个别名：git lg 和git fl，分别如下：
  lg: log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'
  fl: log -M --follow --stat --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(dim)%ad%C(reset) %C(cyan)%s%C(reset) %C(dim)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'

  "
end
