a:30:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Python DB Synching";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2376:"
#!/usr/bin/python
"""Synchs with Master with Slave
"""
# Imports
import os
import subprocess
import MySQLdb
import tempfile

__author__ = "Mani"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Mani"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"


# Get Master Host Info
masterHost = raw_input("Enter Master Host: ")
masterPort = raw_input("Enter Master Port: ")
masterUser = raw_input("Enter Master User: ")
masterPassword = raw_input("Enter Master Password")

# Get Slave Host Info
slaveHost = raw_input("Enter Slave Host: ")
slavePort = raw_input("Enter Slave Port: ")
slaveUser = raw_input("Enter Slave User: ")
slavePassword = raw_input("Enter Slave Password")

# master_CONN = "-u${masterUser} -p${masterPassword}"
dbMasterCon = MySQLdb.connect(host=masterHost,user=masterUser, passwd=masterPassword, port=masterPort)
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")
# cur.execute("SHOW MASTER STATUS")

# From here we need File and Position
# ROWS are File, Position
# Print Column 1
masterFile = cur.execute("SHOW MASTER STATUS")| awk'{print 1}'
# Print Column 2
masterPOS  = cur.execute("SHOW MASTER STATUS")| awk'{print 2}' 

# CREATE TMP File

# tempdir = tempfile.gettempdir()
# f = tempfile.NamedTemporaryFile(dir = tempdir)
# target_dir = /usr/tmp/;
# time_backup = time.strftime('%Y-%m-%d-%H-%M-%S')
# backupfile = target_dir + time_backup +".sql"
f  = open('backupfile.sql', 'w')
f.write('STOP SLAVE; \n')
f.write('CHANGE MASTER TO MASTER_HOST = 'masterHost', \n')
f.write('MASTER_PORT = masterPort, \n')
f.write('MASTER_USER = masterUser, \n')
f.write('MASTER_PASSWORD=masterPassword, \n')
# Info from MASTER SHOW STATUS
f.write('MASTER_LOG_FILE= masterFile, \n')
f.write('MASTER_LOG_POS=  masterPOS, \n')
#***********************************************************
f.write(os.system("mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database"))
#***********************************************************
f.write('START SLAVE; \n')
f.close()
cur.execute("UNLOCK TABLES")

# SCP File to slave tmp dir
os.system("scp backupfile.sql SLAVE_USER@SERVER:PATH")

dbSlaveCon = MySQLdb.connect(host=slaveHost,user=slaveUser, passwd=slavePassword, port=slavePort)
cur = dbSlaveCon.cursor()
for line in open('/usr/tmp/backupfile.sql')
	cur.execute(line)





";i:1;N;i:2;N;}i:2;i:40;}i:4;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:40;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"VERSION 2";}i:2;i:2426;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2435;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3483:"
#!/usr/bin/python
"""Synchs with Master with Slave
"""
# Imports
import os
import subprocess
import MySQLdb
import tempfile
import logging

__author__ = "Mani"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Mani"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"


# Get Master Host Info
masterHost = raw_input("Enter Master Host: ")
masterPort = raw_input("Enter Master Port: ")
masterUser = raw_input("Enter Master User: ")
masterPassword = raw_input("Enter Master Password")

# Get Slave Host Info
slaveHost = raw_input("Enter Slave Host: ")
slavePort = raw_input("Enter Slave Port: ")
slaveUser = raw_input("Enter Slave User: ")
slavePassword = raw_input("Enter Slave Password")

# Start Logging
# "basicConfig()" method to login the info to the file.
logging.basicConfig(
					level=	logging.DEBUG,
					format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch.txt'
                   )

# master_CONN = "-u${masterUser} -p${masterPassword}"
dbMasterCon = MySQLdb.connect(host=masterHost,user=masterUser, passwd=masterPassword, port=masterPort)
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")
# cur.execute("SHOW MASTER STATUS")

# From here we need File and Position
# ROWS are File, Position
# Print Column 1
masterFile = cur.execute("SHOW MASTER STATUS")| awk'{print 1}'
# Print Column 2
masterPOS  = cur.execute("SHOW MASTER STATUS")| awk'{print 2}' 
# You don`t want to run same command twice


# AWK Multiple Outputs
# awk -F, '{print $1, $2}'
# Multiple Assignments
# masterFile, masterPOS = cur.execute("SHOW MASTER STATUS")| awk'{print $1, $2}'

# CREATE TMP File

# tempdir = tempfile.gettempdir()
# f = tempfile.NamedTemporaryFile(dir = tempdir)
# target_dir = /usr/tmp/;
# time_backup = time.strftime('%Y-%m-%d-%H-%M-%S')
# backupfile = target_dir + time_backup +".sql"
f  = open('backupfile.sql', 'w')
f.write('STOP SLAVE; \n')
#***********************************************************
# SQL DUMP
# f.write(os.system("mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database"))
# Subprocess will replace os.system
f.write(subprocess.call('mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database',shell = True))
# For Test Purposes
#ret = subprocess.call('mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database',shell = True)
	#if ret == 0
		#print "success"
	#else
		#print "failure"
# Logging Info 
logging.info("SQLDump complete")
#***********************************************************
f.write('CHANGE MASTER TO MASTER_HOST = 'masterHost', \n')
f.write('MASTER_PORT = masterPort, \n')
f.write('MASTER_USER = masterUser, \n')
f.write('MASTER_PASSWORD=masterPassword, \n')
# Info from MASTER SHOW STATUS
f.write('MASTER_LOG_FILE= masterFile, \n')
f.write('MASTER_LOG_POS=  masterPOS, \n')
logging.info("Synching with Master complete")
f.write('START SLAVE; \n')
f.close()
cur.execute("UNLOCK TABLES")

# SCP File to slave tmp dir
# os.system("scp backupfile.sql SLAVE_USER@SERVER:PATH")
os.system("scp backupfile.sql mani@localhost:/home/mani")
# Need Db Connectivity in Slave?
# We can just easily just dump the file into the Slave
dbSlaveCon = MySQLdb.connect(host=slaveHost,user=slaveUser, passwd=slavePassword, port=slavePort)
cur = dbSlaveCon.cursor()
for line in open('/usr/tmp/backupfile.sql')
	cur.execute(line)





";i:1;N;i:2;N;}i:2;i:2442;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2442;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Version 3";}i:2;i:5935;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5944;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3789:"
#!/usr/bin/python
"""Synchs with Master with Slave
"""
# Imports
import os
import subprocess
import MySQLdb
import tempfile
import logging

__author__ = "Mani"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Mani"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"


# Get Master Host Info
masterHost = raw_input("Enter Master Host: ")
masterPort = raw_input("Enter Master Port: ")
masterUser = raw_input("Enter Master User: ")
masterPassword = raw_input("Enter Master Password")

# Get Slave Host Info
slaveHost = raw_input("Enter Slave Host: ")
slavePort = raw_input("Enter Slave Port: ")
slaveUser = raw_input("Enter Slave User: ")
slavePassword = raw_input("Enter Slave Password")

# Start Logging
# "basicConfig()" method to login the info to the file.
logging.basicConfig(
					level=	logging.DEBUG,
					format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch.txt'
                   )

# master_CONN = "-u${masterUser} -p${masterPassword}"
dbMasterCon = MySQLdb.connect(host=masterHost,user=masterUser, passwd=masterPassword, port=masterPort)
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")
# cur.execute("SHOW MASTER STATUS")
# From here we need File and Position
# ROWS are File, Position
# Print Column 1
#masterFile = cur.execute("SHOW MASTER STATUS")| awk'{print 1}'
# Print Column 2
#masterPOS  = cur.execute("SHOW MASTER STATUS")| awk'{print 2}' 
# You don`t want to run same command twice

# masterFile = cur.execute('SHOW MASTER STATUS')
#/////////////////////////////////////////////////////
cur.execute("SHOW MASTER STATUS")
# Retrieve next row of a query result
values = cur.fetchone()
masterFile, masterPOS = values.split(" | ")[0:2] 
#/////////////////////////////////////////////////////

# AWK Multiple Outputs
# awk -F, '{print $1, $2}'
# Multiple Assignments
# masterFile, masterPOS = cur.execute("SHOW MASTER STATUS")| awk'{print $1, $2}'

# CREATE TMP File

# tempdir = tempfile.gettempdir()
# f = tempfile.NamedTemporaryFile(dir = tempdir)
# target_dir = /usr/tmp/;
# time_backup = time.strftime('%Y-%m-%d-%H-%M-%S')
# backupfile = target_dir + time_backup +".sql"
f  = open('backupfile.sql', 'w')
f.write('STOP SLAVE; \n')
#***********************************************************
# SQL DUMP
# f.write(os.system("mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database"))
# Subprocess will replace os.system
f.write(subprocess.call('mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database',shell = True))
# For Test Purposes
#ret = subprocess.call('mysqldump -u masterUser -p masterPassword --all-database --add-drop-table --add-drop-database',shell = True)
	#if ret == 0
		#print "success"
	#else
		#print "failure"
# Logging Info 
logging.info("SQLDump complete")
#***********************************************************
f.write('CHANGE MASTER TO MASTER_HOST = 'masterHost', \n')
f.write('MASTER_PORT = masterPort, \n')
f.write('MASTER_USER = masterUser, \n')
f.write('MASTER_PASSWORD=masterPassword, \n')
# Info from MASTER SHOW STATUS
f.write('MASTER_LOG_FILE= masterFile, \n')
f.write('MASTER_LOG_POS=  masterPOS, \n')
logging.info("Synching with Master complete")
f.write('START SLAVE; \n')
f.close()
cur.execute("UNLOCK TABLES")

# SCP File to slave tmp dir
# os.system("scp backupfile.sql SLAVE_USER@SERVER:PATH")
os.system("scp backupfile.sql mani@localhost:/home/mani")
# Need Db Connectivity in Slave?
# We can just easily just dump the file into the Slave
dbSlaveCon = MySQLdb.connect(host=slaveHost,user=slaveUser, passwd=slavePassword, port=slavePort)
cur = dbSlaveCon.cursor()
for line in open('/usr/tmp/backupfile.sql')
	cur.execute(line)





";i:1;N;i:2;N;}i:2;i:5951;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5951;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Third Script";}i:2;i:9750;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9762;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3672:"
#!/usr/bin/python
import os
import subprocess
import subprocess as sub
import MySQLdb
import tempfile
import logging
import shutil
import datetime
import tarfile

#OPERATIONS
MYSQL_DUMP = "mysqldump"

# MASTER DATA
masterHost   = '127.0.0.1'
masterUser   = 'root'
masterPasswd = 'india611'
masterPort   = 3306

# SLAVE DATA
slaveHost    = '127.0.0.1'
slavePort    = 3307
slaveUser    = 'root'
slavePasswd  = 'india611'

logging.basicConfig(
                    level=    logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch1.txt'
                   )
#dbMasterCon = MySQLdb.connect(host='127.0.0.1', user='root', passwd='india611', port=3306)
dbMasterCon = MySQLdb.connect(host= masterHost, user = masterUser, passwd = masterPasswd, port = masterPort)
logging.info("DB Connected")
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")
showMaster = 'mysql -h 127.0.0.1 -P 3306 -u root -p --skip-column-names -e \'SHOW MASTER STATUS;\''
p = os.popen(showMaster,'r', 1)
str1 = p.read()
str2 = str1.split()
masterFile = str2[0]
masterPOS  = str2[1]
f = tempfile.mktemp()
tempfile = open(f, 'w')
tempfile.write('STOP SLAVE; \n')
#takeaDUMP = 'mysqldump -h 127.0.0.1 -P 3306 --all-database --add-drop-table --add-drop-database -u root -p'
takeaDUMP = 'mysqldump -h '+ str(masterHost)+ ' -P '+ str(masterPort) + ' --all-database --add-drop-table --add-drop-database ' + '-u ' + str(masterUser) + ' -p'
#print takeaDUMP
p1 = os.popen(takeaDUMP,'r',1)
strDUMP = p1.read()
tempfile.write(strDUMP + '\n')
tempfile.write('CHANGE MASTER TO MASTER_HOST = ' + str(masterHost) + '\n')
tempfile.write('MASTER_PORT = '+ str(masterPort) + '\n')
tempfile.write('MASTER_USER = '+ str(masterUser) + '\n')
tempfile.write('MASTER_PASSWORD = '+ str(masterPasswd) + '\n')
tempfile.write('MASTER_LOG_FILE = '+ masterFile + '\n' )
tempfile.write('MASTER_LOG_POS = '+ masterPOS + '\n' )
tempfile.write('START SLAVE; \n')
tempfile.close()
#tar.close()
cur.execute("UNLOCK TABLES")
#print f
# SCP File to Slave 
#os.system("scp f mani@localhost:/home/mani")
filepath = f
hostname = "mani@localhost"
remote_path = "/home/mani"
subprocess.call(['scp', filepath, ':'.join([hostname,remote_path])])

# SLAVE System
#subprocess.call(['ssh', '-i', remote_user +'@'+remote_host,'mysql -u root -p '])
#dbSlaveCon = MySQLdb.connect(host=slaveHost, user=slaveUser, passwd=slavePasswd, port=slavePort)
#cur = dbSlaveCon.cursor()
    #for line in open('')
     #   cur.execute(line)
#logging.info("Replication complete")
remote_user = 'mani'
remote_host = 'localhost'
remote_pass = 'india611'
slavePort = '3307'
#print ' < /home/mani/' + os.path.basename(f)  

#subprocess.call([
                #'ssh'+
                # remote_user + '@' + remote_host,
                # '/usr/bin/mysql -h ' + remote_host + '-P ' + slavePort + '-u root -p'+
                # ' < /home/mani/' + os.path.basename(f)  
               #])
#tt = 'ssh '+ remote_user + '@' + remote_host +'mysql -h ' + remote_host + ' -P ' + slavePort + ' -u root -p'+remote_pass+ '< /home/mani/' + os.path.basename(f)             
#print tt;
#print os.path.basename(f)
#tt = 'ssh '+ remote_user + '@' + remote_host,' mysql -h ' + remote_host + ' -P ' + slavePort + ' -u root -p'+remote_pass+ ' < /home/mani/' + os.path.basename(f)  
#print tt  

tt = '\'mysql -h ' + '127.0.0.1' + ' -P ' + slavePort + ' -u root -p'+remote_pass+ ' < /home/mani/' + os.path.basename(f) +'\''  
print tt

subprocess.call([
                'ssh '+
                 remote_user + '@' + remote_host, 
                 tt  
               ])

";i:1;N;i:2;N;}i:2;i:9769;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9769;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"4th Script";}i:2;i:13451;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13461;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4896:"
#!/usr/bin/python
#!/usr/bin/env python
# IMPORTS
import os
import subprocess
# import subprocess as sub
import MySQLdb
import tempfile
import logging
# import shutil
#import datetime
# SSH2 prototcol
import paramiko

# METADATA
__author__ = "Chaudhry Usman Ali"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Chaudhry Usman Ali"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"

#OPERATIONS
MYSQL_DUMP = "mysqldump"

# MASTER DATA
masterHost   = '127.0.0.1'
masterUser   = 'root'
masterPasswd = 'india611'
masterPort   = 3306

# SLAVE DATA
slaveHost    = '127.0.0.1'
slavePort    = 3307
slaveUser    = 'root'
slavePasswd  = 'india611'

# MYSQL ACCESS
#mysql_root_auth_creds={}
#mysql_root_auth_creds['local']=raw_input('Enter the local MySQL Root Password:')

# REMOTE USER
#remote_user_auth_creds={}
#remote_host=raw_input('Enter the remote hostname:')
#mysql_root_auth_creds['remote']=raw_input('Enter the remote MySQL Root Password:')
#remote_user_auth_creds['user']=raw_input('Enter the remote SSH user to use:')
#remote_user_auth_creds['key']='/home/jsanford/.ssh/passwordLessLoginKey'
#remote_user_auth_creds['key']='/home/mani/.ssh/passwordLessLoginKey'
# LOGGING
logging.basicConfig(
                    level= logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch1.txt'
                   )

# Establish Master DB Connectivity
dbMasterCon = MySQLdb.connect(host= masterHost, user = masterUser, passwd = masterPasswd, port = masterPort)
logging.info("DB Connected")
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")

# SHOW MASTER STATUS - Grab masterFile and masterPOS for use in file to be sent to the Slave
showMaster = 'mysql -h 127.0.0.1 -P 3306 -u root -p --skip-column-names -e \'SHOW MASTER STATUS;\''
p = os.popen(showMaster,'r', 1)
str1 = p.read()
str2 = str1.split()
masterFile = str2[0]
masterPOS  = str2[1]

# Create Temporary file
f = tempfile.mktemp()
tempfile = open(f, 'w')
tempfile.write('STOP SLAVE; \n')

# SQL Dump
takeaDUMP = 'mysqldump -h '+ str(masterHost)+ ' -P '+ str(masterPort) + ' --all-database --add-drop-table --add-drop-database ' + '-u ' + str(masterUser) + ' -p'

# Push DUMP into the file
p1 = os.popen(takeaDUMP,'r',1)
strDUMP = p1.read()
tempfile.write(strDUMP + '\n')

# Push Instructions for the slave
tempfile.write('CHANGE MASTER TO MASTER_HOST = ' +'\''+ str(masterHost)+ '\','+ '\n')
tempfile.write('MASTER_PORT = '+ str(masterPort) +','+'\n')
tempfile.write('MASTER_USER = '+ '\''+str(masterUser) +'\''+','+'\n')
tempfile.write('MASTER_PASSWORD = '+'\''+ str(masterPasswd) +'\''+','+'\n')
tempfile.write('MASTER_LOG_FILE = '+ '\''+masterFile +'\''+','+'\n' )
tempfile.write('MASTER_LOG_POS = '+ masterPOS +';'+ '\n' )
tempfile.write('START SLAVE; \n')

# Close file
tempfile.close()
cur.execute("UNLOCK TABLES")

filepath = f
#hostname = "mani@localhost"
hostname = '127.0.0.1'
port = 22
username = 'mani'
password = 'india611'
remote_path = "/home/mani/Downloads/"
subprocess.call(['scp', filepath, ':'.join([hostname,remote_path])])

s = paramiko.SSHClient()
#s.load_system_host_keys()
# FORCE THE NO KEY USE POLICY
#s.set_missing_host_key_policy(paramiko.AutoAddPolicy())

s.connect(hostname, port, username, password)
#command = '\'mysql -h 127.0.0.1 -P 3307 -u root -pindia611\''+ '< /home/mani/Downloads/'+os.path.basename(f)
command = 'mysql -h 127.0.0.1 -P 3307 -u root -pindia611 '+ '< /home/mani/Downloads/'+os.path.basename(f)

print command
#stdin, stdout, stderr = s.exec_command('command')
sh = s.get_transport().open_session()
sh.exec_command(command)
print "exit status: %s" % sh.recv_exit_status()
#print stdout.readLines()

s.close()
# REMOTE CONNECTION CREDENTIALS
#remote_user = 'mani'
#remote_host = 'localhost'
#remote_pass = 'india611'
#slavePort = '3307'
#print os.path.basename(f)

# SLAVE CONNECTIONx
#tt = '\'mysql -h ' + '127.0.0.1' + ' -P ' + slavePort + ' -u root -p'+remote_pass+ ' < /home/mani/' + os.path.basename(f) +'\''  
#chh =  'ssh '+ remote_user + '@' + remote_host,tt   
#print chh
#cbb = 'ssh -L mani@127.0.0.1 '+'\'mysql -h 127.0.0.1 -P 3307 -u root -pindia611\'' ' < /home/mani/Downloads/'+ os.path.basename(f)
#print cbb
#subprocess.call([
#                'ssh '+
#                 remote_user + '@' + remote_host, 
#                tt  
 #               cbb 
 #              ])

#*******************************************************************************************
#tt = '\'mysql -h ' + ' -P ' + slavePort + ' -u root -p'+remote_pass+ ' < /home/mani/' + os.path.basename(f) +'\''
#just = 'ssh -L '+ '3306:127.0.0.1:3307 '+ remote_user + '@' + remote_host,tt
#print just
#subprocess.call([
#                'ssh -L '+ '3306:127.0.0.1:3307 '+ 
#                 remote_user + '@' + remote_host,
#                 tt
#               ])

";i:1;N;i:2;N;}i:2;i:13468;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13468;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"5th Script";}i:2;i:18374;}i:22;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18384;}i:23;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2856:"
#!/usr/bin/python

# IMPORTS
import os
import subprocess
import MySQLdb
import tempfile
import logging

# METADATA
__author__ = "Chaudhry Usman Ali"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Chaudhry Usman Ali"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"

#OPERATIONS
MYSQL_DUMP = "mysqldump"

# MASTER DATA
masterHost   = '127.0.0.1'
masterUser   = 'root'
masterPasswd = 'india611'
masterPort   = 3306

# SLAVE DATA
slaveHost    = '127.0.0.1'
slavePort    = 3307
slaveUser    = 'root'
slavePasswd  = 'india611'

# LOGGING
logging.basicConfig(
                    level= logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch1.txt'
                   )

# Establish Master DB Connectivity
dbMasterCon = MySQLdb.connect(host= masterHost, user = masterUser, passwd = masterPasswd, port = masterPort)
logging.info("DB Connected")
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")

# SHOW MASTER STATUS - Grab masterFile and masterPOS for use in file to be sent to the Slave
showMaster = 'mysql -h 127.0.0.1 -P 3306 -u root -p --skip-column-names -e \'SHOW MASTER STATUS;\''
p = os.popen(showMaster,'r', 1)
str1 = p.read()
str2 = str1.split()
masterFile = str2[0]
masterPOS  = str2[1]

# Create Temporary file
f = tempfile.mktemp()
tempfile = open(f, 'w')
tempfile.write('STOP SLAVE; \n')

# SQL Dump
takeaDUMP = 'mysqldump -h '+ str(masterHost)+ ' -P '+ str(masterPort) + ' --all-database --add-drop-table --add-drop-database ' + '-u ' + str(masterUser) + ' -p'

# Push DUMP into the file
p1 = os.popen(takeaDUMP,'r',1)
strDUMP = p1.read()
tempfile.write(strDUMP + '\n')

# Push Instructions for the slave
tempfile.write('CHANGE MASTER TO MASTER_HOST = ' +'\''+ str(masterHost)+ '\','+ '\n')
tempfile.write('MASTER_PORT = '+ str(masterPort) +','+'\n')
tempfile.write('MASTER_USER = '+ '\''+str(masterUser) +'\''+','+'\n')
tempfile.write('MASTER_PASSWORD = '+'\''+ str(masterPasswd) +'\''+','+'\n')
tempfile.write('MASTER_LOG_FILE = '+ '\''+masterFile +'\''+','+'\n' )
tempfile.write('MASTER_LOG_POS = '+ masterPOS +';'+ '\n' )
tempfile.write('START SLAVE; \n')

# Close file
tempfile.close()
cur.execute("UNLOCK TABLES")

filepath = f
#hostname = "mani@localhost"
hostname = '127.0.0.1'
port = 22
username = 'mani'
password = 'india611'
remote_path = "/home/mani/Downloads/"
subprocess.call(['scp', filepath, ':'.join([hostname,remote_path])])

command = 'mysql -h 127.0.0.1 -P 3307 -u root -pindia611 '+ '< /home/mani/Downloads/'+os.path.basename(f)

# Remote Connection 
remote_user = 'mani'
remote_host = '127.0.0.1'

rett = subprocess.call([
                 'ssh',
                 #'-i',
                 remote_user+'@'+remote_host,
                 command
               ])

print rett

";i:1;N;i:2;N;}i:2;i:18391;}i:24;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18391;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"With Key";}i:2;i:21257;}i:26;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21265;}i:27;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3046:"
#!/usr/bin/python

# IMPORTS
import os
import subprocess
import MySQLdb
import tempfile
import logging

# METADATA
__author__ = "Chaudhry Usman Ali"
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Chaudhry Usman Ali"
__email__ = "mani.ali@unb.ca"
__status__ = "Development"

remote_user_auth_creds={}
remote_user_auth_creds['key']='/home/mani/.ssh/rocknroll'


# OPERATIONS
MYSQL_DUMP = "mysqldump"

# CREDENTIALS
#mysql_root_auth_creds = {}
#remote_user_auth_creds = {}



# MASTER DATA
masterHost   = '127.0.0.1'
masterUser   = 'root'
masterPasswd = 'india611'
masterPort   = 3306

# SLAVE DATA
slaveHost    = '127.0.0.1'
slavePort    = 3307
slaveUser    = 'root'
slavePasswd  = 'india611'

# LOGGING
logging.basicConfig(
                    level= logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    filename='/home/mani/vre_synch1.txt'
                   )

# Establish Master DB Connectivity
dbMasterCon = MySQLdb.connect(host= masterHost, user = masterUser, passwd = masterPasswd, port = masterPort)
logging.info("DB Connected")
cur = dbMasterCon.cursor()
cur.execute("RESET MASTER")
cur.execute("FLUSH TABLES WITH READ LOCK")

# SHOW MASTER STATUS - Grab masterFile and masterPOS for use in file to be sent to the Slave
showMaster = 'mysql -h 127.0.0.1 -P 3306 -u root -p --skip-column-names -e \'SHOW MASTER STATUS;\''
p = os.popen(showMaster,'r', 1)
str1 = p.read()
str2 = str1.split()
masterFile = str2[0]
masterPOS  = str2[1]

# Create Temporary file
f = tempfile.mktemp()
tempfile = open(f, 'w')
tempfile.write('STOP SLAVE; \n')

# SQL Dump
takeaDUMP = 'mysqldump -h '+ str(masterHost)+ ' -P '+ str(masterPort) + ' --all-database --add-drop-table --add-drop-database ' + '-u ' + str(masterUser) + ' -p'

# Push DUMP into the file
p1 = os.popen(takeaDUMP,'r',1)
strDUMP = p1.read()
tempfile.write(strDUMP + '\n')

# Push Instructions for the slave
tempfile.write('CHANGE MASTER TO MASTER_HOST = ' +'\''+ str(masterHost)+ '\','+ '\n')
tempfile.write('MASTER_PORT = '+ str(masterPort) +','+'\n')
tempfile.write('MASTER_USER = '+ '\''+str(masterUser) +'\''+','+'\n')
tempfile.write('MASTER_PASSWORD = '+'\''+ str(masterPasswd) +'\''+','+'\n')
tempfile.write('MASTER_LOG_FILE = '+ '\''+masterFile +'\''+','+'\n' )
tempfile.write('MASTER_LOG_POS = '+ masterPOS +';'+ '\n' )
tempfile.write('START SLAVE; \n')

# Close file
tempfile.close()
cur.execute("UNLOCK TABLES")

filepath = f
#hostname = "mani@localhost"
hostname = '127.0.0.1'
port = 22
username = 'mani'
password = 'india611'
remote_path = "/home/mani/Downloads/"
subprocess.call(['scp', filepath, ':'.join([hostname,remote_path])])

command = 'mysql -h 127.0.0.1 -P 3307 -u root -pindia611 '+ '< /home/mani/Downloads/'+os.path.basename(f)

# Remote Connection 
remote_user = 'mani'
remote_host = '127.0.0.1'

rett = subprocess.call([
                 'ssh',
                 '-i',remote_user_auth_creds['key'],
                 remote_user+'@'+remote_host,
                 command
               ])

print rett

";i:1;N;i:2;N;}i:2;i:21272;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24326;}i:29;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:24326;}}