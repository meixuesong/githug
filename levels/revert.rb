# -*- encoding : utf-8 -*-
difficulty 4
description "你已经在本地做了几次提交，而且所有提交都Push到了远程代码库。现在你发现有一次提交(Bad commit)包含了Bug, 你需要把它回滚掉。"

setup do
  repo.init

  FileUtils.touch "file1"
  repo.add        "file1"
  repo.commit_all "First commit"

  FileUtils.touch "file3"
  repo.add        "file3"
  repo.commit_all "Bad commit"

  FileUtils.touch "file2"
  repo.add        "file2"
  repo.commit_all "Second commit"
end

solution do
  valid = false
  commit_messages = repo.commits.map(&:message)
  valid = true if repo.commits.length > 3 &&
    commit_messages.any? { |e| e =~ /(Revert )?"Bad commit"/ }
  valid
end

hint do
  puts "Try the revert command."
end
