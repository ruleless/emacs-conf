# 我的emacs配置

## 本地安装

早期我使用的是本地安装的方式，但这种方式有如下劣势：

1. 对操作系统有比较强的依赖。如：之前我主要是在 CentOS7.0 的操作系统下制作了本地安装脚本，但如果我的开发机切换到 ubuntu，那这个安装脚本就不能用了
2. 每次的安装过程都比较复杂，难以做到一键式安装

所以，虽然本工程下仍保留了本地安装脚本，但它却不一定可用，推荐使用Docker镜像安装方式。

## 镜像安装
#### step 1. 准备基础镜像

我们用的是无界面的26.3版本的emacs镜像：

``` shell
docker pull silex/emacs:26.3
```

此镜像大概 480M，通过下面的命令将该镜像重命名：

``` shell
docker tag silex/emacs:26.3 emacs:26.3
```

#### step 2. 构建镜像

``` shell
docker build -t emacs .
```

*注意：* 我们的emacs镜像依赖golang，而golang官方站点经常被屏蔽，所以我们需要去[官网](https://golang.org/dl/)先把安装包下载下来。

#### step 3. 准备启动脚本和其他依赖

1. 将启动脚本 `bin/emacs` 拷贝到可执行文件路径下，推荐 `$HOME/bin`
2. 创建 `$HOME/emacs.conf.d/` 目录，并将 `.TabNine/` 目录下的二进制拷贝到该目录下

至此，便可在终端通过敲入 `emacs` 来打开 emacs 软件了。
