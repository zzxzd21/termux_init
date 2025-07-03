#!/data/data/com.termux/files/usr/bin/bash
#运行时将文件“spark-3.5.6-bin-hadoop3.tgz”复制于(/storage/emulated/0)/Download(安卓目录)
#记得先运行chmod哦~

#安装软件
pkg update && pkg upgrade -y
pkg install openssh openjdk-17 vim clang python3 htop mandoc -y

#简单配置ssh
whoami >> ~/init_log.txt #记录用户名，格式类似u0_a120
echo '00000000
00000000' | passwd      #初始化密码便于ssh访问（不安全的做法！！）
echo sshd > ~/.bashrc   #bash启动时即自启动ssh服务
sshd

#安装spark
cd ~
mv ~/storage/downloads/spark-3.5.6-bin-hadoop3.tgz ~    #移到主目录方便操作
tar -zxvf spark-3.5.6-bin-hadoop3.tgz
mv ~/spark-3.5.6-bin-hadoop3 ~/spark    #简化
rm ~/spark-3.5.6-bin-hadoop3.tgz

#结束
ifconfig | grep 192 >> ~/init_log.txt   #获取ip地址
reset
cat ~/init_log.txt
echo '完成'