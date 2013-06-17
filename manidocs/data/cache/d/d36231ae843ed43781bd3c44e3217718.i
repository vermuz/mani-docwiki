a:141:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Vagrant";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:375:"Vagrant allows developers to build, manage and share virtual development environments. Vagrant usesVirtualBox for its virtual machines and you can use Puppet or Chef as a provisioning tool. The goal ofVagrant is to offer developers the ability to build and work in a consistent virtualized environment without wasting time setting up a local version of Apache, PHP and MySQL.";}i:2;i:24;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:399;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:401;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Setup";i:1;i:2;i:2;i:401;}i:2;i:401;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:401;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:401;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"1. First, we have to download a Vagrant box. Run the following command from your terminal.";}i:2;i:421;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:511;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:63:"
$ vagrant box add base http://files.vagrantup.com/lucid32.box
";i:1;N;i:2;N;}i:2;i:518;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:518;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:"2. Go to the Vagrant project that you just downloaded and create a public directory.";}i:2;i:591;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:681;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:39:"
$ cd [vagrant project]
$ mkdir public
";i:1;N;i:2;N;}i:2;i:681;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:461:"
If you don't create a public directory, you will get the following error:
There was a problem with the configuration of Vagrant. The error message(s)
are printed below:
 
vm:
* Shared folder host path for 'public' doesn't exist: ./public
3. We have to make one change to the Vagrantfile which gives user www-data access to the Vagrant shared folder. I couldn't install Drupal without giving the user (www-data) access to the public directory (Issue #1364008).
";i:1;N;i:2;N;}i:2;i:735;}i:18;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:735;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:138:"The Vagrantfile is used to configure Vagrant on a per-project bases. The file can be located in the root directory of any Vagrant project.";}i:2;i:1206;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1344;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1344;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"Open up the Vagrantfile and replace:";}i:2;i:1346;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1382;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:51:"
config.vm.share_folder("v-root", "/vagrant", ".")
";i:1;N;i:2;N;}i:2;i:1389;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1389;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"With,";}i:2;i:1450;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1455;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:109:"
config.vm.share_folder("public", "/vagrant/public", "./public", :owner => "www-data", :group => "www-data")
";i:1;N;i:2;N;}i:2;i:1462;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1462;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"4. Finally, add the line below to your host file.";}i:2;i:1581;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1630;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:51:"
33.33.33.10 drupal.vbox.local dev-site.vbox.local
";i:1;N;i:2;N;}i:2;i:1637;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1637;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:109:"5. Now it's time to boot up our virtual machine. Using Terminal go to the Vagrant project and run vagrant up.";}i:2;i:1698;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1807;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
$ cd [vagrant project]
$ vagrant up
";i:1;N;i:2;N;}i:2;i:1814;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1814;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"The build process will take between 2 to 5 minutes.";}i:2;i:1861;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1913;}i:40;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1913;}i:41;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1913;}i:42;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1913;}i:43;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" Site ";}i:2;i:1917;}i:44;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:1923;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:" - ";}i:2;i:1926;}i:46;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:25:"http://drupal.vbox.local/";i:1;N;}i:2;i:1929;}i:47;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1954;}i:48;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1954;}i:49;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1954;}i:50;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1954;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:" PhpMyAdmin ";}i:2;i:1958;}i:52;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:1970;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" (If needed) - ";}i:2;i:1973;}i:54;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:36:"http://drupal.vbox.local/phpmyadmin/";i:1;N;}i:2;i:1988;}i:55;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2024;}i:56;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2024;}i:57;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2024;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2025;}i:59;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"Configure Default Development Site";i:1;i:1;i:2;i:2025;}i:2;i:2025;}i:60;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2025;}i:61;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2025;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:455:"The Vagrantfile defines two websites, drupal.vbox.local and dev-site.vbox.local. As stated earlier the drupal.vbox.local site has already been setup. However, the dev-site.vbox.local site has not been fully setup. The only configuration that has been created is the Apache vhost, and that's it. To setup the dev-site.vbox.local site, all we need to do is place a copy of Drupal into ./public/dev-site.vbox.local/www and create a database using phpMyAdmin.";}i:2;i:2075;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2530;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2530;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:159:"You may need to restart Apache, once you have created the dev-site.vbox.local/www folder. All we need to do is SSH into the virtual machine and restart Apache.";}i:2;i:2532;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2691;}i:67;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2691;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"1. SSH into the virtual machine by running the vagrant ssh command.";}i:2;i:2693;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2760;}i:70;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:111:"
$ cd [vagrant project]
$ vagrant ssh
2. Restart Apache by running the $ sudo service apache2 restart command.
";i:1;N;i:2;N;}i:2;i:2767;}i:71;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2888;}i:72;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Adding New Sites";i:1;i:1;i:2;i:2888;}i:2;i:2888;}i:73;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2888;}i:74;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2888;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:280:"Right now we have two sites setup, a default Drupal and development site. Both of these sites were already defined in the Vagrantfile. As developers, we tend to work with a lot more than two websites at any one time. Let's now setup another site using the d7-dev.vbox.local alias.";}i:2;i:2920;}i:76;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3200;}i:77;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3200;}i:78;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3202;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"Steps";}i:2;i:3204;}i:80;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3209;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:3211;}i:82;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3217;}i:83;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
1. Add 33.33.33.10 d7-dev.vbox.local to your hosts file.
";i:1;N;i:2;N;}i:2;i:3217;}i:84;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3217;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:"2. Open the Vagrantfile file and add d7-dev.vbox.local to the :localhost_aliases array.";}i:2;i:3285;}i:86;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3378;}i:87;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:89:"
:localhost_aliases => ["drupal.vbox.local", "dev-site.vbox.local", "d7-dev.vbox.local"]
";i:1;N;i:2;N;}i:2;i:3378;}i:88;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3378;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:188:"3. Restart the virtual machine so that the d7-dev.vbox.local site will get created. First, we must shutdown the virtual machine using vagrant halt and then boot it back up with vagrant up.";}i:2;i:3477;}i:90;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3671;}i:91;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:52:"
$ cd [vagrant project]
$ vagrant halt
$ vagrant up
";i:1;N;i:2;N;}i:2;i:3671;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3671;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:170:"4. SSH into the virtual machine (vagrant ssh) and download a copy of Drupal into/vagrant/public/d7-dev.vbox.local/www. You will have to create a d7-dev.vbox.local folder.";}i:2;i:3733;}i:94;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3903;}i:95;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3903;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"5. Once you have downloaded a copy of Drupal, go to ";}i:2;i:3905;}i:97;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:24:"http://d7-dev.vbox.local";i:1;N;}i:2;i:3957;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:" and install the site.";}i:2;i:3981;}i:99;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4003;}i:100;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4005;}i:101;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Vagrant Commands";i:1;i:1;i:2;i:4005;}i:2;i:4005;}i:102;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4005;}i:103;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4005;}i:104;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4037;}i:105;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Vagrant Up";}i:2;i:4039;}i:106;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4049;}i:107;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4051;}i:108;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4051;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"This is the main command that boots or builds a virtual machine.";}i:2;i:4053;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4123;}i:111;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:80:"
$ cd [vagrant project]
$ vagrant up
[default] Importing base box 'base'...
...
";i:1;N;i:2;N;}i:2;i:4123;}i:112;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4123;}i:113;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4213;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Vagrant Halt";}i:2;i:4215;}i:115;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4227;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4229;}i:117;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4229;}i:118;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"This command will shutdown the virtual machine and when you boot it back up you won't lose any data.";}i:2;i:4231;}i:119;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4337;}i:120;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:87:"
$ cd [vagrant project]
$ vagrant halt
[default] Attempting graceful shutdown of VM...
";i:1;N;i:2;N;}i:2;i:4337;}i:121;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4337;}i:122;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4434;}i:123;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Vagrant SSH";}i:2;i:4436;}i:124;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4447;}i:125;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4449;}i:126;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4449;}i:127;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:68:"This command will simply login you into the virtual machine via SSH.";}i:2;i:4451;}i:128;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4525;}i:129;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:716:"
$ cd [vagrant project]
$ vagrant ssh
Linux lucid32 2.6.32-38-generic #83-Ubuntu SMP Wed Jan 4 11:13:04 UTC 2012 i686 GNU/Linux
Ubuntu 12.04 LTS

Welcome to Ubuntu!
 * Documentation:  https://help.ubuntu.com/
New release 'precise' available.
Run 'do-release-upgrade' to upgrade to it.
 
Welcome to your Vagrant-built virtual machine.
Last login: Fri Sep 14 07:26:29 2012 from 10.0.2.2
vagrant@lucid32:~$
<code>

**Vagrant Destroy**

This command will delete the virtual machine and any file and database stored within the virtual machine. Only use this command if you're certain you want to start from scratch.
<code>
$ cd [vagrant project]
$ vagrant destroy
Are you sure you want to destroy the 'default' VM? [Y/N]
";i:1;N;i:2;N;}i:2;i:4525;}i:130;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4525;}i:131;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5251;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:"Vagrant Status";}i:2;i:5253;}i:133;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5267;}i:134;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5269;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5269;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:148:"This command will give you the current state of a virtual machine. Use this command if you want to know if a virtual machine is running or shutdown.";}i:2;i:5271;}i:137;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5425;}i:138;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:518:"
$ cd [vagrant project]
$ vagrant status
Current VM states:
 
default                  poweroff
 
The VM is powered off. To restart the VM, simply run `vagrant up`
If a virtual machine is running, then you should see the message below:

Current VM states:
 
default                  running
 
The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
";i:1;N;i:2;N;}i:2;i:5425;}i:139;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5951;}i:140;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5951;}}