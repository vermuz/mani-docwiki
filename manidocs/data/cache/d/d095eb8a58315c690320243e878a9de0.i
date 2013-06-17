a:49:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Ajax Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"ajax_example.css";i:1;i:2;i:2;i:29;}i:2;i:29;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:553:"
   1 /*
   2  * @file
   3  * CSS for ajax_example.
   4  *
   5  * See @link ajax_example_dependent_dropdown_degrades @endlink for
   6  * details on what this file does. It is not used in any other example.
   7  */
   8  
   9 /* Hides the next button when not degrading to non-javascript browser */
  10 html.js .next-button { 
  11   display: none; 
  12 }
  13 
  14 /* Makes the next/choose button align to the right of the select control */
  15 .form-item-dropdown-first, .form-item-question-type-select {
  16   display: inline-block;
  17 }
";i:1;N;i:2;N;}i:2;i:63;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:626;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"ajax_example.info";i:1;i:2;i:2;i:626;}i:2;i:626;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:626;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:180:"
   1 name = AJAX Example
   2 description = An example module showing how to use Drupal AJAX forms
   3 package = Example modules
   4 core = 7.x
   5 files[] = ajax_example.test
";i:1;N;i:2;N;}i:2;i:661;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:851;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"ajax_example.install";i:1;i:2;i:2;i:851;}i:2;i:851;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:851;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1722:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * AJAX Examples install file schema for ajax_example_form_node_form_alter()
   6  */
   7 
   8 /**
   9  * Implements hook_schema().
  10  */
  11 function ajax_example_schema() {
  12   $schema['ajax_example_node_form_alter'] = array(
  13     'description' => 'Stores example settings for nodes.',
  14     'fields' => array(
  15       'nid' => array(
  16         'type' => 'int',
  17         'unsigned' => TRUE,
  18         'not null' => TRUE,
  19         'default' => 0,
  20         'description' => 'The {node}.nid to store settings.',
  21       ),
  22       'example_1' => array(
  23         'type' => 'int',
  24         'not null' => TRUE,
  25         'default' => 0,
  26         'description' => 'Node Form Example 1 checkbox',
  27       ),
  28       'example_2' => array(
  29         'type' => 'varchar',
  30         'length' => 256,
  31         'not null' => FALSE,
  32         'default' => '',
  33         'description' => 'Node Form Example 2 textfield',
  34       ),
  35     ),
  36     'primary key' => array('nid'),
  37     'foreign keys' => array(
  38       'dnv_node' => array(
  39         'table' => 'node',
  40         'columns' => array('nid' => 'nid'),
  41       ),
  42     ),
  43   );
  44   return $schema;
  45 }
  46 
  47 /**
  48  * Add the new ajax_example_node_form_alter table.
  49  */
  50 function ajax_example_update_7100() {
  51   if (!db_table_exists('ajax_example_node_form_alter')) {
  52     $schema = ajax_example_schema();
  53     db_create_table('ajax_example_node_form_alter', $schema['ajax_example_node_form_alter']);
  54     return st('Created table ajax_example_node_form_alter');
  55   }
  56 }
";i:1;N;i:2;N;}i:2;i:889;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2620;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"ajax_example.js";i:1;i:2;i:2;i:2620;}i:2;i:2620;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2620;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:995:"
   1 /*
   2  * @file
   3  * JavaScript for ajax_example.
   4  *
   5  * See @link ajax_example_dependent_dropdown_degrades @endlink for
   6  * details on what this file does. It is not used in any other example.
   7  */
   8 
   9 (function($) {
  10 
  11   // Re-enable form elements that are disabled for non-ajax situations.
  12   Drupal.behaviors.enableFormItemsForAjaxForms = {
  13     attach: function() {
  14     // If ajax is enabled.
  15     if (Drupal.ajax) {
  16       $('.enabled-for-ajax').removeAttr('disabled');
  17     }
  18 
  19     // Below is only for the demo case of showing with js turned off.
  20     // It overrides the behavior of the CSS that would normally turn off
  21     // the 'ok' button when JS is enabled. Here, for demonstration purposes,
  22     // we have AJAX disabled but JS turned on, so use this to simulate.
  23     if (!Drupal.ajax) {
  24       $('html.js .next-button').show();
  25     }
  26   }
  27   };
  28 
  29 })(jQuery);
";i:1;N;i:2;N;}i:2;i:2653;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3658;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"ajax_example.module";i:1;i:2;i:2;i:3658;}i:2;i:3658;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3658;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:25875:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * AJAX Examples module file with basic examples.
   6  */
   7 
   8 /**
   9  * @defgroup ajax_example Example: AJAX
  10  * @ingroup examples
  11  * @{
  12  * These examples show basic AJAX concepts.
  13  *
  14  * General documentation is available at
  15  * @link ajax AJAX Framework documentation @endlink and at the
  16  * @link http://drupal.org/node/752056 AJAX Forms handbook page @endlink.
  17  *
  18  * The several examples here demonstrate basic AJAX usage.
  19  */
  20 
  21 // The Node Form Alter example needs to be in another file.
  22 module_load_include('inc', 'ajax_example', 'ajax_example_node_form_alter');
  23 
  24 /**
  25  * Implements hook_menu().
  26  *
  27  * Sets up calls to drupal_get_form() for all our example cases.
  28  *
  29  * @see menu_example.module
  30  * @see menu_example_menu()
  31  */
  32 function ajax_example_menu() {
  33   $items = array();
  34 
  35   $items['examples/ajax_example'] = array(
  36     'title' => 'AJAX Example',
  37     'page callback' => 'ajax_example_intro',
  38     'access callback' => TRUE,
  39     'expanded' => TRUE,
  40   );
  41 
  42   // Change the description of a form element.
  43   $items['examples/ajax_example/simplest'] = array(
  44     'title' => 'Simplest AJAX Example',
  45     'page callback' => 'drupal_get_form',
  46     'page arguments' => array('ajax_example_simplest'),
  47     'access callback' => TRUE,
  48     'weight' => 0,
  49   );
  50   // Generate a changing number of checkboxes.
  51   $items['examples/ajax_example/autocheckboxes'] = array(
  52     'title' => 'Generate checkboxes',
  53     'page callback' => 'drupal_get_form',
  54     'page arguments' => array('ajax_example_autocheckboxes'),
  55     'access callback' => TRUE,
  56     'weight' => 1,
  57   );
  58   // Generate different textfields based on form state.
  59   $items['examples/ajax_example/autotextfields'] = array(
  60     'title' => 'Generate textfields',
  61     'page callback' => 'drupal_get_form',
  62     'page arguments' => array('ajax_example_autotextfields'),
  63     'access callback' => TRUE,
  64     'weight' => 2,
  65   );
  66 
  67   // Submit a form without a page reload.
  68   $items['examples/ajax_example/submit_driven_ajax'] = array(
  69     'title' => 'Submit-driven AJAX',
  70     'page callback' => 'drupal_get_form',
  71     'page arguments' => array('ajax_example_submit_driven_ajax'),
  72     'access callback' => TRUE,
  73     'weight' => 3,
  74   );
  75 
  76   // Repopulate a dropdown based on form state.
  77   $items['examples/ajax_example/dependent_dropdown'] = array(
  78     'title' => 'Dependent dropdown',
  79     'page callback' => 'drupal_get_form',
  80     'page arguments' => array('ajax_example_dependent_dropdown'),
  81     'access callback' => TRUE,
  82     'weight' => 4,
  83   );
  84   // Repopulate a dropdown, but this time with graceful degredation.
  85   // See ajax_example_graceful_degradation.inc.
  86   $items['examples/ajax_example/dependent_dropdown_degrades'] = array(
  87     'title' => 'Dependent dropdown (with graceful degradation)',
  88     'page callback' => 'drupal_get_form',
  89     'page arguments' => array('ajax_example_dependent_dropdown_degrades'),
  90     'access callback' => TRUE,
  91     'weight' => 5,
  92     'file' => 'ajax_example_graceful_degradation.inc',
  93   );
  94   // The above example as it appears to users with no javascript.
  95   $items['examples/ajax_example/dependent_dropdown_degrades_no_js'] = array(
  96     'title' => 'Dependent dropdown with javascript off',
  97     'page callback' => 'drupal_get_form',
  98     'page arguments' => array('ajax_example_dependent_dropdown_degrades', TRUE),
  99     'access callback' => TRUE,
 100     'file' => 'ajax_example_graceful_degradation.inc',
 101     'weight' => 5,
 102   );
 103 
 104   // Populate a form section based on input in another element.
 105   $items['examples/ajax_example/dynamic_sections'] = array(
 106     'title' => 'Dynamic Sections (with graceful degradation)',
 107     'page callback' => 'drupal_get_form',
 108     'page arguments' => array('ajax_example_dynamic_sections'),
 109     'access callback' => TRUE,
 110     'weight' => 6,
 111     'file' => 'ajax_example_graceful_degradation.inc',
 112   );
 113   // The  above example as it appears to users with no javascript.
 114   $items['examples/ajax_example/dynamic_sections_no_js'] = array(
 115     'title' => 'Dynamic Sections w/JS turned off',
 116     'page callback' => 'drupal_get_form',
 117     'page arguments' => array('ajax_example_dynamic_sections', TRUE),
 118     'access callback' => TRUE,
 119     'weight' => 6,
 120     'file' => 'ajax_example_graceful_degradation.inc',
 121   );
 122 
 123   // A classic multi-step wizard, but with no page reloads.
 124   // See ajax_example_graceful_degradation.inc.
 125   $items['examples/ajax_example/wizard'] = array(
 126     'title' => 'Wizard (with graceful degradation)',
 127     'page callback' => 'drupal_get_form',
 128     'page arguments' => array('ajax_example_wizard'),
 129     'access callback' => TRUE,
 130     'file' => 'ajax_example_graceful_degradation.inc',
 131     'weight' => 7,
 132   );
 133   // The above example as it appears to users with no javascript.
 134   $items['examples/ajax_example/wizard_no_js'] = array(
 135     'title' => 'Wizard w/JS turned off',
 136     'page callback' => 'drupal_get_form',
 137     'page arguments' => array('ajax_example_wizard', TRUE),
 138     'access callback' => TRUE,
 139     'file' => 'ajax_example_graceful_degradation.inc',
 140     'weight' => 7,
 141   );
 142 
 143   // Add-more button that creates additional form elements.
 144   // See ajax_example_graceful_degradation.inc.
 145   $items['examples/ajax_example/add_more'] = array(
 146     'title' => 'Add-more button (with graceful degradation)',
 147     'page callback' => 'drupal_get_form',
 148     'page arguments' => array('ajax_example_add_more'),
 149     'access callback' => TRUE,
 150     'file' => 'ajax_example_graceful_degradation.inc',
 151     'weight' => 8,
 152   );
 153   // The above example as it appears to users with no javascript.
 154   $items['examples/ajax_example/add_more_no_js'] = array(
 155     'title' => 'Add-more button w/JS turned off',
 156     'page callback' => 'drupal_get_form',
 157     'page arguments' => array('ajax_example_add_more', TRUE),
 158     'access callback' => TRUE,
 159     'file' => 'ajax_example_graceful_degradation.inc',
 160     'weight' => 8,
 161   );
 162 
 163   // Use the AJAX framework outside the context of a form using the use-ajax
 164   // class. See ajax_example_misc.inc.
 165   $items['examples/ajax_example/ajax_link'] = array(
 166     'title' => 'Ajax Link ("use-ajax" class)',
 167     'page callback' => 'ajax_example_render_link',
 168     'access callback' => TRUE,
 169     'file' => 'ajax_example_misc.inc',
 170     'weight' => 9,
 171   );
 172   // Use the AJAX framework outside the context of a form using a renderable
 173   // array of type link with the #ajax property. See ajax_example_misc.inc.
 174   $items['examples/ajax_example/ajax_link_renderable'] = array(
 175     'title' => 'Ajax Link (Renderable Array)',
 176     'page callback' => 'ajax_example_render_link_ra',
 177     'access callback' => TRUE,
 178     'file' => 'ajax_example_misc.inc',
 179     'weight' => 9,
 180   );
 181   // A menu callback is required when using ajax outside of the Form API.
 182   $items['ajax_link_callback'] = array(
 183     'page callback' => 'ajax_link_response',
 184     'access callback' => 'user_access',
 185     'access arguments' => array('access content'),
 186     'type' => MENU_CALLBACK,
 187     'file' => 'ajax_example_misc.inc',
 188   );
 189 
 190   // Use AJAX framework commands outside of the #ajax form property.
 191   // See ajax_example_advanced.inc.
 192   $items['examples/ajax_example/advanced_commands'] = array(
 193     'title' => 'AJAX framework commands',
 194     'page callback' => 'drupal_get_form',
 195     'page arguments' => array('ajax_example_advanced_commands'),
 196     'access callback' => TRUE,
 197     'file' => 'ajax_example_advanced.inc',
 198     'weight' => 100,
 199   );
 200 
 201   // Autocomplete examples.
 202   $items['examples/ajax_example/simple_autocomplete'] = array(
 203     'title' => 'Autocomplete (simple)',
 204     'page callback' => 'drupal_get_form',
 205     'page arguments' => array('ajax_example_simple_autocomplete'),
 206     'access arguments' => array('access user profiles'),
 207     'file' => 'ajax_example_autocomplete.inc',
 208     'weight' => 10,
 209   );
 210   $items['examples/ajax_example/simple_user_autocomplete_callback'] = array(
 211     'page callback' => 'ajax_example_simple_user_autocomplete_callback',
 212     'file' => 'ajax_example_autocomplete.inc',
 213     'type' => MENU_CALLBACK,
 214     'access arguments' => array('access user profiles'),
 215   );
 216   $items['examples/ajax_example/node_autocomplete'] = array(
 217     'title' => 'Autocomplete (node with nid)',
 218     'page callback' => 'drupal_get_form',
 219     'page arguments' => array('ajax_example_unique_autocomplete'),
 220     'access arguments' => array('access content'),
 221     'file' => 'ajax_example_autocomplete.inc',
 222     'weight' => 11,
 223   );
 224   $items['examples/ajax_example/unique_node_autocomplete_callback'] = array(
 225     'page callback' => 'ajax_example_unique_node_autocomplete_callback',
 226     'file' => 'ajax_example_autocomplete.inc',
 227     'type' => MENU_CALLBACK,
 228     'access arguments' => array('access content'),
 229   );
 230   $items['examples/ajax_example/node_by_author'] = array(
 231     'title' => 'Autocomplete (node limited by author)',
 232     'page callback' => 'drupal_get_form',
 233     'page arguments' => array('ajax_example_node_by_author_autocomplete'),
 234     'access callback' => TRUE,
 235     'file' => 'ajax_example_autocomplete.inc',
 236     'weight' => 12,
 237   );
 238   $items['examples/ajax_example/node_by_author_autocomplete'] = array(
 239     'page callback' => 'ajax_example_node_by_author_node_autocomplete_callback',
 240     'file' => 'ajax_example_autocomplete.inc',
 241     'type' => MENU_CALLBACK,
 242     'access arguments' => array('access content'),
 243   );
 244 
 245   return $items;
 246 }
 247 
 248 function ajax_example_intro() {
 249   $markup = t('The AJAX example module provides many examples of AJAX including forms, links, and AJAX commands.');
 250 
 251   $list[] = l(t('Simplest AJAX Example'), 'examples/ajax_example/simplest');
 252   $list[] = l(t('Generate checkboxes'), 'examples/ajax_example/autocheckboxes');
 253   $list[] = l(t('Generate textfields'), 'examples/ajax_example/autotextfields');
 254   $list[] = l(t('Submit-driven AJAX'), 'examples/ajax_example/submit_driven_ajax');
 255   $list[] = l(t('Dependent dropdown'), 'examples/ajax_example/dependent_dropdown');
 256   $list[] = l(t('Dependent dropdown (with graceful degradation)'), 'examples/ajax_example/dependent_dropdown_degrades');
 257   $list[] = l(t('Dynamic Sections w/JS turned off'), 'examples/ajax_example/dependent_dropdown_degrades_no_js');
 258   $list[] = l(t('Wizard (with graceful degradation)'), 'examples/ajax_example/wizard');
 259   $list[] = l(t('Wizard w/JS turned off'), 'examples/ajax_example/wizard_no_js');
 260   $list[] = l(t('Add-more button (with graceful degradation)'), 'examples/ajax_example/add_more');
 261   $list[] = l(t('Add-more button w/JS turned off'), 'examples/ajax_example/add_more_no_js');
 262   $list[] = l(t('Ajax Link ("use-ajax" class)'), 'examples/ajax_example/ajax_link');
 263   $list[] = l(t('Ajax Link (Renderable Array)'), 'examples/ajax_example/ajax_link_renderable');
 264   $list[] = l(t('AJAX framework commands'), 'examples/ajax_example/advanced_commands');
 265   $list[] = l(t('Autocomplete (simple)'), 'examples/ajax_example/simple_autocomplete');
 266   $list[] = l(t('Autocomplete (node with nid)'), 'examples/ajax_example/node_autocomplete');
 267   $list[] = l(t('Autocomplete (node limited by author)'), 'examples/ajax_example/node_by_author');
 268 
 269   $variables['items'] = $list;
 270   $variables['type'] = 'ul';
 271   $markup .= theme('item_list', $variables);
 272 
 273   return $markup;
 274 }
 275 
 276 /**
 277  * Simple form whose ajax-enabled 'changethis' member causes a text change
 278  * in the description of the 'replace_textfield' member.
 279  * See @link http://drupal.org/node/262422 Form API Tutorial @endlink
 280  */
 281 function ajax_example_simplest($form, &$form_state) {
 282   $form = array();
 283   $form['changethis'] = array(
 284     '#title' => t("Choose something and explain why"),
 285     '#type' => 'select',
 286     '#options' => array(
 287       'one' => 'one',
 288       'two' => 'two',
 289       'three' => 'three',
 290     ),
 291     '#ajax' => array(
 292       // #ajax has two required keys: callback and wrapper.
 293       // 'callback' is a function that will be called when this element changes.
 294       'callback' => 'ajax_example_simplest_callback',
 295       // 'wrapper' is the HTML id of the page element that will be replaced.
 296       'wrapper' => 'replace_textfield_div',
 297       // There are also several optional keys - see ajax_example_autocheckboxes
 298       // below for details on 'method', 'effect' and 'speed' and
 299       // ajax_example_dependent_dropdown for 'event'.
 300     ),
 301   );
 302 
 303   // This entire form element will be replaced whenever 'changethis' is updated.
 304   $form['replace_textfield'] = array(
 305     '#type' => 'textfield',
 306     '#title' => t("Why"),
 307     // The prefix/suffix provide the div that we're replacing, named by
 308     // #ajax['wrapper'] above.
 309     '#prefix' => '<div id="replace_textfield_div">',
 310     '#suffix' => '</div>',
 311   );
 312 
 313   // An AJAX request calls the form builder function for every change.
 314   // We can change how we build the form based on $form_state.
 315   if (!empty($form_state['values']['changethis'])) {
 316     $form['replace_textfield']['#description'] = t("Say why you chose '@value'", array('@value' => $form_state['values']['changethis']));
 317   }
 318   return $form;
 319 }
 320 
 321 /**
 322  * Callback for ajax_example_simplest.
 323  *
 324  * On an ajax submit, the form builder function is called again, then the $form
 325  * and $form_state are passed to this callback function so it can select which
 326  * portion of the form to send on to the client.
 327  *
 328  * @return renderable array (the textfield element)
 329  */
 330 function ajax_example_simplest_callback($form, $form_state) {
 331   // The form has already been submitted and updated. We can return the replaced
 332   // item as it is.
 333   return $form['replace_textfield'];
 334 }
 335 
 336 /**
 337  * AJAX-enabled select element causes replacement of a set of checkboxes
 338  * based on the selection.
 339  */
 340 function ajax_example_autocheckboxes($form, &$form_state) {
 341   // Since the form builder is called after every AJAX request, we rebuild
 342   // the form based on $form_state.
 343   $num_checkboxes = !empty($form_state['values']['howmany_select']) ? $form_state['values']['howmany_select'] : 1;
 344 
 345   $form['howmany_select'] = array(
 346     '#title' => t('How many checkboxes do you want?'),
 347     '#type' => 'select',
 348     '#options' => array(1 => 1, 2 => 2, 3 => 3, 4 => 4),
 349     '#default_value' => $num_checkboxes,
 350     '#ajax' => array(
 351       'callback' => 'ajax_example_autocheckboxes_callback',
 352       'wrapper' => 'checkboxes-div',
 353       //'method' defaults to replaceWith, but valid values also include
 354       // append, prepend, before and after.
 355       // 'method' => 'replaceWith',
 356       // 'effect' defaults to none. Other valid values are 'fade' and 'slide'.
 357       // See ajax_example_autotextfields for an example of 'fade'.
 358       'effect' => 'slide',
 359       // 'speed' defaults to 'slow'. You can also use 'fast'
 360       // or a number of milliseconds for the animation to last.
 361       // 'speed' => 'slow',
 362       // Don't show any throbber...
 363       'progress' => array('type' => 'none'),
 364     ),
 365   );
 366 
 367 
 368   $form['checkboxes_fieldset'] = array(
 369     '#title' => t("Generated Checkboxes"),
 370     // The prefix/suffix provide the div that we're replacing, named by
 371     // #ajax['wrapper'] above.
 372     '#prefix' => '<div id="checkboxes-div">',
 373     '#suffix' => '</div>',
 374     '#type' => 'fieldset',
 375     '#description' => t('This is where we get automatically generated checkboxes'),
 376   );
 377 
 378   for ($i = 1; $i <= $num_checkboxes; $i++) {
 379     $form['checkboxes_fieldset']["checkbox$i"] = array(
 380       '#type' => 'checkbox',
 381       '#title' => "Checkbox $i",
 382     );
 383   }
 384 
 385   $form['submit'] = array(
 386     '#type' => 'submit',
 387     '#value' => t('Submit'),
 388   );
 389 
 390   return $form;
 391 }
 392 
 393 /**
 394  * Callback element needs only select the portion of the form to be updated.
 395  * Since #ajax['callback'] return can be HTML or a renderable array (or an
 396  * array of commands), we can just return a piece of the form.
 397  * See @link ajax_example_advanced.inc AJAX Advanced Commands for more details
 398  * on AJAX framework commands.
 399  *
 400  * @return renderable array (the checkboxes fieldset)
 401  */
 402 function ajax_example_autocheckboxes_callback($form, $form_state) {
 403   return $form['checkboxes_fieldset'];
 404 }
 405 
 406 
 407 /**
 408  * Show/hide textfields based on AJAX-enabled checkbox clicks.
 409  */
 410 function ajax_example_autotextfields($form, &$form_state) {
 411 
 412   $form['ask_first_name'] = array(
 413     '#type' => 'checkbox',
 414     '#title' => t('Ask me my first name'),
 415     '#ajax' => array(
 416       'callback' => 'ajax_example_autotextfields_callback',
 417       'wrapper' => 'textfields',
 418       'effect' => 'fade',
 419     )
 420   );
 421   $form['ask_last_name'] = array(
 422    '#type' => 'checkbox',
 423    '#title' => t('Ask me my last name'),
 424     '#ajax' => array(
 425       'callback' => 'ajax_example_autotextfields_callback',
 426       'wrapper' => 'textfields',
 427       'effect' => 'fade',
 428     ),
 429   );
 430 
 431   $form['textfields'] = array(
 432     '#title' => t("Generated text fields for first and last name"),
 433     '#prefix' => '<div id="textfields">',
 434     '#suffix' => '</div>',
 435     '#type' => 'fieldset',
 436     '#description' => t('This is where we put automatically generated textfields'),
 437   );
 438 
 439   // Since checkboxes return TRUE or FALSE, we have to check that
 440   // $form_state has been filled as well as what it contains.
 441   if (!empty($form_state['values']['ask_first_name']) && $form_state['values']['ask_first_name']) {
 442     $form['textfields']['first_name'] = array(
 443       '#type' => 'textfield',
 444       '#title' => t('First Name'),
 445     );
 446   }
 447   if (!empty($form_state['values']['ask_last_name']) && $form_state['values']['ask_last_name']) {
 448     $form['textfields']['last_name'] = array(
 449       '#type' => 'textfield',
 450       '#title' => t('Last Name'),
 451     );
 452   }
 453 
 454   $form['submit'] = array(
 455     '#type' => 'submit',
 456     '#value' => t('Click Me'),
 457   );
 458 
 459   return $form;
 460 }
 461 
 462 /**
 463  * Selects the piece of the form we want to use as replacement text and returns
 464  * it as a form (renderable array).
 465  *
 466  * @return renderable array (the textfields element)
 467  */
 468 function ajax_example_autotextfields_callback($form, $form_state) {
 469   return $form['textfields'];
 470 }
 471 
 472 
 473 /**
 474  * A very basic form which with an AJAX-enabled submit.
 475  *
 476  * On submit, the markup in the #markup element is updated.
 477  */
 478 function ajax_example_submit_driven_ajax($form, &$form_state) {
 479   $form['box'] = array(
 480     '#type' => 'markup',
 481     '#prefix' => '<div id="box">',
 482     '#suffix' => '</div>',
 483     '#markup' => '<h1>Initial markup for box</h1>',
 484   );
 485 
 486   $form['submit'] = array(
 487     '#type' => 'submit',
 488     '#ajax' => array(
 489       'callback' => 'ajax_example_submit_driven_callback',
 490       'wrapper' => 'box',
 491     ),
 492     '#value' => t('Submit'),
 493   );
 494 
 495   return $form;
 496 }
 497 
 498 /**
 499  * Select the 'box' element, change the markup in it, and return it as a
 500  * renderable array.
 501  *
 502  * @return renderable array (the box element)
 503  */
 504 function ajax_example_submit_driven_callback($form, $form_state) {
 505   // In most cases, it is recomended that you put this logic in form generation
 506   // rather than the callback. Submit driven forms are an exception, because
 507   // you may not want to return the form at all.
 508   $element = $form['box'];
 509   $element['#markup'] = "Clicked submit ({$form_state['values']['op']}): " . date('c');
 510   return $element;
 511 }
 512 
 513 
 514 /**
 515  * A form with a dropdown whose options are dependent on a
 516  * choice made in a previous dropdown.
 517  *
 518  * On changing the first dropdown, the options in the second
 519  * are updated.
 520  */
 521 function ajax_example_dependent_dropdown($form, &$form_state) {
 522   // Get the list of options to populate the first dropdown.
 523   $options_first = _ajax_example_get_first_dropdown_options();
 524   // If we have a value for the first dropdown from $form_state['values'] we use
 525   // this both as the default value for the first dropdown and also as a
 526   // parameter to pass to the function that retrieves the options for the
 527   // second dropdown.
 528   $selected = isset($form_state['values']['dropdown_first']) ? $form_state['values']['dropdown_first'] : key($options_first);
 529 
 530   $form['dropdown_first'] = array(
 531     '#type' => 'select',
 532     '#title' => 'Instrument Type',
 533     '#options' => $options_first,
 534     '#default_value' => $selected,
 535     // Bind an ajax callback to the change event (which is the default for the
 536     // select form type) of the first dropdown. It will replace the second
 537     // dropdown when rebuilt
 538     '#ajax' => array(
 539       // When 'event' occurs, Drupal will perform an ajax request in the
 540       // background. Usually the default value is sufficient (eg. change for
 541       // select elements), but valid values include any jQuery event,
 542       // most notably 'mousedown', 'blur', and 'submit'.
 543       // 'event' => 'change',
 544       'callback' => 'ajax_example_dependent_dropdown_callback',
 545       'wrapper' => 'dropdown-second-replace',
 546     ),
 547   );
 548 
 549   $form['dropdown_second'] = array(
 550     '#type' => 'select',
 551     '#title' => $options_first[$selected] . ' ' . t('Instruments'),
 552     // The entire enclosing div created here gets replaced when dropdown_first
 553     // is changed.
 554     '#prefix' => '<div id="dropdown-second-replace">',
 555     '#suffix' => '</div>',
 556     // when the form is rebuilt during ajax processing, the $selected variable
 557     // will now have the new value and so the options will change
 558     '#options' => _ajax_example_get_second_dropdown_options($selected),
 559     '#default_value' => isset($form_state['values']['dropdown_second']) ? $form_state['values']['dropdown_second'] : '',
 560   );
 561   $form['submit'] = array(
 562     '#type' => 'submit',
 563     '#value' => t('Submit'),
 564   );
 565   return $form;
 566 }
 567 
 568 /**
 569  * Selects just the second dropdown to be returned for re-rendering
 570  *
 571  * Since the controlling logic for populating the form is in the form builder
 572  * function, all we do here is select the element and return it to be updated.
 573  *
 574  * @return renderable array (the second dropdown)
 575  */
 576 function ajax_example_dependent_dropdown_callback($form, $form_state) {
 577   return $form['dropdown_second'];
 578 }
 579 
 580 /**
 581  * Helper function to populate the first dropdown. This would normally be
 582  * pulling data from the database.
 583  *
 584  * @return array of options
 585  */
 586 function _ajax_example_get_first_dropdown_options() {
 587   // drupal_map_assoc() just makes an array('String' => 'String'...).
 588   return drupal_map_assoc(array(t('String'), t('Woodwind'), t('Brass'), t('Percussion')));
 589 }
 590 
 591 /**
 592  * Helper function to populate the second dropdown. This would normally be
 593  * pulling data from the database.
 594  *
 595  * @param $key
 596  *   This will determine which set of options is returned.
 597  *
 598  * @return array of options
 599  */
 600 function _ajax_example_get_second_dropdown_options($key = '') {
 601   $options = array(
 602     t('String') => drupal_map_assoc(array(t('Violin'), t('Viola'), t('Cello'), t('Double Bass'))),
 603     t('Woodwind') => drupal_map_assoc(array(t('Flute'), t('Clarinet'), t('Oboe'), t('Bassoon'))),
 604     t('Brass') => drupal_map_assoc(array(t('Trumpet'), t('Trombone'), t('French Horn'), t('Euphonium'))),
 605     t('Percussion') => drupal_map_assoc(array(t('Bass Drum'), t('Timpani'), t('Snare Drum'), t('Tambourine'))),
 606   );
 607   if (isset($options[$key])) {
 608     return $options[$key];
 609   }
 610   else {
 611     return array();
 612   }
 613 }
 614 /**
 615  * @} End of "defgroup ajax_example".
 616  */
";i:1;N;i:2;N;}i:2;i:3695;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29580;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"ajax_example.test";i:1;i:2;i:2;i:29580;}i:2;i:29580;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29580;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2411:"
   1 <?php
   2 /**
   3  * @file
   4  * Test ajax example module.
   5  */
   6 class AjaxExampleTestCase extends DrupalWebTestCase {
   7 
   8   public static function getInfo() {
   9     return array(
  10       'name' => 'Ajax example',
  11       'description' => 'Checks behavior of the Ajax Example',
  12       'group' => 'Examples',
  13     );
  14   }
  15 
  16   /**
  17    * Enable module.
  18    */
  19   function setUp() {
  20     parent::setUp('ajax_example');
  21   }
  22 
  23   /**
  24    * Check the non-JS version of the "Dynamic Sections" example.
  25    */
  26   function testDynamicSectionsNoJs() {
  27     // The path to the example form.
  28     $path = 'examples/ajax_example/dynamic_sections_no_js';
  29     // Confirmation text for right and wrong answers.
  30     $wrong = 'Wrong answer. Try again. (Hint: The right answer is "George Washington".)';
  31     $right = 'You got the right answer: George Washington';
  32     // For each question style, choose some parameters.
  33     $params = array(
  34       'Multiple Choice' => array(
  35         'value' => 'Abraham Lincoln',
  36         'answer' => 'Abraham Lincoln',
  37         'response' => $wrong,
  38       ),
  39       'True/False' => array(
  40         'value' => 'George Washington',
  41         'answer' => 'George Washington',
  42         'response' => $right,
  43       ),
  44       'Fill-in-the-blanks' => array(
  45         'value' => NULL,
  46         'answer' => 'George Washington',
  47         'response' => $right,
  48       ),
  49     );
  50     foreach ($params as $style => $QandA) {
  51       // Submit the initial form.
  52       $edit = array('question_type_select' => t($style));
  53       $this->drupalPost($path, $edit, t('Choose'));
  54       $this->assertResponse(200, format_string('Question style "@style" selected.', array('@style' => t($style))));
  55       // For convenience, make variables out of the entries in $QandA.
  56       extract($QandA);
  57       // Check for the expected input field.
  58       $this->assertFieldByName('question', t($value));
  59       // Now, submit the dynamically generated form.
  60       $edit = array('question' => t($answer));
  61       $this->drupalPost(NULL, $edit, t('Submit your answer'));
  62       $this->assertRaw(t($response), 'Dynamic form has been submitted.');
  63     }
  64   }
  65 
  66 }
";i:1;N;i:2;N;}i:2;i:29615;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32036;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"ajax_example_advanced.inc";i:1;i:2;i:2;i:32036;}i:2;i:32036;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:32036;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16856:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * AJAX Commands examples.
   6  *
   7  * This demonstrates each of the
   8  * new AJAX commands. This is consolidated into a dense page because
   9  * it's advanced material and because it would spread itself all over creation
  10  * otherwise.
  11  */
  12 
  13 /**
  14  * Form to display the AJAX Commands.
  15  */
  16 function ajax_example_advanced_commands($form, &$form_state) {
  17   $form = array();
  18   $form['intro'] = array(
  19     '#type' => 'markup',
  20     '#markup' => t("<div>Demonstrates how AJAX commands can be used.</div>"),
  21   );
  22 
  23   // Shows the 'after' command with a callback generating commands.
  24   $form['after_command_example_fieldset'] = array(
  25     '#type' => 'fieldset',
  26     '#title' => t("This shows the Ajax 'after' command. Click to put something below the div that says 'Something can be inserted after this'")
  27   );
  28 
  29   $form['after_command_example_fieldset']['after_command_example'] = array(
  30     '#value' => t("AJAX 'After': Click to put something after the div"),
  31     '#type' => 'submit',
  32     '#ajax' => array(
  33       'callback' => 'ajax_example_advanced_commands_after_callback',
  34     ),
  35     '#suffix' => "<div id='after_div'>Something can be inserted after this</div>
  36                   <div id='after_status'>'After' Command Status: Unknown</div>",
  37   );
  38 
  39   // Shows the 'alert' command.
  40   $form['alert_command_example_fieldset'] = array(
  41     '#type' => 'fieldset',
  42     '#title' => t("Demonstrates the AJAX 'alert' command. Click the button."),
  43   );
  44   $form['alert_command_example_fieldset']['alert_command_example'] = array(
  45     '#value' => t("AJAX 'Alert': Click to alert"),
  46     '#type' => 'submit',
  47     '#ajax' => array(
  48       'callback' => 'ajax_example_advanced_commands_alert_callback',
  49     ),
  50   );
  51 
  52   // Shows the 'append' command.
  53   $form['append_command_example_fieldset'] = array(
  54     '#type' => 'fieldset',
  55     '#title' => t("This shows the Ajax 'append' command. Click to put something below the div that says 'Something can be inserted after this'")
  56   );
  57 
  58   $form['append_command_example_fieldset']['append_command_example'] = array(
  59     '#value' => t("AJAX 'Append': Click to append something"),
  60     '#type' => 'submit',
  61     '#ajax' => array(
  62       'callback' => 'ajax_example_advanced_commands_append_callback',
  63     ),
  64     '#suffix' => "<div id='append_div'>Something can be appended inside this div... </div>
  65                   <div id='append_status'>'After' Command Status: Unknown</div>"
  66   );
  67 
  68 
  69   // Shows the 'before' command.
  70   $form['before_command_example_fieldset'] = array(
  71     '#type' => 'fieldset',
  72     '#title' => t("This shows the Ajax 'before' command.")
  73   );
  74 
  75   $form['before_command_example_fieldset']['before_command_example'] = array(
  76     '#value' => t("AJAX 'before': Click to put something before the div"),
  77     '#type' => 'submit',
  78     '#ajax' => array(
  79       'callback' => 'ajax_example_advanced_commands_before_callback',
  80     ),
  81     '#suffix' => "<div id='before_div'>Something can be inserted before this</div>
  82                   <div id='before_status'>'before' Command Status: Unknown</div>"
  83   );
  84 
  85   // Shows the 'changed' command.
  86   $form['changed_command_example_fieldset'] = array(
  87     '#type' => 'fieldset',
  88     '#title' => t("Demonstrates the AJAX 'changed' command. If region is 'changed', it is marked with CSS. This example also puts an asterisk by changed content."),
  89   );
  90 
  91   $form['changed_command_example_fieldset']['changed_command_example'] = array(
  92     '#title' => t("AJAX changed: If checked, div is marked as changed."),
  93     '#type' => 'checkbox',
  94     '#default_value' => FALSE,
  95     '#ajax' => array(
  96       'callback' => 'ajax_example_advanced_commands_changed_callback',
  97     ),
  98     '#suffix' => "<div id='changed_div'> <div id='changed_div_mark_this'>This div can be marked as changed or not.</div></div>
  99                   <div id='changed_status'>Status: Unknown</div>"
 100   );
 101 
 102   // Shows the AJAX 'css' command.
 103   $form['css_command_example_fieldset'] = array(
 104     '#type' => 'fieldset',
 105     '#title' => t("Demonstrates the AJAX 'css' command."),
 106   );
 107 
 108   $form['css_command_example_fieldset']['css_command_example'] = array(
 109     '#title' => t("AJAX CSS: Choose the color you'd like the '#box' div to be."),
 110     '#type' => 'select',
 111     // '#default_value' => 'green',
 112     '#options' => array('green' => 'green', 'blue' => 'blue'),
 113     '#ajax' => array(
 114       'callback' => 'ajax_example_advanced_commands_css_callback',
 115     ),
 116     '#suffix' => "<div id='css_div' style='height: 50px; width: 50px; border: 1px solid black'> box</div>
 117                   <div id='css_status'>Status: Unknown</div>"
 118   );
 119 
 120   // Shows the AJAX 'data' command. But there is no use of this information,
 121   // as this would require a javascript client to use the data.
 122   $form['data_command_example_fieldset'] = array(
 123     '#type' => 'fieldset',
 124     '#title' => t("Demonstrates the AJAX 'data' command."),
 125   );
 126 
 127   $form['data_command_example_fieldset']['data_command_example'] = array(
 128     '#title' => t("AJAX data: Set a key/value pair on a selector."),
 129     '#type' => 'textfield',
 130     '#default_value' => 'color=green',
 131     '#ajax' => array(
 132       'callback' => 'ajax_example_advanced_commands_data_callback',
 133     ),
 134     '#suffix' => "<div id='data_div'>This div should have key='time'/value='a time string' attached.</div>
 135                   <div id='data_status'>Status: Unknown</div>"
 136   );
 137 
 138   // Shows the AJAX 'html' command.
 139   $form['html_command_example_fieldset'] = array(
 140     '#type' => 'fieldset',
 141     '#title' => t("Demonstrates the AJAX 'html' command."),
 142   );
 143 
 144   $form['html_command_example_fieldset']['html_command_example'] = array(
 145     '#title' => t("AJAX html: Replace the HTML in a selector."),
 146     '#type' => 'textfield',
 147     '#default_value' => 'new value',
 148     '#ajax' => array(
 149       'callback' => 'ajax_example_advanced_commands_html_callback',
 150     ),
 151     '#suffix' => "<div id='html_div'>Original contents</div>
 152                   <div id='html_status'>Status: Unknown</div>"
 153   );
 154 
 155   // Shows the AJAX 'prepend' command.
 156   $form['prepend_command_example_fieldset'] = array(
 157     '#type' => 'fieldset',
 158     '#title' => t("This shows the AJAX 'prepend' command. Click to put something below the div that says 'Something can be inserted after this'")
 159   );
 160 
 161   $form['prepend_command_example_fieldset']['prepend_command_example'] = array(
 162     '#value' => t("AJAX 'prepend': Click to prepend something"),
 163     '#type' => 'submit',
 164     '#ajax' => array(
 165       'callback' => 'ajax_example_advanced_commands_prepend_callback',
 166     ),
 167     '#suffix' => "<div id='prepend_div'>Something can be prepended to this div... </div>
 168                   <div id='prepend_status'>'After' Command Status: Unknown</div>"
 169   );
 170 
 171   // Shows the AJAX 'remove' command.
 172   $form['remove_command_example_fieldset'] = array(
 173     '#type' => 'fieldset',
 174     '#title' => t("Shows the Ajax 'remove' command.")
 175   );
 176 
 177   $form['remove_command_example_fieldset']['remove_command_example'] = array(
 178     '#title' => t("AJAX 'remove': Check to remove text. Uncheck to add it back."),
 179     '#type' => 'checkbox',
 180     '#default_value' => FALSE,
 181     '#ajax' => array(
 182       'callback' => 'ajax_example_advanced_commands_remove_callback',
 183     ),
 184     '#suffix' => "<div id='remove_div'><div id='remove_text'>text to be removed</div></div>
 185                   <div id='remove_status'>'After' Command Status: Unknown</div>"
 186   );
 187 
 188   // Show off the AJAX 'restripe' command. Also shows classic AJAX replacement
 189   // on the "how many rows" processing.
 190   $form['restripe_command_example_fieldset'] = array(
 191     '#type' => 'fieldset',
 192     '#title' => t("Demonstrates the Ajax 'restripe' command.")
 193   );
 194 
 195   $form['restripe_command_example_fieldset']['restripe_num_rows'] = array(
 196     '#type' => 'select',
 197     '#default_value' => !empty($form_state['values']['restripe_num_rows']) ? $form_state['values']['restripe_num_rows'] : 1,
 198     '#options' => drupal_map_assoc(array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
 199     '#ajax' => array(
 200       'callback' => 'ajax_example_advanced_commands_restripe_num_rows',
 201       'method' => 'replace',
 202       'wrapper' => 'restripe_table',
 203     ),
 204   );
 205   $form['restripe_command_example_fieldset']['restripe_restripe'] = array(
 206     '#type' => 'submit',
 207     '#value' => t("Restripe the table"),
 208     '#ajax' => array(
 209       'callback' => 'ajax_example_advanced_commands_restripe_callback',
 210     ),
 211     '#suffix' => "<div id='restripe_div'>
 212                   <table id='restripe_table' style='border: 1px solid black' >
 213                   <tr id='table-first'><td>first row</td></tr>
 214                   </table>
 215                   </div>
 216                   <div id='restripe_status'>'Restripe' Command Status: Unknown</div>",
 217 
 218   );
 219 
 220   $form['submit'] = array(
 221     '#type' => 'submit',
 222     '#value' => t('Submit'),
 223   );
 224 
 225   return $form;
 226 }
 227 
 228 /**
 229  * 'after' callback.
 230  *
 231  * @see ajax_command_after()
 232  */
 233 function ajax_example_advanced_commands_after_callback($form, $form_state) {
 234   $selector = '#after_div';
 235 
 236   $commands = array();
 237   $commands[] = ajax_command_after($selector, "New 'after'...");
 238   $commands[] = ajax_command_replace("#after_status", "<div id='after_status'>Updated after_command_example " . date('r') . "</div>");
 239   return array('#type' => 'ajax', '#commands' => $commands);
 240 }
 241 
 242 /**
 243  * 'alert' callback.
 244  *
 245  * @see ajax_command_alert()
 246  */
 247 function ajax_example_advanced_commands_alert_callback($form, $form_state) {
 248   $commands = array();
 249   $commands[] = ajax_command_alert("Alert requested at " . date('r'));
 250   return array('#type' => 'ajax', '#commands' => $commands);
 251 }
 252 
 253 /**
 254  * 'append' callback.
 255  *
 256  * @see ajax_command_append()
 257  */
 258 function ajax_example_advanced_commands_append_callback($form, $form_state) {
 259   $selector = '#append_div';
 260 
 261   $commands = array();
 262   $commands[] = ajax_command_append($selector, "Stuff...");
 263   $commands[] = ajax_command_replace("#append_status", "<div id='append_status'>Updated append_command_example " . date('r') . "</div>");
 264   return array('#type' => 'ajax', '#commands' => $commands);
 265 }
 266 
 267 /**
 268  * 'before' callback.
 269  *
 270  * @see ajax_command_before()
 271  */
 272 function ajax_example_advanced_commands_before_callback($form, $form_state) {
 273   $selector = '#before_div';
 274 
 275   $commands = array();
 276   $commands[] = ajax_command_before($selector, "New 'before'...");
 277   $commands[] = ajax_command_replace("#before_status", "<div id='before_status'>Updated before_command_example " . date('r') . "</div>");
 278   return array('#type' => 'ajax', '#commands' => $commands);
 279 }
 280 
 281 /**
 282  * 'changed' callback.
 283  *
 284  * @see ajax_command_changed()
 285  */
 286 function ajax_example_advanced_commands_changed_callback($form, $form_state) {
 287   $checkbox_value = $form_state['values']['changed_command_example'];
 288   $checkbox_value_string = $checkbox_value ? "TRUE" : "FALSE";
 289   $commands = array();
 290   if ($checkbox_value) {
 291     $commands[] = ajax_command_changed( '#changed_div', '#changed_div_mark_this');
 292   }
 293   else {
 294     $commands[] = ajax_command_replace('#changed_div', "<div id='changed_div'> <div id='changed_div_mark_this'>This div can be marked as changed or not.</div></div>");
 295   }
 296   $commands[] = ajax_command_replace("#changed_status", "<div id='changed_status'>Updated changed_command_example to $checkbox_value_string: " . date('r') . "</div>");
 297   return array('#type' => 'ajax', '#commands' => $commands);
 298 }
 299 
 300 /**
 301  * 'css' callback.
 302  *
 303  * @see ajax_command_css()
 304  */
 305 function ajax_example_advanced_commands_css_callback($form, $form_state) {
 306   $selector = '#css_div';
 307   $color = $form_state['values']['css_command_example'];
 308 
 309   $commands = array();
 310   $commands[] = ajax_command_css($selector, array('background-color' => $color));
 311   $commands[] = ajax_command_replace("#css_status", "<div id='css_status'>Updated css_command_example to '{$color}' " . date('r') . "</div>");
 312   return array('#type' => 'ajax', '#commands' => $commands);
 313 }
 314 
 315 /**
 316  * 'data' callback.
 317  *
 318  * @see ajax_command_data()
 319  */
 320 function ajax_example_advanced_commands_data_callback($form, $form_state) {
 321   $selector = '#data_div';
 322   $text = $form_state['values']['data_command_example'];
 323   list($key, $value) = preg_split('/=/', $text);
 324 
 325   $commands = array();
 326   $commands[] = ajax_command_data($selector, $key, $value);
 327   $commands[] = ajax_command_replace("#data_status", "<div id='data_status'>Updated data_command_example with key=$key, value=$value; " . date('r') . "</div>");
 328   return array('#type' => 'ajax', '#commands' => $commands);
 329 }
 330 
 331 /**
 332  * 'html' callback.
 333  *
 334  * @see ajax_command_html()
 335  */
 336 function ajax_example_advanced_commands_html_callback($form, $form_state) {
 337   $text = $form_state['values']['html_command_example'];
 338 
 339   $commands = array();
 340   $commands[] = ajax_command_html('#html_div', $text);
 341   $commands[] = ajax_command_replace("#html_status", "<div id='html_status'>Updated html_command_example with text=$text;  " . date('r') . "</div>");
 342   return array('#type' => 'ajax', '#commands' => $commands);
 343 }
 344 
 345 /**
 346  * 'prepend' callback.
 347  *
 348  * @see ajax_command_prepend()
 349  */
 350 function ajax_example_advanced_commands_prepend_callback($form, $form_state) {
 351   $commands = array();
 352   $commands[] = ajax_command_prepend('#prepend_div', "Prepended Stuff...");
 353   $commands[] = ajax_command_replace("#prepend_status", "<div id='prepend_status'>Updated prepend_command_example " . date('r') . "</div>");
 354   return array('#type' => 'ajax', '#commands' => $commands);
 355 }
 356 
 357 /**
 358  * 'remove' callback.
 359  *
 360  * @see ajax_command_remove()
 361  */
 362 function ajax_example_advanced_commands_remove_callback($form, $form_state) {
 363   $commands = array();
 364   $should_remove = $form_state['values']['remove_command_example'];
 365   $should_remove_string = $should_remove ? 'TRUE' : 'FALSE';
 366   if ($should_remove) {
 367     $commands[] = ajax_command_remove('#remove_text');
 368   }
 369   else {
 370     $commands[] = ajax_command_html('#remove_div', "<div id='remove_text'>text to be removed</div>");
 371   }
 372   $commands[] = ajax_command_replace("#remove_status", "<div id='remove_status'>Updated remove_command_example (value={$should_remove_string} " . date('r') . "</div>");
 373   return array('#type' => 'ajax', '#commands' => $commands);
 374 }
 375 
 376 /**
 377  * 'restripe' rows callback.
 378  *
 379  * Rebuilds the table with the selected number of rows.
 380  */
 381 function ajax_example_advanced_commands_restripe_num_rows($form, $form_state) {
 382   $num_rows = $form_state['values']['restripe_num_rows'];
 383   $output = "<table id='restripe_table' style='border: 1px solid black'>";
 384   for ($i=1; $i<=$num_rows; $i++) {
 385     $output .= "<tr><td>Row $i</td></tr>";
 386   }
 387   $output .= "</table>";
 388   return $output;
 389 }
 390 
 391 /**
 392  * 'restripe' callback.
 393  *
 394  * @see ajax_command_restripe()
 395  */
 396 function ajax_example_advanced_commands_restripe_callback($form, $form_state) {
 397   $commands = array();
 398   $commands[] = ajax_command_restripe('#restripe_table');
 399   $commands[] = ajax_command_replace("#restripe_status", "<div id='restripe_status'>Restriped table " . date('r') . "</div>");
 400   return array('#type' => 'ajax', '#commands' => $commands);
 401 }
";i:1;N;i:2;N;}i:2;i:32079;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:48944;}i:32;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"ajax_example_autocomplete.inc";i:1;i:2;i:2;i:48944;}i:2;i:48944;}i:33;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:48944;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16718:"
  1 <?php
   2 /**
   3  * @file
   4  * ajax_example_autocomplete.inc
   5  *
   6  * Demonstrates usage of the Form API's autocomplete features.
   7  *
   8  * This file provides three examples in increasing complexity:
   9  * - A simple username autocomplete (usernames are unique, so little effort is required)
  10  * - A node title autocomplete (titles are not unique, so we have to find the nid and stash it in the field)
  11  * - A username autocomplete that updates a node title autocomplete with a changed #autocomplete_path so that the
  12  *   #autocomplete_path can have context (the username to use in the search).
  13  */
  14 
  15 /**
  16  * A simple autocomplete form which just looks up usernames in the user table.
  17  *
  18  * @param $form
  19  * @param $form_state
  20  * @return array
  21  */
  22 function ajax_example_simple_autocomplete($form, &$form_state) {
  23 
  24   $form['info'] = array(
  25     '#markup' => '<div>' . t("This example does a simplest possible autocomplete by username. You'll need a few users on your system for it to make sense.") . '</div>',
  26   );
  27 
  28   $form['user'] = array(
  29     '#type' => 'textfield',
  30     '#title' => t('Choose a user (or a people, depending on your usage preference)'),
  31     // The autocomplete path is provided in hook_menu in ajax_example.module.
  32     '#autocomplete_path' => 'examples/ajax_example/simple_user_autocomplete_callback',
  33   );
  34 
  35  return $form;
  36 }
  37 
  38 /**
  39  * This is just a copy of user_autocomplete().
  40  *
  41  * It works simply by searching usernames (and of course in Drupal usernames are unique, so can be used for
  42  * identifying a record.)
  43  *
  44  * The returned $matches array has
  45  * * key: string which will be displayed once the autocomplete is selected
  46  * * value: the value which will is displayed in the autocomplete pulldown.
  47  *
  48  * In the simplest cases (see user_autocomplete()) these are the same, and nothing needs to be done. However, more more
  49  * complicated autocompletes require more work. Here we demonstrate the difference by displaying the UID along with
  50  * the username in the dropdown.
  51  *
  52  * In the end, though, we'll be doing something with the value that ends up in the textfield, so it needs to uniquely
  53  * identify the record we want to access. This is demonstrated in ajax_example_unique_autocomplete().
  54  *
  55  * @param $string
  56  *   The string that will be searched.
  57  */
  58 function ajax_example_simple_user_autocomplete_callback($string = "") {
  59   $matches = array();
  60   if ($string) {
  61     $result = db_select('users')
  62       ->fields('users', array('name', 'uid'))
  63       ->condition('name', db_like($string) . '%', 'LIKE')
  64       ->range(0, 10)
  65       ->execute();
  66     foreach ($result as $user) {
  67       // In the simplest case (see user_autocomplete), the key and the value are the same. Here we'll display the
  68       // uid along with the username in the dropdown.
  69       $matches[$user->name] = check_plain($user->name) . " (uid=$user->uid)";
  70     }
  71   }
  72 
  73   drupal_json_output($matches);
  74 }
  75 
  76 
  77 
  78 
  79 /**
  80  * A unique autocomplete form which looks up nodes by title in the node table, but must keep track of the nid, because
  81  * titles are certainly not guaranteed to be unique.
  82  *
  83  * @param $form
  84  * @param $form_state
  85  * @return array
  86  */
  87 function ajax_example_unique_autocomplete($form, &$form_state) {
  88 
  89   $form['info'] = array(
  90     '#markup' => '<div>' . t("This example does a node autocomplete by title. The difference between this and a username autocomplete is that the node title may not be unique, so we have to use the nid for uniqueness, placing it in a parseable location in the textfield.") . '</div>',
  91   );
  92 
  93   $form['node'] = array(
  94     '#type' => 'textfield',
  95     '#title' => t('Choose a node by title'),
  96     // The autocomplete path is provided in hook_menu in ajax_example.module.
  97     '#autocomplete_path' => 'examples/ajax_example/unique_node_autocomplete_callback',
  98   );
  99 
 100   $form['actions'] = array(
 101     '#type' => 'actions'
 102   );
 103 
 104   $form['actions']['submit'] = array(
 105     '#type' => 'submit',
 106     '#value' => t('Submit'),
 107   );
 108 
 109   return $form;
 110 }
 111 
 112 /**
 113  * Validate handler to convert our string like "Some node title [3325]" into a nid.
 114  *
 115  * In case the user did not actually use the autocomplete or have a valid string there, we'll try to look
 116  * up a result anyway giving it our best guess.
 117  *
 118  * Since the user chose a unique node, we must now use the same one in our submit handler, which means we need to look
 119  * in the string for the nid.
 120  *
 121  * @param $form
 122  * @param $form_state
 123  */
 124 function ajax_example_unique_autocomplete_validate($form, &$form_state) {
 125   $title = $form_state['values']['node'];
 126   $matches = array();
 127   $nid = 0;
 128 
 129   // This preg_match() looks for the last pattern like [33334] and if found extracts the numeric portion.
 130   $result = preg_match('/\[([0-9]+)\]$/', $title, $matches);
 131   if ($result > 0) {
 132     // If $result is nonzero, we found a match and can use it as the index into $matches.
 133     $nid = $matches[$result];
 134     // Verify that it's a valid nid.
 135     $node = node_load($nid);
 136     if (empty($node)) {
 137       form_error($form['node'], t('Sorry, no node with nid %nid can be found', array('%nid' => $nid)));
 138       return;
 139     }
 140   }
 141   // BUT: Not everybody will have javascript turned on, or they might hit ESC and not use the autocomplete values
 142   // offered. In that case, we can attempt to come up with a useful value. This is not absolutely necessary,
 143   // and we *could* just emit a form_error() as below.
 144   else {
 145     $nid = db_select('node')
 146       ->fields('node', array('nid'))
 147       ->condition('title', db_like($title) . '%', 'LIKE')
 148       ->range(0, 1)
 149       ->execute()
 150       ->fetchField();
 151   }
 152 
 153   // Now, if we somehow found a nid, assign it to the node. If we failed, emit an error.
 154   if (!empty($nid)) {
 155     $form_state['values']['node'] = $nid;
 156   }
 157   else {
 158     form_error($form['node'], t('Sorry, no node starting with %title can be found', array('%title' => $title)));
 159   }
 160 }
 161 
 162 /**
 163  * Submit handler for node lookup unique autocomplete example.
 164  *
 165  * Here the nid has already been placed in $form_state['values']['node'] by the validation handler.
 166  *
 167  * @param $form
 168  * @param $form_state
 169  */
 170 function ajax_example_unique_autocomplete_submit($form, &$form_state) {
 171   $node = node_load($form_state['values']['node']);
 172   drupal_set_message(t('You found node %nid with title %title', array('%nid' => $node->nid, '%title' => $node->title)));
 173 }
 174 
 175 /**
 176  * Autocomplete callback for nodes by title.
 177  *
 178  * Searches for a node by title, but then identifies it by nid, so the actual returned value can be used later by
 179  * the form.
 180  *
 181  * The returned $matches array has
 182  * * key: The title, with the identifying nid in brackets, like "Some node title [3325]"
 183  * * value: the title which will is displayed in the autocomplete pulldown.
 184  *
 185  * Note that we must use a key style that can be parsed successfully and unambiguously. For example, if we might
 186  * have node titles that could have [3325] in them, then we'd have to use a more restrictive token.
 187  *
 188  * @param $string
 189  *   The string that will be searched.
 190  */
 191 function ajax_example_unique_node_autocomplete_callback($string = "") {
 192   $matches = array();
 193   if ($string) {
 194     $result = db_select('node')
 195       ->fields('node', array('nid', 'title'))
 196       ->condition('title', db_like($string) . '%', 'LIKE')
 197       ->range(0, 10)
 198       ->execute();
 199     foreach ($result as $node) {
 200       $matches[$node->title . " [$node->nid]"] = check_plain($node->title);
 201     }
 202   }
 203 
 204   drupal_json_output($matches);
 205 }
 206 
 207 
 208 
 209 
 210 /**
 211  * In this example, we'll look up nodes by title, but we want only nodes that have been authored by a particular user.
 212  * That means that we'll have to make an autocomplete function which takes a username as an argument, and
 213  * use #ajax to change the #autocomplete_path based on the selected user.
 214  *
 215  * Although the implementation of the validate handler may look complex, it's just ambitious. The idea here is:
 216  * 1. Autcomplete to get a valid username.
 217  * 2. Use #ajax to update the node element with a #autocomplete_callback that gives the context for the username.
 218  * 3. Do an autcomplete on the node field that is limited by the username.
 219  *
 220  * @param $form
 221  * @param $form_state
 222  * @return array
 223  */
 224 function ajax_example_node_by_author_autocomplete($form, &$form_state) {
 225 
 226   $form['intro'] = array(
 227     '#markup' => '<div>' . t("This example uses a user autocomplete to dynamically change a node title autocomplete using #ajax.
 228       This is a way to get past the fact that we have no other way to provide context to the autocomplete function.
 229       It won't work very well unless you have a few users who have created some content that you can search for.") . '</div>',
 230   );
 231 
 232   $form['author'] = array(
 233     '#type' => 'textfield',
 234     '#title' => t('Choose the username that authored nodes you are interested in'),
 235     // Since we just need simple user lookup, we can use the simplest function of them all, user_autocomplete().
 236     '#autocomplete_path' => 'user/autocomplete',
 237     '#ajax' => array(
 238       'callback' => 'ajax_example_node_by_author_ajax_callback',
 239       'wrapper' => 'autocomplete-by-node-ajax-replace',
 240     ),
 241   );
 242 
 243   // This form element with autocomplete will be replaced by #ajax whenever the author changes, allowing the search
 244   // to be limited by user.
 245   $form['node'] = array(
 246     '#type' => 'textfield',
 247     '#title' => t('Choose a node by title'),
 248     '#prefix' => '<div id="autocomplete-by-node-ajax-replace">',
 249     '#suffix' => '</div>',
 250     '#disabled' => TRUE,
 251   );
 252 
 253   // When the author changes in the author field, we'll change the autocomplete_path to match.
 254   if (!empty($form_state['values']['author'])) {
 255     $author = user_load_by_name($form_state['values']['author']);
 256     if (!empty($author)) {
 257       $autocomplete_path = 'examples/ajax_example/node_by_author_autocomplete/' . $author->uid;
 258       $form['node']['#autocomplete_path'] = $autocomplete_path;
 259       $form['node']['#title'] = t('Choose a node title authored by %author', array('%author' => $author->name));
 260       $form['node']['#disabled'] = FALSE;
 261     }
 262   }
 263 
 264   $form['actions'] = array(
 265     '#type' => 'actions'
 266   );
 267 
 268   $form['actions']['submit'] = array(
 269     '#type' => 'submit',
 270     '#value' => t('Submit'),
 271   );
 272 
 273   return $form;
 274 }
 275 
 276 /**
 277  *
 278  * AJAX callback for author form element.
 279  *
 280  * @param $form
 281  * @param $form_state
 282  * @return array
 283  */
 284 function ajax_example_node_by_author_ajax_callback($form, $form_state) {
 285   return $form['node'];
 286 }
 287 
 288 /**
 289  * Validate handler to convert our string like "Some node title [3325]" into a nid.
 290  *
 291  * In case the user did not actually use the autocomplete or have a valid string there, we'll try to look
 292  * up a result anyway giving it our best guess.
 293  *
 294  * Since the user chose a unique node, we must now use the same one in our submit handler, which means we need to look
 295  * in the string for the nid.
 296  *
 297  * This handler looks complex because it's ambitious (and tries to punt and find a node if they've entered a valid
 298  * username and part of a title), but you *could* just do a form_error() if nothing were found,
 299  * forcing people to use the autocomplete to look up the relevant items.
 300  *
 301  * @param $form
 302  * @param $form_state
 303  */
 304 function ajax_example_node_by_author_autocomplete_validate($form, &$form_state) {
 305   $title = $form_state['values']['node'];
 306   $author = $form_state['values']['author'];
 307   $matches = array();
 308   $nid = 0;
 309 
 310   $account = user_load_by_name($author); // We must have a valid user.
 311   if (empty($account)) {
 312     form_error($form['author'], t('You must choose a valid author username'));
 313     return;
 314   }
 315   // This preg_match() looks for the last pattern like [33334] and if found extracts the numeric portion.
 316   $result = preg_match('/\[([0-9]+)\]$/', $title, $matches);
 317   if ($result > 0) {
 318     // If $result is nonzero, we found a match and can use it as the index into $matches.
 319     $nid = $matches[$result];
 320     // Verify that it's a valid nid.
 321     $node = node_load($nid);
 322     if (empty($node)) {
 323       form_error($form['node'], t('Sorry, no node with nid %nid can be found', array('%nid' => $nid)));
 324       return;
 325     }
 326   }
 327   // BUT: Not everybody will have javascript turned on, or they might hit ESC and not use the autocomplete values
 328   // offered. In that case, we can attempt to come up with a useful value. This is not absolutely necessary,
 329   // and we *could* just emit a form_error() as below. Here we'll find the *first* matching title and assume
 330   // that is adequate.
 331   else {
 332     $nid = db_select('node')
 333       ->fields('node', array('nid'))
 334       ->condition('uid', $account->uid)
 335       ->condition('title', db_like($title) . '%', 'LIKE')
 336       ->range(0, 1)
 337       ->execute()
 338       ->fetchField();
 339   }
 340 
 341   // Now, if we somehow found a nid, assign it to the node. If we failed, emit an error.
 342   if (!empty($nid)) {
 343     $form_state['values']['node'] = $nid;
 344   }
 345   else {
 346     form_error($form['node'], t('Sorry, no node starting with %title can be found', array('%title' => $title)));
 347   }
 348 }
 349 
 350 /**
 351  * Submit handler for node lookup unique autocomplete example.
 352  *
 353  * Here the nid has already been placed in $form_state['values']['node'] by the validation handler.
 354  *
 355  * @param $form
 356  * @param $form_state
 357  */
 358 function ajax_example_node_by_author_autocomplete_submit($form, &$form_state) {
 359   $node = node_load($form_state['values']['node']);
 360   $account = user_load($node->uid);
 361   drupal_set_message(t('You found node %nid with title !title_link, authored by !user_link',
 362     array('%nid' => $node->nid, '!title_link' => l($node->title, 'node/' . $node->nid), '!user_link' => theme('username', array('account' => $account)))));
 363 }
 364 
 365 /**
 366  * Autocomplete callback for nodes by title but limited by author.
 367  *
 368  * Searches for a node by title given the passed-in author username.
 369  *
 370  * The returned $matches array has
 371  * * key: The title, with the identifying nid in brackets, like "Some node title [3325]"
 372  * * value: the title which will is displayed in the autocomplete pulldown.
 373  *
 374  * Note that we must use a key style that can be parsed successfully and unambiguously. For example, if we might
 375  * have node titles that could have [3325] in them, then we'd have to use a more restrictive token.
 376  *
 377  * @param $author_uid
 378  *   The author username to limit the search.
 379  * @param $string
 380  *   The string that will be searched.
 381  */
 382 function ajax_example_node_by_author_node_autocomplete_callback($author_uid, $string = "") {
 383   $matches = array();
 384   if ($author_uid > 0 && trim($string)) {
 385     $result = db_select('node')
 386       ->fields('node', array('nid', 'title'))
 387       ->condition('uid', $author_uid)
 388       ->condition('title', db_like($string) . '%', 'LIKE')
 389       ->range(0, 10)
 390       ->execute();
 391     foreach ($result as $node) {
 392       $matches[$node->title . " [$node->nid]"] = check_plain($node->title);
 393     }
 394   }
 395 
 396   drupal_json_output($matches);
 397 }
";i:1;N;i:2;N;}i:2;i:48991;}i:35;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:65718;}i:36;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"ajax_example_graceful_degradation.inc";i:1;i:2;i:2;i:65718;}i:2;i:65718;}i:37;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:65718;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27091:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Demonstrations of AJAX with graceful degradation.
   6  */
   7 
   8 /**
   9  * @defgroup ajax_degradation_example Example: AJAX Graceful Degradation
  10  * @ingroup examples
  11  * @{
  12  * These examples show AJAX with graceful degradation when Javascript is not
  13  * available.
  14  *
  15  * In each of these the key idea is that the form is rebuilt different ways
  16  * depending on form input. In order to accomplish that, the formbuilder function
  17  * is in charge of almost all logic.
  18  */
  19 
  20 /**
  21  * A form with a dropdown whose options are dependent on a
  22  * choice made in a previous dropdown.
  23  *
  24  * On changing the first dropdown, the options in the second
  25  * are updated. Gracefully degrades if no javascript.
  26  *
  27  * A bit of CSS and javascript is required. The CSS hides the "add more" button
  28  * if javascript is not enabled. The Javascript snippet is really only used
  29  * to enable us to present the form in degraded mode without forcing the user
  30  * to turn off Javascript.  Both of these are loaded by using the
  31  * #attached FAPI property, so it is a good example of how to use that.
  32  *
  33  * The extra argument $no_js_use is here only to allow presentation of this
  34  * form as if Javascript were not enabled. ajax_example_menu() provides two
  35  * ways to call this form, one normal ($no_js_use = FALSE) and one simulating
  36  * Javascript disabled ($no_js_use = TRUE).
  37  */
  38 function ajax_example_dependent_dropdown_degrades($form, &$form_state, $no_js_use = FALSE) {
  39   // Get the list of options to populate the first dropdown.
  40   $options_first = _ajax_example_get_first_dropdown_options();
  41 
  42   // If we have a value for the first dropdown from $form_state['values'] we use
  43   // this both as the default value for the first dropdown and also as a
  44   // parameter to pass to the function that retrieves the options for the
  45   // second dropdown.
  46   $selected = isset($form_state['values']['dropdown_first']) ? $form_state['values']['dropdown_first'] : key($options_first);
  47 
  48   // Attach the CSS and JS we need to show this with and without javascript.
  49   // Without javascript we need an extra "Choose" button, and this is
  50   // hidden when we have javascript enabled.
  51   $form['#attached']['css'] = array(
  52     drupal_get_path('module', 'ajax_example') . '/ajax_example.css',
  53   );
  54   $form['#attached']['js'] = array(
  55     drupal_get_path('module', 'ajax_example') . '/ajax_example.js',
  56   );
  57 
  58   $form['dropdown_first_fieldset'] = array(
  59     '#type' => 'fieldset',
  60   );
  61   $form['dropdown_first_fieldset']['dropdown_first'] = array(
  62     '#type' => 'select',
  63     '#title' => 'Instrument Type',
  64     '#options' => $options_first,
  65     '#attributes' => array('class' => array('enabled-for-ajax')),
  66 
  67     // The '#ajax' property allows us to bind a callback to the server whenever this
  68     // form element changes. See ajax_example_autocheckboxes and
  69     // ajax_example_dependent_dropdown in ajax_example.module for more details.
  70     '#ajax' => array(
  71       'callback' => 'ajax_example_dependent_dropdown_degrades_first_callback',
  72       'wrapper' => 'dropdown-second-replace',
  73     ),
  74   );
  75 
  76   // This simply allows us to demonstrate no-javascript use without
  77   // actually turning off javascript in the browser. Removing the #ajax
  78   // element turns off AJAX behaviors on that element and as a result
  79   // ajax.js doesn't get loaded. This is for demonstration purposes only.
  80   if ($no_js_use) {
  81     unset($form['dropdown_first_fieldset']['dropdown_first']['#ajax']);
  82   }
  83 
  84   // Since we don't know if the user has js or not, we always need to output
  85   // this element, then hide it with with css if javascript is enabled.
  86   $form['dropdown_first_fieldset']['continue_to_second'] = array(
  87     '#type' => 'submit',
  88     '#value' => t('Choose'),
  89     '#attributes' => array('class' => array('next-button')),
  90   );
  91 
  92   $form['dropdown_second_fieldset'] = array(
  93     '#type' => 'fieldset',
  94   );
  95   $form['dropdown_second_fieldset']['dropdown_second'] = array(
  96     '#type' => 'select',
  97     '#title' => $options_first[$selected] . ' ' . t('Instruments'),
  98     '#prefix' => '<div id="dropdown-second-replace">',
  99     '#suffix' => '</div>',
 100     '#attributes' => array('class' => array('enabled-for-ajax')),
 101     // When the form is rebuilt during processing (either AJAX or multistep),
 102     // the $selected variable will now have the new value and so the options
 103     // will change.
 104     '#options' => _ajax_example_get_second_dropdown_options($selected),
 105   );
 106   $form['dropdown_second_fieldset']['submit'] = array(
 107     '#type' => 'submit',
 108     '#value' => t('OK'),
 109     // This class allows attached js file to override the disabled attribute,
 110     // since it's not necessary in ajax-enabled form.
 111     '#attributes' => array('class' => array('enabled-for-ajax')),
 112   );
 113 
 114   // Disable dropdown_second if a selection has not been made on dropdown_first.
 115   if (empty($form_state['values']['dropdown_first'])) {
 116     $form['dropdown_second_fieldset']['dropdown_second']['#disabled'] = TRUE;
 117     $form['dropdown_second_fieldset']['dropdown_second']['#description'] = t('You must make your choice on the first dropdown before changing this second one.');
 118     $form['dropdown_second_fieldset']['submit']['#disabled'] = TRUE;
 119   }
 120 
 121   return $form;
 122 }
 123 
 124 /**
 125  * Submit function for ajax_example_dependent_dropdown_degrades().
 126  */
 127 function ajax_example_dependent_dropdown_degrades_submit($form, &$form_state) {
 128 
 129   // Now handle the case of the next, previous, and submit buttons.
 130   // only submit will result in actual submission, all others rebuild.
 131   switch ($form_state['triggering_element']['#value']) {
 132     case t('OK'): // Submit: We're done.
 133       drupal_set_message(t('Your values have been submitted. dropdown_first=@first, dropdown_second=@second', array('@first' => $form_state['values']['dropdown_first'], '@second' => $form_state['values']['dropdown_second'])));
 134       return;
 135   }
 136   // 'Choose' or anything else will cause rebuild of the form and present
 137   // it again.
 138   $form_state['rebuild'] = TRUE;
 139 }
 140 
 141 /**
 142  * Selects just the second dropdown to be returned for re-rendering.
 143  *
 144  * @return
 145  *   Renderable array (the second dropdown).
 146  */
 147 function ajax_example_dependent_dropdown_degrades_first_callback($form, $form_state) {
 148   return $form['dropdown_second_fieldset']['dropdown_second'];
 149 }
 150 
 151 
 152 /**
 153  * Example of a form with portions dynamically enabled or disabled, but
 154  * with graceful degradation in the case of no javascript.
 155  *
 156  * The idea here is that certain parts of the form don't need to be displayed
 157  * unless a given option is selected, but then they should be displayed and
 158  * configured.
 159  *
 160  * The third $no_js_use argument is strictly for demonstrating operation
 161  * without javascript, without making the user/developer turn off javascript.
 162  */
 163 function ajax_example_dynamic_sections($form, &$form_state, $no_js_use = FALSE) {
 164 
 165   // Attach the CSS and JS we need to show this with and without javascript.
 166   // Without javascript we need an extra "Choose" button, and this is
 167   // hidden when we have javascript enabled.
 168   $form['#attached']['css'] = array(
 169     drupal_get_path('module', 'ajax_example') . '/ajax_example.css',
 170   );
 171   $form['#attached']['js'] = array(
 172     drupal_get_path('module', 'ajax_example') . '/ajax_example.js',
 173   );
 174   $form['description'] = array(
 175     '#type' => 'markup',
 176     '#markup' => '<div>' . t('This example demonstrates a form which dynamically creates various sections based on the configuration in the form.
 177       It deliberately allows graceful degradation to a non-javascript environment.
 178       In a non-javascript environment, the "Choose" button next to the select control
 179       is displayed; in a javascript environment it is hidden by the module CSS.
 180       <br/><br/>The basic idea here is that the form is built up based on
 181       the selection in the question_type_select field, and it is built the same
 182       whether we are in a javascript/AJAX environment or not.
 183       <br/><br/>
 184       Try the <a href="!ajax_link">AJAX version</a> and the <a href="!non_ajax_link">simulated-non-AJAX version</a>.
 185     ', array('!ajax_link' => url('examples/ajax_example/dynamic_sections'), '!non_ajax_link' => url('examples/ajax_example/dynamic_sections_no_js') )) . '</div>',
 186   );
 187   $form['question_type_select'] = array(
 188     '#type' => 'select',
 189     '#title' => t('Question style'),
 190     '#options' => drupal_map_assoc(array(t('Choose question style'), t('Multiple Choice'), t('True/False'), t('Fill-in-the-blanks'))),
 191     '#ajax' => array(
 192       'wrapper' => 'questions-fieldset-wrapper',
 193       'callback' => 'ajax_example_dynamic_sections_select_callback',
 194     ),
 195   );
 196   // The CSS for this module hides this next button if JS is enabled.
 197   $form['question_type_submit'] = array(
 198     '#type' => 'submit',
 199     '#value' => t('Choose'),
 200     '#attributes' => array('class' => array('next-button')),
 201     '#limit_validation_errors' => array(),  // No need to validate when submitting this.
 202     '#validate' => array(),
 203   );
 204 
 205   // This simply allows us to demonstrate no-javascript use without
 206   // actually turning off javascript in the browser. Removing the #ajax
 207   // element turns off AJAX behaviors on that element and as a result
 208   // ajax.js doesn't get loaded.
 209   if ($no_js_use) {
 210     // Remove the #ajax from the above, so ajax.js won't be loaded.
 211     unset($form['question_type_select']['#ajax']);
 212   }
 213 
 214   // This fieldset just serves as a container for the part of the form
 215   // that gets rebuilt.
 216   $form['questions_fieldset'] = array(
 217     '#type' => 'fieldset',
 218     // These provide the wrapper referred to in #ajax['wrapper'] above.
 219     '#prefix' => '<div id="questions-fieldset-wrapper">',
 220     '#suffix' => '</div>',
 221   );
 222   if (!empty($form_state['values']['question_type_select'])) {
 223 
 224     $form['questions_fieldset']['question'] = array(
 225       '#markup' => t('Who was the first president of the U.S.?'),
 226     );
 227     $question_type = $form_state['values']['question_type_select'];
 228 
 229     switch ($question_type) {
 230       case t('Multiple Choice'):
 231         $form['questions_fieldset']['question'] = array(
 232           '#type' => 'radios',
 233           '#title' => t('Who was the first president of the United States'),
 234           '#options' => drupal_map_assoc(array(t('George Bush'), t('Adam McGuire'), t('Abraham Lincoln'), t('George Washington'))),
 235         );
 236         break;
 237 
 238       case t('True/False'):
 239         $form['questions_fieldset']['question'] = array(
 240           '#type' => 'radios',
 241           '#title' => t('Was George Washington the first president of the United States?'),
 242           '#options' => array(t('George Washington') => t("True"), 0 => t("False")),
 243           '#description' => t('Click "True" if you think George Washington was the first president of the United States.'),
 244         );
 245         break;
 246 
 247       case t('Fill-in-the-blanks'):
 248         $form['questions_fieldset']['question'] = array(
 249           '#type' => 'textfield',
 250           '#title' => t('Who was the first president of the United States'),
 251           '#description' => t('Please type the correct answer to the question.'),
 252         );
 253         break;
 254     }
 255 
 256     $form['questions_fieldset']['submit'] = array(
 257       '#type' => 'submit',
 258       '#value' => t('Submit your answer'),
 259     );
 260   }
 261   return $form;
 262 }
 263 
 264 /**
 265  * Validation function for ajax_example_dynamic_sections().
 266  */
 267 function ajax_example_dynamic_sections_validate($form, &$form_state) {
 268   $answer = $form_state['values']['question'];
 269   if ($answer !== t('George Washington')) {
 270     form_set_error('question', t('Wrong answer. Try again. (Hint: The right answer is "George Washington".)'));
 271   }
 272 }
 273 
 274 /**
 275  * Submit function for ajax_example_dynamic_sections().
 276  */
 277 function ajax_example_dynamic_sections_submit($form, &$form_state) {
 278   // This is only executed when a button is pressed, not when the AJAXified
 279   // select is changed.
 280   // Now handle the case of the next, previous, and submit buttons.
 281   // Only submit will result in actual submission, all others rebuild.
 282   switch ($form_state['triggering_element']['#value']) {
 283     case t('Submit your answer'): // Submit: We're done.
 284       $form_state['rebuild'] = FALSE;
 285       $answer = $form_state['values']['question'];
 286 
 287       // Special handling for the checkbox.
 288       if ($answer == 1 && $form['questions_fieldset']['question']['#type'] == 'checkbox') {
 289         $answer = $form['questions_fieldset']['question']['#title'];
 290       }
 291       if ($answer === t('George Washington')) {
 292         drupal_set_message(t('You got the right answer: @answer', array('@answer' => $answer)));
 293       }
 294       else {
 295         drupal_set_message(t('Sorry, your answer (@answer) is wrong', array('@answer' => $answer)));
 296       }
 297       $form_state['rebuild'] = FALSE;
 298       return;
 299     // Any other form element will cause rebuild of the form and present
 300     // it again.
 301     case t('Choose'):
 302       $form_state['values']['question_type_select'] =
 303         $form_state['input']['question_type_select'];
 304       // Fall through.
 305     default:
 306       $form_state['rebuild'] = TRUE;
 307   }
 308 }
 309 
 310 /**
 311  * Callback for the select element.
 312  *
 313  * This just selects and returns the questions_fieldset.
 314  */
 315 function ajax_example_dynamic_sections_select_callback($form, $form_state) {
 316   return $form['questions_fieldset'];
 317 }
 318 
 319 
 320 /**
 321  * This example is a classic wizard, where a different and sequential form
 322  * is presented on each step of the form.
 323  *
 324  * In the AJAX version, the form is replaced for each wizard section. In the
 325  * multistep version, it causes a new page load.
 326  *
 327  * @param $form
 328  * @param $form_state
 329  * @param $no_js_use
 330  *   Used for this demonstration only. If true means that the form should be
 331  *   built using a simulated no-javascript approach (ajax.js will not be
 332  *   loaded.)
 333  */
 334 function ajax_example_wizard($form, &$form_state, $no_js_use = FALSE) {
 335 
 336   // Provide a wrapper around the entire form, since we'll replace the whole
 337   // thing with each submit.
 338   $form['#prefix'] = '<div id="wizard-form-wrapper">';
 339   $form['#suffix'] = '</div>';
 340   $form['#tree'] = TRUE; // We want to deal with hierarchical form values.
 341 
 342   $form['description'] = array(
 343     '#markup' => '<div>' . t('This example is a step-by-step wizard. The <a href="!ajax">AJAX version</a> does it without page reloads; the <a href="!multistep">multistep version</a> is the same code but simulates a non-javascript environment, showing it with page reloads.',
 344       array('!ajax' => url('examples/ajax_example/wizard'), '!multistep' => url('examples/ajax_example/wizard_no_js')))
 345     . '</div>',
 346   );
 347 
 348   // $form_state['storage'] has no specific drupal meaning, but it is
 349   // traditional to keep variables for multistep forms there.
 350   $step = empty($form_state['storage']['step']) ? 1 : $form_state['storage']['step'];
 351   $form_state['storage']['step'] = $step;
 352 
 353   switch ($step) {
 354     case 1:
 355       $form['step1'] = array(
 356         '#type' => 'fieldset',
 357         '#title' => t('Step 1: Personal details'),
 358       );
 359       $form['step1']['name'] = array(
 360         '#type' => 'textfield',
 361         '#title' => t('Your name'),
 362         '#default_value' => empty($form_state['values']['step1']['name']) ? '' : $form_state['values']['step1']['name'],
 363         '#required' => TRUE,
 364       );
 365       break;
 366 
 367     case 2:
 368       $form['step2'] = array(
 369         '#type' => 'fieldset',
 370         '#title' => t('Step 2: Street address info'),
 371       );
 372       $form['step2']['address'] = array(
 373         '#type' => 'textfield',
 374         '#title' => t('Your street address'),
 375         '#default_value' => empty($form_state['values']['step2']['address']) ? '' : $form_state['values']['step2']['address'],
 376         '#required' => TRUE,
 377       );
 378       break;
 379 
 380     case 3:
 381       $form['step3'] = array(
 382         '#type' => 'fieldset',
 383         '#title' => t('Step 3: City info'),
 384       );
 385       $form['step3']['city'] = array(
 386         '#type' => 'textfield',
 387         '#title' => t('Your city'),
 388         '#default_value' => empty($form_state['values']['step3']['city']) ? '' : $form_state['values']['step3']['city'],
 389         '#required' => TRUE,
 390       );
 391       break;
 392   }
 393   if ($step == 3) {
 394     $form['submit'] = array(
 395       '#type' => 'submit',
 396       '#value' => t("Submit your information"),
 397     );
 398   }
 399   if ($step < 3) {
 400     $form['next'] = array(
 401       '#type' => 'submit',
 402       '#value' => t('Next step'),
 403       '#ajax' => array(
 404         'wrapper' => 'wizard-form-wrapper',
 405         'callback' => 'ajax_example_wizard_callback',
 406       ),
 407     );
 408   }
 409   if ($step > 1) {
 410     $form['prev'] = array(
 411       '#type' => 'submit',
 412       '#value' => t("Previous step"),
 413 
 414       // Since all info will be discarded, don't validate on 'prev'.
 415       '#limit_validation_errors' => array(),
 416       // #submit is required to use #limit_validation_errors
 417       '#submit' => array('ajax_example_wizard_submit'),
 418       '#ajax' => array(
 419         'wrapper' => 'wizard-form-wrapper',
 420         'callback' => 'ajax_example_wizard_callback',
 421       ),
 422     );
 423   }
 424 
 425   // This simply allows us to demonstrate no-javascript use without
 426   // actually turning off javascript in the browser. Removing the #ajax
 427   // element turns off AJAX behaviors on that element and as a result
 428   // ajax.js doesn't get loaded.
 429   // For demonstration only! You don't need this.
 430   if ($no_js_use) {
 431     // Remove the #ajax from the above, so ajax.js won't be loaded.
 432     // For demonstration only.
 433     unset($form['next']['#ajax']);
 434     unset($form['prev']['#ajax']);
 435   }
 436 
 437   return $form;
 438 }
 439 
 440 function ajax_example_wizard_callback($form, $form_state) {
 441   return $form;
 442 }
 443 
 444 /**
 445  * Submit function for ajax_example_wizard.
 446  *
 447  * In AJAX this is only submitted when the final submit button is clicked,
 448  * but in the non-javascript situation, it is submitted with every
 449  * button click.
 450  */
 451 function ajax_example_wizard_submit($form, &$form_state) {
 452 
 453   // Save away the current information.
 454   $current_step = 'step' . $form_state['storage']['step'];
 455   if (!empty($form_state['values'][$current_step])) {
 456     $form_state['storage']['values'][$current_step] = $form_state['values'][$current_step];
 457   }
 458 
 459   // Increment or decrement the step as needed. Recover values if they exist.
 460   if ($form_state['triggering_element']['#value'] == t('Next step')) {
 461     $form_state['storage']['step']++;
 462     // If values have already been entered for this step, recover them from
 463     // $form_state['storage'] to pre-populate them.
 464     $step_name = 'step' . $form_state['storage']['step'];
 465     if (!empty($form_state['storage']['values'][$step_name])) {
 466       $form_state['values'][$step_name] = $form_state['storage']['values'][$step_name];
 467     }
 468   }
 469   if ($form_state['triggering_element']['#value'] == t('Previous step')) {
 470     $form_state['storage']['step']--;
 471     // Recover our values from $form_state['storage'] to pre-populate them.
 472     $step_name = 'step' . $form_state['storage']['step'];
 473     $form_state['values'][$step_name] = $form_state['storage']['values'][$step_name];
 474   }
 475 
 476   // If they're done, submit.
 477   if ($form_state['triggering_element']['#value'] == t('Submit your information')) {
 478     $value_message = t('Your information has been submitted:') . ' ';
 479     foreach ($form_state['storage']['values'] as $step => $values) {
 480       $value_message .= "$step: ";
 481       foreach ($values as $key => $value) {
 482         $value_message .= "$key=$value, ";
 483       }
 484     }
 485     drupal_set_message($value_message);
 486     $form_state['rebuild'] = FALSE;
 487     return;
 488   }
 489 
 490   // Otherwise, we still have work to do.
 491   $form_state['rebuild'] = TRUE;
 492 }
 493 
 494 
 495 /**
 496  * This example shows a button to "add more" - add another textfield, and
 497  * the corresponding "remove" button.
 498  *
 499  * It works equivalently with javascript or not, and does the same basic steps
 500  * either way.
 501  *
 502  * The basic idea is that we build the form based on the setting of
 503  * $form_state['num_names']. The custom submit functions for the "add-one"
 504  * and "remove-one" buttons increment and decrement $form_state['num_names']
 505  * and then force a rebuild of the form.
 506  *
 507  * The $no_js_use argument is simply for demonstration: When set, it prevents
 508  * '#ajax' from being set, thus making the example behave as if javascript
 509  * were disabled in the browser.
 510  */
 511 function ajax_example_add_more($form, &$form_state, $no_js_use = FALSE) {
 512   $form['description'] = array(
 513     '#markup' => '<div>' . t('This example shows an add-more and a remove-last button. The <a href="!ajax">AJAX version</a> does it without page reloads; the <a href="!multistep">non-js version</a> is the same code but simulates a non-javascript environment, showing it with page reloads.',
 514       array('!ajax' => url('examples/ajax_example/add_more'), '!multistep' => url('examples/ajax_example/add_more_no_js')))
 515     . '</div>',
 516   );
 517 
 518   // Because we have many fields with the same values, we have to set
 519   // #tree to be able to access them.
 520   $form['#tree'] = TRUE;
 521   $form['names_fieldset'] = array(
 522     '#type' => 'fieldset',
 523     '#title' => t('People coming to the picnic'),
 524     // Set up the wrapper so that AJAX will be able to replace the fieldset.
 525     '#prefix' => '<div id="names-fieldset-wrapper">',
 526     '#suffix' => '</div>',
 527   );
 528 
 529   // Build the fieldset with the proper number of names. We'll use
 530   // $form_state['num_names'] to determine the number of textfields to build.
 531   if (empty($form_state['num_names'])) {
 532     $form_state['num_names'] = 1;
 533   }
 534   for ($i = 0; $i < $form_state['num_names']; $i++) {
 535     $form['names_fieldset']['name'][$i] = array(
 536       '#type' => 'textfield',
 537       '#title' => t('Name'),
 538     );
 539   }
 540   $form['names_fieldset']['add_name'] = array(
 541     '#type' => 'submit',
 542     '#value' => t('Add one more'),
 543     '#submit' => array('ajax_example_add_more_add_one'),
 544     // See the examples in ajax_example.module for more details on the
 545     // properties of #ajax.
 546     '#ajax' => array(
 547       'callback' => 'ajax_example_add_more_callback',
 548       'wrapper' => 'names-fieldset-wrapper',
 549     ),
 550   );
 551   if ($form_state['num_names'] > 1) {
 552     $form['names_fieldset']['remove_name'] = array(
 553       '#type' => 'submit',
 554       '#value' => t('Remove one'),
 555       '#submit' => array('ajax_example_add_more_remove_one'),
 556       '#ajax' => array(
 557         'callback' => 'ajax_example_add_more_callback',
 558         'wrapper' => 'names-fieldset-wrapper',
 559       ),
 560     );
 561   }
 562   $form['submit'] = array(
 563     '#type' => 'submit',
 564     '#value' => t('Submit'),
 565   );
 566 
 567   // This simply allows us to demonstrate no-javascript use without
 568   // actually turning off javascript in the browser. Removing the #ajax
 569   // element turns off AJAX behaviors on that element and as a result
 570   // ajax.js doesn't get loaded.
 571   // For demonstration only! You don't need this.
 572   if ($no_js_use) {
 573     // Remove the #ajax from the above, so ajax.js won't be loaded.
 574     if (!empty($form['names_fieldset']['remove_name']['#ajax'])) {
 575       unset($form['names_fieldset']['remove_name']['#ajax']);
 576     }
 577     unset($form['names_fieldset']['add_name']['#ajax']);
 578   }
 579 
 580   return $form;
 581 }
 582 
 583 /**
 584  * Callback for both ajax-enabled buttons.
 585  *
 586  * Selects and returns the fieldset with the names in it.
 587  */
 588 function ajax_example_add_more_callback($form, $form_state) {
 589   return $form['names_fieldset'];
 590 }
 591 
 592 /**
 593  * Submit handler for the "add-one-more" button.
 594  *
 595  * Increments the max counter and causes a rebuild.
 596  */
 597 function ajax_example_add_more_add_one($form, &$form_state) {
 598   $form_state['num_names']++;
 599   $form_state['rebuild'] = TRUE;
 600 }
 601 
 602 /**
 603  * Submit handler for the "remove one" button.
 604  *
 605  * Decrements the max counter and causes a form rebuild.
 606  */
 607 function ajax_example_add_more_remove_one($form, &$form_state) {
 608   if ($form_state['num_names'] > 1) {
 609     $form_state['num_names']--;
 610   }
 611   $form_state['rebuild'] = TRUE;
 612 }
 613 
 614 /**
 615  * Final submit handler.
 616  *
 617  * Reports what values were finally set.
 618  */
 619 function ajax_example_add_more_submit($form, &$form_state) {
 620   $output = t('These people are coming to the picnic: @names',
 621     array('@names' => implode(', ', $form_state['values']['names_fieldset']['name'])) );
 622   drupal_set_message($output);
 623 }
 624 /**
 625  * @} End of "defgroup ajax_degradation_example".
 626  */
";i:1;N;i:2;N;}i:2;i:65773;}i:39;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:92873;}i:40;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"ajax_example_misc.inc";i:1;i:2;i:2;i:92873;}i:2;i:92873;}i:41;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:92873;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4757:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * AJAX Miscellaneous Topics.
   6  */
   7 
   8 /**
   9  * Demonstrates a clickable AJAX-enabled link using the 'use-ajax' class.
  10  *
  11  * Because of the 'use-ajax' class applied here, the link submission is done
  12  * without a page refresh.
  13  *
  14  * When using the AJAX framework outside the context of a form or a renderable
  15  * array of type 'link', you have to include ajax.js explicitly.
  16  *
  17  * @return
  18  *
  19  * @ingroup ajax_example
  20  */
  21 function ajax_example_render_link() {
  22   // drupal_add_library is invoked automatically when a form element has the
  23   // '#ajax' property, but since we are not rendering a form here, we have to
  24   // do it ourselves.
  25   drupal_add_library('system', 'drupal.ajax');
  26   $explanation = "
  27 The link below has the <i>use-ajax</i> class applied to it, so if
  28 javascript is enabled, ajax.js will try to submit it via an AJAX call instead
  29 of a normal page load. The URL also contains the '/nojs/' magic string, which
  30 is stripped if javascript is enabled, allowing the server code to tell by the
  31 URL whether JS was enabled or not, letting it do different things based on that.";
  32   $output = "<div>" . t($explanation) . "</div>";
  33   // The use-ajax class is special, so that the link will call without causing
  34   // a page reload. Note the /nojs portion of the path - if javascript is
  35   // enabled, this part will be stripped from the path before it is called.
  36   $link = l(t('Click here'), 'ajax_link_callback/nojs/', array('attributes' => array('class' => array('use-ajax'))));
  37   $output .= "<div id='myDiv'></div><div>$link</div>";
  38   return $output;
  39 }
  40 
  41 /**
  42  * Demonstrates a clickable AJAX-enabled link using a renderable array with the
  43  * #ajax property.
  44  *
  45  * A link that is constructed as a renderable array can have the #ajax property,
  46  * which ensures that the link submission is done without a page refresh. The
  47  * href of the link is used as the ajax callback, but it degrades gracefully
  48  * without JavaScript because if the 'nojs' portion of the href is not stripped
  49  * out by js, the callback will return content as required for a full page
  50  * reload.
  51  *
  52  * The necessary JavaScript file, ajax.js, will be included on the page
  53  * automatically.
  54  *
  55  * @return
  56  */
  57 function ajax_example_render_link_ra() {
  58   $explanation = "
  59 The link below has been rendered as an element with the #ajax property, so if
  60 javascript is enabled, ajax.js will try to submit it via an AJAX call instead
  61 of a normal page load. The URL also contains the '/nojs/' magic string, which
  62 is stripped if javascript is enabled, allowing the server code to tell by the
  63 URL whether JS was enabled or not, letting it do different things based on that.";
  64   $build['my_div'] = array(
  65     '#markup' => $explanation . '<div id="myDiv"></div>',
  66   );
  67   $build['ajax_link'] = array(
  68     '#type' => 'link',
  69     '#title' => t('Click here'),
  70     // Note the /nojs portion of the href - if javascript is enabled,
  71     // this part will be stripped from the path before it is called.
  72     '#href' => 'ajax_link_callback/nojs/',
  73     '#id' => 'ajax_link',
  74     '#ajax' => array(
  75       'wrapper' => 'myDiv',
  76       'method' => 'html',
  77     ),
  78   );
  79   return $build;
  80 }
  81 
  82 /**
  83  * Callback for link example.
  84  *
  85  * Takes different logic paths based on whether Javascript was enabled.
  86  * If $type == 'ajax', it tells this function that ajax.js has rewritten
  87  * the URL and thus we are doing an AJAX and can return an array of commands.
  88  *
  89  * @param $type
  90  *   Either 'ajax' or 'nojs. Type is simply the normal URL argument to this URL.
  91  *
  92  * @return
  93  *   If $type == 'ajax', returns an array of AJAX Commands.
  94  *   Otherwise, just returns the content, which will end up being a page.
  95  *
  96  * @ingroup ajax_example
  97  */
  98 function ajax_link_response($type = 'ajax') {
  99   if ($type == 'ajax') {
 100     $output = t("This is some content delivered via AJAX");
 101     $commands = array();
 102     // See ajax_example_advanced.inc for more details on the available commands
 103     // and how to use them.
 104     $commands[] = ajax_command_append('#myDiv', $output);
 105     $page = array('#type' => 'ajax', '#commands' => $commands);
 106     ajax_deliver($page);
 107   }
 108   else {
 109     $output = t("This is some content delivered via a page load.");
 110     return $output;
 111   }
 112 }
";i:1;N;i:2;N;}i:2;i:92913;}i:43;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:97679;}i:44;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"ajax_example_node_form_alter.inc";i:1;i:2;i:2;i:97679;}i:2;i:97679;}i:45;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:97679;}i:46;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5377:"
   1 <?php
   2 /**
   3  * @file
   4  * This example shows how to use AJAX when altering a node form.
   5  *
   6  * It maintains a table parallel to the node table containing attributes
   7  * 'example_1' and 'example_2' which are displayed on the node form.
   8  * 'example_2' is displayed dynamically when example_1 is checked.
   9  */
  10 
  11 /**
  12  * Implements hook_form_FORM_ID_alter() for the node form.
  13  *
  14  * Adds two fields to the node form, second only appears after first is enabled.
  15  */
  16 function ajax_example_form_node_form_alter(&$form, &$form_state, $form_id) {
  17   $node = $form['#node'];
  18   $form['ajax_example_1'] = array(
  19     '#type' => 'checkbox',
  20     '#title' => t('AJAX Example 1'),
  21     '#description' => t('Enable to show second field.'),
  22     '#default_value' => $node->ajax_example['example_1'],
  23     '#ajax' => array(
  24       'callback' => 'ajax_example_form_node_callback',
  25       'wrapper' => 'ajax-example-form-node',
  26       'effect' => 'fade',
  27     )
  28   );
  29   $form['container'] = array(
  30     '#prefix' => '<div id="ajax-example-form-node">',
  31     '#suffix' => '</div>',
  32   );
  33 
  34   // If the state values exist and 'ajax_example_1' state value is 1 or
  35   // if the state values don't exist and 'example1' variable is 1 then
  36   // display the ajax_example_2 field.
  37   if (!empty($form_state['values']['ajax_example_1']) && $form_state['values']['ajax_example_1'] == 1
  38       || empty($form_state['values']) && $node->ajax_example['example_1']) {
  39 
  40     $form['container']['ajax_example_2'] = array(
  41       '#type' => 'textfield',
  42       '#title' => t('AJAX Example 2'),
  43       '#description' => t('AJAX Example 2'),
  44       '#default_value' => empty($form_state['values']['ajax_example_2']) ?
  45                           $node->ajax_example['example_2'] :
  46                           $form_state['values']['ajax_example_2'],
  47     );
  48   }
  49 }
  50 
  51 /**
  52  * Returns changed part of the form.
  53  *
  54  * @return renderable array
  55  *
  56  * @see ajax_example_form_node_form_alter()
  57  */
  58 function ajax_example_form_node_callback($form, $form_state) {
  59   return $form['container'];
  60 }
  61 
  62 /**
  63  * Implements hook_node_submit().
  64  * @see ajax_example_form_node_form_alter()
  65  */
  66 function ajax_example_node_submit($node, $form, &$form_state) {
  67   $values = $form_state['values'];
  68   // Move the new data into the node object.
  69   $node->ajax_example['example_1'] = $values['ajax_example_1'];
  70   // Depending on the state of ajax_example_1; it may not exist.
  71   $node->ajax_example['example_2'] = isset($values['ajax_example_2']) ? $values['ajax_example_2'] : '';
  72 }
  73 
  74 /**
  75  * Implements hook_node_prepare().
  76  *
  77  * @see ajax_example_form_node_form_alter()
  78  */
  79 function ajax_example_node_prepare($node) {
  80   if (empty($node->ajax_example)) {
  81     // Set default values, since this only runs when adding a new node.
  82     $node->ajax_example['example_1'] = 0;
  83     $node->ajax_example['example_2'] = '';
  84   }
  85 }
  86 
  87 /**
  88  * Implements hook_node_load().
  89  *
  90  * @see ajax_example_form_node_form_alter()
  91  */
  92 function ajax_example_node_load($nodes, $types) {
  93   $result = db_query('SELECT * FROM {ajax_example_node_form_alter} WHERE nid IN(:nids)', array(':nids' => array_keys($nodes)))->fetchAllAssoc('nid');
  94 
  95   foreach ($nodes as &$node) {
  96     $node->ajax_example['example_1'] =
  97       isset($result[$node->nid]->example_1) ?
  98       $result[$node->nid]->example_1 : 0;
  99     $node->ajax_example['example_2'] =
 100       isset($result[$node->nid]->example_2) ?
 101       $result[$node->nid]->example_2 : '';
 102   }
 103 }
 104 
 105 /**
 106  * Implements hook_node_insert().
 107  *
 108  * @see ajax_example_form_node_form_alter()
 109  */
 110 function ajax_example_node_insert($node) {
 111   if (isset($node->ajax_example)) {
 112     db_insert('ajax_example_node_form_alter')
 113       ->fields(array(
 114         'nid' => $node->nid,
 115         'example_1' => $node->ajax_example['example_1'],
 116         'example_2' => $node->ajax_example['example_2'],
 117       ))
 118       ->execute();
 119   }
 120 }
 121 
 122 /**
 123  * Implements hook_node_update().
 124  * @see ajax_example_form_node_form_alter()
 125  */
 126 function ajax_example_node_update($node) {
 127   if (db_select('ajax_example_node_form_alter', 'a')->fields('a')->condition('nid', $node->nid, '=')->execute()->fetchAssoc()) {
 128     db_update('ajax_example_node_form_alter')
 129       ->fields(array(
 130         'example_1' => $node->ajax_example['example_1'],
 131         'example_2' => $node->ajax_example['example_2'],
 132       ))
 133       ->condition('nid', $node->nid)
 134       ->execute();
 135   }
 136   else {
 137     // Cleaner than doing it again.
 138     ajax_example_node_insert($node);
 139   }
 140 }
 141 
 142 /**
 143  * Implements hook_node_delete().
 144  * @see ajax_example_form_node_form_alter()
 145  */
 146 function ajax_example_node_delete($node) {
 147   db_delete('ajax_example_node_form_alter')
 148     ->condition('nid', $node->nid)
 149     ->execute();
 150 }
";i:1;N;i:2;N;}i:2;i:97729;}i:47;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:103114;}i:48;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:103114;}}