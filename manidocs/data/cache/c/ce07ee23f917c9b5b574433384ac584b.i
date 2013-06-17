a:365:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"MySQL Commands";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:17;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Start and Stop mysql server";}i:2;i:21;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:48;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:248:"
sudo /etc/init.d/mysql start
kojan:~> sudo /etc/init.d/mysql restart
[sudo] password for chris: 
Stopping MySQL database server: mysqld.
Starting MySQL database server: mysqld.
Checking for corrupt, not cleanly closed and upgrade needing tables..
";i:1;N;i:2;N;}i:2;i:55;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:55;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"Using killall to kill mysql processes";}i:2;i:313;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:350;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:115:"
# killall mysqld
# ps aux|grep mysql
root     12288  0.0  0.0  3508  448 pts/0    S+   16:23   0:00 grep -i mysql
";i:1;N;i:2;N;}i:2;i:357;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:357;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Start SQL Instance";}i:2;i:482;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:500;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:108:"
sudo mysqld_safe --defaults-file=/etc/mysql/my.cnf &
sudo mysqld_safe --defaults-file=/etc/mysql2/my.cnf &
";i:1;N;i:2;N;}i:2;i:507;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:507;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Check Logs";}i:2;i:625;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:635;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
mani@mani-ubuntu:~$ sudo tail -f /var/log/syslog
";i:1;N;i:2;N;}i:2;i:642;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:642;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Permissions";}i:2;i:702;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:713;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
chown -R mysql:mysql *
";i:1;N;i:2;N;}i:2;i:720;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:720;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"To login (from unix shell) use -h only if needed.";}i:2;i:754;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:803;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
# [mysql dir]/bin/mysql -h hostname -u root -p
";i:1;N;i:2;N;}i:2;i:810;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:810;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Create a database ";}i:2;i:868;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:886;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:40:"
mysql> create database [databasename];
";i:1;N;i:2;N;}i:2;i:893;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:893;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"List all databases";}i:2;i:943;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:961;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
mysql> show databases;
";i:1;N;i:2;N;}i:2;i:968;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:968;}i:39;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Switch to a database";}i:2;i:1002;}i:40;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1022;}i:41;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:23:"
mysql> use [db name];
";i:1;N;i:2;N;}i:2;i:1029;}i:42;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1029;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"See all tables";}i:2;i:1062;}i:44;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1076;}i:45;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
mysql> show tables;
";i:1;N;i:2;N;}i:2;i:1083;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1083;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Database field formats";}i:2;i:1114;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1136;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
mysql> describe [table name];
";i:1;N;i:2;N;}i:2;i:1143;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1143;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Delete Database";}i:2;i:1184;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1199;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:39:"
mysql> drop database [database name];
";i:1;N;i:2;N;}i:2;i:1206;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1206;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Delete Table";}i:2;i:1255;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1267;}i:57;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:33:"
mysql> drop table [table name];
";i:1;N;i:2;N;}i:2;i:1274;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1274;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Show all data in a table";}i:2;i:1317;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1341;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:36:"
mysql> SELECT * FROM [table name];
";i:1;N;i:2;N;}i:2;i:1348;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1348;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"Returns the columns and column information pertaining to the designated table.";}i:2;i:1394;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1472;}i:65;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:40:"
mysql> show columns from [table name];
";i:1;N;i:2;N;}i:2;i:1479;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1479;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"Show certain selected rows with the value ";}i:2;i:1529;}i:68;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1571;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"whatever";}i:2;i:1572;}i:70;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1580;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:1581;}i:72;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1582;}i:73;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:68:"
mysql> SELECT * FROM [table name] WHERE [field name] = "whatever";
";i:1;N;i:2;N;}i:2;i:1589;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1589;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"Show all records containing the name ";}i:2;i:1667;}i:76;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1704;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"Bob";}i:2;i:1705;}i:78;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1708;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:" AND the phone number '3444444'.";}i:2;i:1709;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1741;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:84:"
mysql> SELECT * FROM [table name] WHERE name = "Bob" AND phone_number = '3444444';
";i:1;N;i:2;N;}i:2;i:1748;}i:82;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1748;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Show all records not containing the name ";}i:2;i:1842;}i:84;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:1883;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"Bob";}i:2;i:1884;}i:86;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:1887;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" AND the phone number '3444444' order by the phone_number field.";}i:2;i:1888;}i:88;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1952;}i:89;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:107:"
mysql> SELECT * FROM [table name] WHERE name != "Bob" AND phone_number = '3444444' order by phone_number;
";i:1;N;i:2;N;}i:2;i:1959;}i:90;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1959;}i:91;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Show all records starting with the letters 'bob' AND the phone number '3444444'.";}i:2;i:2076;}i:92;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2156;}i:93;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
mysql> SELECT * FROM [table name] WHERE name like "Bob%" AND phone_number = '3444444';
";i:1;N;i:2;N;}i:2;i:2163;}i:94;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2163;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:108:"Show all records starting with the letters 'bob' AND the phone number '3444444' limit to records 1 through 5";}i:2;i:2261;}i:96;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2369;}i:97;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:98:"
mysql> SELECT * FROM [table name] WHERE name like "Bob%" AND phone_number = '3444444' limit 1,5;
";i:1;N;i:2;N;}i:2;i:2376;}i:98;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2376;}i:99;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Use a regular expression to find records. Use ";}i:2;i:2484;}i:100;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:2530;}i:101;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"REGEXP BINARY";}i:2;i:2531;}i:102;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2544;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:" to force case-sensitivity. This finds any record beginning with a";}i:2;i:2545;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2611;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
mysql> SELECT * FROM [table name] WHERE rec RLIKE "^a";
";i:1;N;i:2;N;}i:2;i:2618;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2618;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Show unique records";}i:2;i:2685;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2704;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
mysql> SELECT DISTINCT [column name] FROM [table name];
";i:1;N;i:2;N;}i:2;i:2711;}i:110;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2711;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"Show selected records sorted in an ascending (asc) or descending (desc).";}i:2;i:2778;}i:112;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2850;}i:113;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
mysql> SELECT [col1],[col2] FROM [table name] ORDER BY [col2] DESC;
";i:1;N;i:2;N;}i:2;i:2857;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2857;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Return number of rows";}i:2;i:2936;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2957;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"
mysql> SELECT COUNT(*) FROM [table name];
";i:1;N;i:2;N;}i:2;i:2964;}i:118;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2964;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Sum column.";}i:2;i:3017;}i:120;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3028;}i:121;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:41:"
mysql> SELECT SUM(*) FROM [table name];
";i:1;N;i:2;N;}i:2;i:3035;}i:122;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3035;}i:123;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Join tables on common columns.";}i:2;i:3086;}i:124;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3116;}i:125;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:207:"
mysql> select lookup.illustrationid, lookup.personid,person.birthday from lookup left join person
on lookup.personid=person.personid=statement to join birthday in person table with primary illustration id;
";i:1;N;i:2;N;}i:2;i:3123;}i:126;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3123;}i:127;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:93:"Creating a new user. Login as root. Switch to the MySQL db. Make the user. Update privileges.";}i:2;i:3340;}i:128;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3433;}i:129;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:153:"
# mysql -u root -p
mysql> use mysql;
mysql> INSERT INTO user (Host,User,Password)
VALUES('%','username',PASSWORD('password'));
mysql> flush privileges;
";i:1;N;i:2;N;}i:2;i:3440;}i:130;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3440;}i:131;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"Change a users password from unix shell.";}i:2;i:3603;}i:132;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3643;}i:133;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:90:"
# [mysql dir]/bin/mysqladmin -u username -h hostname.blah.org -p password 'new-password'
";i:1;N;i:2;N;}i:2;i:3650;}i:134;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3650;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:94:"Change a users password from MySQL prompt. Login as root. Set the password. Update privileges.";}i:2;i:3750;}i:136;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3844;}i:137;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:115:"
# mysql -u root -p
mysql> SET PASSWORD FOR 'user'@'hostname' =
PASSWORD('passwordhere');
mysql> flush privileges;
";i:1;N;i:2;N;}i:2;i:3851;}i:138;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3851;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:174:"Recover a MySQL root password. Stop the MySQL server process. Start again with no grant tables.
Login to MySQL as root. Set new password. Exit MySQL and restart MySQL server.";}i:2;i:3976;}i:140;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4150;}i:141;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:263:"
# /etc/init.d/mysql stop
# mysqld_safe --skip-grant-tables &
# mysql -u root
mysql> use mysql;
mysql> update user set password=PASSWORD("newrootpassword")
where User='root';
mysql> flush privileges;
mysql> quit
# /etc/init.d/mysql stop
# /etc/init.d/mysql start
";i:1;N;i:2;N;}i:2;i:4157;}i:142;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4157;}i:143;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"Set a root password if there is on root password.";}i:2;i:4430;}i:144;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4479;}i:145;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"
# mysqladmin -u root password newpassword
";i:1;N;i:2;N;}i:2;i:4486;}i:146;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4486;}i:147;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Update a root password.";}i:2;i:4539;}i:148;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4562;}i:149;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
# mysqladmin -u root -p oldpassword newpassword
";i:1;N;i:2;N;}i:2;i:4569;}i:150;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4569;}i:151;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Allow the user ";}i:2;i:4628;}i:152;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4643;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"mani";}i:2;i:4644;}i:154;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4648;}i:155;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:" to connect to the server from localhost using the password ";}i:2;i:4649;}i:156;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4709;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"passwd";}i:2;i:4710;}i:158;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4716;}i:159;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:". Login as
root. Switch to the MySQL db. Give privileges. Update privileges.";}i:2;i:4717;}i:160;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4793;}i:161;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:131:"
# mysql -u root -p
mysql> use mysql;
mysql> grant usage on *.* to mani@localhost identified by 'passwd';
mysql> flush privileges;
";i:1;N;i:2;N;}i:2;i:4800;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4800;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:106:"Give user privilages for a db. Login as root. Switch to the MySQL db. Grant privileges. Update privileges.";}i:2;i:4941;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5047;}i:165;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:333:"
# mysql -u root -p
mysql> use mysql;
mysql> INSERT INTO db
(Host,Db,User,Select_priv,Insert_priv,Update_priv,Delete_priv ,Create_priv,Drop_priv) VALUES
('%','databasename','username','Y','Y','Y','Y','Y','N');
mysql> flush privileges;

or

mysql> grant all privileges on databasename.* to
username@localhost;
mysql> flush privileges
";i:1;N;i:2;N;}i:2;i:5054;}i:166;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5054;}i:167;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"To update info already in a table";}i:2;i:5397;}i:168;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5430;}i:169;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:115:"
mysql> UPDATE [table name] SET Select_priv = 'Y',Insert_priv = 'Y',Update_priv = 'Y' where [field name] = 'user';
";i:1;N;i:2;N;}i:2;i:5437;}i:170;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5437;}i:171;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:28:"Delete a row(s) from a table";}i:2;i:5562;}i:172;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5590;}i:173;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
mysql> DELETE from [table name] where [field name] = 'whatever';
";i:1;N;i:2;N;}i:2;i:5597;}i:174;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5597;}i:175;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"Update database permissions/privilages";}i:2;i:5673;}i:176;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5711;}i:177;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:26:"
mysql> flush privileges;
";i:1;N;i:2;N;}i:2;i:5718;}i:178;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5718;}i:179;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Delete a column.";}i:2;i:5754;}i:180;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5770;}i:181;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
mysql> alter table [table name] drop column [column name];
";i:1;N;i:2;N;}i:2;i:5777;}i:182;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5777;}i:183;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Add a new column to db";}i:2;i:5847;}i:184;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5869;}i:185;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:76:"
mysql> alter table [table name] add column [new column name] varchar (20);
";i:1;N;i:2;N;}i:2;i:5876;}i:186;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5876;}i:187;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Change column name.";}i:2;i:5962;}i:188;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5981;}i:189;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:90:"
mysql> alter table [table name] change [old column name] [new column name] varchar (50);
";i:1;N;i:2;N;}i:2;i:5988;}i:190;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5988;}i:191;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Make a unique column so you get no duplicates.";}i:2;i:6088;}i:192;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6134;}i:193;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:61:"
mysql> alter table [table name] add unique ([column name]);
";i:1;N;i:2;N;}i:2;i:6141;}i:194;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6141;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Make a column bigger.";}i:2;i:6212;}i:196;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6233;}i:197;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
mysql> alter table [table name] modify [column name] VARCHAR(3);
";i:1;N;i:2;N;}i:2;i:6240;}i:198;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6240;}i:199;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Delete unique from table.";}i:2;i:6316;}i:200;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6341;}i:201;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
mysql> alter table [table name] drop index [colmn name];
";i:1;N;i:2;N;}i:2;i:6348;}i:202;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6348;}i:203;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Load a CSV file into a table.";}i:2;i:6416;}i:204;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6445;}i:205;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:151:"
mysql> LOAD DATA INFILE '/tmp/filename.csv' replace INTO TABLE [table name] FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (field1,field2,field3);
";i:1;N;i:2;N;}i:2;i:6452;}i:206;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6452;}i:207;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Dump all databases for backup. Backup file is sql commands to recreate all db's.";}i:2;i:6613;}i:208;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6693;}i:209;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:77:"
# [mysql dir]/bin/mysqldump -u root -ppassword --opt >/tmp/alldatabases.sql
";i:1;N;i:2;N;}i:2;i:6700;}i:210;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6700;}i:211;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Dump one database for backup.";}i:2;i:6787;}i:212;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6816;}i:213;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:100:"
# [mysql dir]/bin/mysqldump -u username -ppassword --databases databasename >/tmp/databasename.sql
";i:1;N;i:2;N;}i:2;i:6823;}i:214;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6823;}i:215;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Dump a table from a database.";}i:2;i:6933;}i:216;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6962;}i:217;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:112:"
# [mysql dir]/bin/mysqldump -c -u username -ppassword databasename tablename > /tmp/databasename.tablename.sql
";i:1;N;i:2;N;}i:2;i:6969;}i:218;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6969;}i:219;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"Restore database (or database table) from backup.";}i:2;i:7091;}i:220;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7140;}i:221;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:85:"
# [mysql dir]/bin/mysql -u username -ppassword databasename < /tmp/databasename.sql
";i:1;N;i:2;N;}i:2;i:7147;}i:222;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7147;}i:223;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Create Table Example 1";}i:2;i:7242;}i:224;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7264;}i:225;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:293:"
mysql> CREATE TABLE [table name] (firstname VARCHAR(20),
middleinitial VARCHAR(3), lastname VARCHAR(35),suffix
VARCHAR(3),officeid VARCHAR(10),userid VARCHAR(15),username
VARCHAR(8),email VARCHAR(35),phone VARCHAR(25), groups
VARCHAR(15),datestamp DATE,timestamp time,pgpemail
VARCHAR(255));
";i:1;N;i:2;N;}i:2;i:7271;}i:226;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7271;}i:227;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Create Table Example 2";}i:2;i:7574;}i:228;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7596;}i:229;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:170:"
mysql> create table [table name] (personid int(50) not null
auto_increment primary key,firstname varchar(35),middlename
varchar(50),lastnamevarchar(50) default 'bato');
";i:1;N;i:2;N;}i:2;i:7603;}i:230;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7603;}i:231;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7783;}i:232;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"20 MySQL (Mysqladmin) Commands for Database Administration in Linux
";}i:2;i:7785;}i:233;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7853;}i:234;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7855;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7855;}i:236;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"1. How to set MySQL Root password?";}i:2;i:7857;}i:237;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7891;}i:238;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:47:"
# mysqladmin -u root password YOURNEWPASSWORD
";i:1;N;i:2;N;}i:2;i:7898;}i:239;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7898;}i:240;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"2. How to Change MySQL Root password?";}i:2;i:7955;}i:241;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7992;}i:242;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:47:"
mysqladmin -u root -p123456 password 'xyz123'
";i:1;N;i:2;N;}i:2;i:7999;}i:243;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7999;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"3. How to check MySQL Server is running?";}i:2;i:8056;}i:245;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8096;}i:246;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:63:"
# mysqladmin -u root -p ping

Enter password:
mysqld is alive
";i:1;N;i:2;N;}i:2;i:8103;}i:247;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8103;}i:248;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"4. How to Check which MySQL version I am running?";}i:2;i:8176;}i:249;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8225;}i:250;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:645:"
# mysqladmin -u root -p version

Enter password:
mysqladmin  Ver 8.42 Distrib 5.5.28, for Linux on i686
Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version          5.5.28
Protocol version        10
Connection              Localhost via UNIX socket
UNIX socket             /var/lib/mysql/mysql.sock
Uptime:                 7 days 14 min 45 sec

Threads: 2  Questions: 36002  Slow queries: 0  Opens: 15  Flush tables: 1  Open tables: 8  Queries per second avg: 0.059
";i:1;N;i:2;N;}i:2;i:8232;}i:251;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8232;}i:252;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"5. How to Find out current Status of MySQL server?";}i:2;i:8887;}i:253;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8937;}i:254;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:197:"
# mysqladmin -u root -ptmppassword status

Enter password:
Uptime: 606704  Threads: 2  Questions: 36003  Slow queries: 0  Opens: 15  Flush tables: 1  Open tables: 8  Queries per second avg: 0.059
";i:1;N;i:2;N;}i:2;i:8944;}i:255;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8944;}i:256;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"6. How to check status of all MySQL Server Variable’s and value’s?";}i:2;i:9151;}i:257;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9221;}i:258;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1356:"
# mysqladmin -u root -p extended-status

Enter password:
+------------------------------------------+-------------+
| Variable_name                            | Value       |
+------------------------------------------+-------------+
| Aborted_clients                          | 3           |
| Aborted_connects                         | 3           |
| Binlog_cache_disk_use                    | 0           |
| Binlog_cache_use                         | 0           |
| Binlog_stmt_cache_disk_use               | 0           |
| Binlog_stmt_cache_use                    | 0           |
| Bytes_received                           | 6400357     |
| Bytes_sent                               | 2610105     |
| Com_admin_commands                       | 3           |
| Com_assign_to_keycache                   | 0           |
| Com_alter_db                             | 0           |
| Com_alter_db_upgrade                     | 0           |
| Com_alter_event                          | 0           |
| Com_alter_function                       | 0           |
| Com_alter_procedure                      | 0           |
| Com_alter_server                         | 0           |
| Com_alter_table                          | 0           |
| Com_alter_tablespace                     | 0           |
+------------------------------------------+-------------+
";i:1;N;i:2;N;}i:2;i:9228;}i:259;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9228;}i:260;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"7. How to see all MySQL server Variables and Values?";}i:2;i:10594;}i:261;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10646;}i:262;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2578:"
# mysqladmin  -u root -p variables

Enter password:
+---------------------------------------------------+----------------------------------------------+
| Variable_name                                     | Value                                        |
+---------------------------------------------------+----------------------------------------------+
| auto_increment_increment                          | 1                                            |
| auto_increment_offset                             | 1                                            |
| autocommit                                        | ON                                           |
| automatic_sp_privileges                           | ON                                           |
| back_log                                          | 50                                           |
| basedir                                           | /usr                                         |
| big_tables                                        | OFF                                          |
| binlog_cache_size                                 | 32768                                        |
| binlog_direct_non_transactional_updates           | OFF                                          |
| binlog_format                                     | STATEMENT                                    |
| binlog_stmt_cache_size                            | 32768                                        |
| bulk_insert_buffer_size                           | 8388608                                      |
| character_set_client                              | latin1                                       |
| character_set_connection                          | latin1                                       |
| character_set_database                            | latin1                                       |
| character_set_filesystem                          | binary                                       |
| character_set_results                             | latin1                                       |
| character_set_server                              | latin1                                       |
| character_set_system                              | utf8                                         |
| character_sets_dir                                | /usr/share/mysql/charsets/                   |
| collation_connection                              | latin1_swedish_ci                            |
+---------------------------------------------------+----------------------------------------------+
";i:1;N;i:2;N;}i:2;i:10653;}i:263;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10653;}i:264;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"8. How to check all the running Process of MySQL server?";}i:2;i:13241;}i:265;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13297;}i:266;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:606:"
# mysqladmin -u root -p processlist

Enter password:
+-------+---------+-----------------+---------+---------+------+-------+------------------+
| Id    | User    | Host            | db      | Command | Time | State | Info             |
+-------+---------+-----------------+---------+---------+------+-------+------------------+
| 18001 | rsyslog | localhost:38307 | rsyslog | Sleep   | 5590 |       |                  |
| 18020 | root    | localhost       |         | Query   | 0    |       | show processlist |
+-------+---------+-----------------+---------+---------+------+-------+------------------+
";i:1;N;i:2;N;}i:2;i:13304;}i:267;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13304;}i:268;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"9. How to create a Database in MySQL server?";}i:2;i:13920;}i:269;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13964;}i:270;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:62:"
# mysqladmin -u root -p create databasename

Enter password:
";i:1;N;i:2;N;}i:2;i:13971;}i:271;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:725:"
# mysql -u root -p

Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18027
Server version: 5.5.28 MySQL Community Server (GPL) by Remi

Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| databasename       |
| mysql              |
| test               |
+--------------------+
8 rows in set (0.01 sec)

mysql>
";i:1;N;i:2;N;}i:2;i:14048;}i:272;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14048;}i:273;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"10. How to drop a Database in MySQL server?";}i:2;i:14783;}i:274;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14826;}i:275;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:268:"
# mysqladmin -u root -p drop databasename

Enter password:
Dropping the database is potentially a very bad thing to do.
Any data stored in the database will be destroyed.

Do you really want to drop the 'databasename' database [y/N] y
Database "databasename" dropped
";i:1;N;i:2;N;}i:2;i:14833;}i:276;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14833;}i:277;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"11. How to reload/refresh MySQL Privileges?";}i:2;i:15111;}i:278;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15154;}i:279;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"
# mysqladmin -u root -p reload;
# mysqladmin -u root -p refresh
";i:1;N;i:2;N;}i:2;i:15161;}i:280;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15161;}i:281;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"12. How to shutdown MySQL server Safely?";}i:2;i:15236;}i:282;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15276;}i:283;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
mysqladmin -u root -p shutdown

Enter password:
";i:1;N;i:2;N;}i:2;i:15283;}i:284;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15283;}i:285;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"You can also use the following commands to start/stop MySQL server.";}i:2;i:15342;}i:286;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15409;}i:287;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:54:"
# /etc/init.d/mysqld stop
# /etc/init.d/mysqld start
";i:1;N;i:2;N;}i:2;i:15416;}i:288;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15416;}i:289;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"13. Some useful MySQL Flush commands";}i:2;i:15480;}i:290;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15517;}i:291;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:15517;}i:292;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15517;}i:293;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15517;}i:294;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:" flush-hosts: Flush all host information from host cache.";}i:2;i:15521;}i:295;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15578;}i:296;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15578;}i:297;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15578;}i:298;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15578;}i:299;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:" flush-tables: Flush all tables.";}i:2;i:15582;}i:300;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15614;}i:301;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15614;}i:302;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15614;}i:303;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15614;}i:304;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" flush-threads: Flush all threads cache.";}i:2;i:15618;}i:305;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15658;}i:306;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15658;}i:307;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15658;}i:308;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15658;}i:309;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" flush-logs: Flush all information logs.";}i:2;i:15662;}i:310;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15702;}i:311;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15702;}i:312;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15702;}i:313;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15702;}i:314;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:" flush-privileges: Reload the grant tables (same as reload).";}i:2;i:15706;}i:315;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15766;}i:316;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15766;}i:317;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:15766;}i:318;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:15766;}i:319;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:" flush-status: Clear status variables.";}i:2;i:15770;}i:320;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:15808;}i:321;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:15808;}i:322;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:15808;}i:323;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:225:"
# mysqladmin -u root -p flush-hosts
# mysqladmin -u root -p flush-tables
# mysqladmin -u root -p flush-threads
# mysqladmin -u root -p flush-logs
# mysqladmin -u root -p flush-privileges
# mysqladmin -u root -p flush-status
";i:1;N;i:2;N;}i:2;i:15815;}i:324;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15815;}i:325;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"14. How to kill Sleeping MySQL Client Process?";}i:2;i:16050;}i:326;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16096;}i:327;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:492:"
# mysqladmin -u root -p processlist

Enter password:
+----+------+-----------+----+---------+------+-------+------------------+
| Id | User | Host      | db | Command | Time | State | Info             |
+----+------+-----------+----+---------+------+-------+------------------+
| 5  | root | localhost |    | Sleep   | 14   |       |					 |
| 8  | root | localhost |    | Query   | 0    |       | show processlist |
+----+------+-----------+----+---------+------+-------+------------------+
";i:1;N;i:2;N;}i:2;i:16103;}i:328;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:424:"
# mysqladmin -u root -p kill 5

Enter password:
+----+------+-----------+----+---------+------+-------+------------------+
| Id | User | Host      | db | Command | Time | State | Info             |
+----+------+-----------+----+---------+------+-------+------------------+
| 12 | root | localhost |    | Query   | 0    |       | show processlist |
+----+------+-----------+----+---------+------+-------+------------------+
";i:1;N;i:2;N;}i:2;i:16610;}i:329;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
# mysqladmin -u root -p kill 5,10
";i:1;N;i:2;N;}i:2;i:17049;}i:330;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17049;}i:331;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"15. How to run multiple mysqladmin commands together?";}i:2;i:17094;}i:332;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17147;}i:333;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1168:"
# mysqladmin  -u root -p processlist status version

Enter password:
+----+------+-----------+----+---------+------+-------+------------------+
| Id | User | Host      | db | Command | Time | State | Info             |
+----+------+-----------+----+---------+------+-------+------------------+
| 8  | root | localhost |    | Query   | 0    |       | show processlist |
+----+------+-----------+----+---------+------+-------+------------------+
Uptime: 3801  Threads: 1  Questions: 15  Slow queries: 0  Opens: 15  Flush tables: 1  Open tables: 8  Queries per second avg: 0.003
mysqladmin  Ver 8.42 Distrib 5.5.28, for Linux on i686
Copyright (c) 2000, 2012, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version          5.5.28
Protocol version        10
Connection              Localhost via UNIX socket
UNIX socket             /var/lib/mysql/mysql.sock
Uptime:                 1 hour 3 min 21 sec

Threads: 1  Questions: 15  Slow queries: 0  Opens: 15  Flush tables: 1  Open tables: 8  Queries per second avg: 0.003
";i:1;N;i:2;N;}i:2;i:17154;}i:334;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17154;}i:335;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"16. How to Connect remote mysql server";}i:2;i:18332;}i:336;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18370;}i:337;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"
# mysqladmin  -h 172.16.25.126 -u root -p
";i:1;N;i:2;N;}i:2;i:18377;}i:338;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18377;}i:339;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"17. How to execute command on remote MySQL server";}i:2;i:18430;}i:340;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18479;}i:341;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
# mysqladmin  -h 172.16.25.126 -u root -p status
";i:1;N;i:2;N;}i:2;i:18486;}i:342;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18486;}i:343;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"18. How to start/stop MySQL replication on a slave server?";}i:2;i:18546;}i:344;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18604;}i:345;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:74:"
# mysqladmin  -u root -p start-slave
# mysqladmin  -u root -p stop-slave
";i:1;N;i:2;N;}i:2;i:18611;}i:346;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18611;}i:347;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"19. How to store MySQL server Debug Information to logs?";}i:2;i:18695;}i:348;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18751;}i:349;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
# mysqladmin  -u root -p debug

Enter password:
";i:1;N;i:2;N;}i:2;i:18758;}i:350;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18758;}i:351;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"20. How to view mysqladmin options and usage";}i:2;i:18817;}i:352;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18861;}i:353;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
# mysqladmin --help
";i:1;N;i:2;N;}i:2;i:18868;}i:354;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18868;}i:355;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Useful commands: ";}i:2;i:18899;}i:356;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:49:"http://crashmag.net/list-of-useful-mysql-commands";i:1;N;}i:2;i:18916;}i:357;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18965;}i:358;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18965;}i:359;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:18967;}i:360;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Drush Check Database with Website credentials
";}i:2;i:18969;}i:361;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:19015;}i:362;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19017;}i:363;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
mani@relentless:/srv/www/VRE/sites/etc.lib.unb.ca.acva.contestedterrain> drush sql-cli
";i:1;N;i:2;N;}i:2;i:19024;}i:364;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:19024;}}