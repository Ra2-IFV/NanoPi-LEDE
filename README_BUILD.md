# 源码编译教程
本教程同样适用于其他的源码，替换一些步骤即可  
这里推荐使用Ubuntu 2X.XX 64bit系统进行编译，以此为例  
## 环境准备
在开始前，请确保你的硬盘空间充足（至少40G），系统至少有2G左右内存空余，挂上梯子以提高编译成功率。CPU核心数与内存大小的比率至少为1（否则需要设置SWAP）  
不要使用root账户进行编译！必定失败！  
准备好了吗？Let's rock and roll!  
* 在终端内输入`sudo apt update && sudo apt upgrade`更新软件源  
* 使用`sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync`安装好必要的依赖  
* 输入`git clone https://github.com/Ra2-IFV/NanoPi-LEDE`clone源码，然后`cd NanoPi-LEDE`  
## 调整
输入
```
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
```
更新一遍feeds，并检查编译依赖
## 编译报错排障指南
这方面我绝对有发言权，因为我把能踩的坑几乎都踩了一遍......  
Waiting for update...
