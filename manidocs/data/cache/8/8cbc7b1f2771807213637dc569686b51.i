a:250:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Drupal Module Development";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:42;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Drupal Request Processing";i:1;i:1;i:2;i:42;}i:2;i:42;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:42;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:42;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"request a SERVER
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
";i:1;N;i:2;N;}i:2;i:5666;}i:196;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5666;}i:197;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:99:"We use callback to call a function to build contents of a page when you click an item in the menu. ";}i:2;i:6464;}i:198;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6564;}i:199;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6564;}i:200;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6564;}i:201;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6564;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:" If there is no content - 404 is served.";}i:2;i:6568;}i:203;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6608;}i:204;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6608;}i:205;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6608;}i:206;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6608;}i:207;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:" If there is content    - Drupal wraps it in DRUPAL Theme.";}i:2;i:6612;}i:208;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6670;}i:209;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6670;}i:210;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6670;}i:211;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6672;}i:212;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:46:"Using URL Arguments in Page Callback Functions";i:1;i:2;i:2;i:6672;}i:2;i:6672;}i:213;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6672;}i:214;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6672;}i:215;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:132:"If we want to give the user the ability to pass something in the query string to change the output from the callback, for example - ";}i:2;i:6732;}i:216;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6865;}i:217;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6865;}i:218;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6865;}i:219;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6865;}i:220;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6869;}i:221;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:43:"http://localhost/mani-drupal/magic/anything";i:1;N;}i:2;i:6870;}i:222;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6913;}i:223;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6913;}i:224;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6913;}i:225;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6913;}i:226;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:6917;}i:227;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:38:"http://localhost/mani-drupal/magic/joe";i:1;N;}i:2;i:6918;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:". ";}i:2;i:6956;}i:229;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6958;}i:230;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6958;}i:231;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6958;}i:232;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6958;}i:233;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:"These values decide the response of the system.";}i:2;i:6959;}i:234;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7006;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7006;}i:236;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:7008;}i:237;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:105:"We can also change the ability of our menu link to show up as a tab rather than a link in the navigation.";}i:2;i:7010;}i:238;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:7115;}i:239;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7117;}i:240;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1062:"
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
      //*******************************************************************
      $items['magic/%'] = array(
      'title'           => 'Even more magical',
      'page callback'   => 'menu_magic_extra',
      'page arguments'  =>  array(1),
      'access arguments'=> array('access content'),
      );
     return $items;
}
";i:1;N;i:2;N;}i:2;i:7124;}i:241;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7124;}i:242;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:151:"Now if I am thinking what the user will enter in the address bar, i.e. magic/joe or magic/123. Drupal provides a special character called the wildcard ";}i:2;i:8196;}i:243;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8347;}i:244;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"%";}i:2;i:8348;}i:245;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:8349;}i:246;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:8350;}i:247;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8351;}i:248;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8351;}i:249;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:8351;}}