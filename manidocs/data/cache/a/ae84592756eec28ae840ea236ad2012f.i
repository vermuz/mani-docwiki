a:67:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"Script  to play with list data types";}i:2;i:5;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:41;}i:5;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:43;}i:6;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:50;}i:7;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:575:"
# String
value1 = input("Enter str element 1/3: ")
# Integer
value2 = int(input("Enter int element 2/3: "))
# Float
value3 = float(input("Enter float element 3/3: "))

lst = [value1,value2,value3]
tpl = (value1,value2,value3)
dict = {"First element: ": value1, "Second element: ":value2,
        "Third element: ": value3}

print("\n")
print("Here is your new list: ", lst)
print("Here is your new tuple: ", tpl)
print("Here is your new dictionary: ", dict)
print("\n")
value4 = input("Add a new str list element: ")
lst.append(value4)
print("Here is your new list: ", lst)
";i:1;N;i:2;N;}i:2;i:50;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:50;}i:9;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:636;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Execution";}i:2;i:638;}i:11;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:647;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:649;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:656;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:380:"
Enter str element 1/3: spam
Enter int element 2/3: 4000
Enter float element 3/3: 3.232

Here is your new list:  ['spam', 4000, 3.232]
Here is your new tuple:  ('spam', 4000, 3.232)
Here is your new dictionary:  {'Second element: ': 4000, 'Third element: ': 3.232, 'First element: ': 'spam'}

Add a new str list element: eggs
Here is your new list:  ['spam', 4000, 3.232, 'eggs']
";i:1;N;i:2;N;}i:2;i:656;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:656;}i:16;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1047;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Clear the Screen Script";}i:2;i:1049;}i:18;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1072;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1074;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1081;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:202:"
'''
Module name: wiper.py
Author: Mani
Contact: sss@sss
Desc: The w() function clears the interpreter screen
'''
def w() :
    print ("\n" * 100)

*****************************************************
";i:1;N;i:2;N;}i:2;i:1081;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:596:"
dir(wiper)
['__builtins__', '__cached__', '__doc__', '__file__', '__name__', '__package__', 'w']
help(wiper)
Help on module wiper:

NAME
wiper
DESCRIPTION

Module name: wiper.py
Author: Mani
Contact: sss@sss
Desc: The w() function clears the interpreter screen
FUNCTIONS
w()
FILE
/home/mani/Downloads/wiper.py
print(wiper._doc_)
Traceback (most recent call last):
File "<string>", line 1, in <fragment>
builtins.AttributeError: 'module' object has no attribute '_doc_'
print(wiper.__doc__)
Module name: wiper.py
Author: Mani
Contact: sss@sss
Desc: The w() function clears the interpreter screen
";i:1;N;i:2;N;}i:2;i:1299;}i:23;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1299;}i:24;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1906;}i:25;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"Generate multiplication table for an input range";}i:2;i:1908;}i:26;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1956;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1958;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:678:"
# input would have returned string so we embed it into an int
lb = int(input("Enter lower bound: "))
ub = int(input("Enter upper bound: "))

print("\nYou chose {0} as your lower bound, \
and {1} as your upper bound.".format(lb,ub))

verif = input("\nProceed? (y/n): ")
response = verif.lower()

if response == 'y':
    # iterate from lower bound to the upper bound + 1
    # for loop not inclusive of the upper bound of the range
    # hence upper bound + 1 - want to iterate to whatever the
    # the user inputs
    for multiplier in range (lb, (ub+1)):
        for i in range (1,11):
            print(i, "x", multiplier, "=", i*multiplier)

else:
    print("We are done!")
";i:1;N;i:2;N;}i:2;i:1967;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1967;}i:30;a:3:{i:0;s:14:"monospace_open";i:1;a:0:{}i:2;i:2656;}i:31;a:3:{i:0;s:15:"monospace_close";i:1;a:0:{}i:2;i:2658;}i:32;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2660;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Execution:";}i:2;i:2662;}i:34;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2672;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:2674;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2681;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:493:"
mani@mani-ubu:~/Downloads$ python3 kinput.py 
Enter lower bound: 2
Enter upper bound: 4

You chose 2 as your lower bound, and 4 as your upper bound.

Proceed? (y/n): y
1 x 2 = 2
2 x 2 = 4
3 x 2 = 6
4 x 2 = 8
5 x 2 = 10
6 x 2 = 12
7 x 2 = 14
8 x 2 = 16
9 x 2 = 18
10 x 2 = 20
1 x 3 = 3
2 x 3 = 6
3 x 3 = 9
4 x 3 = 12
5 x 3 = 15
6 x 3 = 18
7 x 3 = 21
8 x 3 = 24
9 x 3 = 27
10 x 3 = 30
1 x 4 = 4
2 x 4 = 8
3 x 4 = 12
4 x 4 = 16
5 x 4 = 20
6 x 4 = 24
7 x 4 = 28
8 x 4 = 32
9 x 4 = 36
10 x 4 = 40
";i:1;N;i:2;N;}i:2;i:2681;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2681;}i:39;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3184;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Get Environment Variables
";}i:2;i:3186;}i:41;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3212;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3214;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3214;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"Dump of all the environment variables for the logged user.";}i:2;i:3216;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3274;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2888:"
>>> import os
>>> for k, v in os.environ.items(): #-> iterate through all the environment variables 
	print('%s = %s' % (k,v)) #-> print the variables one for one using string formatting

	
XAUTHORITY = /var/run/gdm/auth-for-mani-lkUcLi/database
GNOME_DESKTOP_SESSION_ID = this-is-deprecated
GJS_DEBUG_OUTPUT = stderr
LESSOPEN = | /usr/bin/lesspipe %s
LOGNAME = mani
USER = mani
GNOME_KEYRING_CONTROL = /tmp/keyring-0brMGJ
PATH = /usr/local/bin:/usr/bin:/bin:/usr/games
WINDOWPATH = 7
SSH_AGENT_PID = 2067
LANG = en_CA.UTF-8
TERM = xterm
SHELL = /bin/bash
XDG_SESSION_COOKIE = fad4bcfdf20df03c400858e60000000b-1360588278.549257-1007191275
LANGUAGE = en_CA:en
SESSION_MANAGER = local/mani-ubuntu:@/tmp/.ICE-unix/2019,unix/mani-ubuntu:/tmp/.ICE-unix/2019
SHLVL = 1
MANDATORY_PATH = /usr/share/gconf/cinnamon.mandatory.path
DISPLAY = :0
WINDOWID = 52431704
GPG_AGENT_INFO = /tmp/keyring-0brMGJ/gpg:0:1
HOME = /home/mani
USERNAME = mani
SSH_AUTH_SOCK = /tmp/keyring-0brMGJ/ssh
GDMSESSION = cinnamon
LESSCLOSE = /usr/bin/lesspipe %s %s
XDG_CURRENT_DESKTOP = GNOME
DBUS_SESSION_BUS_ADDRESS = unix:abstract=/tmp/dbus-26RkM6bhGt,guid=dcbfa856ea4c23ff5ec5340b00000039
_ = /usr/bin/idle3
DEFAULTS_PATH = /usr/share/gconf/cinnamon.default.path
DESKTOP_SESSION = cinnamon
XDG_CONFIG_DIRS = /etc/xdg/xdg-cinnamon:/etc/xdg
GNOME_KEYRING_PID = 2002
UBUNTU_MENUPROXY = libappmenu.so
OLDPWD = /home/mani
GDM_LANG = en_CA
XDG_DATA_DIRS = /usr/share/cinnamon:/usr/share/gnome:/usr/local/share/:/usr/share/
PWD = /home/mani/pydev
COLORTERM = gnome-terminal
LS_COLORS = rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:
GJS_DEBUG_TOPICS = JS ERROR;JS LOG
";i:1;N;i:2;N;}i:2;i:3281;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3281;}i:48;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6179;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Random Number Generator - Guess a Number
";}i:2;i:6181;}i:50;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6222;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:6224;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6230;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:945:"
'''
Title: Guess the Numbers game
Adapted from: inventwithpython.com
Purpose: Demo a live Python program
'''

#random module
import random
guessesTaken = 0
print('Hello! What is your name?')
myName = input()
# Generate a sudo random number
number = random.randint(1, 20)
print('Well, ' + myName + ', I am thinking of a number between 1 and 20')
while guessesTaken < 6:
      print('Take a guess.')
      guess = input()
      guess = int(guess)
      guessesTaken = guessesTaken + 1

      if guess < number:
          print('Your guess is too low.')
      if guess > number:
          print('Your guess is too high.')
      if guess == number:
          break

if guess == number:
    guessesTaken = str(guessesTaken)
    print('Good job, ' + myName + '! You guessed my number in ' + guessesTaken
          + ' guesses!')
    
if guess != number:
    number = str(number)
    print('Nope you didn`t get it right, I was thinking of ' + number)
";i:1;N;i:2;N;}i:2;i:6230;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6230;}i:55;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7185;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Multiple function calls and Comprehension";}i:2;i:7187;}i:57;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7228;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7230;}i:59;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:960:"
#!/usr/bin/python #SHEBANG!!!

#Variable Scope
#Exponentiate an integer in the range 0-9
S = [x**2 for x in range(10)] #global name

def choice_a(x):
    print(S)
    return
# 2 to the power 
def choice_b(x):
    V = [2**i for i in range(x)]
    print(V)
    return
#Modulus
def choice_c(y):
    M = [x for x in range(y) if x % 2 == 0]
    print(M)

def choice_d():
    raise SystemExit

print('Which operation do you want to perform?\n')
print('''
a: x to the second power
b: 2 the xth power
c: mod 2
d: quit program
''')

resp = input('Choice: ')
resp2 = int(input('Upper limit? '))

if resp == 'a':
    choice_a(resp2)
elif resp == 'b':
    choice_b(resp2)
elif resp == 'c':
    choice_c(resp2)
else:
    choice_d()

//******************
mani@mani-ubuntu:~/pydev$ python3 mod9.py
Which operation do you want to perform?


a: x to the second power
b: 2 the xth power
c: mod 2
d: quit program

Choice: a
Upper limit? 10
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

";i:1;N;i:2;N;}i:2;i:7237;}i:60;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7237;}i:61;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8207;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Connecting to MySQL with Python";}i:2;i:8209;}i:63;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8240;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8242;}i:65;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:907:"
#!/usr/bin/python
# version.py – Fetch and display the MySQL database server version.

# import the MySQLdb and sys modules
import MySQLdb
import sys

# open a database connection
# be sure to change the host IP address, username, password and database name to match your own
connection = MySQLdb.connect (host = “192.168.1.1″, user = “username”, passwd = “password”, db = “database_name”)

# prepare a cursor object using cursor() method
cursor = connection.cursor ()

# execute the SQL query using execute() method.
cursor.execute (“SELECT VERSION()”)

# fetch a single row using fetchone() method.
row = cursor.fetchone ()

# print the row[0]
# (Python starts the first row in an array with the number zero – instead of one)
print “Server version:”, row[0]

# close the cursor object
cursor.close ()

# close the connection
connection.close ()

# exit the program
sys.exit()
";i:1;N;i:2;N;}i:2;i:8249;}i:66;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8249;}}