# IFVWRT
基于[Lean的源码](https://github.com/coolsnowwolf/lede)修改，默认的配置文件适用于Friendly Elec. NanoPi R4S，可自行更换平台  
[软件包介绍](README_IPK.md)  
[编译教程](README_COMPILE.md)  
[FAQ](README_FAQ.md)
## 特性
* 默认自带极少的插件,但附带了常用工具,做到干净整洁但不简陋  
* 仓库扩充,添加了Hello World,PassWall,Bypass,SSR+等科学上网插件,反对封闭人人有责  
* 更换shell为bash,使用5.10内核  
* 使用Nginx作为前端  
## 镜像
Releases内为镜像。首先选择镜像类型  
Squashfs适用于NOR-Flash(常见于路由器等嵌入式设备),Ext4则适用于Nand-Flash(U盘,SD卡等均在此列)  
详细区别请看[这里](https://forum.openwrt.org/t/ext4-vs-squashfs/25187),NanoPi选Ext4就可以了  
下载镜像后使用Gzip解压,然后使用烧录工具刷入即可  
### Linux用户终端刷入指南  
首先打开终端(如果你不知道这是什么,请使用图形化的工具),使用`cd`移动到镜像目录下  
然后使用`gzip -dk 你下载的镜像.img.gz`解压镜像(若报错`gzip: command not found`,使用`sudo apt install gzip`或`sudo yum install gzip`)
插入要烧录的设备,在终端输入`sudo fdisk -l`找到要烧录设备的位置,一般名字为sdX啥的,路径为/dev/sdX  
然后输入`sudo dd if=你的镜像.img of=要烧录设备的位置 bs=5M status=progress`  
注意⚠️! 被烧录设备的数据会全部删除!务必做好备份!必须确认路径是你要烧录的设备!!!  
嗯?你问我为啥这么咬牙切齿?因为我只是想提醒你不要像我这个⑨一样失手把数据盘烧了......  
等待完成后弹出设备,大功告成!  
## 使用说明  
默认登录地址为192.168.2.1(作为从路由可能有变,具体看主路由分配的IP地址)或<http://ifvwrt>  
浏览器可能会报错提示证书不可信,这是由于Nginx默认开启SSL,使用了自签证书,无视即可  
默认用户名为root,密码为password,一定要在联网前修改!  
Waiting for update...
