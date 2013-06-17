a:349:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Drush Site Deployment
";}i:2;i:3;}i:4;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:25;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:27;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:27;}i:7;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:29;}i:8;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Site Install
";}i:2;i:31;}i:9;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:44;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"
1- Download Drupal";}i:2;i:46;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:71;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17:" drush dl drupal ";i:1;N;i:2;N;}i:2;i:71;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:71;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"2- Create DB. (Remember name, password).";}i:2;i:98;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:138;}i:16;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:138;}i:17;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:138;}i:18;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:138;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" PHPMyAdmin on localhost";}i:2;i:145;}i:20;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:169;}i:21;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:169;}i:22;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:2;}i:2;i:169;}i:23;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:169;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" Development Environment";}i:2;i:175;}i:25;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:199;}i:26;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:199;}i:27;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:199;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:199;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"      Creating a Database for Use With Drupal: Drupal requires not only UTF-8 encoded tables, but additionally a UTF-8 encoded database";}i:2;i:200;}i:30;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:341;}i:31;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:77:"CREATE DATABASE **DBNAME** DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci";i:1;N;i:2;N;}i:2;i:341;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:341;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"3- Site Install ";}i:2;i:428;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:450;}i:35;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:138:"
drush site-install standard --account-name=admin --account-pass=[useruser_pass] --db-url=mysql://[db_user]:[db_pass]@localhost/[db_name]
";i:1;N;i:2;N;}i:2;i:450;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:450;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"OR";}i:2;i:598;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:600;}i:39;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"drush si --db-url=mysql://[db_user]:[db_pass]@localhost/[db_name]";i:1;N;i:2;N;}i:2;i:607;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:607;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"4- Drush enables clean urls by default. Disable Clean urls. ";}i:2;i:682;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:742;}i:43;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"drush vset clean_url 0";i:1;N;i:2;N;}i:2;i:749;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:749;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"5- Check Site Status";}i:2;i:781;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:801;}i:47;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1115:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush status
 Drupal version                  :  7.19                  
 Site URI                        :  http://default        
 Database driver                 :  mysql                 
 Database hostname               :  localhost             
 Database username               :  root                  
 Database name                   :  drupalearn            
 Database                        :  Connected             
 Drupal bootstrap                :  Successful            
 Drupal user                     :  Anonymous             
 Default theme                   :  bartik                
 Administration theme            :  seven                 
 PHP configuration               :  /etc/php5/cli/php.ini 
 Drush version                   :  5.8                   
 Drush configuration             :                        
 Drupal root                     :  /var/www/drupal-7.19  
 Site path                       :  sites/default         
 File directory path             :  sites/default/files   
 Temporary file directory path   :  /tmp                  
";i:1;N;i:2;N;}i:2;i:808;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:808;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"5- Enjoy !";}i:2;i:1933;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1943;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1943;}i:52;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1945;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"Packages";}i:2;i:1947;}i:54;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1955;}i:55;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1957;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1957;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"6- Check Packages (all)";}i:2;i:1959;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1982;}i:59;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:" drush pml ";i:1;N;i:2;N;}i:2;i:1989;}i:60;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:34:"drush pml --status="not installed"";i:1;N;i:2;N;}i:2;i:2014;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:44:"drush pml --status="not installed, disabled"";i:1;N;i:2;N;}i:2;i:2062;}i:62;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"drush pml --type=theme";i:1;N;i:2;N;}i:2;i:2120;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2120;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"7- Download Devel";}i:2;i:2152;}i:65;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2169;}i:66;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:" drush dl devel ";i:1;N;i:2;N;}i:2;i:2176;}i:67;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:" drush pml ";i:1;N;i:2;N;}i:2;i:2206;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2206;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Devel is in Development package. ";}i:2;i:2226;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2259;}i:71;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2259;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Show Development package.";}i:2;i:2261;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2286;}i:74;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:360:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pml --package=development
 Name                                   Type    Status         Version 
 Devel (devel)                          Module  Not installed  7.x-1.3 
 Devel generate (devel_generate)        Module  Not installed  7.x-1.3 
 Devel node access (devel_node_access)  Module  Not installed  7.x-1.3 
";i:1;N;i:2;N;}i:2;i:2293;}i:75;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2293;}i:76;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Get Package information";}i:2;i:2664;}i:77;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2687;}i:78;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1239:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pmi devel
 Extension        :  devel                                                
 Project          :  devel                                                
 Type             :  module                                               
 Title            :  Devel                                                
 Description      :  Various blocks, pages, and functions for developers. 
 Version          :  7.x-1.3                                              
 Package          :  Development                                          
 Core             :  7.x                                                  
 PHP              :  5.2.4                                                
 Status           :  not installed                                        
 Path             :  sites/all/modules/devel                              
 Schema version   :  no schema installed                                  
 Files            :  devel.test, devel.mail.inc                           
 Requires         :  none                                                 
 Required by      :  devel_generate                                       


mani@mani-ubuntu:/var/www/drupal-7.19$ drush rln devel

";i:1;N;i:2;N;}i:2;i:2694;}i:79;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2694;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"8- Drush pipe pml information on a Module";}i:2;i:3943;}i:81;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3984;}i:82;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:153:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pml | grep -i comment
 Core         Comment (comment)                      Module  Enabled        7.19    
";i:1;N;i:2;N;}i:2;i:3991;}i:83;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3991;}i:84;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"9- Drush Disable Module";}i:2;i:4154;}i:85;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4177;}i:86;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush dis comment
";i:1;N;i:2;N;}i:2;i:4184;}i:87;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4184;}i:88;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"10- Drush Enable Module";}i:2;i:4252;}i:89;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4275;}i:90;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush -y en devel
";i:1;N;i:2;N;}i:2;i:4282;}i:91;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4282;}i:92;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"11- Drush Uninstall Module";}i:2;i:4350;}i:93;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4376;}i:94;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:67:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pm-uninstall comment
";i:1;N;i:2;N;}i:2;i:4383;}i:95;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4383;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"To avoid answering yes-no options";}i:2;i:4460;}i:97;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4493;}i:98;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:70:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush -y pm-uninstall comment
";i:1;N;i:2;N;}i:2;i:4500;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4500;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:"12- Check Installed modules in Core package and count lines (Number of Modules in the Core)";}i:2;i:4580;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4671;}i:102;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:114:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pml --type=module --package=core --status=enabled --pipe | wc -l
29
";i:1;N;i:2;N;}i:2;i:4678;}i:103;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4678;}i:104;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4802;}i:105;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"Themes";}i:2;i:4804;}i:106;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4810;}i:107;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4812;}i:108;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4812;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"13- List available themes";}i:2;i:4814;}i:110;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4839;}i:111;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:303:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush pml --type=theme
 Package  Name               Status    Version 
 Core     Bartik (bartik)    Enabled   7.19    
 Core     Garland (garland)  Disabled  7.19    
 Core     Seven (seven)      Enabled   7.19    
 Core     Stark (stark)      Disabled  7.19    
";i:1;N;i:2;N;}i:2;i:4846;}i:112;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4846;}i:113;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"14- What is the current theme";}i:2;i:5159;}i:114;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5188;}i:115;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:89:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget theme_default
theme_default: "bartik"
";i:1;N;i:2;N;}i:2;i:5195;}i:116;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5195;}i:117;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"15- Enable a theme";}i:2;i:5294;}i:118;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5312;}i:119;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:187:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush -y en garland
The following extensions will be enabled: garland
Do you really want to continue? (y/n): y
garland was enabled successfully.  
";i:1;N;i:2;N;}i:2;i:5319;}i:120;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5319;}i:121;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"16- Set default theme";}i:2;i:5516;}i:122;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5537;}i:123;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:199:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vset theme_default garland
theme_default was set to "garland". 
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget theme_default
theme_default: "garland"
";i:1;N;i:2;N;}i:2;i:5544;}i:124;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5544;}i:125;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"17- Drupal Admin Theme";}i:2;i:5753;}i:126;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5775;}i:127;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:197:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget admin_theme
admin_theme: "seven"
node_admin_theme: "1"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget admin_theme --exact
admin_theme: "seven"
";i:1;N;i:2;N;}i:2;i:5782;}i:128;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5782;}i:129;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"Download a new admin theme rubik tao and replace the admin theme.";}i:2;i:5989;}i:130;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6060;}i:131;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:723:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush dl rubik tao
Project rubik (7.x-4.0-beta8) downloaded to /var/www/drupal-7.19/sites/all/themes/rubik.                        [success]
Project tao (7.x-3.0-beta4) downloaded to /var/www/drupal-7.19/sites/all/themes/tao.                            [success]
mani@mani-ubuntu:/var/www/drupal-7.19$ drush -y en rubik tao
The following extensions will be enabled: rubik, tao
Do you really want to continue? (y/n): y
rubik was enabled successfully.                                                                                 [ok]
tao was enabled successfully.  
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vset admin_theme rubik
admin_theme was set to "rubik".                
";i:1;N;i:2;N;}i:2;i:6060;}i:132;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6060;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Set admin theme back to seven";}i:2;i:6793;}i:134;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6828;}i:135;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:102:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vset admin_theme seven
admin_theme was set to "seven". 
";i:1;N;i:2;N;}i:2;i:6828;}i:136;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6828;}i:137;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6940;}i:138;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"Coding Values and tracking changes to Drupal
";}i:2;i:6942;}i:139;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6987;}i:140;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6989;}i:141;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6989;}i:142;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"18- Comparison of data based on introducing a variable. Write values to a file ";}i:2;i:6991;}i:143;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7070;}i:144;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"before";}i:2;i:7071;}i:145;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:7077;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:" before before making a change and then write the values to a file named ";}i:2;i:7078;}i:147;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:7151;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"after";}i:2;i:7152;}i:149;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:7157;}i:150;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:", after making the changes.";}i:2;i:7158;}i:151;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7185;}i:152;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:708:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget > before
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget > after
mani@mani-ubuntu:/var/www/drupal-7.19$ diff before after
7a8,9
> default_nodes_main: "10"
> drupal_http_request_fails: "FALSE"
66a69,70
> site_403: ""
> site_404: ""
67a72
> site_frontpage: "node"
69c74,75
< site_name: "Site-Install"
---
> site_name: "Drush"
> site_slogan: "A Command line shell and scripting interface for Drupal"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget site_name --pipe
$variables['site_name'] = 'Drush';
mani@mani-ubuntu:/var/www/drupal-7.19$ drush vget site_slogan --pipe
$variables['site_slogan'] = 'A Command line shell and scripting interface for Drupal';
";i:1;N;i:2;N;}i:2;i:7192;}i:153;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7192;}i:154;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:7910;}i:155;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"User Management";}i:2;i:7912;}i:156;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7927;}i:157;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7929;}i:158;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7929;}i:159;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Get information about a user.";}i:2;i:7931;}i:160;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7960;}i:161;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:300:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush uinf admin
 User ID       :  1                                 
 User name     :  admin                             
 User mail     :  admin@example.com                 
 User roles    :  authenticated user, administrator 
 User status   :  active      
";i:1;N;i:2;N;}i:2;i:7967;}i:162;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7967;}i:163;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Get full information about a user";}i:2;i:8277;}i:164;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8310;}i:165;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:893:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush uinf admin --full
uid: 1
name: admin
pass: $S$DJBFoq/vRz.8gPwCROeTQAnwYfXJRSZ4.JyGArEbGzdEb6QP2SRA
mail: admin@example.com
theme: 
signature: 
signature_format: 
created: Thu, 01/17/2013 - 10:11
access: Thu, 01/17/2013 - 13:05
login: Thu, 01/17/2013 - 10:34
status: 1
timezone: America/Anguilla
language: 
picture: 
init: admin@example.com
roles: 
Array
(
    [2] => authenticated user
    [3] => administrator
)

rdf_mapping: 
Array
(
    [rdftype] => Array
        (
            [0] => sioc:UserAccount
        )

    [name] => Array
        (
            [predicates] => Array
                (
                    [0] => foaf:name
                )

        )

    [homepage] => Array
        (
            [predicates] => Array
                (
                    [0] => foaf:page
                )

            [type] => rel
        )

)

";i:1;N;i:2;N;}i:2;i:8317;}i:166;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8317;}i:167;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9220;}i:168;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Change Admin Password
";}i:2;i:9222;}i:169;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9244;}i:170;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9246;}i:171;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9252;}i:172;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:74:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush upwd admin --password=hello
";i:1;N;i:2;N;}i:2;i:9252;}i:173;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9252;}i:174;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9336;}i:175;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Generate a one time login ";}i:2;i:9338;}i:176;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:9364;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:".
";}i:2;i:9367;}i:178;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9369;}i:179;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9371;}i:180;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9371;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Preferable method.";}i:2;i:9373;}i:182;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9391;}i:183;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:270:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush uli admin
default does not appear to be a resolvable hostname or IP, not starting browser.                                [warning]
http://default/?q=user/reset/1/1358443596/bSPfk8_3_uS-yiKAn-k1USMQsQwkt6TMH2IhS_T3LcU/login
";i:1;N;i:2;N;}i:2;i:9398;}i:184;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9398;}i:185;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:17:":onetimelogin.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:9678;}i:186;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9700;}i:187;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9700;}i:188;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9702;}i:189;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Create User
";}i:2;i:9704;}i:190;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9716;}i:191;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9718;}i:192;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:520:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ucrt test --mail="test@example.com" --password=test
 User ID       :  2                  
 User name     :  test               
 User mail     :  test@example.com   
 User roles    :  authenticated user 
 User status   :  active  

mani@mani-ubuntu:/var/www/drupal-7.19$ drush uinf test
 User ID       :  2                  
 User name     :  test               
 User mail     :  test@example.com   
 User roles    :  authenticated user 
 User status   :  active          
";i:1;N;i:2;N;}i:2;i:9725;}i:193;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9725;}i:194;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10255;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Block User";}i:2;i:10257;}i:196;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10267;}i:197;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10269;}i:198;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ublk test
";i:1;N;i:2;N;}i:2;i:10276;}i:199;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10276;}i:200;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10342;}i:201;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Check User Info
";}i:2;i:10344;}i:202;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10360;}i:203;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:10362;}i:204;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10368;}i:205;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:237:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush uinf test
 User ID       :  2                  
 User name     :  test               
 User mail     :  test@example.com   
 User roles    :  authenticated user 
 User status   :  blocked   
";i:1;N;i:2;N;}i:2;i:10368;}i:206;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10368;}i:207;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"Note: If you want to be able to block both admin and the user test.";}i:2;i:10615;}i:208;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10682;}i:209;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"drush blk 1,test";i:1;N;i:2;N;}i:2;i:10689;}i:210;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10689;}i:211;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10715;}i:212;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Unblock User";}i:2;i:10717;}i:213;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10729;}i:214;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10731;}i:215;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:293:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush uublk test
sh: 1: /usr/sbin/sendmail: not found
WD mail: Error sending e-mail (from admin@example.com to test@example.com).                                     [error]
Unable to send e-mail. Contact the site administrator if the problem persists.
";i:1;N;i:2;N;}i:2;i:10738;}i:216;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10738;}i:217;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11041;}i:218;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Cancel User Account";}i:2;i:11043;}i:219;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11062;}i:220;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11064;}i:221;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:429:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ucan test --delete-content
Cancelling the user account with the following information:
 User ID       :  2                  
 User name     :  test               
 User mail     :  test@example.com   
 User roles    :  authenticated user 
 User status   :  active             

All content created by this user will be deleted!
Cancel user account?:  (y/n): y
test has been deleted.
";i:1;N;i:2;N;}i:2;i:11071;}i:222;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11071;}i:223;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11510;}i:224;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Drupal Site Management";}i:2;i:11512;}i:225;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11534;}i:226;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11536;}i:227;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11536;}i:228;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11538;}i:229;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Clear Cache
";}i:2;i:11540;}i:230;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11552;}i:231;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11554;}i:232;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11554;}i:233;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"Drupal Blocks and Menus consistently burden the site with cache buildup.";}i:2;i:11556;}i:234;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11628;}i:235;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:110:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush cc all
'all' cache was cleared in /var/www/drupal-7.19#default 
";i:1;N;i:2;N;}i:2;i:11635;}i:236;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11635;}i:237;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11755;}i:238;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Cron Job
";}i:2;i:11757;}i:239;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11766;}i:240;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11768;}i:241;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:11768;}i:242;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:11768;}i:243;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11768;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" Execute scheduled jobs.";}i:2;i:11779;}i:245;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11803;}i:246;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11803;}i:247;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:4;}i:2;i:11803;}i:248;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:11803;}i:249;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" Execute updates etcetera.";}i:2;i:11814;}i:250;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:11840;}i:251;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:11840;}i:252;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:11840;}i:253;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:10:"drush cron";i:1;N;i:2;N;}i:2;i:11847;}i:254;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11847;}i:255;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:124:"Note: When cron finds issues, i.e updates. it tries to email. If you have setup an email, you should be able to receive one.";}i:2;i:11869;}i:256;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11993;}i:257;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11993;}i:258;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11995;}i:259;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Check Recent Log Messages
";}i:2;i:11997;}i:260;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12023;}i:261;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"
Used to be watchdog (named retained in DB). D7 uses dblog module.";}i:2;i:12025;}i:262;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12091;}i:263;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12091;}i:264;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12093;}i:265;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:"Watchdog DB related system communication";}i:2;i:12095;}i:266;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12135;}i:267;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12137;}i:268;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:616:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush wd-list
Select a message type or severity level.
 [0]   :  Cancel                
          == message types ==   
 [1]   :  actions               
 [2]   :  cron                  
 [3]   :  mail                  
 [4]   :  system                
 [5]   :  user                  
          == severity levels == 
 [6]   :  emergency(0)          
 [7]   :  alert(1)              
 [8]   :  critical(2)           
 [9]   :  error(3)              
 [10]  :  warning(4)            
 [11]  :  notice(5)             
 [12]  :  info(6)               
 [13]  :  debug(7)       
";i:1;N;i:2;N;}i:2;i:12144;}i:269;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12144;}i:270;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12770;}i:271;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Show Watchdog log messages
";}i:2;i:12772;}i:272;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12799;}i:273;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12801;}i:274;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1171:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ws
 Id  Date          Severity  Type    Message                                                            
 57  17/Jan 13:39  notice    user    Deleted user: test .                                               
 56  17/Jan 13:38  error     mail    Error sending e-mail (from admin@example.com to test@example.com). 
 55  17/Jan 13:32  notice    user    Session opened for test.                                           
 54  17/Jan 13:28  notice    cron    Cron run completed.                                                
 53  17/Jan 13:28  notice    user    Session opened for admin.                                          
 52  17/Jan 13:28  notice    user    User admin used one-time login link at time 1358443596.            
 51  17/Jan 10:34  notice    user    Session opened for admin.                                          
 50  17/Jan 10:12  notice    cron    Cron run completed.                                                
 49  17/Jan 10:11  notice    user    Session opened for admin.                                          
 48  17/Jan 10:11  info      system  update module enabled.            
";i:1;N;i:2;N;}i:2;i:12808;}i:275;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:462:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ws --count=5 --type=system
 Id  Date          Severity  Type    Message                    
 48  17/Jan 10:11  info      system  update module enabled.     
 47  17/Jan 10:11  info      system  update module installed.   
 34  17/Jan 10:11  info      system  standard module enabled.   
 33  17/Jan 10:11  info      system  standard module installed. 
 32  17/Jan 10:11  info      system  toolbar module enabled.   
";i:1;N;i:2;N;}i:2;i:13994;}i:276;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13994;}i:277;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:14467;}i:278;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Check messages in real time.
";}i:2;i:14469;}i:279;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:14498;}i:280;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:14500;}i:281;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14506;}i:282;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1286:"
mani@mani-ubuntu:/var/www/drupal-7.19$ drush ws --tail
 Id  Date          Severity  Type    Message                                                            
 48  17/Jan 10:11  info      system  update module enabled.                                             
 49  17/Jan 10:11  notice    user    Session opened for admin.                                          
 50  17/Jan 10:12  notice    cron    Cron run completed.                                                
 51  17/Jan 10:34  notice    user    Session opened for admin.                                          
 52  17/Jan 13:28  notice    user    User admin used one-time login link at time 1358443596.            
 53  17/Jan 13:28  notice    user    Session opened for admin.                                          
 54  17/Jan 13:28  notice    cron    Cron run completed.                                                
 55  17/Jan 13:32  notice    user    Session opened for test.                                           
 56  17/Jan 13:38  error     mail    Error sending e-mail (from admin@example.com to test@example.com). 
 57  17/Jan 13:39  notice    user    Deleted user: test .                                               

 58  17/Jan 13:56  notice    user    Login attempt failed for test.      
";i:1;N;i:2;N;}i:2;i:14506;}i:283;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14506;}i:284;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:15802;}i:285;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Updating Drupal
";}i:2;i:15804;}i:286;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:15820;}i:287;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15822;}i:288;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15822;}i:289;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"No need to use update.php. You can update the db as well in one go.";}i:2;i:15824;}i:290;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15891;}i:291;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush up
";i:1;N;i:2;N;}i:2;i:15898;}i:292;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15898;}i:293;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:15957;}i:294;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Archiving and Restoring Sites";}i:2;i:15959;}i:295;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:15988;}i:296;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15990;}i:297;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15990;}i:298;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:15992;}i:299;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Export entire schema and data
";}i:2;i:15994;}i:300;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16024;}i:301;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16026;}i:302;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:143:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush sql-dump --result-file=../backup-2013-01-17.sql
Database dump saved to ../backup-2013-01-17.sql 
";i:1;N;i:2;N;}i:2;i:16033;}i:303;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16033;}i:304;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:16186;}i:305;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Delete DB
";}i:2;i:16188;}i:306;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16198;}i:307;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16200;}i:308;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:103:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush sql-drop
Do you really want to drop all tables? (y/n): y
";i:1;N;i:2;N;}i:2;i:16207;}i:309;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16207;}i:310;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:16320;}i:311;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Restore DB";}i:2;i:16322;}i:312;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16332;}i:313;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16334;}i:314;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:602:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush sql-drop
Do you really want to drop all tables? (y/n): y
mani@mani-ubuntu:/var/www/drupal-7.15$ drush sqlq --file=../backup-2013-01-17.sql 
mani@mani-ubuntu:/var/www/drupal-7.15$ drush cache-clear
Enter a number to choose which cache to clear.
 [0]  :  Cancel         
 [1]  :  all            
 [2]  :  drush          
 [3]  :  theme-registry 
 [4]  :  menu           
 [5]  :  css-js         
 [6]  :  block          
 [7]  :  module-list    
 [8]  :  theme-list     
 [9]  :  registry       

1
'all' cache was cleared in /var/www/drupal-7.15#default   
";i:1;N;i:2;N;}i:2;i:16341;}i:315;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16341;}i:316;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:16953;}i:317;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Backup site, DB, code into a single tar file";}i:2;i:16955;}i:318;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:16999;}i:319;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17001;}i:320;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1200:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush ard --destination=../backup-2013-01-17.tar
 Drupal version                  :  7.19                  
 Site URI                        :  http://default        
 Database driver                 :  mysql                 
 Database hostname               :  localhost             
 Database username               :  root                  
 Database name                   :  drupalold             
 Database                        :  Connected             
 Drupal bootstrap                :  Successful            
 Drupal user                     :  Anonymous             
 Default theme                   :  bartik                
 Administration theme            :  seven                 
 PHP configuration               :  /etc/php5/cli/php.ini 
 Drush version                   :  5.8                   
 Drush configuration             :                        
 Drupal root                     :  /var/www/drupal-7.15  
 Site path                       :  sites/default         
 File directory path             :  sites/default/files   
 Temporary file directory path   :  /tmp                  

Archive saved to /var/www/backup-2013-01-17.tar
";i:1;N;i:2;N;}i:2;i:17008;}i:321;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17008;}i:322;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:18218;}i:323;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Drop the site DB again";}i:2;i:18220;}i:324;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:18242;}i:325;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18244;}i:326;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:103:"
mani@mani-ubuntu:/var/www/drupal-7.15$ drush sql-drop
Do you really want to drop all tables? (y/n): y
";i:1;N;i:2;N;}i:2;i:18251;}i:327;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18251;}i:328;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:18364;}i:329;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Delete the site folder";}i:2;i:18366;}i:330;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:18388;}i:331;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18390;}i:332;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:79:"
mani@mani-ubuntu:/var/www$ sudo rm -Rf drupal-7.15
[sudo] password for mani: 
";i:1;N;i:2;N;}i:2;i:18397;}i:333;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18397;}i:334;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:18486;}i:335;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Archive Restore";}i:2;i:18488;}i:336;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:18503;}i:337;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18505;}i:338;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:256:"
mani@mani-ubuntu:/var/www$ drush arr backup-2013-01-17.tar
No tables to drop.                                                                                                                                  [ok]
Archive restored to /var/www/drupal-7.15  
";i:1;N;i:2;N;}i:2;i:18512;}i:339;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18512;}i:340;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:18778;}i:341;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Clear Cache";}i:2;i:18780;}i:342;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:18791;}i:343;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18793;}i:344;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:68:"
mani@mani-ubuntu:/var/www$ drush cc all
'drush' cache was cleared 
";i:1;N;i:2;N;}i:2;i:18800;}i:345;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18800;}i:346;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Check website now.";}i:2;i:18878;}i:347;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18878;}i:348;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:18878;}}