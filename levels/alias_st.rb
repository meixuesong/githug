difficulty 1
description "使⽤短别名git st来查看git状态"

setup do
  repo.init
end

solution do
  valid = false

  config_alias_status = repo.config["alias.st"]

  if "status" == config_alias_status
    valid = true
  end

  valid
end

hint do
  puts "These settings are config settings.  You should run `git help config` if you are stuck."
end
