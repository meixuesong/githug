difficulty 3
description "你在hotfix分支修复生产环境的紧急问题，现在你已经修复完成，需要单独将这个修复(Filled in README.md with proper input) 合并到master分支."

setup do
    init_from_level
    `git stash` #fix for README.md being in githug root an the level
    `git checkout new-feature --quiet && git branch -m hotfix --quiet`
    `git checkout master --quiet`
end

solution do
  return false unless repo.commits[1].message == "Added fancy branded output"
  return false unless repo.commits[0].message == "Filled in README.md with proper input"
  true
end

hint do
  puts "Sneak a peek at the `cherry-pick` command."
end
