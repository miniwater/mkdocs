# GitHub项目目录指南

## .github

github专用配置文件

### FUNDING.yml

个人收钱码

## .dockerignore

docker 在构建镜像时首先从构建上下文找有没有 .dockerignore 文件，如果有的话则在上传上下文到 docker 服务端时忽略掉 .dockerignore 里面的文件列表。

| 符号 | 作用             |
|----|----------------|
| #  | 注释             |
| *  | 匹配0或多个非/的字符    |
| ?  | 匹配1个非/的字符      |
| ** | 0个或多个目录        |
| !  | 除...外，需结合上下文语义 |

示例：

```dockerignore
.devcontainer/
.git/
.github/
.vscode/
contributing/
docs/
node_modules/
tests/
# Folder is cloned during the preview + prod workflows, the assets are merged into other locations for use before the build
docs-early-access/
# During the preview deploy untrusted user code may be cloned into this directory
user-code/
```

## .gitattributes

为特定文件或路径指定版本控制的行为，例如处理特定的文本文件或二进制文件。

## .gitignore

git 忽略掉的文件

示例：

```gitignore
.DS_Store
.idea/
/node_modules/
```

## CITATION.cff

描述科学研究项目的引用元数据文件

参考：https://docs.github.com/zh/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files

示例：

```md
cff-version: 1.2.0
message: "If you use this software, please cite it as below."
authors:
- family-names: "Lisa"
  given-names: "Mona"
  orcid: "https://orcid.org/0000-0000-0000-0000"
- family-names: "Bot"
  given-names: "Hew"
  orcid: "https://orcid.org/0000-0000-0000-0000"
title: "My Research Software"
version: 2.0.4
doi: 10.5281/zenodo.1234
date-released: 2017-12-18
url: "https://github.com/github-linguist/linguist"
```

## CODE_OF_CONDUCT.md

贡献者公约行为准则

获取最新贡献者盟约：<https://www.contributor-covenant.org/>

## docker-compose.yaml

构建 docker-compose

## Dockerfile

构建 Docker

## LICENSE

开源许可证

## README.md

介绍项目

动态徽章：<https://img.shields.io/>

Star历史图：<https://star-history.com/>

依赖许可证分析：<https://app.fossa.com/>

## SECURITY.md

安全性维护的方式

```md
# Security Policy

安全说明

All security bugs should be reported to the contact as below:

所有安全漏洞都应报告给以下联系人：

- github.com

Thanks for your support!

感谢您的支持！
```
