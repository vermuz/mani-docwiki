a:49:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"JS Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:27;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"accordion.tpl.php";i:1;i:2;i:2;i:27;}i:2;i:27;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:27;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2177:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Template file for js_example module.
   6  */
   7 ?>
   8 <div class="demo">
   9 <h2><?php print $title; ?></h2>
  10 <div id="accordion">
  11   <h3><a href="#">Section 1</a></h3>
  12   <div>
  13     <p>
  14     Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
  15     ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
  16     amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
  17     odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
  18     </p>
  19   </div>
  20   <h3><a href="#">Section 2</a></h3>
  21   <div>
  22     <p>
  23     Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
  24     purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
  25     velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
  26     suscipit faucibus urna.
  27     </p>
  28   </div>
  29   <h3><a href="#">Section 3</a></h3>
  30   <div>
  31     <p>
  32     Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
  33     Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
  34     ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
  35     lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
  36     </p>
  37     <ul>
  38       <li>List item one</li>
  39       <li>List item two</li>
  40       <li>List item three</li>
  41     </ul>
  42   </div>
  43   <h3><a href="#">Section 4</a></h3>
  44   <div>
  45     <p>
  46     Cras dictum. Pellentesque habitant morbi tristique senectus et netus
  47     et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
  48     faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
  49     mauris vel est.
  50     </p>
  51     <p>
  52     Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
  53     Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
  54     inceptos himenaeos.
  55     </p>
  56   </div>
  57 </div>
  58 
  59 </div><!-- End demo -->
";i:1;N;i:2;N;}i:2;i:62;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2248;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"js_example.info";i:1;i:2;i:2;i:2248;}i:2;i:2248;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2248;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:175:"
   1 name = JS Example
   2 description = An example module showing how to use some of the new JavaScript features in Drupal 7
   3 package = Example modules
   4 core = 7.x
";i:1;N;i:2;N;}i:2;i:2281;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2465;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"js_example.module";i:1;i:2;i:2;i:2465;}i:2;i:2465;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2465;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3022:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Examples showing how to use some of the new JavaScript features in Drupal 7.
   6  */
   7 
   8 /**
   9  * @defgroup js_example Example: JavaScript
  10  * @ingroup examples
  11  * @{
  12  * Examples using Drupal 7's built-in JavaScript.
  13  */
  14 
  15 /**
  16  * Implements hook_theme().
  17  */
  18 function js_example_theme() {
  19   return array(
  20     'my_accordion' => array(
  21       'template' => 'accordion',
  22       'variables' => array('title' => NULL),
  23     ),
  24   );
  25 }
  26 
  27 /**
  28  * Implements hook_menu().
  29  */
  30 function js_example_menu() {
  31   $items = array();
  32   $items['js_example/weights'] = array(
  33     'title' => 'JS Example: see weighting in action',
  34     'page callback' => 'js_example_js_weights',
  35     'access callback' => TRUE,
  36   );
  37   $items['js_example/accordion'] = array(
  38     'title' => 'JS Example: jQuery UI accordion',
  39     'page callback' => 'js_example_accordion',
  40     'access callback' => TRUE,
  41   );
  42   return $items;
  43 }
  44 
  45 /**
  46  * js_example_weights implementation.
  47  */
  48 function js_example_js_weights() {
  49   // Add some css to show which line is output by which script
  50   drupal_add_css(drupal_get_path('module', 'js_example') . '/css/jsweights.css');
  51   //
  52   $weights = array(
  53     'red' => 100,
  54     'blue' => 23,
  55     'green' => 3,
  56     'brown' => 45,
  57     'black' => 5,
  58     'purple' => 60
  59   );
  60   drupal_add_js(array('js_weights' => $weights), array('type' => 'setting'));
  61   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/red.js', array('weight' => $weights['red']));
  62   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/blue.js', array('weight' => $weights['blue']));
  63   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/green.js', array('weight' => $weights['green']));
  64   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/brown.js', array('weight' => $weights['brown']));
  65   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/black.js', array('weight' => $weights['black']));
  66   drupal_add_js(drupal_get_path('module', 'js_example') . '/js/purple.js', array('weight' => $weights['purple']));
  67   $output = '<div id="js-weights"></div>';
  68   return $output;
  69 }
  70 
  71 /**
  72  * js_example_accordion implementation.
  73  */
  74 function js_example_accordion() {
  75   $title = t('Click sections to expand or collapse:');
  76   $build['myelement'] = array(
  77     '#theme' => 'my_accordion',
  78     '#title' => $title,
  79   );
  80   $build['myelement']['#attached']['library'][] = array('system', 'ui.accordion');
  81   $build['myelement']['#attached']['js'][] = array('data' => '(function($){$(function() { $("#accordion").accordion(); })})(jQuery);', 'type' => 'inline');
  82   $output = drupal_render($build);
  83   return $output;
  84 }
";i:1;N;i:2;N;}i:2;i:2500;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5531;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"ajaxy.js";i:1;i:2;i:2;i:5531;}i:2;i:5531;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5531;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:133:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   $('div#test').html('hello katherine');
   5 });
   6 })(jQuery);
";i:1;N;i:2;N;}i:2;i:5557;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5699;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"black.js";i:1;i:2;i:2;i:5699;}i:2;i:5699;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5699;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:278:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.black;
   5   var newDiv = $('<div></div>').css('color', 'black').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:5725;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6012;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"blue.js";i:1;i:2;i:2;i:6012;}i:2;i:6012;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6012;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:276:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.blue;
   5   var newDiv = $('<div></div>').css('color', 'blue').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:6037;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6322;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"brown.js";i:1;i:2;i:2;i:6322;}i:2;i:6322;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6322;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:278:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.brown;
   5   var newDiv = $('<div></div>').css('color', 'brown').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:6348;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6635;}i:32;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"green.js";i:1;i:2;i:2;i:6635;}i:2;i:6635;}i:33;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6635;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:278:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.green;
   5   var newDiv = $('<div></div>').css('color', 'green').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:6661;}i:35;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6948;}i:36;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"purple.js";i:1;i:2;i:2;i:6948;}i:2;i:6948;}i:37;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6948;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:280:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.purple;
   5   var newDiv = $('<div></div>').css('color', 'purple').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:6975;}i:39;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7264;}i:40;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"red.js";i:1;i:2;i:2;i:7264;}i:2;i:7264;}i:41;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7264;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:274:"
   1 
   2 (function($){
   3 $(document).ready(function(){
   4   var weight = Drupal.settings.js_weights.red;
   5   var newDiv = $('<div></div>').css('color', 'red').html('I have a weight of ' + weight);
   6   $('#js-weights').append(newDiv);
   7 });
   8 })(jQuery);
";i:1;N;i:2;N;}i:2;i:7288;}i:43;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7571;}i:44;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"jsweights.css";i:1;i:2;i:2;i:7571;}i:2;i:7571;}i:45;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7571;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:90:"
   1 
   2 div#js-weights div {
   3   font-size: 20px;
   4   font-weight: bold;
   5 }
";i:1;N;i:2;N;}i:2;i:7602;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7700;}i:48;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7700;}}