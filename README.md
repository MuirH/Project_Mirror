# Git 自动同步

利用Github Action，可以方便的同步各个平台的储存库

## 参数

### `src`

**必须** 源储存库的SSH URL

### `dst`

**必须** 目标储存库的SSH URL

## 环境变量

`SSH_KEY`: 一个可以访问两个存储库的SSH密钥。


## 栗子

```
name: Sync to Bitbucket Repo

on: [ push, delete, create ]

jobs:
  git-mirror:
    runs-on: ubuntu-latest
    steps:
      - uses: MuirProject/Project_Sync@v1
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_KEY }}
        with:
          src: 'git@github.com:MuirProject/example_repo.git'
          dst: 'git@bitbucket.org:MuirProject/example_repo.git'
```