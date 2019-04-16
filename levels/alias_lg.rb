# -*- encoding : utf-8 -*-
difficulty 1
description "使⽤git lg来查看带有树形结构的提交记录."

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
  valid = false

  config_alias_lg = repo.config["alias.lg"]

  if "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(white)%ad%C(reset) %C(bold green)%s%C(reset) %C(auto)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'" == config_alias_lg
    valid = true
  end

  valid
end

hint do
  puts "增加一个git别名，内容如下：log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(white)%ad%C(reset) %C(bold green)%s%C(reset) %C(auto)- %an%C(reset)%C(auto)%d%C(reset)'  --date=format:'%Y-%m-%d %H:%M:%S'"
end
