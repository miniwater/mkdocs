# Conda

> 官方文档
> <https://docs.conda.io/projects/conda/en/latest/index.html>

查看版本

```conda --version```

查看环境

```conda env list```

windows环境变量
`E:\Anaconda3\condabin`

## 环境

### 创建环境

创建一个新环境并在其中安装包。将环境命名snowflakes并安装BioPython软件包。

```conda create --name snowflakes biopython```

创建一个名为“snakes”的新环境，其中包含 Python 3.9

```conda create --name snakes python=3.9```

创建一个名为“node”的新环境，其中什么都没有

```conda create --name node```

### 进入(切换)环境

使用或“激活”`snowflakes`新环境

```conda activate snowflakes```

将当前环境更改回默认值base

```conda activate```

### 删除环境

```Shell
conda remove --name oldName --all

conda remove -n base --all
```

### 克隆环境

跟删除环境搭配可实现环境改名(重命名环境)

`conda create --name newName --clone oldName`

### 所有环境的列表

```conda info --envs```

### 退出环境

```conda deactivate```

## 包

### 搜索包

```shell
conda search beautifulsoup4

conda search cuda -c pkgs   #与conda search cuda等效
conda search cuda -c anaconda
conda search cuda -c pytorch
conda search cuda -c nvidia
```

### 安装包

```shell
conda install beautifulsoup4

conda install beautifulsoup4 -c conda-forge

conda install nodejs=14.7.0 -c conda-forge
```

### 包列表

```conda list```

### 包更新

更新单个包：`conda update package`

更新所有包：`conda update --all`

升级conda(升级Anaconda前需要先升级conda)：`conda update conda`

升级anaconda：`conda update anaconda`

升级spyder：`conda update spyder`

源

pip安装列表
```pip freeze```

superset 面板
superset run -p 8088 --with-threads --reload --debugger
pip install apache-superset --upgrade
superset db upgrade
superset init

/mnt/data/server/conda/lib/python3.9/site-packages/superset
BABEL_DEFAULT_LOCALE = "en"

pip 批量更新

```pip install pip-review```  # 安装 pip-review

```pip-review```  # 查看可更新的包

```pip-review --auto```  # 自动更新所有包

pip-review --local --interactive

注意：
win10目录`C:\Users\user\AppData\Local\Microsoft\WindowsApps`下有个假python，再未安装Python的情况下命令行里输入`python`会跳去win10应用商店。
可通过开始菜单搜索`app exec`或 *设置->应用->应用和功能->更多设置->应用执行别名* 关闭。
