a:186:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"MySQL Python";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:15;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Install Mysql";}i:2;i:19;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:32;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
$ sudo apt-get install mysql-server
";i:1;N;i:2;N;}i:2;i:39;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:39;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:101:"We don't know the package name for the MySQLdb module. We use the apt-cache command to figure it out.";}i:2;i:86;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:187;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:235:"
$ apt-cache search MySQLdb
python-mysqldb - A Python interface to MySQL
python-mysqldb-dbg - A Python interface to MySQL (debug extension)
bibus - bibliographic database
eikazo - graphical frontend for SANE designed for mass-scanning
";i:1;N;i:2;N;}i:2;i:194;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:194;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"Python interface to the MySQL database";}i:2;i:439;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:477;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:39:"
$ sudo apt-get install python-mysqldb
";i:1;N;i:2;N;}i:2;i:484;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:484;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"create a new database user and a new database";}i:2;i:533;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:578;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:229:"
$ mysql -u root -p
mysql> SHOW DATABASES;
mysql> CREATE DATABASE testdb;
mysql> CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test623';
mysql> USE testdb;
mysql> GRANT ALL ON testdb.* TO 'testuser'@'localhost';
mysql> quit;
";i:1;N;i:2;N;}i:2;i:585;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:585;}i:23;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:824;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"_mysql module";}i:2;i:826;}i:25;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:839;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:841;}i:27;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:841;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"The _mysql module implements the MySQL C ";}i:2;i:843;}i:29;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:884;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:" directly. It is not compatible with the Python DB ";}i:2;i:887;}i:31;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:938;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:" interface. Generally, the programmers prefer the object oriented MySQLdb module.";}i:2;i:941;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1022;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1022;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"version of the MySQL database.";}i:2;i:1024;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1054;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:456:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import _mysql
import sys


con = None

try:

    con = _mysql.connect('localhost', 'testuser', 
        'test623', 'testdb')
        
    con.query("SELECT VERSION()")
    result = con.use_result()
    
    print "MySQL version: %s" % \
        result.fetch_row()[0]
    
except _mysql.Error, e:
  
    print "Error %d: %s" % (e.args[0], e.args[1])
    sys.exit(1)

finally:
    
    if con:
        con.close()
";i:1;N;i:2;N;}i:2;i:1062;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1062;}i:39;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1528;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"MySQLdb module";}i:2;i:1530;}i:41;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1544;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1546;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1546;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"MySQLdb is a thin Python wrapper around _mysql. It is compatible with the Python DB ";}i:2;i:1548;}i:45;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:1632;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:", which makes the code more portable. Using this model is the preferred way of working with the MySQL.";}i:2;i:1635;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1737;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1737;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"version of the MySQL database.";}i:2;i:1739;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1769;}i:51;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:465:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys

con = None

try:

    con = mdb.connect('localhost', 'testuser', 
        'test623', 'testdb');

    cur = con.cursor()
    cur.execute("SELECT VERSION()")

    data = cur.fetchone()
    
    print "Database version : %s " % data
    
except mdb.Error, e:
  
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
    
finally:    
        
    if con:    
        con.close()
";i:1;N;i:2;N;}i:2;i:1776;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1776;}i:53;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:2251;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Execution";}i:2;i:2253;}i:55;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:2262;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2264;}i:57;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
>>> 
Database version : 5.5.29-0ubuntu0.12.04.1 
";i:1;N;i:2;N;}i:2;i:2271;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2271;}i:59;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2331;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Creating and populating a table";}i:2;i:2333;}i:61;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2364;}i:62;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2366;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2366;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"create a table and populate it with some data.";}i:2;i:2368;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2414;}i:66;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:647:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys

con = mdb.connect('localhost', 'testuser', 'test623', 'testdb');

with con:
    
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS \
        Writers(Id INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(25))")
    cur.execute("INSERT INTO Writers(Name) VALUES('Jack London')")
    cur.execute("INSERT INTO Writers(Name) VALUES('Honore de Balzac')")
    cur.execute("INSERT INTO Writers(Name) VALUES('Lion Feuchtwanger')")
    cur.execute("INSERT INTO Writers(Name) VALUES('Emile Zola')")
    cur.execute("INSERT INTO Writers(Name) VALUES('Truman Capote')")

";i:1;N;i:2;N;}i:2;i:2421;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2421;}i:68;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3078;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Retrieving data";}i:2;i:3080;}i:70;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3095;}i:71;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3097;}i:72;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:297:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys


con = mdb.connect('localhost', 'testuser', 
        'test623', 'testdb');

with con: 

    cur = con.cursor()
    cur.execute("SELECT * FROM Writers")

    rows = cur.fetchall()

    for row in rows:
        print row
";i:1;N;i:2;N;}i:2;i:3104;}i:73;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3104;}i:74;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:3411;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Execution:";}i:2;i:3413;}i:76;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:3423;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3425;}i:78;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:196:"
>>> ================================ RESTART ================================
>>> 
(1L, 'Jack London')
(2L, 'Honore de Balzac')
(3L, 'Lion Feuchtwanger')
(4L, 'Emile Zola')
(5L, 'Truman Capote')
";i:1;N;i:2;N;}i:2;i:3432;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3432;}i:80;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3638;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Fetch rows one by one";}i:2;i:3640;}i:82;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3661;}i:83;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3663;}i:84;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:346:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys


con = mdb.connect('localhost', 'testuser', 
    'test623', 'testdb');

with con:

    cur = con.cursor()
    cur.execute("SELECT * FROM Writers")

    numrows = int(cur.rowcount)

    for i in range(numrows):
        row = cur.fetchone()
        print row[0], row[1]
";i:1;N;i:2;N;}i:2;i:3670;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3670;}i:86;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:4026;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Execution:";}i:2;i:4028;}i:88;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:4038;}i:89;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4040;}i:90;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:166:"
>>> ================================ RESTART ================================
>>> 
1 Jack London
2 Honore de Balzac
3 Lion Feuchtwanger
4 Emile Zola
5 Truman Capote
";i:1;N;i:2;N;}i:2;i:4047;}i:91;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4047;}i:92;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4223;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"The dictionary cursor
";}i:2;i:4225;}i:94;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4247;}i:95;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4249;}i:96;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4249;}i:97;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:253:"There are multiple cursor types in the MySQLdb module. The default cursor returns the data in a tuple of tuples. When we use a dictionary cursor, the data is sent in a form of Python dictionaries. This way we can refer to the data by their column names.";}i:2;i:4251;}i:98;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4504;}i:99;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:343:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys

con = mdb.connect('localhost', 'testuser', 
    'test623', 'testdb')

with con:

    cur = con.cursor(mdb.cursors.DictCursor)
    cur.execute("SELECT * FROM Writers")

    rows = cur.fetchall()

    for row in rows:
        print "%s %s" % (row["Id"], row["Name"])
";i:1;N;i:2;N;}i:2;i:4511;}i:100;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4511;}i:101;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:4864;}i:102;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Execution";}i:2;i:4866;}i:103;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:4875;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4877;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:93:"
>>> 
1 Jack London
2 Honore de Balzac
3 Lion Feuchtwanger
4 Emile Zola
5 Truman Capote
>>> 
";i:1;N;i:2;N;}i:2;i:4884;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4884;}i:107;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4987;}i:108;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Column headers
";}i:2;i:4989;}i:109;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5004;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5006;}i:111;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5006;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:"Print column headers with the data from the database table.";}i:2;i:5008;}i:113;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5067;}i:114;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:383:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys


con = mdb.connect('localhost', 'testuser', 
    'test623', 'testdb')

with con:

    cur = con.cursor()
    cur.execute("SELECT * FROM Writers")

    rows = cur.fetchall()

    desc = cur.description

    print "%s %3s" % (desc[0][0], desc[1][0])

    for row in rows:    
        print "%2s %3s" % row

";i:1;N;i:2;N;}i:2;i:5074;}i:115;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5074;}i:116;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:5467;}i:117;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Execution
";}i:2;i:5469;}i:118;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:5479;}i:119;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:5481;}i:120;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5487;}i:121;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"
Id Name
 1 Jack London
 2 Honore de Balzac
 3 Lion Feuchtwanger
 4 Emile Zola
 5 Truman Capote
";i:1;N;i:2;N;}i:2;i:5487;}i:122;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5487;}i:123;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5593;}i:124;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Prepared Statements";}i:2;i:5595;}i:125;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5614;}i:126;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5616;}i:127;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5616;}i:128;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:184:"When we write prepared statements, we use placeholders instead of directly writing the values into the statements. Prepared statements increase security and performance. The Python DB ";}i:2;i:5618;}i:129;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:5802;}i:130;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:" specification suggests 5 different ways how to build prepared statements. MySQLdb module supports one of them, the ANSI printf format codes.";}i:2;i:5805;}i:131;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5946;}i:132;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:366:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys


con = mdb.connect('localhost', 'testuser', 
    'test623', 'testdb')
    
with con:    

    cur = con.cursor()
        
    cur.execute("UPDATE Writers SET Name = %s WHERE Id = %s", 
        ("Guy de Maupasant", "4"))        
    
    print "Number of rows updated: %d" % cur.rowcount

";i:1;N;i:2;N;}i:2;i:5953;}i:133;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5953;}i:134;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:6329;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Execution
";}i:2;i:6331;}i:136;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:6341;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:6343;}i:138;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6349;}i:139;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
>>> 
Number of rows updated: 1
>>> 
";i:1;N;i:2;N;}i:2;i:6349;}i:140;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6349;}i:141;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6396;}i:142;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Writing images
";}i:2;i:6398;}i:143;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6413;}i:144;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6415;}i:145;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6415;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:311:"Some people prefer to put their images into the database, some prefer to keep them on the file system for their applications. Technical difficulties arise when we work with millions of images. Images are binary data. MySQL database has a special data type to store binary data called BLOB (Binary Large Object).";}i:2;i:6417;}i:147;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6728;}i:148;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6728;}i:149;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Create table called Images";}i:2;i:6730;}i:150;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6756;}i:151;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:81:"
mysql> CREATE TABLE Images(Id INT PRIMARY KEY AUTO_INCREMENT, Data MEDIUMBLOB);
";i:1;N;i:2;N;}i:2;i:6763;}i:152;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6763;}i:153;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"Read a png image and insert it into the Images table";}i:2;i:6854;}i:154;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6906;}i:155;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:601:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys

try:
    fin = open("chrome.png")
    img = fin.read()
    fin.close()

except IOError, e:

    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)

 
try:
    conn = mdb.connect(host='localhost',user='testuser',
       passwd='test623', db='testdb')
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Images SET Data='%s'" % \
        mdb.escape_string(img))

    conn.commit()

    cursor.close()
    conn.close()

except mdb.Error, e:
  
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
";i:1;N;i:2;N;}i:2;i:6913;}i:156;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6913;}i:157;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7524;}i:158;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"Reading images";}i:2;i:7526;}i:159;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7540;}i:160;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7542;}i:161;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7542;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"We are going to read the image back from the table.";}i:2;i:7544;}i:163;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7595;}i:164;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:476:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb 
import sys

try:
    conn = mdb.connect(host='localhost',user='testuser', 
        passwd='test623', db='testdb')

    cursor = conn.cursor()

    cursor.execute("SELECT Data FROM Images LIMIT 1")

    fout = open('image.png','wb')
    fout.write(cursor.fetchone()[0])
    fout.close()

    cursor.close()
    conn.close()

except IOError, e:

    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
";i:1;N;i:2;N;}i:2;i:7602;}i:165;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7602;}i:166;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8088;}i:167;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Transaction support";}i:2;i:8090;}i:168;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8109;}i:169;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8111;}i:170;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8111;}i:171;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:216:"A transaction is an atomic unit of database operations against the data in one or more databases. The effects of all the SQL statements in a transaction can be either all committed to the database or all rolled back.";}i:2;i:8113;}i:172;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8329;}i:173;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8329;}i:174;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:262:"For databases that support transactions, the Python interface silently starts a transaction when the cursor is created. The commit() method commits the updates made using that cursor, and the rollback() method discards them. Each method starts a new transaction.";}i:2;i:8331;}i:175;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8593;}i:176;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8593;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:488:"The MySQL database has different types of storage engines. The most common are the MyISAM and the InnoDB engines. The MyISAM is the default one. There is a trade-off between data security and database speed. The MyISAM tables are faster to process and they do not support transactions. The commit() and rollback() methods are not implemented. They do nothing. On the other hand, the InnoDB tables are more safe against the data loss. They support transactions. They are slower to process.";}i:2;i:8595;}i:178;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9083;}i:179;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:664:"
#!/usr/bin/python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import sys

try:
    conn = mdb.connect('localhost', 'testuser', 
        'test623', 'testdb');

    cursor = conn.cursor()
    
    cursor.execute("UPDATE Writers SET Name = %s WHERE Id = %s", 
        ("Leo Tolstoy", "1"))       
    cursor.execute("UPDATE Writers SET Name = %s WHERE Id = %s", 
        ("Boris Pasternak", "2"))
    cursor.execute("UPDATE Writer SET Name = %s WHERE Id = %s", 
        ("Leonid Leonov", "3"))   

    conn.commit()

    cursor.close()
    conn.close()

except mdb.Error, e:
  
    conn.rollback()
    print "Error %d: %s" % (e.args[0],e.args[1])
    sys.exit(1)
";i:1;N;i:2;N;}i:2;i:9090;}i:180;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9090;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Sources:
";}i:2;i:9764;}i:182;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:34:"http://zetcode.com/db/mysqlpython/";i:1;N;}i:2;i:9773;}i:183;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9807;}i:184;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9807;}i:185;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:9807;}}