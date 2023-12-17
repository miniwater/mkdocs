# Git

Github教程:<https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git>

用sourcetree管理

查看配置信息

```shell
git config --list
```

配置用户信息

```shell
git config --global user.name "runoob"
git config --global user.email test@runoob.com
```

查询配置信息

```shell
git config user.name
```

## 创建Git

初始化

```shell
git init
```

提交到暂存区

```shell
git add .
```

可以通过 `git status` 查看现在的状态

绑定个人信息（存在可以跳过）

```shell
git config --global user.email "xxx@qq.com"
git config --global user.name "xxx"
```

提交到本地仓库

```shell
git commit -m "第一次提交"
```

在Github上创建空的远程仓库

添加目标仓库地址

```shell
git remote add origin https://github.com/xxx/xxx.git
```

[由于Github在2021年8月13日取消了对密码身份验证的支持](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls)，从而转用[个人访问令牌创建](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)。

Github：Settings->Developer settings->Personal access token->Tokens(classic)

推送

```shell
git push -u origin "master"
```

## 已有

克隆

```shell
git clone <repo> <directory>
```

## 常用命令

提交暂存文件

```git
git add .
```

撤销暂存

```git
git reset HEAD
```

撤销滚暂存前的修改

```git
git checkout .
```

撤销全部修改（包括暂存）

```git
git checkout HEAD .
```

提交暂存文件

```git
git commit -m '备注'
```

当前状态

```
git status
```

比较暂存区和工作区差异

```
git diff
```

回退

```
git reset HEAD^            # 回退所有内容到上一个版本  
git reset HEAD^ hello.php  # 回退 hello.php 文件的版本到上一个版本  
git reset  052e           # 回退到指定版本
```

提交历史

```
git log
```

创建分支

```
git branch (branchname)
```

切换分支

```
git checkout (branchname)
```

合并release分支

```
git merge release
```

标签

```
git tag -a v1.0 
```

:wq保存退出
:qa不保存退出

推

```
git push
```

拉

```
git pull
```

```
git remote -v

git remote rm origin

git remote add origin gitlab@gitlab.

git pull origin master

git branch --set-upstream-to=origin/master master

git config --global credential.helper store
 
git pull

```

## 好用的readme工具

<https://shields.io/>

<https://star-history.com/>
