# -*- encoding : utf-8 -*-
difficulty 2
description "你需获取远程所有分⽀最新代码，并让版本树尽量整洁（只有⼀个树⼲）."

setup do
  # remember the working directory so we can come back to it later
  cwd = Dir.pwd
  repo.init

  # initialize another git repo to be used as a "remote"
  # remote repo
  tmpdir = Dir.mktmpdir
  Dir.chdir tmpdir
  repo.init
  # make a 'non-bare' repo accept pushes
  `git config receive.denyCurrentBranch ignore`

  # add a different file and commit so remote and local would diverge
  FileUtils.touch "file1"
  repo.add        "file1"
  repo.commit_all "first commit"


  # change back to original repo to set up a remote
  Dir.chdir cwd

  `git remote add origin #{tmpdir}/.git `

  `git fetch origin --quiet`
  # `git branch -u origin/master master`

  # 处理本地repo
  `git pull origin master --quiet`

  File.open("file1", "a") do | f |
    f.write "Hello\n"
  end

  `git add file1`
  `git commit -m "Second commit" --quiet`

  Dir.chdir tmpdir
  FileUtils.touch "file2"
  File.open("#{tmpdir}/file2", "w") do | f |
    f.write "Hello\n"
  end
  `git add file2`
  `git commit -m "Third commit"  --quiet`

  Dir.chdir cwd
  FileUtils.touch "file3"
  File.open("#{cwd}/file3", "w") do | f |
    f.write "Hello\n"
  end
  `git add file3`
  `git commit -m "Forth commit"  --quiet`
  `git branch --set-upstream-to=origin/master master`

end

solution do
  1 == repo.commits("master")[0].parents.length
end

hint do
  puts "Take a look at `git fetch`, `git pull`, and `git push`."
end
