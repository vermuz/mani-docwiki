a:596:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"PHP";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"PHP Configuration";i:1;i:2;i:2;i:19;}i:2;i:19;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:19;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:139:"Default Settings: php.ini (we can put php.ini in the folder of webpage that applies to that folder).
php.ini can load extensions i.e. mysql";}i:2;i:50;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:189;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:189;}i:10;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:191;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"PHP settings
";}i:2;i:193;}i:12;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:206;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:208;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21:"
<?php
phpinfo();
?>
";i:1;N;i:2;N;}i:2;i:215;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:215;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"Other settings include max_execution_time and memory_limit. ";}i:2;i:246;}i:17;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:306;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"
We can also set configuration options using ini_set() and ini_get() functions.";}i:2;i:308;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:387;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:34:"
ini_set('display_errors', 'On');
";i:1;N;i:2;N;}i:2;i:394;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:394;}i:22;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:438;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Enable Debugging";}i:2;i:440;}i:24;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:456;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:458;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:458;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"debugging and warning messages";}i:2;i:460;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:490;}i:29;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
error_reporting(E_ALL);;
ini_set('display_errors','On');
";i:1;N;i:2;N;}i:2;i:497;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:565;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Variables";i:1;i:2;i:2;i:565;}i:2;i:565;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:565;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:565;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"Note (Do not need to declare variables before using them)";}i:2;i:588;}i:35;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:645;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"
Variables can hold different types at different times,";}i:2;i:647;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:702;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
$var = 4;
$var = 'This text';
";i:1;N;i:2;N;}i:2;i:709;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:709;}i:40;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:750;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Assignment";}i:2;i:752;}i:42;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:762;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:764;}i:44;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
// Strings
$yummy = "potato";

// Number Variables
$c = 3;
print "<p>". $c/2 . "</p>";
";i:1;N;i:2;N;}i:2;i:771;}i:45;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:868;}i:46;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:868;}i:47;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:868;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:" Variables used within a function are local only to that function.";}i:2;i:872;}i:49;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:938;}i:50;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:938;}i:51;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:938;}i:52;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:938;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" They cannot be accessed outside the function.";}i:2;i:942;}i:54;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:988;}i:55;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:988;}i:56;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:988;}i:57;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:988;}i:58;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:" If you want a variable to be available to every function, make it global.";}i:2;i:992;}i:59;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1066;}i:60;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1066;}i:61;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1066;}i:62;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:99:"
// Global Variables
$global_var = 4;
function foo()
{
  global $global_var;
  print $globalvar;
}
";i:1;N;i:2;N;}i:2;i:1073;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1073;}i:64;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1182;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"PHP Magic Variables
";}i:2;i:1184;}i:66;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1204;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1206;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1206;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"Super global arrays created by PHP when you view a site. ";}i:2;i:1208;}i:70;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1265;}i:71;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:89:"
All of these arrays contain useful information that you can use in making your website. ";}i:2;i:1267;}i:72;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:1356;}i:73;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1358;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1359;}i:75;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1359;}i:76;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1359;}i:77;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1359;}i:78;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:" $_GET";}i:2;i:1363;}i:79;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1369;}i:80;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1369;}i:81;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1369;}i:82;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1369;}i:83;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:" $_POST";}i:2;i:1373;}i:84;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1380;}i:85;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1380;}i:86;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1380;}i:87;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1380;}i:88;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" $_REQUEST";}i:2;i:1384;}i:89;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1394;}i:90;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1394;}i:91;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1394;}i:92;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1394;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" $_SERVER";}i:2;i:1398;}i:94;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1407;}i:95;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1407;}i:96;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1407;}i:97;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1407;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:" $_COOKIE";}i:2;i:1411;}i:99;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1420;}i:100;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1420;}i:101;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1420;}i:102;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1420;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:" $_SESSION";}i:2;i:1424;}i:104;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1434;}i:105;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1434;}i:106;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1434;}i:107;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1434;}i:108;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1436;}i:109;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"$_GET
";}i:2;i:1438;}i:110;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1444;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1446;}i:112;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1447;}i:113;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1447;}i:114;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1447;}i:115;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1447;}i:116;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:59:" contains parameters passed to your script from the browser";}i:2;i:1451;}i:117;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1510;}i:118;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1510;}i:119;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1510;}i:120;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1510;}i:121;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:" GET parameters are visible in your ";}i:2;i:1514;}i:122;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:1550;}i:123;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" bar, unlike POST parameter";}i:2;i:1553;}i:124;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1580;}i:125;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1580;}i:126;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1580;}i:127;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:119:"
    http://example.com/index.php?key1=value1&key2=value2&
    $_GET['key1'] == 'value1"
    $_GET['key2'] == 'value2"
";i:1;N;i:2;N;}i:2;i:1586;}i:128;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1586;}i:129;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1715;}i:130;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"$_POST";}i:2;i:1717;}i:131;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1723;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1725;}i:133;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1726;}i:134;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1726;}i:135;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1726;}i:136;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1726;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" works like $_GET except that parameters aren`t passed in the ";}i:2;i:1730;}i:138;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:1792;}i:139;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:1795;}i:140;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1796;}i:141;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1796;}i:142;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1796;}i:143;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1796;}i:144;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:" Recommended way to pass form data - so it won`t be easily visible and changeable.";}i:2;i:1800;}i:145;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1882;}i:146;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1882;}i:147;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1882;}i:148;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1882;}i:149;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1884;}i:150;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"$_REQUEST
";}i:2;i:1886;}i:151;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1896;}i:152;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1898;}i:153;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1899;}i:154;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1899;}i:155;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1899;}i:156;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1899;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" Union of $_GET, $_SET and $_COOKIE";}i:2;i:1903;}i:158;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1938;}i:159;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1938;}i:160;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1938;}i:161;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1938;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:" used in situations where you don`t really care where the input comes from";}i:2;i:1942;}i:163;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2016;}i:164;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2016;}i:165;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2016;}i:166;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2018;}i:167;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Comments";i:1;i:2;i:2;i:2018;}i:2;i:2018;}i:168;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2018;}i:169;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:52:"
//This is a comment.
/* This is also a comment.
*/
";i:1;N;i:2;N;}i:2;i:2045;}i:170;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2107;}i:171;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Expressions";i:1;i:2;i:2;i:2107;}i:2;i:2107;}i:172;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2107;}i:173;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:106:"
$c = 3.141592653;
$c + 1; //4.141592653
2*($c + 1); //8.283185306
// Assignments to evaluate
$c = 5; //5
";i:1;N;i:2;N;}i:2;i:2137;}i:174;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2253;}i:175;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Operators";i:1;i:2;i:2;i:2253;}i:2;i:2253;}i:176;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2253;}i:177;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2253;}i:178;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"The ones to remember,";}i:2;i:2275;}i:179;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2302;}i:180;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:50:"
.  String Concatenation
-> Member Field/function
";i:1;N;i:2;N;}i:2;i:2302;}i:181;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2362;}i:182;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"String Quoting";i:1;i:2;i:2;i:2362;}i:2;i:2362;}i:183;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2362;}i:184;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2362;}i:185;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"Double Quote (can have values embedded in them, not interpreted literally).";}i:2;i:2390;}i:186;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:2465;}i:187;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"
Single Quote (interpreted literally).";}i:2;i:2467;}i:188;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2505;}i:189;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:229:"
$food = "potatoes";
$double_quoted = "I like to eat $food.";
$single_quoted = "I like to eat $food.";

print "<p>$double_quoted</p>"; // Prints I like to eat potatoes 
print "<p>$single_quoted</p>";// Prints I like to eat $food
";i:1;N;i:2;N;}i:2;i:2512;}i:190;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2751;}i:191;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"Arrays";i:1;i:2;i:2;i:2751;}i:2;i:2751;}i:192;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2751;}i:193;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2769;}i:194;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2769;}i:195;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2769;}i:196;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:" Arrays are collections of values.";}i:2;i:2773;}i:197;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2807;}i:198;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2807;}i:199;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2807;}i:200;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2807;}i:201;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:" PHP arrays are sort of like Python dictionaries.";}i:2;i:2811;}i:202;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2860;}i:203;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2860;}i:204;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2860;}i:205;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2860;}i:206;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:" Accessed via a key.";}i:2;i:2864;}i:207;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2884;}i:208;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2884;}i:209;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2884;}i:210;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2884;}i:211;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:" Each key is associated with exactly one value.";}i:2;i:2888;}i:212;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2935;}i:213;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2935;}i:214;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2935;}i:215;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2935;}i:216;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:" A key may be integer, string or other type.";}i:2;i:2939;}i:217;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2983;}i:218;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2983;}i:219;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2983;}i:220;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2983;}i:221;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2985;}i:222;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Arrays Indexing";}i:2;i:2987;}i:223;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3002;}i:224;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3004;}i:225;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:256:"
$languages = array('PHP','Java','C++','Python');
//******************************************************************
print "<p>The first language is " . $languages[0] . "!</p>"; // PHP
print "<p>The first language is " . $languages[1] . "!</p>"; // Java
";i:1;N;i:2;N;}i:2;i:3011;}i:226;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3011;}i:227;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3277;}i:228;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Add value to Array";}i:2;i:3279;}i:229;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3297;}i:230;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3299;}i:231;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
$languages[] = "Perl";
";i:1;N;i:2;N;}i:2;i:3306;}i:232;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3340;}i:233;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Conditional";i:1;i:2;i:2;i:3340;}i:2;i:3340;}i:234;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3340;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3340;}i:236;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:60:"Whatever you supply as condition is converted to a boolean. ";}i:2;i:3364;}i:237;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:3424;}i:238;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:85:"
False (boolean value false, number 0, zero length strings, null, zero length errors)";}i:2;i:3426;}i:239;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3511;}i:240;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:114:"
if($favorite_color == "blue")
{
   // Code
}
else if ($favorite_color == "red")
{
  // Code
}
else
{
  // Code
}
";i:1;N;i:2;N;}i:2;i:3518;}i:241;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3642;}i:242;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Loops";i:1;i:2;i:2;i:3642;}i:2;i:3642;}i:243;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3642;}i:244;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3642;}i:245;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3661;}i:246;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"For";}i:2;i:3663;}i:247;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3666;}i:248;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3668;}i:249;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:179:"
$languages = array('PHP', 'Java', 'C++', 'Python');

for($c = 0; $c < count($languages); $c++)
{
  $lang = $languages[$c];
  print "<p>The language at index $c is $lang.</p>";
}
";i:1;N;i:2;N;}i:2;i:3675;}i:250;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3675;}i:251;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3864;}i:252;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Foreach";}i:2;i:3866;}i:253;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3873;}i:254;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3875;}i:255;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:330:"
//Array using non integer keys

$languages = array('best' => 'PHP', 'tastiest' => 'Java', 'funkiest' => 'Scheme');

// with keys
foreach($languages as $adjective => $lang)
{
  print "<p>The $adjective language is $lang.</p>";
}

// without keys
foreach($languages as $lang)
{
  print "<p>$lang is a programming language.</p>";
}
";i:1;N;i:2;N;}i:2;i:3882;}i:256;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3882;}i:257;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4222;}i:258;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Functions";}i:2;i:4224;}i:259;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4233;}i:260;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4235;}i:261;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4235;}i:262;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Functions can return values. ";}i:2;i:4237;}i:263;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:4266;}i:264;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4269;}i:265;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
$num = count($arr); // count returns size of array $arr
return $num
";i:1;N;i:2;N;}i:2;i:4276;}i:266;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:106:"
function hereIsAFunction()
{
  print "This is a function.";
  print "It doesn`t really do very much.";
}
";i:1;N;i:2;N;}i:2;i:4360;}i:267;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:154:"
function countDown($start)
{
  while($start >= 0)
  {
    print "<p>$start...</p>";
    $start--;
  }
}

function squareNumber($x)
{
  return $x * $x;
}
";i:1;N;i:2;N;}i:2;i:4481;}i:268;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4481;}i:269;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4645;}i:270;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Useful functions
";}i:2;i:4647;}i:271;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4664;}i:272;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4666;}i:273;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4666;}i:274;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:4668;}i:275;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"isset($var) and some useful functions";}i:2;i:4670;}i:276;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:4707;}i:277;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:4709;}i:278;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4710;}i:279;a:3:{i:0;s:10:"listo_open";i:1;a:0:{}i:2;i:4710;}i:280;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4710;}i:281;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4710;}i:282;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:" Returns true if $var has been set.";}i:2;i:4714;}i:283;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4749;}i:284;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4749;}i:285;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4749;}i:286;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4749;}i:287;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:" isset($favorite_color)";}i:2;i:4753;}i:288;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4776;}i:289;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4776;}i:290;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4776;}i:291;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4776;}i:292;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:" isset($_GET['name']) will return true if $_GET['name'] has a value";}i:2;i:4780;}i:293;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4847;}i:294;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4847;}i:295;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4847;}i:296;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4847;}i:297;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:104:" explode($delimiter, $string) breaks up $string into an array of substrings, separating using $delimiter";}i:2;i:4851;}i:298;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4955;}i:299;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4955;}i:300;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4955;}i:301;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4955;}i:302;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" count()";}i:2;i:4959;}i:303;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:4967;}i:304;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:4967;}i:305;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:4967;}i:306;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:4967;}i:307;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" print_r($array) prints an array, useful for debugging";}i:2;i:4971;}i:308;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5025;}i:309;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5025;}i:310;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5025;}i:311;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5025;}i:312;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" require_once($filename) includes another file";}i:2;i:5029;}i:313;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5075;}i:314;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5075;}i:315;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5075;}i:316;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5075;}i:317;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:" ini_set($setting, value) - configuration settings";}i:2;i:5079;}i:318;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5129;}i:319;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5129;}i:320;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5129;}i:321;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5129;}i:322;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:117:" header($data) - if at the beginning, outputs HTTP header data, can be used for redirects i.e. to secure HTTPS pages.";}i:2;i:5133;}i:323;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5250;}i:324;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5250;}i:325;a:3:{i:0;s:11:"listo_close";i:1;a:0:{}i:2;i:5250;}i:326;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5252;}i:327;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"Classes";i:1;i:2;i:2;i:5252;}i:2;i:5252;}i:328;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5252;}i:329;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:5272;}i:330;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5272;}i:331;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5272;}i:332;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:" Classes are bundles of variables and functions that should be grouped together.";}i:2;i:5276;}i:333;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5356;}i:334;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5356;}i:335;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5356;}i:336;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5356;}i:337;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:" :: Scoping resolution operator - to access super-class and call its functions.";}i:2;i:5360;}i:338;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5439;}i:339;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5439;}i:340;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5439;}i:341;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5439;}i:342;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5443;}i:343;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:2:"->";}i:2;i:5444;}i:344;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:" operator to access functions/fields of classes";}i:2;i:5446;}i:345;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5493;}i:346;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5493;}i:347;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:5493;}i:348;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:5493;}i:349;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:" Fields and functions can be public and private";}i:2;i:5497;}i:350;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:5544;}i:351;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:5544;}i:352;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:5544;}i:353;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:401:"
class user
{
   public $ID;
   public $first_name;
   public $last_name;
   
  // Constructor  
  function __construct($first, $last, $id)
  {
    $this->ID = $id;
    $this->first_name = $first;
    $this->last_name = $last;
  }
  function getName()
  {
    return $this->first_name . " " . $this->last_name;
  }
  function toString()
  {
    return $this->getName() . "(" . $this->ID . ")";
  }
}

";i:1;N;i:2;N;}i:2;i:5551;}i:354;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5551;}i:355;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:5962;}i:356;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Extend classes
";}i:2;i:5964;}i:357;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:5979;}i:358;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:5981;}i:359;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5987;}i:360;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:334:"
class facebook_user extends user
{
  public $network;
  // Construction
  function __construct($first, $last, $id, $net)
  {
    // Use old constructor
    parent::__construct($first, $last, $id);
    $this->network = $net;
  }
  
  //Override
  function toString()
  {
    return $this->getName() . "(". $this->network . ")";
  }
}
";i:1;N;i:2;N;}i:2;i:5987;}i:361;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5987;}i:362;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Now, we will use the class,";}i:2;i:6331;}i:363;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6358;}i:364;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:207:"
$some_user = new user("Steve", "Levine", "123");

print "<p>".$some_user->toString()."</p>";

$another_user = new facebook_user("Steve","Levine","123","MIT");

print "<p>".$another_user->toString()."</p>";
";i:1;N;i:2;N;}i:2;i:6365;}i:365;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6582;}i:366;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"PHP Cookies and Sessions";i:1;i:2;i:2;i:6582;}i:2;i:6582;}i:367;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6582;}i:368;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6582;}i:369;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6620;}i:370;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Cookies";}i:2;i:6622;}i:371;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:6629;}i:372;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:6631;}i:373;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6632;}i:374;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:6632;}i:375;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6632;}i:376;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6632;}i:377;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:" Cookies are little data files that websites can store on your system.";}i:2;i:6636;}i:378;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6706;}i:379;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6706;}i:380;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6706;}i:381;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6706;}i:382;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:" Cookies are used to store information about the user, or the website state on the computer.";}i:2;i:6710;}i:383;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6802;}i:384;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6802;}i:385;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:6802;}i:386;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:6802;}i:387;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" Cookie information exchange happens at the beginning of the HTTP protocol.";}i:2;i:6806;}i:388;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:6881;}i:389;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:6881;}i:390;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:6881;}i:391;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6881;}i:392;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Commonly used form,";}i:2;i:6883;}i:393;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6902;}i:394;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:75:"
// Keep it at the top of your code
bool setcookie($name, $value, $expire)
";i:1;N;i:2;N;}i:2;i:6909;}i:395;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6909;}i:396;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:6994;}i:397;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Cookies Example";}i:2;i:6996;}i:398;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:7011;}i:399;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7013;}i:400;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1120:"
<?php
// Cookies happen at the beginning

// See if we have stored a cookie yet.
if (isset($_COOKIE['username']))
{
  // The cookie is set. This means there is a non expired cookie, so the user was already here.
  $username = $_COOKIE['username'];
  print "<h1>Welcome Back</h1>";
  print "<p>I see you have been here before, $username!</p>";
}
else
{
  // The cookie is not set, so assume that the user has not been there
  // Check and see if user just submitted.
  if (isset($_POST['username']))
  {
    // The user just submitted, Store a cookie
    $username = $_POST['username'];
    setcookie('username', $username, time() + 120);
    print "<h1>Nice to meet you!</h1>";
    print "<p>It is nice to meet you, $username!</p>";
  }
  else
  {
    //The user didn`t submit, and we don`t have a cookie.
    // Display a form
    print "<h1>Hello Stranger!</h1>";
    print "<p>What is your name?</p>"
    print "<form method =\ "POST\" action=\ "cookie.php\">";
    print "Username: <input type =\ "text\" name=\ "username\" />;
    print "<input type=\" submit\" value=\ "Hello!\" />;
    print "<form>";
  }
}

?>
";i:1;N;i:2;N;}i:2;i:7020;}i:401;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7020;}i:402;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8150;}i:403;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Sessions
";}i:2;i:8152;}i:404;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8161;}i:405;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:8163;}i:406;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8164;}i:407;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:8164;}i:408;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8164;}i:409;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8164;}i:410;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:95:" Sessions are another way to store information about your websites users, kind of like cookies.";}i:2;i:8168;}i:411;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8263;}i:412;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8263;}i:413;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8263;}i:414;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8263;}i:415;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" Unlike cookies, sessions are stored on the server, not on client computer.";}i:2;i:8267;}i:416;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8342;}i:417;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8342;}i:418;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8342;}i:419;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8342;}i:420;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:" Less chances out there of this data being tampered or altered as you have control of it on the server.";}i:2;i:8346;}i:421;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8449;}i:422;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8449;}i:423;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8449;}i:424;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8449;}i:425;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:" Data stored in sessions can be accessed across different pages in your website.";}i:2;i:8453;}i:426;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8533;}i:427;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8533;}i:428;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8533;}i:429;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8533;}i:430;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:" There is a magic, super global array called $_SESSION. It acts like $_GET, $_POST, and $_REQUEST.";}i:2;i:8537;}i:431;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8635;}i:432;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8635;}i:433;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8635;}i:434;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8635;}i:435;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:" To save information, you get a string valued key of $_SESSION to the data you want.";}i:2;i:8639;}i:436;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8723;}i:437;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8723;}i:438;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8723;}i:439;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8723;}i:440;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:84:" After you get a session variable, it is visible to all other pages on your website.";}i:2;i:8727;}i:441;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8811;}i:442;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8811;}i:443;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:8811;}i:444;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:8811;}i:445;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:" You can use sessions to implement a login system, shopping carts.";}i:2;i:8815;}i:446;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:8881;}i:447;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:8881;}i:448;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:8881;}i:449;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:41:"
$_SESSION['name'] = 'William B.Rogers';
";i:1;N;i:2;N;}i:2;i:8888;}i:450;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8888;}i:451;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:8939;}i:452;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"Session Example";}i:2;i:8941;}i:453;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:8956;}i:454;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8958;}i:455;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1032:"
<?php
// Sessions also must happen at the beginning of HTTP
session_start();

if(isset($_SESSION['username']))
{
  // The cookie is set, this means that there is a non expired cookie, so the user was already here
  $username = $_SESSION['username'];
  print "<h1>Welcome back!</h1>";
  print "<p>I see you have been here before, $username!</p>";
}
else
{
  // has not been here yet.
  
  // Check and see if the user just submitted.
  if (isset($_POST['username']))
  {
     $username = $_POST['username'];
     $_SESSION['username'] = $username;
     print "<h1>Nice to meet you!</h1>";
     print "<p>It is nice to meet you, $username!</p>" 
  }
  else
  {
    // The user did not submit, we don`t have a cookie,
    // Display a form
    print "<h1>Hello, stranger!</h1>";
    print "<p>What is your name?</p>";
    print "<form method=\ "POST\" action=\ "session.php\ ">";
    print "Username: <input type=\ "text\" name=\ "username\" />";
    print "<input type=\ "submit\" value=\ "Hello!\" />";
    print "<form>";
  }
}
?>
";i:1;N;i:2;N;}i:2;i:8965;}i:456;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10007;}i:457;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Database Connectivity";i:1;i:2;i:2;i:10007;}i:2;i:10007;}i:458;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10007;}i:459;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10007;}i:460;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"Access MySQL db is via the MySQLi extension for PHP.";}i:2;i:10042;}i:461;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10094;}i:462;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10094;}i:463;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10096;}i:464;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:12:"Using MySQLi";}i:2;i:10098;}i:465;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10110;}i:466;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10112;}i:467;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10112;}i:468;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:108:"MySQLi represents a connection
MySQLi_STMT represents a query
MySQLi_Result represents the result of a query";}i:2;i:10114;}i:469;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10222;}i:470;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1972:"
<?php
//For debugging, turn on error output
ini_set('display errors','On');
error_reporting(E_ALL);

// CONNECT
//************************************************************************
//If DB username and password are in a separate file, lets import them.
require_once('private/mysql_info.php');

// Make an MySQLi class, representing a connection to the MySQL database.
$conn = new mysqli('MYSQL HOST', MYSQL_USER,MYSQL_PASSWORD, 'DATABASE-NAME');

// See if connection was successful
if(mysqli_connect_errno())
{
  print "<p>Couldn`t connect to the mysql server, Bummer!</p>";
  exit();
}
//*************************************************************************
// Prepare the query
// bind_params: Fill in all of the ? in the query string with the values.
// First argument is the type, s for string, i for int etc.
//*************************************************************************
// If we get here, it means the connection has been made
// Prepare a query
$query = $conn->prepare("SELECT * FROM people WHERE gender=?");

// Bind parameters, corresponding to ?s
$gender = 'Male';
$query->bind_param('s',$gender);
//*************************************************************************
//Execute query
$query->execute();
//*************************************************************************
// Now process the results.
// First bind variables corresponding to columns in our results:
$query->bind_result($name, $course, $gender, $fav_prog_lang);
print "<table><tr><td>Name</td><td>Course</td><td>Gender</td><td>Favorite Programming Language</td></tr>";

// Continually fetch new results.
// Put answers in the bound variables.
// Keep going until no more results to fetch.

while($query->fetch())
{
  print "<tr><td>$name</td><td>$course</td><td>gender</td><td>$fav_prog_lang</td></tr>";
}

print "</table>";
//***************************************************************************************
// Close the connection
$conn->close();
?>
";i:1;N;i:2;N;}i:2;i:10229;}i:471;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10229;}i:472;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12211;}i:473;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"Output";}i:2;i:12213;}i:474;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12219;}i:475;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12221;}i:476;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:105:"
Name   Course Gender Favorite Programming Language
Steve  6      Male   PHP   
Bob    8      Male   C++
";i:1;N;i:2;N;}i:2;i:12228;}i:477;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12343;}i:478;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Security";i:1;i:2;i:2;i:12343;}i:2;i:12343;}i:479;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:12343;}i:480;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12343;}i:481;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"MySQL security is very important.";}i:2;i:12365;}i:482;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12398;}i:483;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12398;}i:484;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"Opening the doors of injection attacks? this code will do,";}i:2;i:12400;}i:485;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12458;}i:486;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:72:"
$result = $conn->query("SELECT * FROM people WHERE name=\ "$name\ "");
";i:1;N;i:2;N;}i:2;i:12465;}i:487;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12465;}i:488;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"Assume that $name is retrieved directly from form data (i.e., $name = $_POST['name'];)";}i:2;i:12547;}i:489;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12633;}i:490;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12633;}i:491;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"It works just fine if $name is Mani.";}i:2;i:12635;}i:492;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12671;}i:493;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12671;}i:494;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:"Malicious user types this instead of Mani: ";}i:2;i:12673;}i:495;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12722;}i:496;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
"; DROP people; SELECT * FROM foo WHERE name="
";i:1;N;i:2;N;}i:2;i:12722;}i:497;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12722;}i:498;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"so MySQL query string becomes,";}i:2;i:12780;}i:499;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12810;}i:500;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:85:"
SELECT * FROM people WHERE name=""; DROP people;
SELECT * FROM foo WHERE name = "";
";i:1;N;i:2;N;}i:2;i:12817;}i:501;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12817;}i:502;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Someone has just deleted our MySQL table.";}i:2;i:12912;}i:503;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12953;}i:504;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12953;}i:505;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:12955;}i:506;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"Solution";}i:2;i:12957;}i:507;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:12965;}i:508;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12967;}i:509;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12967;}i:510;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"Escape any text used in a MySQL query.";}i:2;i:12970;}i:511;a:3:{i:0;s:9:"linebreak";i:1;a:0:{}i:2;i:13008;}i:512;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"
bind_param in MySQLi does that automatically.";}i:2;i:13010;}i:513;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13056;}i:514;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13056;}i:515;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13058;}i:516;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"XSS Attacks";}i:2;i:13060;}i:517;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13071;}i:518;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13073;}i:519;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13073;}i:520;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:13075;}i:521;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Cross Site Scripting.
";}i:2;i:13077;}i:522;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:13099;}i:523;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:13101;}i:524;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13102;}i:525;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:13102;}i:526;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13102;}i:527;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13102;}i:528;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:" Data entered by one user is visible to another but what if a malicious user wants to enter ";}i:2;i:13106;}i:529;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:13198;}i:530;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:" or Javascript into the database in a forum post. ";}i:2;i:13202;}i:531;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13252;}i:532;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13252;}i:533;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13252;}i:534;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13252;}i:535;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:" If PHP outputs this data as is, it will be interpreted by the browser as ";}i:2;i:13256;}i:536;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:13330;}i:537;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:40:". The hacker`s entry will close off the ";}i:2;i:13334;}i:538;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:13374;}i:539;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:" and start executing JavaScript. ";}i:2;i:13378;}i:540;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13411;}i:541;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13411;}i:542;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13411;}i:543;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13411;}i:544;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:92:" A hacker could potentially read and send off your cookies (perhaps via HTTPRequests/AJAX). ";}i:2;i:13415;}i:545;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13507;}i:546;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13507;}i:547;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:13507;}i:548;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:13507;}i:549;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:173:" PHP Sessions are implemented by storing a session ID cookie on the computer. If this is stolen, someone else can impersonate you on the websites. This is Session hijacking.";}i:2;i:13511;}i:550;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:13684;}i:551;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:13684;}i:552;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:13684;}i:553;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13684;}i:554;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13686;}i:555;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"Solution";}i:2;i:13688;}i:556;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13696;}i:557;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13698;}i:558;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13698;}i:559;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:13700;}i:560;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"use htmlspecialchars()
";}i:2;i:13702;}i:561;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:13725;}i:562;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13727;}i:563;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13727;}i:564;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:113:"Takes as input a string, encodes it in a way that the content remains the same but it will not be interpreted as ";}i:2;i:13729;}i:565;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:13842;}i:566;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:13846;}i:567;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13847;}i:568;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:133:"
htmlspecialchars('<script>alert("XSS!");</script>',
ENT_QUOTES) will output:

&lt;script&gt;alert(&quot;XSS!&quot;);&lt;/script&gt;
";i:1;N;i:2;N;}i:2;i:13854;}i:569;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13997;}i:570;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"Cool Stuff";i:1;i:2;i:2;i:13997;}i:2;i:13997;}i:571;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:13997;}i:572;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:14020;}i:573;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14020;}i:574;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14020;}i:575;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:" Send emails using email() function.";}i:2;i:14024;}i:576;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14060;}i:577;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14060;}i:578;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14060;}i:579;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14060;}i:580;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:82:" Download other webpages using cURL (nifty for getting price quotes or directions)";}i:2;i:14064;}i:581;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14146;}i:582;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14146;}i:583;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14146;}i:584;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14146;}i:585;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" Generate images using GD usesful for creating CAPTCHA systems";}i:2;i:14150;}i:586;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14212;}i:587;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14212;}i:588;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:14212;}i:589;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:14212;}i:590;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" Encryption through mcrypt";}i:2;i:14216;}i:591;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:14242;}i:592;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:14242;}i:593;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:14242;}i:594;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14243;}i:595;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:14243;}}