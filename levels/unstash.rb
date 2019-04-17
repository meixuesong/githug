# -*- encoding : utf-8 -*-
difficulty 2
description "你之前做了一些修改，并且暂存了它们，你当前位于分支`featurehumans-txt`。
现在请切回到master，恢复你之前暂存的内容，以便继续修改。
"

setup do
  init_from_level

  `git stash`
  `git checkout -b featurehumans-txt --quiet`
end

solution do
  return false unless `git stash list` !~ /stash@\{0\}/
  # return false unless File.exist?("lyrics.txt") 
  return false unless repo.head.name == "master"
  true
end

hint do
  puts "It's like stashing. Try finding appropriate git command."
end
