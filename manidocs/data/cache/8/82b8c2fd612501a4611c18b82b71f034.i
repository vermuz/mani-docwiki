a:131:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Github Procedures";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:20;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22;}i:7;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:48:"http://www.vogella.com/articles/Git/article.html";i:1;N;}i:2;i:24;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:72;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:72;}i:10;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:74;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Useful Commands";}i:2;i:76;}i:12;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:91;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:93;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:93;}i:15;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:95;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Install GIT";}i:2;i:97;}i:17;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:108;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:110;}i:19;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:32:"
sudo apt-get install git-core 
";i:1;N;i:2;N;}i:2;i:117;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:117;}i:21;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:159;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Git settings";}i:2;i:161;}i:23;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:173;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:175;}i:25;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
git config --list 
";i:1;N;i:2;N;}i:2;i:182;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:182;}i:27;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:212;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Ignore certain files";}i:2;i:214;}i:29;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:234;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:236;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:112:"
# Ignore all files ending with ~
*~
# Ignore the target directory
# Matches "target" in any subfolder
target/ 
";i:1;N;i:2;N;}i:2;i:243;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:243;}i:33;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:365;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Create directory";}i:2;i:367;}i:35;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:383;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:385;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:128:"
#Switch to home
cd ~/
# Create a directory
mkdir ~/repo01
# Switch into it
cd repo01
# Create a new directory
mkdir datafiles 
";i:1;N;i:2;N;}i:2;i:392;}i:38;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:392;}i:39;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:530;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Create Git repository";}i:2;i:532;}i:41;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:553;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:555;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:71:"
# Initialize the Git repository
# for the current directory
git init 
";i:1;N;i:2;N;}i:2;i:562;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:562;}i:45;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:643;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"Create content";}i:2;i:645;}i:47;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:659;}i:48;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:661;}i:49;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:222:"
# Switch to your new directory
cd ~/repo01
# Create a new directory
mkdir datafiles
# Create a few files
touch test01
touch test02
touch test03
touch datafiles/data.txt
# Put a little text into the first file
ls >test01 
";i:1;N;i:2;N;}i:2;i:668;}i:50;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:668;}i:51;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:900;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Add files to Git index";}i:2;i:902;}i:53;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:924;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:926;}i:55;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:83:"
# Add all (files and directories) to the index of the 
# Git repository
git add .
";i:1;N;i:2;N;}i:2;i:933;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:933;}i:57;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1026;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Commit to Git repository
";}i:2;i:1028;}i:59;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1053;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1055;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:132:"
# Make a commit of your file to the local repository
git commit -m "Initial commit"

# Show the log file with the commits
git log 
";i:1;N;i:2;N;}i:2;i:1062;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1062;}i:63;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1204;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"See differences since the last commit
";}i:2;i:1206;}i:65;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1244;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1246;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1252;}i:68;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:311:"
# Make some changes to the file
echo "This is a change" > test01
echo "and this is another change" > test02

# Check the changes via the diff command 
git diff

# Commit the changes, -a will commit changes for modified files
# but will not add automatically new files
git commit -a -m "These are new changes" 
";i:1;N;i:2;N;}i:2;i:1252;}i:69;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1252;}i:70;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1573;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Procedure";}i:2;i:1575;}i:72;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1584;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1586;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1586;}i:75;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1588;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"Go to to each of the folders you plan on making a repo out of.
";}i:2;i:1590;}i:77;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1653;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1655;}i:79;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:10:"
git init
";i:1;N;i:2;N;}i:2;i:1662;}i:80;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1662;}i:81;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1682;}i:82;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Add files to it
";}i:2;i:1684;}i:83;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1700;}i:84;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1702;}i:85;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1708;}i:86;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
git add .
git add *
";i:1;N;i:2;N;}i:2;i:1708;}i:87;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27:"
git commit -m ' MESSAGE '
";i:1;N;i:2;N;}i:2;i:1744;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:12:"
git log -v
";i:1;N;i:2;N;}i:2;i:1786;}i:89;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1786;}i:90;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Go to GITHUB, create a repository";}i:2;i:1808;}i:91;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1841;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1841;}i:93;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1843;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Add as a remote
";}i:2;i:1845;}i:95;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1861;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1863;}i:97;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1869;}i:98;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30:"
git add remote github/origin
";i:1;N;i:2;N;}i:2;i:1869;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1869;}i:100;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1909;}i:101;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Push Changes
";}i:2;i:1911;}i:102;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1924;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1926;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1932;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
git push origin master/stable
";i:1;N;i:2;N;}i:2;i:1932;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1932;}i:107;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1974;}i:108;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Git Tagging";}i:2;i:1976;}i:109;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1987;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1989;}i:111;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1989;}i:112;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"Drupal can see tag version info to see if an upgrade is available";}i:2;i:1991;}i:113;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2056;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2056;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Add version to module.info";}i:2;i:2058;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2084;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:333:"
git tag 1.02 (Create tag)

git push --tags origin master (Push Tags)

git checkout -b 7.x (Create a new branch on the local system)

git branch (get branch(es))

git push origin 7.x:7.x  (push local 7.x state to remote 7.x)

git branch -d master (Delete master branch)

git push origin :master (push nothing to master to delete it)
";i:1;N;i:2;N;}i:2;i:2091;}i:118;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2091;}i:119;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2434;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Deleting Tag
";}i:2;i:2436;}i:121;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2449;}i:122;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2451;}i:123;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:179:"
git tag -d 1.02

git push --tags origin 7.x (Push tags)

git status (check status)

git add -p (check what HUNKS are there to add)

              - y

git commit -m "MESSAGE"  

";i:1;N;i:2;N;}i:2;i:2458;}i:124;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2458;}i:125;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2647;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Make Changes to work
";}i:2;i:2649;}i:127;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2670;}i:128;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2672;}i:129;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:367:"
git pull origin (to see if your state is in sync with remote state)

if all is up-to-date (your box is synced)

git status

git add - p (hunks to add)
  
git commit -m "MESSAGE"

git push origin        master
         ======        ======
         remote        branch
           ||            ||
     <In our case>  <Can be any name> 
           ||
         GITHUB
";i:1;N;i:2;N;}i:2;i:2679;}i:130;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2679;}}