a:190:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Creating Multiple MySQL Instances";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:36;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:38;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:38;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:"Login to your mysql server as root and execute the following command
It means we are giving shutdown privileges to the user “multi_admin”";}i:2;i:40;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:187;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:106:"
mysql>GRANT SHUTDOWN ON *.* TO 'multi_admin'@'localhost' IDENTIFIED BY 'secret';
mysql>FLUSH PRIVILEGES;
";i:1;N;i:2;N;}i:2;i:187;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:187;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"Come out of mysql prompt and stop mysql server.To stop you can execute";}i:2;i:303;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:379;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:87:"
[root@localhost ~]#	service mysql stop
or
[root@localhost ~]#/sbin/service mysql stop
";i:1;N;i:2;N;}i:2;i:379;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:379;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:125:"Now we need to locate the mysql config file “my.cnf” and change it as per our requirement which is located at /etc/my.cnf";}i:2;i:476;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:601;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:601;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:308:"N:B:-If you are not finding the my.cnf file then go to your mysql installation folder.In my case it is /usr/share/mysql.You will find four configuration files like “my-small.cnf”,” my-medium.cnf”,” my-large.cnf “,” my-huge.cnf”.You can take any one and put it in /etc and rename it to my.cnf.";}i:2;i:603;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:911;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:911;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"You can also execute the command below to get all of the above file.";}i:2;i:913;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:981;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:981;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"[root@localhost ~]#	find / -name mysql*.cnf";}i:2;i:983;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1026;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1026;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"open my.cnf and comment out the following lines in [mysql] section";}i:2;i:1028;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1094;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:198:"
# The MySQL server
[mysqld]
#port           = 3306
#socket         = /var/run/mysql/mysql.sock
# Change following line if you want to store your database elsewhere
#datadir        = /var/lib/mysql
";i:1;N;i:2;N;}i:2;i:1101;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1101;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"Now just below [mysqld] section put the following lines";}i:2;i:1309;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1364;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:169:"
[mysqld_multi]
mysqld     = /usr/bin/mysqld_safe
mysqladmin = /usr/bin/mysqladmin
log        = /var/log/mysqld_multi.log
user       = multi_admin
password   = admin123
";i:1;N;i:2;N;}i:2;i:1371;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1371;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:296:"Then to create our desired two instances add the below lines after [mysql_multi] section. We have to define different unique values for each server instance or else the data and socket files for both servers collide and as a result mysql server will fail to start or your data could be corrupted.";}i:2;i:1550;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1846;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:427:"
[mysqld1]
port       = 3306
datadir    = /var/lib/mysql
pid-file   = /var/lib/mysql/mysqld.pid
socket     = /var/lib/mysql/mysql.sock
user       = mysql
log-error  = /var/log/mysql1.err

[mysqld2]
port       = 3307
datadir    = /var/lib/mysql-databases/mysqld2
pid-file   = /var/lib/mysql-databases/mysqld2/mysql.pid
socket     = /var/lib/mysql-databases/mysqld2/mysql.sock
user       = mysql
log-error  = /var/log/mysql2.err
";i:1;N;i:2;N;}i:2;i:1853;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1853;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:155:"Save the configuration file and now create the files and folders as we have mentioned in the above configuration.To do that execute the following commands.";}i:2;i:2290;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2445;}i:41;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:64:"
[root@localhost ~]#  mkdir -P /var/lib/mysql-databases/mysqld2
";i:1;N;i:2;N;}i:2;i:2452;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2452;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"For mysql instance 1 we are using the defaults for previously running mysql server But we need to Create the data directory for instance2.Create it by";}i:2;i:2526;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2676;}i:45;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
[root@localhost ~]# mkdir /var/lib/mysql-databases/mysql
";i:1;N;i:2;N;}i:2;i:2683;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2683;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:195:"Copy the mysql database files from the original instance to the second instances database directory and change the ownership of the data directory to the mysql user so the instance can read them.";}i:2;i:2751;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2946;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:227:"
[root@localhost ~]# cp -r /var/lib/mysql/mysql/ /var/lib/mysql-databases/mysql
[root@localhost ~]# cp -r /var/lib/mysql/mysql/ /var/lib/mysql-databases/mysqld2
[root@localhost ~]# chown -R mysql:mysql /var/lib/mysql-databases
";i:1;N;i:2;N;}i:2;i:2953;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2953;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Now the two instances are ready to run.We can start them by the folowing command";}i:2;i:3190;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3270;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:247:"
[root@localhost ~]#mysqld_multi start
To view the status of the instances you can run
[root@localhost ~]# mysqld_multi report
Output:
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is running
";i:1;N;i:2;N;}i:2;i:3277;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3277;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:106:"You can see that the mysqld_multi script has started multiple mysql processes with the following commands.";}i:2;i:3534;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3640;}i:57;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"
ps -e | grep "mysql"
";i:1;N;i:2;N;}i:2;i:3647;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3647;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"To stop both instances just execute the below command.";}i:2;i:3679;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3733;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:38:"
rhys@linux-n0sm:~> mysqld_multi stop
";i:1;N;i:2;N;}i:2;i:3740;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3740;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:85:"We are also able to control individual instances by referring to the assigned number.";}i:2;i:3788;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3873;}i:65;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:404:"
rhys@linux-n0sm:~> mysqld_multi stop 1

To verify this
rhys@linux-n0sm:~> mysqld_multi report

Reporting MySQL servers
MySQL server from group: mysqld1 is not running
MySQL server from group: mysqld2 is running

rhys@linux-n0sm:~> mysqld_multi start 1
rhys@linux-n0sm:~> mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is running
";i:1;N;i:2;N;}i:2;i:3880;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3880;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:115:"Here you need to remember that both the instances running on different port and also having different socket files.";}i:2;i:4294;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4409;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4409;}i:70;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:4411;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Execution Notes
";}i:2;i:4413;}i:72;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:4429;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4431;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4431;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Check for running mysql processes";}i:2;i:4433;}i:76;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4466;}i:77;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
ps aux | grep mysql
";i:1;N;i:2;N;}i:2;i:4473;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4473;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"If a process is not dying, kill it with,";}i:2;i:4504;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4544;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:13:"
kill -9 PID
";i:1;N;i:2;N;}i:2;i:4551;}i:82;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4551;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"Using killall to kill mysql processes";}i:2;i:4574;}i:84;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4611;}i:85;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:115:"
# killall mysqld
# ps aux|grep mysql
root     12288  0.0  0.0  3508  448 pts/0    S+   16:23   0:00 grep -i mysql
";i:1;N;i:2;N;}i:2;i:4618;}i:86;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4618;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Connect to instance";}i:2;i:4743;}i:88;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4762;}i:89;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:52:"
mysql -h 127.0.0.1 -P 3306[PORT-NUMBER] -u root -p
";i:1;N;i:2;N;}i:2;i:4769;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4769;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Check Mysql status";}i:2;i:4831;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4849;}i:93;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:42:"
service mysql status
service mysql start
";i:1;N;i:2;N;}i:2;i:4856;}i:94;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4856;}i:95;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4908;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"Disable and remove AppArmor on Ubuntu based Linux distributions
";}i:2;i:4910;}i:97;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4974;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4976;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4976;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:379:"AppArmor is security Linux kernel module similar to the SELinux but it’s supposed to be easier to setup and maintain. There are many reasons for you to disable it, primary one is that its security features can get in the way of legitimate applications operation. In this article I’m gonna show you how to disable and remove AppArmor from your Ubuntu based Linux distribution.";}i:2;i:4978;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5357;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5357;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"First we stop apparmor service using following command";}i:2;i:5359;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5413;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:32:"
sudo /etc/init.d/apparmor stop
";i:1;N;i:2;N;}i:2;i:5420;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5420;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"Next thing to do is to disable this service from starting at boot time using Debian update-rc.d tool";}i:2;i:5462;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5562;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
sudo update-rc.d -f apparmor remove
";i:1;N;i:2;N;}i:2;i:5569;}i:110;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5569;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:116:"And at last if we don’t wont the AppArmor bits on our hard drive sectors we use this command to remove it for good";}i:2;i:5616;}i:112;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5732;}i:113;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:83:"
sudo apt-get --purge remove apparmor apparmor-utils libapparmor-perl libapparmor1
";i:1;N;i:2;N;}i:2;i:5739;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5739;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Where is mysql.cnf";}i:2;i:5832;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5850;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:585:"
There is no internal MySQL command to trace this, it's a little too abstract. 
The file might be in 5 (or more?) locations, and they would all be valid 
because they load cascading.

/etc/my.cnf
/etc/mysql/my.cnf
$MYSQL_HOME/my.cnf
[datadir]/my.cnf
~/.my.cnf

Find all instances of my.cnf

mani@mani-ubu12x:~$ sudo find / -name *my*cnf
[sudo] password for mani: 
/etc/mysql-original/conf.d/mysqld_safe_syslog.cnf
/etc/mysql-original/my.cnf
/etc/mysql/conf.d/mysqld_safe_syslog.cnf
/etc/mysql/mywithchanges.cnf
/etc/mysql/my.cnf
/usr/share/doc/mysql-server-5.5/examples/my-small.cnf


";i:1;N;i:2;N;}i:2;i:5857;}i:118;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5857;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"Sources:";}i:2;i:6452;}i:120;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6460;}i:121;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6460;}i:122;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:84:"http://mysqladministrators.blogspot.ca/2012/02/creating-multiple-mysql-instance.html";i:1;N;}i:2;i:6462;}i:123;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6546;}i:124;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:6547;}i:125;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:6549;}i:126;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:88:"http://www.ducea.com/2009/01/19/running-multiple-instances-of-mysql-on-the-same-machine/";i:1;N;}i:2;i:6550;}i:127;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6638;}i:128;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:6639;}i:129;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:6641;}i:130;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:115:"http://teknoteknik.wordpress.com/2010/07/29/how-to-run-multiple-instances-of-mysql-server-on-a-single-linux-server/";i:1;N;}i:2;i:6642;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6757;}i:132;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:6758;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:6760;}i:134;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:118:"http://stackoverflow.com/questions/11657829/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run";i:1;N;}i:2;i:6761;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6879;}i:136;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:6880;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:6882;}i:138;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:77:"http://askubuntu.com/questions/90978/mysql-problem-var-run-mysqld-mysqld-sock";i:1;N;}i:2;i:6883;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6960;}i:140;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:6961;}i:141;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:6963;}i:142;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:93:"http://www.packtpub.com/article/running-multiple-mysql-server-instances-parallel-linux-server";i:1;N;}i:2;i:6964;}i:143;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:7057;}i:144;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:7058;}i:145;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:7060;}i:146;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:90:"http://www.techytalk.info/disable-and-remove-apparmor-on-ubuntu-based-linux-distributions/";i:1;N;}i:2;i:7061;}i:147;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:7151;}i:148;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:7152;}i:149;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:7154;}i:150;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:76:"http://stackoverflow.com/questions/2482234/how-to-know-mysql-my-cnf-location";i:1;N;}i:2;i:7155;}i:151;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:7231;}i:152;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:7232;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:7234;}i:154;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:100:"http://www.linuxquestions.org/questions/linux-newbie-8/using-killall-to-kill-mysql-processes-747607/";i:1;N;}i:2;i:7235;}i:155;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7335;}i:156;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7335;}i:157;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7337;}i:158;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Copy of the Session that actually worked
";}i:2;i:7339;}i:159;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7380;}i:160;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7382;}i:161;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2874:"
mani@mani-ubu12x:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 36
Server version: 5.5.29-0ubuntu0.12.10.1 (Ubuntu)

Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> GRANT SHUTDOWN ON *.* TO 'multi_admin'@'localhost' IDENTIFIED BY 'secret';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

mysql> quit
Bye

mani@mani-ubu12x:~$ sudo service mysql stop
[sudo] password for mani: 
mysql stop/waiting

mani@mani-ubu12x:/etc$ cd mysql
mani@mani-ubu12x:/etc/mysql$ dir
conf.d	debian.cnf  debian-start  my.cnf
mani@mani-ubu12x:/etc/mysql$ sudo sublime my.cnf
mani@mani-ubu12x:/etc/mysql$ mkdir -p /var/lib/mysql-databases/mysqld2
mkdir: cannot create directory `/var/lib/mysql-databases': Permission denied
mani@mani-ubu12x:/etc/mysql$ sudo mkdir -p /var/lib/mysql-databases/mysqld2
mani@mani-ubu12x:/etc/mysql$ sudo cp -r /var/lib/mysql/mysql/ /var/lib/mysql-databases/mysqld2
mani@mani-ubu12x:/etc/mysql$ sudo chown -R mysql:mysql /var/lib/mysql-databases

mani@mani-ubu12x:/etc/mysql$ su -
Password: 
root@mani-ubu12x:~# mysqld_multi start
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is running
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is running
root@mani-ubu12x:~# mysqld_multi stop
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is not running
MySQL server from group: mysqld2 is not running
root@mani-ubu12x:~# mysqld_multi start 1
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is not running
root@mani-ubu12x:~# mysqld_multi stop 1
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is not running
MySQL server from group: mysqld2 is not running
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is not running
MySQL server from group: mysqld2 is not running
root@mani-ubu12x:~# mysqld_multi start 1
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is running
MySQL server from group: mysqld2 is not running
root@mani-ubu12x:~# mysqld_multi stop 1
root@mani-ubu12x:~# mysqld_multi report
Reporting MySQL servers
MySQL server from group: mysqld1 is not running
MySQL server from group: mysqld2 is not running
";i:1;N;i:2;N;}i:2;i:7389;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7389;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"/etc/mysql/my.cnf";}i:2;i:10273;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10290;}i:165;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4721:"
#
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# This will be passed to all mysql clients
# It has been reported that passwords should be enclosed with ticks/quotes
# escpecially if they contain "#" chars...
# Remember to edit /etc/mysql/debian.cnf when changing the socket location.
[client]
port		= 3306
socket		= /var/run/mysqld/mysqld.sock

# Here is entries for some specific programs
# The following values assume you have at least 32M ram

# This was formally known as [safe_mysqld]. Both versions are currently parsed.
[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]
#
# * Basic Settings
#
user		= mysql
pid-file	= /var/run/mysqld/mysqld.pid
#socket		= /var/run/mysqld/mysqld.sock
#port		= 3306
basedir		= /usr
#datadir		= /var/lib/mysql
tmpdir		= /tmp
lc-messages-dir	= /usr/share/mysql
skip-external-locking
#************************************************************
# Multi Instance Configuration
[mysqld_multi]
mysqld     = /usr/bin/mysqld_safe
mysqladmin = /usr/bin/mysqladmin
log        = /var/log/mysqld_multi.log
user       = multi_admin
password   = secret

# Two Instances
[mysqld1]
port       = 3306
datadir    = /var/lib/mysql
pid-file   = /var/lib/mysql/mysqld.pid
socket     = /var/lib/mysql/mysql.sock
user       = mysql
log-error  = /var/log/mysql1.err

[mysqld2]
port       = 3307
datadir    = /var/lib/mysql-databases/mysqld2
pid-file   = /var/lib/mysql-databases/mysqld2/mysql.pid
socket     = /var/lib/mysql-databases/mysqld2/mysql.sock
user       = mysql
log-error  = /var/log/mysql2.err

#************************************************************

#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 127.0.0.1
#
# * Fine Tuning
#
key_buffer		= 16M
max_allowed_packet	= 16M
thread_stack		= 192K
thread_cache_size       = 8
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover         = BACKUP
#max_connections        = 100
#table_cache            = 64
#thread_concurrency     = 10
#
# * Query Cache Configuration
#
query_cache_limit	= 1M
query_cache_size        = 16M
#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id		= 1
#log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size         = 100M
#binlog_do_db		= include_database_name
#binlog_ignore_db	= include_database_name
#
# * InnoDB
#
# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
#
# * Security Features
#
# Read the manual, too, if you want chroot!
# chroot = /var/lib/mysql/
#
# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
#
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem



[mysqldump]
quick
quote-names
max_allowed_packet	= 16M

[mysql]
#no-auto-rehash	# faster start of mysql but no tab completition

[isamchk]
key_buffer		= 16M

#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#
!includedir /etc/mysql/conf.d/


# Multiple Instances
# mysqld_multi test, instance 1
#[mysqld1]
#server-id=10001
#socket=/var/run/mysqld/mysqld1.sock
#port=3306
#pid-file=/var/run/mysqld/mysqld1.pid
#datadir=/var/lib/mysql1
#log_bin=/var/log/mysql1/mysql1-bin.log

# mysqld_multi test, instance 2
#[mysqld2]
#server-id=10002
#socket=/var/run/mysqld/mysqld2.sock
#port=3307
#pid-file=/var/run/mysqld/mysqld2.pid
#datadir=/var/lib/mysql2
#log_bin=/var/log/mysql2/mysql2-bin.log
";i:1;N;i:2;N;}i:2;i:10297;}i:166;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10297;}i:167;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"my.cnf (Original)";}i:2;i:15028;}i:168;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15045;}i:169;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3507:"
#
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# This will be passed to all mysql clients
# It has been reported that passwords should be enclosed with ticks/quotes
# escpecially if they contain "#" chars...
# Remember to edit /etc/mysql/debian.cnf when changing the socket location.
[client]
port		= 3306
socket		= /var/run/mysqld/mysqld.sock

# Here is entries for some specific programs
# The following values assume you have at least 32M ram

# This was formally known as [safe_mysqld]. Both versions are currently parsed.
[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]
#
# * Basic Settings
#
user		= mysql
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
port		= 3306
basedir		= /usr
datadir		= /var/lib/mysql
tmpdir		= /tmp
lc-messages-dir	= /usr/share/mysql
skip-external-locking
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 127.0.0.1
#
# * Fine Tuning
#
key_buffer		= 16M
max_allowed_packet	= 16M
thread_stack		= 192K
thread_cache_size       = 8
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover         = BACKUP
#max_connections        = 100
#table_cache            = 64
#thread_concurrency     = 10
#
# * Query Cache Configuration
#
query_cache_limit	= 1M
query_cache_size        = 16M
#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
#server-id		= 1
#log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size         = 100M
#binlog_do_db		= include_database_name
#binlog_ignore_db	= include_database_name
#
# * InnoDB
#
# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
#
# * Security Features
#
# Read the manual, too, if you want chroot!
# chroot = /var/lib/mysql/
#
# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
#
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem



[mysqldump]
quick
quote-names
max_allowed_packet	= 16M

[mysql]
#no-auto-rehash	# faster start of mysql but no tab completition

[isamchk]
key_buffer		= 16M

#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#
!includedir /etc/mysql/conf.d/

";i:1;N;i:2;N;}i:2;i:15052;}i:170;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Replication Session";i:1;i:1;i:2;i:18569;}i:2;i:18569;}i:171;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:18569;}i:172;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18569;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"MASTER";}i:2;i:18604;}i:174;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18610;}i:175;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1235:"
mani@mani-ubu12x:/etc/mysql$ mysql -h 127.0.0.1 -P 3306 -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.5.29-0ubuntu0.12.10.1-log (Ubuntu)

Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> GRANT REPLICATION SLAVE ON *.* TO mani@localhost IDENTIFIED BY 'india611' WITH GRANT OPTION;
Query OK, 0 rows affected (0.00 sec)

mysql> RESET MASTER;
Query OK, 0 rows affected (0.26 sec)

mysql> FLUSH TABLES WITH READ LOCK;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+------------------+----------+--------------+------------------+
| black-bin.000001 |      107 |              |                  |
+------------------+----------+--------------+------------------+
1 row in set (0.00 sec)

mysql> UNLOCK TABLES;
Query OK, 0 rows affected (0.00 sec)

";i:1;N;i:2;N;}i:2;i:18617;}i:176;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18617;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"DUMP";}i:2;i:19862;}i:178;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19866;}i:179;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:206:"
mani@mani-ubu12x:~/Downloads$ mysqldump -h 127.0.0.1 -P 3306 --all-database --add-drop-table --add-drop-database -u root -p  > /home/mani/mysqld1.dump.sql;
Enter password: 
mani@mani-ubu12x:~/Downloads$ 

";i:1;N;i:2;N;}i:2;i:19873;}i:180;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19873;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"LOAD";}i:2;i:20089;}i:182;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20093;}i:183;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:129:"
mani@mani-ubu12x:~$ mysql -h 127.0.0.1 -P 3307 -u root -p < /home/mani/mysqld1.dump.sql 
Enter password: 
mani@mani-ubu12x:~$ 

";i:1;N;i:2;N;}i:2;i:20100;}i:184;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20100;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"SLAVE";}i:2;i:20239;}i:186;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20244;}i:187;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1117:"
mani@mani-ubu12x:~$ mysql -h 127.0.0.1 -P 3307 -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.5.29-0ubuntu0.12.10.1 (Ubuntu)

Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> STOP SLAVE;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> RESET SLAVE;
Query OK, 0 rows affected (0.00 sec)

mysql> CHANGE MASTER TO MASTER_HOST='localhost', MASTER_USER='root', MASTER_PASSWORD='india611', MASTER_LOG_FILE='black-bin.000001', MASTER_LOG_POS=107;
Query OK, 0 rows affected (0.37 sec)

mysql> START SLAVE;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| manitest           |
| mysql              |
| test               |
+--------------------+
4 rows in set (0.00 sec)

";i:1;N;i:2;N;}i:2;i:20251;}i:188;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21377;}i:189;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:21377;}}