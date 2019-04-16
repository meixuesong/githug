# -*- encoding : utf-8 -*-
difficulty 2

description "你需要提供最近一次提交的commit id，并找出新增的内容是什么。"

setup do
  repo.init
  file = File.new("newfile.txt", "w")
  repo.add("newfile.txt")

  `echo "Hello" >> newfile.txt`

  repo.commit_all("THIS IS THE COMMIT YOU ARE LOOKING FOR!")
end

solution do
  repo.commits.last.id_abbrev == request("最近一次提交的commit id是多少？")[0..6]
  "Hello" == request("最近一次提交时，文件newfile.txt中新增的内容是什么？")
end

hint do
  puts "你需要查看提交日志."
end
