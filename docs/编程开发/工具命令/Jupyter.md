# Jupter

```jupyter-lab```
运行jupyter-lab

查看jupter内核
```jupyter kernelspec list```

删除不需要的内核
```jupyter kernelspec remove <kernel_name>```
/root/JupyterLab

切换目录

1. 运行```jupyter notebook --generate-config```
2. 根据提示路径打开jupyter_notebook_config.py文件
3. 找到#c.NotebookApp.notebook_dir =；去掉#，修改为c.NotebookApp.notebook_dir = ‘你的工作目录’。

下载中文包
```pip install jupyterlab-language-pack-zh-CN```

查看扩展
```jupyter labextension list```
安装
```jupyter labextension install @mflevine/jupyterlab_html```
卸载
```jupyter labextension uninstall @mflevine/jupyterlab_html```
更新
```jupyter labextension update --all```