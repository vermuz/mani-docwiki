a:50:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Development Workflow";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:23;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:25;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:475:"
                                                    |---|
                                                    |DEV|  ==> gitdev (clone repo - check if synched and dev)
                                           (push)   |---|     (push)
                                      ====================================     
                                     ||                                  ||
                                   <GIT>                          <SERVER-NAME> 
";i:1;N;i:2;N;}i:2;i:32;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:32;}i:8;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:568;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"SERVER";}i:2;i:570;}i:10;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:576;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:578;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:589;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:172:"
  - SERVER-apache-conf (Access issues)
  - SERVER-Drupal-7-conf (SITE-FOLDER<named as URL>/SETTINGS.PHP)
  - SERVER-Drupal-7-makefiles (SITE FILE<named as SITE URL>)     
";i:1;N;i:2;N;}i:2;i:589;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:589;}i:15;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:771;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"GITDEV";}i:2;i:773;}i:17;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:779;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:781;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:781;}i:20;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:783;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"SERVER-Drupal-7-makefiles
";}i:2;i:785;}i:22;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:811;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:813;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:264:"
git clone SSH-ADDRESS-REPO
git status
git add SITE-NAME.makefile
git diff 
git reset HEAD //to unstage
git diff 
git add SITE-NAME.makefile
git status
git commit -m "SITE-URL : MESSAGE"
git push origin master

FIND .git
 ===> config
git push origin master:master
";i:1;N;i:2;N;}i:2;i:820;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:820;}i:26;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1094;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"PUSH TO LIVE
";}i:2;i:1096;}i:28;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1109;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1111;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:109:"
Add Live

git remote add live ssh:USER@HOSTNAME/REPO/SERVER-Drupal-7-makefiles

git push live master:master
";i:1;N;i:2;N;}i:2;i:1118;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1118;}i:32;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1238;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"SERVER-Drupal-7-conf
";}i:2;i:1240;}i:34;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1261;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1263;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:187:"
.htaccess
SITE-FOLDER NAME (URL)/ Settings.php
git add .htaccess
git add Settings.php
git commit -m "SITE-URL : Initial Site Add"

FIND .git
  ====> config
git push origin master:master
";i:1;N;i:2;N;}i:2;i:1270;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1270;}i:38;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1467;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"PUSH TO LIVE
";}i:2;i:1469;}i:40;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1482;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1484;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:102:"
Add Live
git remote add live ssh:USER@HOSTNAME/REPO/SERVER-Drupal-7-conf
git push live master:master
";i:1;N;i:2;N;}i:2;i:1491;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1491;}i:44;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1603;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"SERVER-apache-conf
";}i:2;i:1605;}i:46;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1624;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1626;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:128:"
cd vhosts.d
edit SITE-URL.conf
git diff
git add SITE-URL.conf
git commit -m "SITE-URL : MESSAGE"
git push origin master:master
";i:1;N;i:2;N;}i:2;i:1633;}i:49;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1633;}}