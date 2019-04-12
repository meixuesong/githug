difficulty 1
description "使⽤git lg来查看带有树形结构的提交记录."

setup do
  repo.init
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
