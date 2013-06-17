a:424:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Drupal Module Development";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:42;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Drupal Request Processing";i:1;i:1;i:2;i:42;}i:2;i:42;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:42;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:42;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"request a SERVER
htaccess rewrites rules, for incoming request to something like index.php";}i:2;i:83;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:173;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:378:"
                                               -    bootstrap.inc        
                                               -    menu.inc
           Index.php -------------------------->    random.inc
           - loads core functionality          -    mysql
           - figure out what site to load      -    user cookies
           ||||||||||||||||
           TALK TO MODULES

";i:1;N;i:2;N;}i:2;i:180;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:568;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Devel";i:1;i:1;i:2;i:568;}i:2;i:568;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:568;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:568;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"Enable devel module and blocks. In the execute php block type,";}i:2;i:589;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:651;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
global $user;
print_r($user);
";i:1;N;i:2;N;}i:2;i:658;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:305:"
print_r means print recursively.
Drupal7 equivalent is debug($user).
Drupal set message (dsm) - dsm($user) - uses kromo library.
Assign variables         - dsm($user,'variable1')
Assign variable          - dsm($user, 'My String')
Kromo print recursive    - kpr($user) - same as print recursive (print_r)
";i:1;N;i:2;N;}i:2;i:704;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1019;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Site Structure";i:1;i:1;i:2;i:1019;}i:2;i:1019;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1019;}i:21;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:654:"
                                              Site
                                        ------ |----------
                                       |                 |
                                      all             default
                                  ---  | ----
                                  |         |
                             - modules -   themes
                            |           |
                           contrib    custom
                                        |
                                     -demo-
                                   |       |
                               demo.info   demo.module       
";i:1;N;i:2;N;}i:2;i:1054;}i:22;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1718;}i:23;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Hook API";i:1;i:1;i:2;i:1718;}i:2;i:1718;}i:24;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1718;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1718;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:"Drupal modules interact by responding to events. Modules should not touch core, rather they should manipulate triggered events.";}i:2;i:1742;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1869;}i:28;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1871;}i:29;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Hook Permission";i:1;i:2;i:2;i:1871;}i:2;i:1871;}i:30;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1871;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1871;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Define user permissions.";}i:2;i:1900;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1924;}i:34;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1924;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:184:"This hook can supply permissions that the module defines, so that they can be selected on the user permissions page and used to grant or restrict access to actions the module performs.";}i:2;i:1926;}i:36;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2110;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:54:"
function MODULE-NAME_permission(--parameters--)
{

}
";i:1;N;i:2;N;}i:2;i:2117;}i:38;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2181;}i:39;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Hook Form Alter";i:1;i:2;i:2;i:2181;}i:2;i:2181;}i:40;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2181;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2181;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"hook_form_alter deals with alterations before a form is rendered.  ";}i:2;i:2213;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2280;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2282;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Hook Node View";i:1;i:2;i:2;i:2282;}i:2;i:2282;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2282;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2282;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:133:"Act on a node that is being assembled before rendering. node_view is run when node is being viewed.
Check for associated information.";}i:2;i:2311;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2444;}i:50;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15:"
krumo($node);
";i:1;N;i:2;N;}i:2;i:2451;}i:51;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2476;}i:52;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"Module Invoke All";i:1;i:2;i:2;i:2476;}i:2;i:2476;}i:53;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2476;}i:54;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2476;}i:55;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:241:"When modules with APIs (views) want data to be amended while it is still being processed. So module_invoke_all asks, before my containing function should be considered done, is there any other module that wants to participate with this data?";}i:2;i:2507;}i:56;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2748;}i:57;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:221:"

                                                           ---  Module 1
                                    module_invoke_all      ---  Module 2
                                                           ---  Module 3
";i:1;N;i:2;N;}i:2;i:2755;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2986;}i:59;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Return Array";i:1;i:2;i:2;i:2986;}i:2;i:2986;}i:60;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2986;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"
return array(
              'key' => t('value'),
            );
";i:1;N;i:2;N;}i:2;i:3017;}i:62;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3017;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:105:"Return array can contain arrays with in it containing key values.
In the above code t means translatable.";}i:2;i:3092;}i:64;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3197;}i:65;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3199;}i:66;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Add Content";i:1;i:2;i:2;i:3199;}i:2;i:3199;}i:67;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3199;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3199;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:130:"Fields are renderable arrays. We can add content. So, when we make a field, we have to make it an array and define its properties.";}i:2;i:3224;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3354;}i:71;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:206:"
$node -> content['demo_field'] = array(
                '#type'   => 'markup',
                '#markup' => '<p>.t('this is done').</p>',
                '#weight' => -10,
                );
krumo($node);
";i:1;N;i:2;N;}i:2;i:3361;}i:72;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3576;}i:73;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3576;}i:74;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3576;}i:75;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:" markup means text";}i:2;i:3580;}i:76;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3598;}i:77;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3598;}i:78;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3598;}i:79;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3598;}i:80;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" weight shows order to show in form";}i:2;i:3602;}i:81;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3637;}i:82;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3637;}i:83;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3637;}i:84;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3637;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" krumo shows values that we assigned.";}i:2;i:3641;}i:86;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3678;}i:87;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3678;}i:88;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3678;}i:89;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3678;}i:90;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:" This field shows up at the top and displays this is done.";}i:2;i:3682;}i:91;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:3740;}i:92;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:3740;}i:93;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:3740;}i:94;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3740;}i:95;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Let us now add a list to our site,";}i:2;i:3742;}i:96;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3776;}i:97;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:192:"
$node -> content['demo-list'] = array(
                '#items'  => array('green','red','blue'),
                '#theme'  => 'item_list',
                '#weight' => -9,
                );
";i:1;N;i:2;N;}i:2;i:3783;}i:98;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:3984;}i:99;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:3984;}i:100;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:3984;}i:101;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:" This comes after -10";}i:2;i:3988;}i:102;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4009;}i:103;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4009;}i:104;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4009;}i:105;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4009;}i:106;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" displays the list in a list like ";}i:2;i:4013;}i:107;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4047;}i:108;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4047;}i:109;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4047;}i:110;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4047;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:" theme is style";}i:2;i:4051;}i:112;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4066;}i:113;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4066;}i:114;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4066;}i:115;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
         - green
         - red
         - blue
";i:1;N;i:2;N;}i:2;i:4072;}i:116;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4131;}i:117;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Drupal Menu System";i:1;i:1;i:2;i:4131;}i:2;i:4131;}i:118;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:4131;}i:119;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4131;}i:120;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Integrating into Drupal menu system via hook_menu. ";}i:2;i:4165;}i:121;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4217;}i:122;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:4217;}i:123;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4217;}i:124;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4217;}i:125;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" We can add a new navigation item. ";}i:2;i:4221;}i:126;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4256;}i:127;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4256;}i:128;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4256;}i:129;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4256;}i:130;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" Drupal uses $items (Associative Array). ";}i:2;i:4260;}i:131;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4301;}i:132;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4301;}i:133;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4301;}i:134;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4301;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:" When Drupal finds the requested page and after checking user permissions";}i:2;i:4305;}i:136;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4378;}i:137;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4378;}i:138;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4378;}i:139;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4378;}i:140;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" Drupal uses page callback to call the relevant function to produce output.";}i:2;i:4382;}i:141;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4457;}i:142;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4457;}i:143;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:4457;}i:144;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:310:"
function mymodule_menu() {
        $item['about'] => array(
               'title'         => 'About Us',
               'description'   => 'A Description',
               'page callback' => 'mymodule_about',
              access callback' => array('access content'),
              );
        return $item;
}
";i:1;N;i:2;N;}i:2;i:4464;}i:145;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4464;}i:146;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"So, lets build a menu item to show in the Navigation bar,";}i:2;i:4784;}i:147;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4841;}i:148;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:408:"
function mymodule_menu()
{
   $items = array();
   $items['magic'] = array(
               'title' => 'little magic',
       'page callback' => 'menu_magic_basic',
     'access callback' => 'user_access',
   
   );
   
}

function menu_magic_basic()
{
  $content = array();
  $content['raw_markup'] = array(
        '#type'   => 'markup',
        '#markup' => '<p>True Magic</p>',
  );
  return $content;
}
";i:1;N;i:2;N;}i:2;i:4848;}i:149;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4848;}i:150;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"Note:";}i:2;i:5266;}i:151;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5271;}i:152;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5271;}i:153;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5271;}i:154;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5271;}i:155;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" You don`t need a translate t() for meny";}i:2;i:5275;}i:156;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5315;}i:157;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5315;}i:158;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5315;}i:159;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5315;}i:160;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5319;}i:161;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:5320;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5323;}i:163;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:5324;}i:164;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"> $items['magic'] ";}i:2;i:5326;}i:165;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"--";}i:2;i:5344;}i:166;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5346;}i:167;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:28:"http://www.example.com/magic";i:1;s:21:"www.example.com/magic";}i:2;i:5347;}i:168;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5368;}i:169;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5368;}i:170;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5368;}i:171;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5368;}i:172;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:" access callback can return true or false";}i:2;i:5372;}i:173;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5413;}i:174;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5413;}i:175;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5413;}i:176;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5413;}i:177;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:" Drupal decides if user viewing has permission to view page";}i:2;i:5417;}i:178;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5476;}i:179;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5476;}i:180;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5476;}i:181;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5476;}i:182;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:" page callback is the function to call when someone navigates to ";}i:2;i:5480;}i:183;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:28:"http://www.example.com/magic";i:1;s:21:"www.example.com/magic";}i:2;i:5545;}i:184;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5566;}i:185;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5566;}i:186;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5566;}i:187;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5567;}i:188;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Page Callback";i:1;i:2;i:2;i:5567;}i:2;i:5567;}i:189;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5567;}i:190;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5567;}i:191;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"It maps ";}i:2;i:5594;}i:192;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:5602;}i:193;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" to the PHP function, which is defined in the module. ";}i:2;i:5605;}i:194;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5659;}i:195;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:788:"
function mymodule_menu()
{
    $items['about'] = array(
         'title'            => 'About us',
         'description'      => 'description',
         'page callback'    =>  module_about,
         'access arguments' =>  array('access content'), 
    );
  return $items;
}

//****************************************************************************
access callback  - Check if user is allowed to be here.
access arguments - List of args that we want to pass to the callback function
which means, 
            user_access('access content') is access content checked under 
            this logged in user.
Note: Drupal will call user_access automatically so it is optional
//****************************************************************************


function module_about()
{
}
";i:1;N;i:2;N;}i:2;i:5666;}i:196;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5666;}i:197;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:99:"We use callback to call a function to build contents of a page when you click an item in the menu. ";}i:2;i:6464;}i:198;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6564;}i:199;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6564;}i:200;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6564;}i:201;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6564;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" If there is no content - 404 is served.";}i:2;i:6568;}i:203;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6608;}i:204;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6608;}i:205;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6608;}i:206;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6608;}i:207;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:" If there is content    - Drupal wraps it in DRUPAL Theme.";}i:2;i:6612;}i:208;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6670;}i:209;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6670;}i:210;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6670;}i:211;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6672;}i:212;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:46:"Using URL Arguments in Page Callback Functions";i:1;i:2;i:2;i:6672;}i:2;i:6672;}i:213;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6672;}i:214;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6672;}i:215;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"If we want to give the user the ability to pass something in the query string to change the output from the callback, for example - ";}i:2;i:6732;}i:216;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6865;}i:217;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6865;}i:218;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6865;}i:219;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6865;}i:220;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6869;}i:221;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:43:"http://localhost/mani-drupal/magic/anything";i:1;N;}i:2;i:6870;}i:222;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6913;}i:223;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6913;}i:224;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6913;}i:225;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6913;}i:226;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6917;}i:227;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:38:"http://localhost/mani-drupal/magic/joe";i:1;N;}i:2;i:6918;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:". ";}i:2;i:6956;}i:229;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6958;}i:230;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6958;}i:231;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6958;}i:232;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6958;}i:233;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"These values decide the response of the system.";}i:2;i:6959;}i:234;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7006;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7006;}i:236;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:7008;}i:237;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:105:"We can also change the ability of our menu link to show up as a tab rather than a link in the navigation.";}i:2;i:7010;}i:238;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:7115;}i:239;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7117;}i:240;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1559:"
function menu_magic_menu() {
       $items = array();
       
       $items['magic'] = array(
      'title'            => 'A little magic',
      'page callback'    => 'menu_magic_basic',
      'access arguments' => array('access content'),
      );
      //*******************************************************************
      // So now lets give the URL a wildcard character and let them
      // enter anything they want here. This value can be passed
      // to our callback function to display an appropriate response.
      
      // Whatever is in page arguments gets passed to the page callback function
      // so when the user types magic/joe , argument joe is at position 1 and hence
      // page arguments - array(1)
      // The trick is to remember that PHP starts counting from zero.
      
      // If page arguments is passed an array(1,2) then it will receive
      // two arguments i.e. magic and whatever is passed in %
      
      // Another argument in this setup is the **file** argument through which,
      // we can specify that the page callback function can be found in the
      // following file. menu_magic_extra.inc is loaded when it is needed.
      //*******************************************************************
      $items['magic/%'] = array(
      'title'           => 'Even more magical',
      'page callback'   => 'menu_magic_extra',
      'page arguments'  =>  array(1),
      'access arguments'=> array('access content'),
      'file'            => menu_magic_extra.inc
      );
     return $items;
}
";i:1;N;i:2;N;}i:2;i:7124;}i:241;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7124;}i:242;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:151:"Now if I am thinking what the user will enter in the address bar, i.e. magic/joe or magic/123. Drupal provides a special character called the wildcard ";}i:2;i:8693;}i:243;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8844;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"%";}i:2;i:8845;}i:245;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8846;}i:246;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:8847;}i:247;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8848;}i:248;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8848;}i:249;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"In the separate file menu_magic_extra.inc let us implement the page callback function,";}i:2;i:8850;}i:250;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8942;}i:251;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:378:"
function menu_magic_extra($wildcard) {
          // We want to use the passed content and display it
          // We want to use a render-able array
          $content = array(
            '#type'  = 'markup',          
            '#markup'= '<p>'.t('The wildcard contains the value "%wildcard".',array('%wildcard'=$wildcard)).'<p>',
          );
          return $content;
}
";i:1;N;i:2;N;}i:2;i:8942;}i:252;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8942;}i:253;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:"Instead of just adding items to the navigation, we want to be able to add items to the tabs.";}i:2;i:9330;}i:254;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9422;}i:255;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:469:"
        $items['user/%/magic'] = array(
        'title'            => 'Magic',
        'description'      => 'Magical magic for users',
        'page callback'    => 'menu_magic_user_tab',
        'page arguments'   => array(1),
        'access callback'  => 'user_access',
        'access arguments' => array('administer users'),
        'file'             => 'menu_magic.user.inc',
        'type'             => MENU_LOCAL_TASK,
        );
        //return $items; 
";i:1;N;i:2;N;}i:2;i:9429;}i:256;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9429;}i:257;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"Notes,";}i:2;i:9908;}i:258;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9920;}i:259;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:154:"
/user/%  => user_id
page arguments will receive whatever the value is passed in /user/% wildcard.
type property decides, what type of menu item this is.
";i:1;N;i:2;N;}i:2;i:9920;}i:260;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9920;}i:261;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Let us also implement the callback function,";}i:2;i:10084;}i:262;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10128;}i:263;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:385:"
     function menu_magic_user_tab($wildcard)
     {
       if (is_numeric($wildcard) && ($account = user_load($wildcard)))
       {
          return array(
               '#type'   => 'markup',
               '#markup' => t("%username is totally awesome.", array('%username' => $account->name)),
          );
       }
       else{
          return drupal_not_found();
       }
     }
";i:1;N;i:2;N;}i:2;i:10135;}i:264;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:432:"
First check if wildcard is a numeric value . Use Drupal`s user_load function which takes one argument a user_id and then 
load a user object from the database,

Once, the user id is loaded then make it available to $account. So, if we are able to find the userid from the database, then
Show message that username is awesome, replace username with user account name from database.

drupal_not_found will display a 404 page for us.
";i:1;N;i:2;N;}i:2;i:10535;}i:265;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10977;}i:266;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"Contextual Menu Links and Menu Autoloaders";i:1;i:2;i:2;i:10977;}i:2;i:10977;}i:267;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10977;}i:268;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10977;}i:269;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:107:"When we scroll our a page in drupal, we see a machine wheel sign on hover. That is contextual link widget.
";}i:2;i:11033;}i:270;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:44:"https://drupal.org/files/contextuallinks.jpg";i:1;N;}i:2;i:11140;}i:271;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11184;}i:272;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11184;}i:273;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:109:"We shall now add links to the contextual links widget. Contextual links are visible both in nodes and blocks.";}i:2;i:11186;}i:274;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11295;}i:275;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11295;}i:276;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:"Now we will add a contextual link that will sit pretty for all nodes on our site.";}i:2;i:11297;}i:277;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11378;}i:278;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11378;}i:279;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11380;}i:280;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Autoloaders";}i:2;i:11382;}i:281;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11393;}i:282;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11395;}i:283;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11395;}i:284;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:205:"A mechanism that allows us to use wildcards and a bit of shorthand in order to perform some tasks like,
Loading the node object from the database, without having to rewrite the same code every single time.";}i:2;i:11397;}i:285;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11602;}i:286;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11602;}i:287;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"In the menu_magic code, lets create a new menuitem,";}i:2;i:11604;}i:288;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11655;}i:289;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1065:"
//********************************************************************
// When we want to define something as a contextual link, we must define 
it as a LOCAL_TASK -> this will show in the tabs

Now, to convert this new tab into a contextual link, we use context
property - with context we decide where we want that tab to show up.

We will be to see both the tab and the contextual link in the end
defining it in the context

Following statement is inclusive OR which means, turn on both of these
features,
'context'         =>  MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE
//********************************************************************

$items['node/%/magic'] = array(
	  'title'           =>  'Magic',
	  'description'     =>  'Do amazing',
	  'page callback'   =>  'menu_magic_node_content',
	  'page arguments'  =>  array(1),
	  'access arguments'=>  array('access content'),
	  'file'            =>  'menu_magic_context.inc'
	  'type'            =>  MENU_LOCAL_TASK,
	  'context'         =>  MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE,
	  );

return $items;
";i:1;N;i:2;N;}i:2;i:11662;}i:290;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11662;}i:291;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"We will not also implement the callback function,";}i:2;i:12737;}i:292;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12786;}i:293;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1165:"
//Notes*******************************************************
We will use incoming node id to load the contents of the node.
The node id is part of the page arguments which we grab from the
incoming address node/%/magic

We will also turn the content upside down.


   function menu_magic_node_context($nid)
   {
   	  Check if node is numeric and can be loaded from the database
   	  if(is_numeric($nid) && $node = node_load($nid))
   	  {
         //**************************************************
         Use the magicify function to invert body of the node
         The value of the body element of a node is body['und'][0]['value']
         We can get this value from the devel module.

         $text = _menu_magicify($node->body['und'][0]['value']);

         // Build an array to return the text
         // Returning a renderable array
         $output = array(
               '#type'   => 'markup',
               '#markup' => $text,
         );
         return $output;

   	  }
   	  else
   	  {
         return drupal_not_found();
   	  }

   }

   function _menu_magicify($text)
   {
     $subsitutions = array(
        '' => '',
     )

   }
";i:1;N;i:2;N;}i:2;i:12793;}i:294;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12793;}i:295;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Refresh cache and check the output.";}i:2;i:13968;}i:296;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14003;}i:297;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14003;}i:298;a:3:{i:0;s:14:"underline_open";i:1;a:0:{}i:2;i:14005;}i:299;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"
";}i:2;i:14007;}i:300;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:14008;}i:301;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"Autoloaders";}i:2;i:14010;}i:302;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:14021;}i:303;a:3:{i:0;s:15:"underline_close";i:1;a:0:{}i:2;i:14023;}i:304;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14025;}i:305;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14025;}i:306;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"When we deliver output based on node id, receiving it in our function to display it. Drupal developers
wanted to automate this functionality. ";}i:2;i:14027;}i:307;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14169;}i:308;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14169;}i:309;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"So, now the code becomes,";}i:2;i:14171;}i:310;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14202;}i:311;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1126:"
$items['node/%node/magic'] = array(
	  'title'           =>  'Magic',
	  'description'     =>  'Do amazing',
	  'page callback'   =>  'menu_magic_node_content',
	  'page arguments'  =>  array(1),
	  'access arguments'=>  array('access content'),
	  'file'            =>  'menu_magic_context.inc'
	  'type'            =>  MENU_LOCAL_TASK,
	  'context'         =>  MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE,
	  );

return $items;

In which case,
function menu_magic_node_context($node)
{
  $output = array(
       '#type'   => 'markup',
       '#markup' => $text,
       );
  return $output;
}

//Notes
So, now the node/%node/ still includes the wildcard to be able to receive any input i.e
node/1 but this time it automatically does the part of node_load($nid) and checking 
if it exists and pushing it into the callback function. We can do the same for user_load.

Drupal has a global $user object, which represents the currently-logged-in user. So to 
avoid confusion and to avoid clobbering the global $user object, it is a good idea to 
assign the result of this function to a different local variable, generally $account.

";i:1;N;i:2;N;}i:2;i:14202;}i:312;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15338;}i:313;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"Drupal Render API";i:1;i:1;i:2;i:15338;}i:2;i:15338;}i:314;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:15338;}i:315;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15338;}i:316;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Drupal renderable arrays - DRUPAL RENDER ";}i:2;i:15371;}i:317;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:15412;}i:318;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15415;}i:319;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15415;}i:320;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"We can use Render ";}i:2;i:15417;}i:321;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:15435;}i:322;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" to cache output from our modules.";}i:2;i:15438;}i:323;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15472;}i:324;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15472;}i:325;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Documentation - ";}i:2;i:15474;}i:326;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:30:"https://drupal.org/node/930760";i:1;N;}i:2;i:15490;}i:327;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15520;}i:328;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:378:"
In a Drupal array, if a key has no # then it is creating an element.
If the key has a # then it is a propery,

$content['raw_markup'] -> element
'#type' -> property

Properties are used by the Drupal render system to turn something
into HTML output.

We can find markup information in forms API
https://api.drupal.org/api/drupal/developer%21topics%21forms_api_reference.html/7
";i:1;N;i:2;N;}i:2;i:15527;}i:329;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15527;}i:330;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"So, lets us add some additional content to a page which is being returned as a 
result of a callback";}i:2;i:15915;}i:331;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16015;}i:332;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1665:"
    function menu_magic_basic()
    {
      $content = array();
      $content['raw_markup'] = array(
          '#type'   => 'markup',
          '#markup' => 'Truly magical',
          '#prefix' => '<p>',
          '#suffix' => '</p>',
      );

      Create an array to declare properties
      for our theme
      $variables = array(
          'path'  => 'http://placekitten.com/440/400',
          'alt'   => t('Magic text'),
          'title' => t('This is the title'),
      );


      Now lets insert images
      Create a new element

      $content['themed_data'] = array(
          '#type'   => 'markup',
          '#markup' => theme('image', $variables),

      );

      List of things
      Drupal will call function theme_item_list to render
      renderable_element
      items is a list
      
      $content['renderable_element'] = array(
           '#theme' => 'item_list',
           '#title' => t('How do we know its magic'),
           '#items' => array(
                t("Is it made of wood?"),
                t("Does it sink in water?"),
                t("Does it weigh the same as a duck?"),
           ), 
     );
      return $content;
    }


//NOTES

Following code same as, '#markup' => '<p>Truly magical</p>'
          '#markup' => 'Truly magical',
          '#prefix' => '<p>',
          '#suffix' => '</p>',

Drupal Theme Image Function,
https://api.drupal.org/api/drupal/includes!theme.inc/function/theme_image/7

if you do,
'#markup' => theme_image($variables)
You are bypassing Drupal`s theme funcitionality

'#markup' => theme('image', $variables),
In this case we are saying theme image function with an argument variables.

";i:1;N;i:2;N;}i:2;i:16022;}i:333;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17697;}i:334;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:43:"Attachments and caching with the Render API";i:1;i:2;i:2;i:17697;}i:2;i:17697;}i:335;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:17697;}i:336;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17697;}i:337;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"We can also add borders to images that we added in the previous task. We can add colored borders around our
image using ";}i:2;i:17754;}i:338;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"CSS";}i:2;i:17874;}i:339;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:". We can load that ";}i:2;i:17877;}i:340;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"CSS";}i:2;i:17896;}i:341;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:" file in Drupal`s hook init to load it with rules. ";}i:2;i:17899;}i:342;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17950;}i:343;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17950;}i:344;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"We also have the capability to define the ";}i:2;i:17952;}i:345;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"CSS";}i:2;i:17994;}i:346;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:" ONLY if it is needed. We renderable arrays, we can load
a ";}i:2;i:17997;}i:347;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"CSS";}i:2;i:18056;}i:348;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" file related to an element only when it is displayed.";}i:2;i:18059;}i:349;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18113;}i:350;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:914:"

MODULE FILE

    $content['themed_data'] = array(
         '#type'   => 'markup',
         '#markup' => theme('image', $variables),
         '#prefix' => '<div class="menu-magic-image">',
         '#suffix' => '</div>',
         '#attached' => array(
             'css'  => array(
                 drupal_get_path('module','menu_magic'). '/menu_magic.css',
             ),
         ),

    );

CSS File
.menu-magic-image img{
	4px border
}

NOTES
#attached -> Allows us to attach CSS and JS to this particular element
https://api.drupal.org/api/drupal/developer%21topics%21forms_api_reference.html/7#attached
https://api.drupal.org/api/drupal/includes%21common.inc/function/drupal_process_attached/7

drupal_get_path(path-to-the-thing, thing-name)
drupal_get_path('module','menu_magic'). '/menu_magic.css'
This gives me direct access to the / root directory of menu_magic module
where we can find menu_magic.css
";i:1;N;i:2;N;}i:2;i:18120;}i:351;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18120;}i:352;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:19044;}i:353;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Caching";}i:2;i:19046;}i:354;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:19053;}i:355;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19055;}i:356;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19055;}i:357;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:300:"In real world a module can be loading data from multiple sources, i.e. third party
APIs or databases and we do not want this information to load everytime. We want
our module to be able to use the work it has already done and build on top of it
without wasting precious CPU cycles and of course TIME.";}i:2;i:19057;}i:358;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19357;}i:359;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19357;}i:360;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:"So, what do we do? We use the ability to cache. Lets use the same renderable code";}i:2;i:19359;}i:361;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19440;}i:362;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1027:"
       $content['renderable_element'] = array(
             '#theme' => 'item_list',
             '#title' => t('How do we know'),
             '#items' => array(
                 t("Is it"),
                 t("Really"),
                 t(' The current time is %time.', array('%time' => date('r'))),
                 ),
             '#cache' => array(
                'keys' => array('menu_magic', 'renderable_element'),
                'bin'  => 'cache',
                'expire' => time() + 30,
                'granularity' => DRUPAL_CACHE_PER_PAGE,
             ),
       ); 

NOTE
HOOK BLOCK INFO:
https://api.drupal.org/api/drupal/modules!block!block.api.php/function/hook_block_info/7

We will replace time with current date and time
Once Drupal encounters cache, it checks the database, oh I have rendered it before.
Cache contains a key for 'keys' => array('menu_magic', 'renderable_element'), 
as menu_magic:renderable_element
Our renderable_element will only stay in cache for 30 seconds
'expire' => time() + 30,
";i:1;N;i:2;N;}i:2;i:19447;}i:363;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:20484;}i:364;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Altering the Page Array";i:1;i:2;i:2;i:20484;}i:2;i:20484;}i:365;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:20484;}i:366;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20484;}i:367;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:107:"We might think that the content generation with hashes may be bit complicated and why don`t we just return ";}i:2;i:20521;}i:368;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:20628;}i:369;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:" the simple way.";}i:2;i:20632;}i:370;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20648;}i:371;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20648;}i:372;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"We want to delay the ";}i:2;i:20650;}i:373;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:20671;}i:374;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:180:" generation for as long as possible. This gives theme and modules time to change how items are rendered.
PHP does way better dealing with an Associative array rather than a string.";}i:2;i:20675;}i:375;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20855;}i:376;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20855;}i:377;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"To get a better idea of the page variables insert following code,";}i:2;i:20857;}i:378;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20922;}i:379;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:253:"
function menu_mangle_page_alter(&$page)
{
	if(arg(0) == 'magic') {
	    $dsm($page);
	    $page['content']['system_main']['renderable_element']['#type'] = 'ol';
	}
}

NOTES
if(arg[0]) so first one after node/magic
ul - unordered list
ol - ordered list
";i:1;N;i:2;N;}i:2;i:20929;}i:380;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21192;}i:381;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"Integrating with the theme system";i:1;i:2;i:2;i:21192;}i:2;i:21192;}i:382;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:21192;}i:383;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21192;}i:384;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:142:"As module developers it is important for us to return our content that can be overriden by the theme. We want it to eventually be turned into ";}i:2;i:21239;}i:385;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:21381;}i:386;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:263:". We want it to do in a way that the themer can come along and change it. The web designer may not agree with my design sense and want to change the way things look. We want them to be able to change the way our output looks without changing anything in our code.";}i:2;i:21385;}i:387;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21648;}i:388;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21648;}i:389;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:158:"We will write theme function. We will write in a way that it displays content produced by our code but can be overriden by the web designer through the theme.";}i:2;i:21650;}i:390;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21808;}i:391;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21808;}i:392;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:145:"We will create another tab to show content but Drupal doesn`t know how to theme our data, so we will create a theme function to theme our output.";}i:2;i:21810;}i:393;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21955;}i:394;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4541:"
   Create TAB

   function spy_glass_menu() {
      $items = array();
      $items['node/%node/spy_glass'] = array(
        'title' => 'Spy Glass',
        'description' => 'Take a closer look',
        'page callback' => 'spy_glass_page',
        'page arguments' => array(1),
        'access callback' => 'node_access',
        'access arguments' => array('view', 1),
        'type' => MENU_LOCAL_TASK,
    );
     return $items;
    }
********************************************************************************************
WE WANT THE WEB DESIGNER TO BE ABLE TO CHANGE THE WAY OUR 
OUTPUT LOOKS - USE HOOK_THEME
/**
 * Implements hook_theme().
 */
 --> REGISTERS WITH DRUPAL THAT WE HAVE SOME THEME IMPLEMENTATION

function spy_glass_theme() {
  return array(
    --> THINGS IN THIS NEED TO BE MADE THEMEABLE
    INSTEAD OF USING A THEME FUNCTION USE A TEMPLATE FILE
   
    USE OF A THEME FILE
   
    'spy_glass_item' => array(
      'arguments' => array('title' => NULL, 'data' => NULL),
      'template' => 'spy-glass-item',
    ),
    
    THEME FUNCTION WAY
    /** for theme function
    --> SPY_GLASS_ITEM IS THE HOOK NAME
    --> DEFAULT VALUE OF ITEM IS NULL
    'spy_glass_item' => array(
      'variables' => array('item' => NULL),
    ),
    */
  );
}
********************************************************************************************
-->CALLBACK FUNCTION
function spy_glass_page($node) {
  $information = _spy_glass_serious_spying_business($node);
  
  --> WE CAN INSPECT using dsm($information);

  $content = array();
  EACH OF THESE ITEMS WILL BE AN ARRAY OF KEYS
  TYPE AND MARKUP
  foreach ($information as $item) {
  CREATE A NEW ELEMENT ON OUR RENDERABLE ARRAY
    $content[] = array(
      '#type' => 'markup',
********************************************************************************************
      ----------------THEME_SPY_GLASS_ITEM($ITEM)
      -----------theme(Name-of-the-thing-to-theme)
      I DONT WANT TO USE THEME FUNCTION PROVIDED
      BY THE MODULE, USE MINE INSTEAD
      '#markup' => theme('spy_glass_item', $item),
    );
  }
    return $content;
}
********************************************************************************************
GET VALUES FROM SPY_GLASS_THEME AND PASS TO THE THEME TPL.PHP
SECURITY - CHECK_PLAIN ON VARIABLES PASSED TO THE TEMPLATE FILE
FOR APPLYING CHANGES

function spy_glass_preprocess_spy_glass_item(&$variables) {
    $variables['title'] = check_plain($variables['title']);
    $variables['data'] = check_plain($variables['data']);
    $variables['module_name'] = t('Spy Glass');
}
********************************************************************************************
WHAT WE DO IN THE THEME FUNCTION CAN BE DONE ON A DIFFERENT LEVEL

/*
THEME FUNCTION PUTS TOGETHER HTML
FUNCTION PRODUCES HTML FOR EACH ITEM
function theme_spy_glass_item($variables) {
    $output = '<p>';
    SECURITY - ALWAYS VALIDATE DATA IF YOU GET IT FROM SOMEWHERE
    $output .= '<strong>' . check_plain($variables['title']) . '</strong><br/>';
    $output .= check_plain($variables['data']);
    $output .= '</p>';
    return $output;
  }
*/

  -->THIS FUNCTION TAKES A NODE OBJECT AND PERFORMS TASKS ON IT
  function _spy_glass_serious_spying_business($node) {
  $information = array();
  
  -->THE ARRAY COLLECTS ALL DATA UNDER TWO COLUMNS TITLE AND DATA
  -->ARRAY 0
  $information[] = array(
    'title' => t('Title Character Count'),
    'data' => t('There are @num characters in the $node->title.', 
     array('@num' => strlen($node->title))),
  );
  -->ARRAY 1
  $seconds = $node->changed - $node->created;
  $information[] = array(
    'title' => t('Timestamp Differences'),
    'data' => t('The $node->changed timestamp is @seconds different from the 
     $node->created timestamp.', 
     array('@seconds' => $seconds)),
  );
  
  if ($node->translate == 0) {
  -->ARRAY 2
  $information[] = array(
      'title' => t('Translated?'),
      'data' => t('This node is NOT translated into pirate speak, hope you know English.'),
    );
  }
  -->ARRAY 3
  $information[] = array(
    'title' => t('Hash'),
    'data' => md5($node->title),
  );
  // Example of potential user input data that needs to be sanitized.
  // Instead of hard-coding this, it could be getting loaded from the db
  // where a user has entered the info.
  ARRAY 4
  $information[] = array(
      'title' => t('Nefarious data'),
      INSERTING JAVASCRIPT
      'data' => '<a href="#" onclick="alert(\'Pwned!\'); return false;">click me</a>',
  );
  return $information;
}
";i:1;N;i:2;N;}i:2;i:21962;}i:395;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:26514;}i:396;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Form API";i:1;i:1;i:2;i:26514;}i:2;i:26514;}i:397;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:26514;}i:398;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:26514;}i:399;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"We use Drupal Form ";}i:2;i:26538;}i:400;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:26557;}i:401;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" to collect info and user input data.";}i:2;i:26560;}i:402;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26597;}i:403;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:26597;}i:404;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"DRUPAL form ";}i:2;i:26599;}i:405;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:26611;}i:406;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" is an extension of the renderable array. As the form ";}i:2;i:26614;}i:407;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:26668;}i:408;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" code shows,
it is more or less like the renderable array setup.";}i:2;i:26671;}i:409;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:26735;}i:410;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:389:"
   function mani_form()
   {
       $form['color'] = array(
         '#type'  => 'select',
         '#title' => t('Favorite color'),
         '#options' => drupal_map_assoc(array(
           t('red'),t('blue'),t('periwinkle')
         )),
       );
        $form['submit'] = array(
          '#type'  => 'submit',
          '#value' =>  t('Submit'),
        );
        return $form;
   }
";i:1;N;i:2;N;}i:2;i:26742;}i:411;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:27141;}i:412;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Form API Worklow";i:1;i:2;i:2;i:27141;}i:2;i:27141;}i:413;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:27141;}i:414;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:952:"
User comes to a page cake
Drupal says oh boy, let me display this page using the meny system
call back function in our module takes care of the URL uses drupal_get_form
to return Form API array
https://api.drupal.org/api/drupal/includes!form.inc/function/drupal_get_form/7
drupal_get_form takes the id of the form that you would like to return
drupal_get_form is the gateway into the form API
The module then starts looking for this form
module looks for function
Form API takes array treating it like a renderable array
and outputs HTML.
When form is displayed
User fills and submits
When user submits a form
We go back to same URL
Drupal uses menu system to map URL to function used
in callback
Form API is receiving $POST data.
Drupal quickly calls validation function
function_validate()
Check for errors
Drupal calls form submit handler
function_submit()
form_state array knows the state of the form
can set redirect using form_state['redirect']
";i:1;N;i:2;N;}i:2;i:27175;}i:415;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:28137;}i:416;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"Creating, Submitting and Validating a Form";i:1;i:2;i:2;i:28137;}i:2;i:28137;}i:417;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:28137;}i:418;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:28137;}i:419;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:9:":sdsd.png";i:1;s:0:"";i:2;s:6:"center";i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:28194;}i:420;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:28210;}i:421;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:28210;}i:422;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:28210;}i:423;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:28210;}}