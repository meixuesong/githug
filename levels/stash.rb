difficulty 2
description "你已经做了一些修改，现在请暂存它们，并切换到分支`featurehumans-txt`。"

setup do
  init_from_level
end

solution do
  return false if `git stash list` !~ /stash@\{0\}/
  return false if repo.status.changed.to_a.flatten.include? "lyrics.txt"
  return false unless repo.head.name == "featurehumans-txt"
  true
end

hint do
  puts "It's like stashing. Try finding appropriate git command."
end
