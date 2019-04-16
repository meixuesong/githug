# -*- encoding : utf-8 -*-
difficulty 2
description "Java编译后会创建 `.class` 文件和 `target` 文件夹， 这些文件/夹并不需要放到代码库中，请配置Git忽略它们。"

setup do
  repo.init

  FileUtils.touch("Hello.class")

  cwd = Dir.pwd
  target = Dir.mkdir "target"
  Dir.chdir "target"
  FileUtils.touch("Foo.class")
  Dir.chdir cwd

  file = File.open(".git/config", "w") do |file|
    file.puts "[core]\nexcludesfile="
  end
end

solution do
  classValid = false
  targetValid = false


  File.open(".gitignore", "r") do |file|
    while line = file.gets
      if line.chomp == "*.class"
        classValid = true
      end

      if line.chomp == "target" || line.chomp == "target/"
        targetValid = true
      end
    end
  end

  classValid && targetValid
end

hint do
  puts "在.gitignore中先加class文件，再加target文件夹"
end
