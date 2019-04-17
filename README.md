# MyGithug
玩游戏一样练习Git操作。 

## About

MyGithub是基于 [Githug](https://github.com/Gazler/githug) 修改的一个练习Git的项目。
旨在为您提供学习git的实用方法。 它有一系列级别，每个级别都要求您使用git命令来获得正确的答案。每个级别都是独立的任务，级别之间没有关联。

## Playing Githug

MyGithug支持Linux, OS X and Windows.

### 前提条件

你需要 Ruby 1.8.7 或更高版本. 你可以通过以下命令获取当前的Ruby版本:

```
ruby --version
```

如果你还没有安装Ruby，请按照官方文档安装：[ruby-lang.org](https://www.ruby-lang.org/en/documentation/installation/).

### 安装

要安装Mygithug，只需要运行：

    gem install mygithug

如果没有权限，你可能需要以管理员身份运行。或者在Linux/Mac下 `sudo`:

    sudo gem install mygithug

### 命令

游戏有4个命令:

 * play - 默认命令，检查你是否已经完成当前级别的任务。
 * hint - 提示信息，在你不知道如何完成任务时，你可能需要它。
 * reset - 重置命令，当你想重新练习某个命令时，可以使用此命令回到该级别。
 * levels - 列出所有的游戏级别。

常用命令示例：

默认命令 play
```
> mygithug play
或者
> mygithug
```

提示信息 hint

```
> mygithug hint
```

重置第3级任务 reset

```
> mygithug reset 3
```

### 开始游戏

你为此游戏创建一个新的文件夹，然后在该文件夹下运行命令：

    mygithug

按照提示，系统默认会再次创建一个git_hug文件夹。

    No githug directory found, do you wish to create one? [yn]

Type `y` (yes) to continue, `n` (no) to cancel and quit Githug.

现在你已经可以开始游戏了。先进入git_hug文件夹。

```
cd git_hug
```

每完成一个任务，就执行命令：

```
mygithug
```

系统会检查你的任务是否成功完成，如果已经完成，则自动进入下一个任务，否则继续完成你的任务。遇到困难时，可以使用 `mygithug hint`命令获取帮助。



