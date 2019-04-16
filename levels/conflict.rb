# -*- encoding : utf-8 -*-
difficulty 4
description "你需要将 `mybranch`分支的变更merge到当前分支 (master). 如果有冲突，请把它搞定."

setup do
  init_from_level
end

solution do
  solved = true

  solved = false unless repo.head.name == "master"
  solved = false unless repo.commits("master")[0].parents.length == 2

  txt = File.read("poem.txt")
  solved = false if txt =~ /[<>=|]/
  solved = false unless txt =~ /Sat on a wall/

  solved
end

hint do
  puts ["首先，你要merge，然后解决冲突。最后别忘了commit."]
end
