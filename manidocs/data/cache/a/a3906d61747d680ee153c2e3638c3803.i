a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Render Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"render_example.css";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:390:"
   1 .render-array { 
   2     border: 2px solid black; 
   3     margin-top: 10px;
   4     padding-left: 5px;
   5     padding-top: 5px;
   6 }
   7 
   8 .render-header {
   9   font-size: large;
  10   font-style: italic;
  11 }
  12 
  13 .unrendered-label {
  14   font-style: italic;
  15   margin-top: 10px;
  16 }
  17 
  18 .rendered {
  19   background-color: lightblue;
  20 }
";i:1;N;i:2;N;}i:2;i:67;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:466;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"render_example.info";i:1;i:2;i:2;i:466;}i:2;i:466;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:466;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:271:"
   1 name = Render example
   2 description = Demonstrates drupal_render's capabilities and altering render arrays
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = devel
   6 stylesheets[all][] = render_example.css
   7 files[] = render_example.test
";i:1;N;i:2;N;}i:2;i:503;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:783;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"render_example.install";i:1;i:2;i:2;i:783;}i:2;i:783;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:783;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:518:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Install, update and uninstall functions for the render_example module.
   6  */
   7 
   8 /**
   9  * Implements hook_uninstall().
  10  */
  11 function render_example_uninstall() {
  12   variable_del('render_example_show_page');
  13   variable_del('render_example_show_block');
  14   variable_del('render_example_reverse_sidebar');
  15   variable_del('render_example_note_about_render_arrays');
  16   variable_del('render_example_move_navigation_menu');
  17 }
";i:1;N;i:2;N;}i:2;i:823;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1350;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"render_example.module";i:1;i:2;i:2;i:1350;}i:2;i:1350;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1350;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:23427:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Demonstrates render arrays.
   6  */
   7 
   8 /**
   9  * @defgroup render_example Example: Render
  10  * @ingroup examples
  11  * @{
  12  * Demonstrate how render arrays are arranged and how they can be altered.
  13  * This alters blocks and the page to show the actual render array
  14  * that is being used to create each item.
  15  *
  16  * @see drupal_render()
  17  */
  18 
  19 // This allows drupal_var_export() to work.
  20 require_once('includes/utility.inc');
  21 
  22 /**
  23  * Implements hook_menu().
  24  */
  25 function render_example_menu() {
  26   $items['examples/render_example'] = array(
  27     'title' => 'Render Example',
  28     'page callback' => 'render_example_info',
  29     'access callback' => TRUE,
  30   );
  31   $items['examples/render_example/altering'] = array(
  32     'title' => 'Alter pages and blocks',
  33     'page callback' => 'drupal_get_form',
  34     'page arguments' => array('render_example_demo_form'),
  35     'access arguments' => array('access devel information'),
  36   );
  37   $items['examples/render_example/arrays'] = array(
  38     'title' => 'Render array examples',
  39     'page callback' => 'render_example_arrays',
  40     'access callback' => TRUE,
  41   );
  42 
  43   return $items;
  44 }
  45 
  46 
  47 /**
  48  * Simple basic information about the module; an entry point.
  49  */
  50 function render_example_info() {
  51   return t('The render example provides a <ul><li><a href="!arrays">demonstration of of render array usage</a></li><li><a href="!alter">using hook_page_alter()</a> to make various changes on a page.</li></ul>', array('!arrays' => url('examples/render_example/arrays'), '!alter' => url('examples/render_example/altering')));
  52 }
  53 
  54 
  55 /**
  56  * Provides a number of render arrays and show what they do.
  57  *
  58  * Each array is keyed by a description; it's returned for rendering at page
  59  * render time. It's easy to add new examples to this.
  60  *
  61  * The array items in $demos are intended to be raw, normal render arrays
  62  * that can be experimented with to end up with different outcomes.
  63  */
  64 function render_example_arrays() {
  65 
  66   $interval = 60; // Interval in seconds for cache update with #cache.
  67 
  68   $demos = array(
  69     // Demonstrate the simplest markup, a #markup element.
  70     t('Super simple #markup')  => array(
  71       '#markup' => t('Some basic text in a #markup (shows basic markup and how it is rendered)'),
  72     ),
  73 
  74     // Shows how #prefix and #suffix can add markup into an array.
  75     t('Using #prefix and #suffix') => array(
  76       '#markup' => t('This one adds a prefix and suffix, which put a div around the item'),
  77       '#prefix' => '<div><br/>(prefix)<br/>',
  78       '#suffix' => '<br/>(suffix)</div>',
  79     ),
  80 
  81     // When #theme is provided, it is the #theme function's job to figure out
  82     // the meaning of the render array. The #theme function receives the entire
  83     // element in $variables and must return it, where it will be the content
  84     // of '#children'. When a #theme or other function is provided, custom
  85     // properties can be invented and used as needed, as the #separator
  86     // property provided here.
  87     //
  88     // If #theme is not provided, either explicitly or by the underlying
  89     // element, then the children are rendered using their own properties and
  90     // the results go into #children.
  91     t('theme for an element') => array(
  92       'child' => array(
  93         t('This is some text that should be put together'),
  94         t('This is some more text that we need'),
  95       ),
  96       '#separator' => ' | ',  // Made up for this theme function.
  97       '#theme' => 'render_example_aggregate',
  98     ),
  99 
 100     // #theme_wrappers provides an array of theme functions which theme the
 101     // envelope or "wrapper" of a set of child elements. The theme function
 102     // finds its element children (the sub-arrays) already rendered in
 103     // '#children'.
 104     t('theme_wrappers demonstration') => array(
 105       'child1' => array('#markup' => t('Markup for child1')),
 106       'child2' => array('#markup' => t('Markup for child2')),
 107       '#theme_wrappers' => array('render_example_add_div', 'render_example_add_notes'),
 108     ),
 109 
 110     // Add '#pre_render' and '#post_render' handlers.
 111     // - '#pre_render' functions get access to the array before it is rendered
 112     //   and can change it. This is similar to a theme function, but it is a
 113     //   specific fixed function and changes the array in place rather than
 114     //   rendering it..
 115     // - '#post_render' functions get access to the rendered content, but also
 116     //   have the original array available.
 117     t('pre_render and post_render') => array(
 118       '#markup' => '<div style="color:green">' . t('markup for pre_render and post_render example') . '</div>',
 119       '#pre_render' => array('render_example_add_suffix'),
 120       '#post_render' => array('render_example_add_prefix'),
 121     ),
 122 
 123     // Cache an element for $interval seconds using #cache.
 124     // The assumption here is that this is an expensive item to render, perhaps
 125     // large or otherwise expensive. Of course here it's just a piece of markup,
 126     // so we don't get the value.
 127     //
 128     // #cache allows us to set
 129     // - 'keys', an array of strings that will create the string cache key.
 130     // - 'bin', the cache bin
 131     // - 'expire', the expire timestamp. Note that this is actually limited
 132     //   to the granularity of a cron run.
 133     // - 'granularity', a bitmask determining at what level the caching is done
 134     //   (user, role, page).
 135     t('cache demonstration') => array(
 136       // If your expensive function were to be executed here it would happen
 137       // on every page load regardless of the cache. The actual markup is
 138       // added via the #pre_render function, so that drupal_render() will only
 139       // execute the expensive function if this array has not been cached.
 140       '#markup' => '',
 141       '#pre_render' => array('render_example_cache_pre_render'),
 142       '#cache' => array(
 143         'keys' => array('render_example', 'cache', 'demonstration'),
 144         'bin' => 'cache',
 145         'expire' => time() + $interval,
 146         'granularity' => DRUPAL_CACHE_PER_PAGE | DRUPAL_CACHE_PER_ROLE,
 147       ),
 148     ),
 149   );
 150 
 151 
 152   // The rest of this function just places the above arrays in a context where
 153   // they can be rendered (hopefully attractively and usefully) on the page.
 154   $page_array = array();
 155   foreach ($demos as $key => $item) {
 156     $page_array[$key]['#theme_wrappers'] = array('render_array');
 157     $page_array[$key]['#description'] = $key;
 158 
 159     $page_array[$key]['unrendered'] = array(
 160       '#prefix' => '<div class="unrendered-label">' . t('Unrendered array (as plain text and with a krumo version)') . ':</div>',
 161       '#type' => 'markup',
 162       '#markup' => htmlentities(drupal_var_export($item)),
 163     );
 164     $page_array[$key]['kpr'] = array(
 165       // The kpr() function is from devel module and is here only allow us
 166       // to output the array in a way that's easy to explore.
 167       '#markup' => kpr($item, TRUE),
 168     );
 169     $page_array[$key]['hr'] = array('#markup' => '<hr/>');
 170     $page_array[$key]['rendered'] = array($item);
 171     $page_array[$key]['rendered']['#prefix'] = '<p><em>Rendered version (light blue)</em>:</p>' . '<div class="rendered">';
 172     $page_array[$key]['rendered']['#suffix'] = '</div>';
 173   }
 174 
 175   return $page_array;
 176 }
 177 
 178 /**
 179  * A '#pre_render' function.
 180  *
 181  * @param $element
 182  *   The element which will be rendered.
 183  *
 184  * @return
 185  *   The altered element. In this case we add the #markup.
 186  */
 187 function render_example_cache_pre_render($element) {
 188   $element['#markup'] = render_example_cache_expensive();
 189 
 190   // The following line is due to the bug described in
 191   // http://drupal.org/node/914792. A #markup element's #pre_render must set
 192   // #children because it replaces the default #markup pre_render, which is
 193   // drupal_pre_render_markup().
 194   $element['#children'] = $element['#markup'];
 195   return $element;
 196 }
 197 
 198 /**
 199  * A potentially expensive function.
 200  *
 201  * @return
 202  *   Some demo text.
 203  */
 204 function render_example_cache_expensive() {
 205   $interval = 60;
 206   $time_message = t('The current time was %time when this was cached. Updated every %interval seconds', array('%time' => date('r'), '%interval' => $interval));
 207   // Uncomment the following line to demonstrate that this function is not
 208   // being run when the rendered array is cached.
 209   // drupal_set_message($time_message);
 210   return $time_message;
 211 }
 212 
 213 /**
 214  * A '#pre_render' function.
 215  *
 216  * @param $element
 217  *   The element which will be rendered.
 218  *
 219  * @return
 220  *   The altered element. In this case we add a #prefix to it.
 221  */
 222 function render_example_add_suffix($element) {
 223   $element['#suffix'] = '<div style="color:red">' . t('This #suffix was added by a #pre_render') . '</div>';
 224 
 225   // The following line is due to the bug described in
 226   // http://drupal.org/node/914792. A #markup element's #pre_render must set
 227   // #children because it replaces the default #markup pre_render, which is
 228   // drupal_pre_render_markup().
 229   $element['#children'] = $element['#markup'];
 230   return $element;
 231 }
 232 
 233 /**
 234  * A '#post_render' function to add a little markup onto the end markup.
 235  *
 236  * @param $markup
 237  *   The rendered element.
 238  * @param $element
 239  *   The element which was rendered (for reference)
 240  *
 241  * @return
 242  *   Markup altered as necessary. In this case we add a little postscript to it.
 243  */
 244 function render_example_add_prefix($markup, $element) {
 245   $markup = '<div style="color:blue">This markup was added after rendering by a #post_render</div>' . $markup;
 246   return $markup;
 247 }
 248 
 249 /**
 250  * A #theme function.
 251  *
 252  * This #theme function has the responsibility of consolidating/rendering the
 253  * children's markup and returning it, where it will be placed in the
 254  * element's #children property.
 255  */
 256 function theme_render_example_aggregate($variables) {
 257   $output = '';
 258   foreach (element_children($variables['element']['child']) as $item) {
 259     $output .= $variables['element']['child'][$item] . $variables['element']['#separator'];
 260   }
 261   return $output;
 262 }
 263 
 264 /*************** Altering Section **************************
 265  * The following section of the example builds and arranges the altering
 266  * example.
 267  */
 268 
 269 /**
 270  * Builds the form that offers options of what items to show.
 271  */
 272 function render_example_demo_form($form, &$form_state) {
 273   $form['description'] = array(
 274     '#type' => 'markup',
 275     '#markup' => t('This example shows what render arrays look like in the building of a page. It will not work unless the user running it has the "access devel information" privilege. It shows both the actual arrays used to build a page or block and also the capabilities of altering the page late in its lifecycle.'),
 276   );
 277 
 278   $form['show_arrays'] = array(
 279     '#type' => 'fieldset',
 280     '#title' => t('Show render arrays'),
 281   );
 282 
 283   foreach (array('block', 'page') as $type) {
 284     $form['show_arrays']['render_example_show_' . $type] = array(
 285       '#type' => 'checkbox',
 286       '#title' => t('Show @type render arrays', array('@type' => $type)),
 287       '#default_value' => variable_get('render_example_show_' . $type, FALSE),
 288     );
 289   }
 290 
 291   $form['page_fiddling'] = array(
 292     '#type' => 'fieldset',
 293     '#title' => t('Make changes on page via hook_page_alter()'),
 294   );
 295   $form['page_fiddling']['render_example_note_about_render_arrays'] = array(
 296     '#title' => t('Add a note about render arrays to top of sidebar_first (if it exists)'),
 297     '#description' => t('Creates a simple render array that displays the use of #pre_render, #post_render, #theme, and #theme_wrappers.'),
 298     '#type' => 'checkbox',
 299     '#default_value' => variable_get('render_example_note_about_render_arrays', FALSE),
 300   );
 301   $form['page_fiddling']['render_example_move_navigation_menu'] = array(
 302     '#title' => t('Move the navigation menu to the top of the content area'),
 303     '#description' => t('Uses hook_page_alter() to move the navigation menu into another region.'),
 304     '#type' => 'checkbox',
 305     '#default_value' => variable_get('render_example_move_navigation_menu', FALSE),
 306   );
 307   $form['page_fiddling']['render_example_reverse_sidebar'] = array(
 308     '#title' => t('Reverse ordering of sidebar_first elements (if it exists) - will affect the above'),
 309     '#description' => t('Uses hook_page_alter() to reverse the ordering of items in sidebar_first'),
 310     '#type' => 'checkbox',
 311     '#default_value' => variable_get('render_example_reverse_sidebar', FALSE),
 312   );
 313   $form['page_fiddling']['render_example_prefix'] = array(
 314     '#title' => t('Use #prefix and #suffix to wrap a div around every block'),
 315     '#description' => t('Uses hook_page_alter to wrap all blocks with a div using #prefix and #suffix'),
 316     '#type' => 'checkbox',
 317     '#default_value' => variable_get('render_example_prefix'),
 318   );
 319 
 320   return system_settings_form($form);
 321 }
 322 
 323 /**
 324  * Implements hook_page_alter().
 325  *
 326  * Alters the page in several different ways based on how the form has been
 327  * configured.
 328  */
 329 function render_example_page_alter(&$page) {
 330 
 331   $original_page = $page;
 332 
 333   // Re-sort the sidebar in reverse order.
 334   if (variable_get('render_example_reverse_sidebar', FALSE) && !empty($page['sidebar_first'])) {
 335     $page['sidebar_first'] = array_reverse($page['sidebar_first']);
 336     foreach (element_children($page['sidebar_first']) as $element) {
 337       // Reverse the weights if they exist.
 338       if (!empty($page['sidebar_first'][$element]['#weight'])) {
 339         $page['sidebar_first'][$element]['#weight'] *= -1;
 340       }
 341     }
 342     $page['sidebar_first']['#sorted'] = FALSE;
 343   }
 344 
 345   // Add a list of items to the top of sidebar_first.
 346   // This shows how #theme and #theme_wrappers work.
 347   if (variable_get('render_example_note_about_render_arrays', FALSE) && !empty($page['sidebar_first'])) {
 348     $items = array(
 349       t('Render arrays are everywhere in D7'),
 350       t('Leave content unrendered as much as possible'),
 351       t('This allows rearrangement and alteration very late in page cycle'),
 352     );
 353 
 354     $note = array(
 355       '#title' => t('Render Array Example'),
 356       '#items' => $items,
 357 
 358       // The functions in #pre_render get to alter the actual data before it
 359       // gets rendered by the various theme functions.
 360       '#pre_render' => array('render_example_change_to_ol'),
 361       // The functions in #post_render get both the element and the rendered
 362       // data and can add to the rendered data.
 363       '#post_render' => array('render_example_add_hr'),
 364       // The #theme theme operation gets the first chance at rendering the
 365       // element and its children.
 366       '#theme' => 'item_list',
 367       // Then the theme operations in #theme_wrappers can wrap more around
 368       // what #theme left in #chilren.
 369       '#theme_wrappers' => array('render_example_add_div', 'render_example_add_notes'),
 370       '#weight' => -9999,
 371     );
 372     $page['sidebar_first']['render_array_note'] = $note;
 373     $page['sidebar_first']['#sorted'] = FALSE;
 374   }
 375 
 376 
 377   // Move the navigation menu into the content area.
 378   if (variable_get('render_example_move_navigation_menu', FALSE) && !empty($page['sidebar_first']['system_navigation']) && !empty($page['content'])) {
 379     $page['content']['system_navigation'] = $page['sidebar_first']['system_navigation'];
 380     $page['content']['system_navigation']['#weight'] = -99999;
 381     unset($page['content']['#sorted']);
 382     unset($page['sidebar_first']['system_navigation']);
 383   }
 384 
 385   // Show the render array used to build the page render array display.
 386   if (variable_get('render_example_show_page', FALSE)) {
 387     $form['render_example_page_fieldset'] = array(
 388       '#type' => 'fieldset',
 389       '#title' => t('Page render array'),
 390       '#collapsible' => TRUE,
 391       '#collapsed' => TRUE,
 392     );
 393     $form['render_example_page_fieldset']['markup'] = array(
 394       // The kpr() function is from devel module and is here only allow us
 395       // to output the array in a way that's easy to explore.
 396       '#markup' => kpr($page, TRUE),
 397     );
 398     $page['content']['page_render_array'] = drupal_get_form('render_example_embedded_form', $form);
 399     $page['content']['page_render_array']['#weight'] = -999999;
 400     $page['content']['#sorted'] = FALSE;
 401   }
 402 
 403   // Add render array to the bottom of each block
 404   if (variable_get('render_example_show_block', FALSE)) {
 405     foreach (element_children($page) as $region_name) {
 406       foreach (element_children($page[$region_name]) as $block_name) {
 407 
 408         // Push the block down a level so we can add another block after it.
 409         $old_block = $page[$region_name][$block_name];
 410         $page[$region_name][$block_name] = array(
 411           $block_name => $old_block,
 412         );
 413         $form = array();
 414         $form['render_example_block_fieldset'] = array(
 415           '#type' => 'fieldset',
 416           '#title' => t('Block render array'),
 417           '#collapsible' => TRUE,
 418           '#collapsed' => TRUE,
 419         );
 420 
 421         $form['render_example_block_fieldset']['markup'] = array(
 422           '#type' => 'item',
 423           '#title' => t('%blockname block render array', array('%blockname' => $block_name)),
 424           // The kpr() function is from devel module and is here only allow us
 425           // to output the array in a way that's easy to explore.
 426           '#markup' => kpr($old_block, TRUE),
 427         );
 428 
 429         // Add the new block that contains the render array.
 430         $page[$region_name][$block_name]['render_example_block_render_array'] =  drupal_get_form('render_example_embedded_form', $form);
 431         $page[$region_name][$block_name]['render_example_block_render_array']['#weight'] = 999;
 432       }
 433     }
 434   }
 435 
 436   // Add #prefix and #suffix to a block to wrap a div around it.
 437   if (variable_get('render_example_prefix', FALSE)) {
 438     foreach (element_children($page) as $region_name) {
 439       foreach (element_children($page[$region_name]) as $block_name) {
 440         $block = &$page[$region_name][$block_name];
 441         $block['#prefix'] = '<div class="block-prefix"><p>Prefixed</p>';
 442         $block['#suffix'] = '<span class="block-suffix">Block suffix</span></div>';
 443       }
 444     }
 445   }
 446   $altered_page = $page;
 447 
 448 }
 449 
 450 /**
 451  * Utility function to build a named form given a set of form elements.
 452  *
 453  * This is a standard form builder function that takes an additional array,
 454  * which is itself a form.
 455  *
 456  * @param $form
 457  *   The standard $form
 458  * @param $form_state
 459  *   The standard $form_state
 460  * @param $form_items
 461  *   The form items to be included in this form.
 462  */
 463 function render_example_embedded_form($form, &$form_state, $form_items) {
 464   return $form_items;
 465 }
 466 
 467 /**
 468  * Implements hook_theme().
 469  */
 470 function render_example_theme() {
 471   $items = array(
 472     'render_example_add_div' => array(
 473       'render element' => 'element',
 474     ),
 475     'render_example_add_notes' => array(
 476       'render element' => 'element',
 477     ),
 478     'render_array' => array(
 479       'render element' => 'element',
 480     ),
 481     'render_example_aggregate' => array(
 482       'render element' => 'element',
 483     ),
 484   );
 485   return $items;
 486 }
 487 
 488 /**
 489  * Wraps a div around the already-rendered #children.
 490  */
 491 function theme_render_example_add_div($variables) {
 492   $element = $variables['element'];
 493   $output = '<div class="render-example-wrapper-div">';
 494   $output .= $element['#children'];
 495   $output .= '</div>';
 496   return $output;
 497 }
 498 
 499 /**
 500  * Wraps a div and add a little text after the rendered #children.
 501  */
 502 function theme_render_example_add_notes($variables) {
 503   $element = $variables['element'];
 504   $output = '<div class="render-example-notes-wrapper-div">';
 505   $output .= $element['#children'];
 506   $output .= '<em>' . t('This is a note added by a #theme_wrapper') . '</em>';
 507   $output .= '</div>';
 508 
 509   return $output;
 510 }
 511 
 512 /**
 513  * Themes the render array (from the demonstration page).
 514  */
 515 function theme_render_array($variables) {
 516   $heading = '<div class="render-header">' . $variables['element']['#description'] . '</div>';
 517 
 518   $rendered = '<div class="render-array">' . $heading . $variables['element']['#children'] . '</div>';
 519   return $rendered;
 520 }
 521 
 522 /**
 523  * Adds a #type to the element before it gets rendered.
 524  * In this case, changes from the default 'ul' to 'ol'.
 525  *
 526  * @param $element
 527  *   The element to be altered, in this case a list, ready for theme_item_list.
 528  *
 529  * @return
 530  *   The altered list (with '#type')
 531  */
 532 function render_example_change_to_ol($element) {
 533   $element['#type'] = 'ol';
 534   return $element;
 535 }
 536 
 537 /**
 538  * This #post_render function gets to alter the rendered output after all
 539  * theme functions have acted on it, and it receives the original data, so
 540  * can make decisions based on that. In this example, no use is made of the
 541  * passed-in $element.
 542  *
 543  * @param $markup
 544  *   The already-rendered data
 545  * @param unknown_type $element
 546  *   The data element that was rendered
 547  *
 548  * @return
 549  *   The altered data.
 550  */
 551 function render_example_add_hr($markup, $element) {
 552   $output = $markup . '<hr />';
 553   return $output;
 554 }
 555 /**
 556  * @} End of "defgroup render_example".
 557  */
";i:1;N;i:2;N;}i:2;i:1389;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24825;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"render_example.test";i:1;i:2;i:2;i:24825;}i:2;i:24825;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:24825;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6053:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test for the render example module.
   6  */
   7 class RenderExampleTestCase extends DrupalWebTestCase {
   8   public static function getInfo() {
   9     return array(
  10       'name' => 'Render example functionality',
  11       'description' => 'Test Render Example',
  12       'group' => 'Examples',
  13       'dependencies' => array('devel'),
  14     );
  15   }
  16 
  17   /**
  18    * Enable modules and create user with specific permissions.
  19    */
  20   function setUp() {
  21     parent::setUp('devel', 'render_example');
  22   }
  23 
  24 
  25   /**
  26    * Assert that all of the xpaths in the array have results.
  27    *
  28    * @param $xpath_array
  29    *   An array of xpaths, each of which must return something.
  30    */
  31   function assertRenderResults($xpath_array) {
  32     foreach ($xpath_array as $xpath) {
  33       $result = $this->xpath($xpath);
  34       $this->assertTrue(!empty($result), format_string('Found xpath %xpath', array('%xpath' => $xpath)));
  35     }
  36   }
  37 
  38 
  39   /**
  40    * Asserts that the string value of the result is the same as the passed text.
  41    *
  42    * @param $xpath_array
  43    *   Array of keyed arrays of tests to be made. Each child array consists of
  44    *   $xpath => $expected_text
  45    */
  46   function assertRenderedText($xpath_array) {
  47     foreach ($xpath_array as $xpath => $text) {
  48       $result = $this->xpath($xpath);
  49       $this->assertTrue((string)$result[0][0] == $text, format_string('%ary selects text %text', array('%ary' => $xpath, '%text' => $text)));
  50     }
  51   }
  52 
  53 
  54   /**
  55    * Login user, create an example node, and test blog functionality through the admin and user interfaces.
  56    */
  57   function testRenderExampleBasic() {
  58 
  59     // Create a user that can access devel information and log in.
  60     $web_user = $this->drupalCreateUser(array('access devel information', 'access content'));
  61     $this->drupalLogin($web_user);
  62 
  63     // Turn on the block render array display and make sure it shows up.
  64     $edit = array(
  65       'render_example_show_block' => TRUE,
  66     );
  67     $this->drupalPost('examples/render_example/altering', $edit, t('Save configuration'));
  68 
  69     $xpath_array = array(
  70       "//div[@id='sidebar-first']//fieldset[starts-with(@id, 'edit-render-example-block-fieldset')]",
  71       '//*[@id="content"]//fieldset[contains(@id,"edit-render-example-block-fieldset")]',
  72     );
  73     $this->assertRenderResults($xpath_array);
  74 
  75 
  76     // Turn off block render array display and turn on the page render array
  77     // display.
  78     $edit = array(
  79       'render_example_show_page' => TRUE,
  80       'render_example_show_block' => FALSE,
  81     );
  82     $this->drupalPost('examples/render_example/altering', $edit, t('Save configuration'));
  83 
  84     $xpath_array = array(
  85       '//*[@id="content"]//fieldset[starts-with(@id,"edit-render-example-page-fieldset")]',
  86     );
  87     $this->assertRenderResults($xpath_array);
  88 
  89     // Add note about render arrays to the top of sidebar_first.
  90     $edit = array(
  91       'render_example_note_about_render_arrays' => TRUE,
  92     );
  93     $this->drupalPost('examples/render_example/altering', $edit, t('Save configuration'));
  94     $xpath_array = array(
  95       '//*[@id="sidebar-first"]//ol//li[starts-with(.,"Render arrays are everywhere")]',
  96     );
  97     $this->assertRenderResults($xpath_array);
  98 
  99     // Move the navigation menu to the top of the content area.
 100     $edit = array(
 101       'render_example_move_navigation_menu' => TRUE,
 102     );
 103     $this->drupalPost('examples/render_example/altering', $edit, t('Save configuration'));
 104     $xpath_array = array(
 105       '//*[@id="content"]//h2[starts-with(.,"Navigation")]',
 106     );
 107     $this->assertRenderResults($xpath_array);
 108 
 109     // Skip a test for reversing order of sidebar_first as I think it would
 110     // be too fragile.
 111 
 112     // Test the addition of #prefix and #suffix
 113     $edit = array(
 114       'render_example_prefix' => TRUE,
 115     );
 116     $this->drupalPost('examples/render_example/altering', $edit, t('Save configuration'));
 117     $xpath_array = array(
 118       '//*[@id="sidebar-first"]//*[contains(@class, "block-prefix")]/span[contains(@class, "block-suffix")]',
 119     );
 120     $this->assertRenderResults($xpath_array);
 121 
 122     // Test some rendering facets of the various render examples
 123     $this->drupalGet('examples/render_example/arrays');
 124     $content = $this->xpath('//*[@class="render-array"][1]');
 125 
 126     $xpath_array = array(
 127       '//div[@class="rendered"][starts-with(.,"Some basic text in a #markup")]' => 'Some basic text in a #markup (shows basic markup and how it is rendered)',
 128       '//div[@class="rendered"][starts-with(.,"This is some text that should be put to")]' => 'This is some text that should be put together | This is some more text that we need | ',
 129       '//div[@class="rendered"][starts-with(.,"The current time was")]' => 'The current time was  when this was cached. Updated every  seconds',
 130       '//div[@class="rendered"]/div[text()][starts-with(.,"(prefix)This one")]' => '(prefix)This one adds a prefix and suffix, which put a div around the item(suffix)',
 131       '//div[@class="rendered"]/div[text()][starts-with(.,"markup for pre_")]' => 'markup for pre_render and post_render example',
 132       '//div[@class="rendered"]/div[text()][starts-with(.,"This markup was added")]' => 'This markup was added after rendering by a #post_render',
 133       '//div[@class="rendered"]/div[text()][starts-with(.,"This #suffix")]' => 'This #suffix was added by a #pre_render',
 134     );
 135     $this->assertRenderedText($xpath_array);
 136 
 137   }
 138 }
";i:1;N;i:2;N;}i:2;i:24862;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30923;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:30923;}}