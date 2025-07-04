#!/data/data/com.termux/files/usr/bin/bash
#运行时将文件“spark-3.5.6-bin-hadoop3.tgz”复制于(/storage/emulated/0)/Download(安卓目录)
#记得先运行chmod哦~

#安装软件
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirror.nju.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
apt update && pkg upgrade -y
pkg install openssh openjdk-17 vim clang python3 htop mandoc -y

#初始化密码便于ssh访问（不安全的做法！！）
echo '00000000
00000000' | passwd

#安装spark
cd ~
mv ~/storage/downloads/spark-3.5.6-bin-hadoop3.tgz ~    #移到主目录方便操作
tar -zxvf spark-3.5.6-bin-hadoop3.tgz
mv ~/spark-3.5.6-bin-hadoop3 ~/spark    #简化
rm ~/spark-3.5.6-bin-hadoop3.tgz

#配置自启动
echo 'sshd' >> ~/.bashrc
echo 'ifconfig | grep "192.168"' >> ~/.bashrc
echo 'whoami' >> ~/.bashrc
#结束
clear
echo '完成'
bash
