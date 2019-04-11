difficulty 1
description "Set up your git alias 'co' for checkout', so that you can type it conveniently."

setup do
  repo.init
end

solution do
  valid = false

  config_alias_status = repo.config["alias.co"]

  if "checkout" == config_alias_status
    valid = true
  end

  valid
end

hint do
  puts "These settings are config settings.  You should run `git help config` if you are stuck."
end
