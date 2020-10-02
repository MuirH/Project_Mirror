# Git 自动同步

利用Github Action，可以方便的同步至各个平台储存库

## 参数

### `target_repo_url`

目标储存库的SSH URL

## `ssh_private_key`

目标储存库的SSH KEY


## 栗子

```
name: 'GitHub Actions Mirror'

on: [push, delete]

jobs:
  mirror_to_gitee:
    runs-on: ubuntu-latest
    steps:
      - name: 'Checkout'
        uses: actions/checkout@v1
      - name: 'Mirror to gitee'
        uses: MuirProject/Project_Sync@v1.0
        with:
          target_repo_url:
            git@gitee.com:becod/test.git
          ssh_private_key:
            ${{ secrets.GITEE_KEY }}

  mirror_to_gitlab:
    runs-on: ubuntu-latest
    steps:
      - name: 'Checkout'
        uses: actions/checkout@v1
      - name: 'Mirror to gitlab'
        uses: MuirProject/Project_Sync@v1.0
        with:
          target_repo_url:
            git@gitlab.com:becod/test.git
          ssh_private_key:
            ${{ secrets.GITLAB_KEY }}
```