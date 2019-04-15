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
  `git remote add origin #{tmpdir}/.git  2> /dev/null`
  `git fetch origin  2> /dev/null`
  `git branch -u origin/master master  2> /dev/null`

  # 处理本地repo
  `git pull origin master --quiet`
  `echo "Hello" >> file1 && git add file1  2> /dev/null && git commit -m "Second commit"  2> /dev/null`

  Dir.chdir tmpdir
  FileUtils.touch "file2"
  `echo "Hello" >> file2 && git add file2  2> /dev/null && git commit -m "Third commit"  2> /dev/null`

  Dir.chdir cwd
  FileUtils.touch "file3"
  `echo "Hello" >> file3  && git add file3  2> /dev/null && git commit -m "Forth commit"  2> /dev/null`
  `git branch --set-upstream-to=origin/master master  2> /dev/null`

end

solution do
  1 == repo.commits("master")[0].parents.length
end

hint do
  puts "Take a look at `git fetch`, `git pull`, and `git push`."
end
