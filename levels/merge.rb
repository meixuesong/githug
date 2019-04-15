difficulty 2
description "你在 feature 分支开发完成了，现在需要合并到 Master分支。"

setup do
	init_from_level

	`git checkout feature --quiet`
end

solution do
	File.exists?("file1")	&& File.exists?("file2")
end

hint do
  puts "You want to research the `git merge` command."
end
