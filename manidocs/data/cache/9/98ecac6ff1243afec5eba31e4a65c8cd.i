a:72:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"Comprehension
";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:17;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19;}i:6;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:110:"          Set Comprehension returns a set object
          List Comprehension returns a list object
          ";}i:2;i:19;}i:7;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:8;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:137;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Set Comprehension";}i:2;i:139;}i:10;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:156;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:158;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:158;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"'shorthand for creating new sets'";}i:2;i:160;}i:14;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:193;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:147:"
>>> s2
{16, 10, 12, 14}
>>> type(s2)
<class 'set'>
>>> setcomp = {i * 2 for i in s2}
>>> setcomp
{32, 24, 20, 28}
>>> type(setcomp)
<class 'set'>
";i:1;N;i:2;N;}i:2;i:200;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:200;}i:17;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:357;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"List Comprehension
";}i:2;i:359;}i:19;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:378;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:380;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:380;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"Nifty 'shorthand' method for creating new lists";}i:2;i:382;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:429;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:127:"
>>> alist = [1,2,4,6,8,10]
>>> alist = [i * 4 for i in alist]
>>> type(alist)
<class 'list'>
>>> alist
[4, 8, 16, 24, 32, 40]
";i:1;N;i:2;N;}i:2;i:436;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:436;}i:26;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:573;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Create a list of lists
";}i:2;i:575;}i:28;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:598;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:600;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:401:"
>>> type(phrase)
<class 'list'>
>>> phrase
['Lorem', 'ipsum', 'dolor', 'sit', 'amet,', 'consectetur', 'adipiscing', 'elit.']
>>> stuff = [[p.upper(),p.lower(), len(p)] for p in phrase]
>>> stuff
[['LOREM', 'lorem', 5], ['IPSUM', 'ipsum', 5], ['DOLOR', 'dolor', 5], ['SIT', 'sit', 3], ['AMET,', 'amet,', 5], ['CONSECTETUR', 'consectetur', 11], ['ADIPISCING', 'adipiscing', 10], ['ELIT.', 'elit.', 5]]
";i:1;N;i:2;N;}i:2;i:607;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:607;}i:32;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1018;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Comprehensions with a Dictionary
";}i:2;i:1020;}i:34;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1053;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1055;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1055;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"You can reorder key/value pairs";}i:2;i:1057;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1088;}i:39;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:145:"
>>> dic1 ={'ay':1, 'bee':2, 'cee':3}
>>> dic2 = {}
>>> dic2 = {value:key for key, value in dic1.items()}
>>> dic2
{1: 'ay', 2: 'bee', 3: 'cee'}
";i:1;N;i:2;N;}i:2;i:1095;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1095;}i:41;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1250;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"Another case for using List comprehension.
So, we create a file lang.txt";}i:2;i:1252;}i:43;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1324;}i:44;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1326;}i:45;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1332;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:124:"
>>> lang = ('/home/mani/pydev/lang.txt')
>>> lang
'/home/mani/pydev/lang.txt'
>>> lang = open('/home/mani/pydev/lang.txt')
";i:1;N;i:2;N;}i:2;i:1332;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1332;}i:48;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1465;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Python can`t read it
";}i:2;i:1467;}i:50;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1488;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1490;}i:52;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1496;}i:53;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:89:"
>>> lang
<_io.TextIOWrapper name='/home/mani/pydev/lang.txt' mode='r' encoding='UTF-8'>
";i:1;N;i:2;N;}i:2;i:1496;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1496;}i:55;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1595;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Open as a list
";}i:2;i:1597;}i:57;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1612;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1614;}i:59;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1620;}i:60;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:213:"
>>> lang = list(open('/home/mani/pydev/lang.txt'))
>>> lang
['python\n', 'c\n', 'haskell\n', 'lisp\n', 'java\n', 'alice\n', 'abc\n', 'perl\n', 'ruby\n', 'basic\n', 'erlang\n', '\n']
>>> type(lang)
<class 'list'>
";i:1;N;i:2;N;}i:2;i:1620;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1620;}i:62;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1843;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:"Problem: in lang.txt, we hit enter after typing names. We need to clean that up.
";}i:2;i:1845;}i:64;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1926;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:1928;}i:66;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:1929;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Apply a comprehension.
";}i:2;i:1931;}i:68;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:1954;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1956;}i:70;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:146:"
>>> lang = [n.rstrip() for n in lang]
>>> lang
['python', 'c', 'haskell', 'lisp', 'java', 'alice', 'abc', 'perl', 'ruby', 'basic', 'erlang', '']
";i:1;N;i:2;N;}i:2;i:1963;}i:71;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1963;}}