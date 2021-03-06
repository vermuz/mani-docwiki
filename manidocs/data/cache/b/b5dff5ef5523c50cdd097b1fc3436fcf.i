a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Theming Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"theming-example-text-form.tpl.php";i:1;i:2;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:32;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1135:"
   1 <?php
   2 /**
   3  * @file
   4  * Template file for the theming example text form.
   5  *
   6  * Available custom variables:
   7  * - $text_form: A string containing the pre-rendered form.
   8  * - $text_form_content: An array of form elements keyed by the element name.
   9  *
  10  * The default example below renders the entire form and its form elements in
  11  * a default order provided by Drupal.
  12  *
  13  * Alternatively, you may print each form element in the order you desire,
  14  * adding any extra html markup you wish to decorate the form like this:
  15  *
  16  * <?php print $text_form_content['element_name']; ?>
  17  *
  18  * The following snippet will print the contents of the $text_form_content
  19  * array, hidden in the source of the page, for you to discover the individual
  20  * element names.
  21  *
  22  * <?php print '<!--' . print_r($text_form_content, TRUE) . '-->'; ?>
  23  *
  24  */
  25 ?>
  26 <!-- theming-example-text-form template -->
  27 <div class="container-inline">
  28 <?php  print $text_form; ?>
  29 </div>
  30 <!-- /theming-example-text-form template -->
";i:1;N;i:2;N;}i:2;i:83;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1227;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"theming_example.css";i:1;i:2;i:2;i:1227;}i:2;i:1227;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1227;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:334:"
   1 /*
   2  * style the list
   3  * for OL you can have
   4  * decimal | lower-roman | upper-roman | lower-alpha | upper-alpha
   5  * for UL you can have
   6  * disc | circle | square or an image eg url(x.png)
   7  * you can also have 'none'
   8  */
   9 ol.theming-example-list {
  10   list-style-type: upper-alpha;
  11 }
";i:1;N;i:2;N;}i:2;i:1264;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1607;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"theming_example.info";i:1;i:2;i:2;i:1607;}i:2;i:1607;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1607;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:177:"
   1 name = Theming example
   2 description = An example module showing how to use theming.
   3 package = Example modules
   4 core = 7.x
   5 files[] = theming_example.test
";i:1;N;i:2;N;}i:2;i:1645;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1831;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"theming_example.module";i:1;i:2;i:2;i:1831;}i:2;i:1831;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1831;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:14770:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Explains how a module declares theme functions, preprocess functions, and
   6  * templates.
   7  *
   8  * The underlying approach is that a module should allow themes to do all
   9  * rendering, but provide default implementations where appropriate.
  10  *
  11  * Modules are also expected to leave data as render arrays as long as possible,
  12  * leaving rendering to theme functions and templates.
  13  */
  14 
  15 /**
  16  * @defgroup theming_example Example: Theming
  17  * @ingroup examples
  18  * @{
  19  * Example of Drupal theming.
  20  *
  21  * The theming_example module attempts to show how module developers can add
  22  * theme functions to their projects so that themes can modify output.
  23  *
  24  * Module developers should to strive to avoid hard-wiring any HTML into the
  25  * output of their code, this should all be done in theme functions.
  26  *
  27  * Starting with the first example, function 'theming_example_page()':
  28  * the output is put into an array $content which is then fed to a theming
  29  * function 'theme_theming_example_page()' which loops over the content,
  30  * wrapping it in html in the process.
  31  *
  32  * In order to get function 'theme_theming_example_page()' recognized it needs
  33  * to be registered with the module theme register function of the
  34  * type 'hook_theme'.
  35  *
  36  * function 'theming_example_theme()' does this for this module.
  37  * for details of what can be done in this hook see the link to api.drupal.org
  38  *
  39  * The functions 'theming_example_list_page()' and theming_example_order_form()
  40  * work in the same way.
  41  *
  42  * In 'theme_theming_example_list_page()' the content is themed as an
  43  * ordered list and given a class attribute 'theming_example_mylist' which
  44  * is defined in theming_example.css
  45  *
  46  * In function 'theme_theming_example_order_form()' the title is loaded into a
  47  * temporary variable '$title', deleted from the $form array and output
  48  * wrapped in html. The rest of the form is wrapped in a div using '#prefix'
  49  * and '#suffix'
  50  *
  51  * The theming functions can be copied to a theme's template.php, renaming
  52  * appropriately, so if you theme is called 'mytheme' you would copy
  53  * function 'theme_theming_example_page()'
  54  * to
  55  * function 'mytheme_theming_example_page()' in template.php and it will be
  56  * used instead of the original.
  57  *
  58  * The fourth example shows the use of a template file
  59  * 'theming_example_text_form.tpl.php'
  60  * This file can be copied to a theme's folder and it will be used instead.
  61  *
  62  * This example also shows what can be done using Drupal's
  63  * template_preprocess_HOOK method. In this case it modifies the output so
  64  * that a themer can output the whole form or gain control over some of its
  65  * parts in the template file.
  66  */
  67 
  68 /**
  69  * Implements hook_menu().
  70  *
  71  * The @link menu_example.module Menu Example @endlink provides extensive
  72  * examples for hook_menu().
  73  */
  74 function theming_example_menu() {
  75   $items['examples/theming_example'] = array(
  76     'title' => 'Theming Example',
  77     'description' => 'Some theming examples.',
  78     'page callback' => 'theming_example_page',
  79     'access callback' => TRUE,
  80     'access arguments' => array('access content'),
  81   );
  82   $items['examples/theming_example/theming_example_list_page'] = array(
  83     'title' => 'Theming a list',
  84     'page callback' => 'theming_example_list_page',
  85     'access arguments' => array('access content'),
  86     'weight' => 1,
  87   );
  88   $items['examples/theming_example/theming_example_select_form'] = array(
  89     'title' => 'Theming a form (select form)',
  90     'page callback'    => 'drupal_get_form',
  91     'page arguments'   => array('theming_example_select_form'),
  92     'access arguments' => array('access content'),
  93     'weight' => 2,
  94   );
  95   $items['examples/theming_example/theming_example_text_form'] = array(
  96     'title' => 'Theming a form (text form)',
  97     'page callback'    => 'drupal_get_form',
  98     'page arguments'   => array('theming_example_text_form'),
  99     'access arguments' => array('access content'),
 100     'weight' => 3,
 101   );
 102 
 103   return $items;
 104 
 105 }
 106 
 107 /**
 108  * Implements hook_theme().
 109  *
 110  * Defines the theming capabilities provided by this module.
 111  */
 112 function theming_example_theme() {
 113   return array(
 114     'theming_example_content_array' => array(
 115       // We use 'render element' when the item to be passed is a self-describing
 116       // render array (it will have #theme_wrappers)
 117       'render element' => 'element',
 118     ),
 119     'theming_example_list' => array(
 120       // We use 'variables' when the item to be passed is an array whose
 121       // structure must be described here.
 122       'variables' => array(
 123         'title' => NULL,
 124         'items' => NULL,
 125       ),
 126     ),
 127     'theming_example_select_form'  => array(
 128       'render element' => 'form',
 129     ),
 130     'theming_example_text_form'  => array(
 131       'render element' => 'form',
 132       // In this one the rendering will be done by a template file
 133       // (theming-example-text-form.tpl.php) instead of being rendered by a
 134       // function. Note the use of dashes to separate words in place of
 135       // underscores. The template file's extension is also left out so that
 136       // it may be determined automatically depending on the template engine
 137       // the site is using.
 138       'template' => 'theming-example-text-form',
 139     ),
 140   );
 141 }
 142 /**
 143  * Initial landing page explaining the use of the module.
 144  *
 145  * We create a render array and specify the theme to be used through the use
 146  * of #theme_wrappers. With all output, we aim to leave the content as a
 147  * render array just as long as possible, so that other modules (or the theme)
 148  * can alter it.
 149  *
 150  * @see render_example.module
 151  * @see form_example_elements.inc
 152  */
 153 function theming_example_page() {
 154   $content[] = t('Some examples of pages and forms that are run through theme functions.');
 155   $content[] = l(t('Simple page with a list'), 'examples/theming_example/theming_example_list_page');
 156   $content[] = l(t('Simple form 1'), 'examples/theming_example/theming_example_select_form');
 157   $content[] = l(t('Simple form 2'), 'examples/theming_example/theming_example_text_form');
 158   $content['#theme_wrappers'] = array('theming_example_content_array');
 159   return $content;
 160 }
 161 
 162 /**
 163  * An example page where the output is supplied as an array which
 164  * is themed into a list and styled with css.
 165  *
 166  * In this case we'll use the core-provided theme_item_list as a #theme_wrapper.
 167  * Any theme need only override theme_item_list to change the behavior.
 168  */
 169 function theming_example_list_page() {
 170   $items = array(
 171     t('First item'),
 172     t('Second item'),
 173     t('Third item'),
 174     t('Fourth item'),
 175   );
 176 
 177   // First we'll create a render array that simply uses theme_item_list.
 178   $title = t("A list returned to be rendered using theme('item_list')");
 179   $build['render_version'] = array(
 180     // We use #theme here instead of #theme_wrappers because theme_item_list()
 181     // is the classic type of theme function that does not just assume a
 182     // render array, but instead has its own properties (#type, #title, #items).
 183     '#theme' => 'item_list',
 184     // '#type' => 'ul',  // The default type is 'ul'
 185     // We can easily make sure that a css or js file is present using #attached.
 186     '#attached' => array('css' => array(drupal_get_path('module', 'theming_example') . '/theming_example.css')),
 187     '#title' => $title,
 188     '#items' => $items,
 189     '#attributes' => array('class' => array('render-version-list'))
 190   );
 191 
 192   // Now we'll create a render array which uses our own list formatter,
 193   // theme('theming_example_list').
 194   $title = t("The same list rendered by theme('theming_example_list')");
 195   $build['our_theme_function'] = array(
 196     '#theme' => 'theming_example_list',
 197     '#attached' => array('css' => array(drupal_get_path('module', 'theming_example') . '/theming_example.css')),
 198     '#title' => $title,
 199     '#items' => $items,
 200   );
 201   return $build;
 202 }
 203 
 204 
 205 /**
 206  * A simple form that displays a select box and submit button.
 207  *
 208  * This form will be be themed by the 'theming_example_select_form' theme
 209  * handler.
 210  */
 211 function theming_example_select_form($form, &$form_state) {
 212   $options = array(
 213     'newest_first' => t('Newest first'),
 214     'newest_last' => t('Newest last'),
 215     'edited_first' => t('Edited first'),
 216     'edited_last' => t('Edited last'),
 217     'by_name' => t('By name'),
 218   );
 219   $form['choice'] = array(
 220     '#type' => 'select',
 221     '#options' => $options,
 222     '#title' => t('Choose which ordering you want'),
 223   );
 224   $form['submit'] = array(
 225     '#type' => 'submit',
 226     '#value' => t('Go'),
 227   );
 228   return $form;
 229 }
 230 function theming_example_select_form_submit($form, &$form_state) {
 231   drupal_set_message(t('You chose %input', array('%input' => $form_state['values']['choice'])));
 232 }
 233 
 234 /**
 235  * A simple form that displays a textfield and submit button.
 236  *
 237  * This form will be rendered by theme('form') (theme_form() by default)
 238  * because we do not provide a theme function for it here.
 239  */
 240 function theming_example_text_form($form, &$form_state) {
 241   $form['text'] = array(
 242     '#type' => 'textfield',
 243     '#title' => t('Please input something!'),
 244     '#required' => TRUE,
 245   );
 246   $form['submit'] = array(
 247     '#type' => 'submit',
 248     '#value' => t('Go'),
 249   );
 250   return $form;
 251 }
 252 function theming_example_text_form_submit($form, &$form_state) {
 253   drupal_set_message(t('You entered %input', array('%input' => $form_state['values']['text'])));
 254 }
 255 
 256 
 257 /**
 258  * Theme a simple content array.
 259  *
 260  * This theme function uses the newer recommended format where a single
 261  * render array is provided to the theme function.
 262  */
 263 function theme_theming_example_content_array($variables) {
 264   $element = $variables['element'];
 265   $output = '';
 266   foreach (element_children($element) AS $count) {
 267     if (! $count) {
 268       // The first paragraph is bolded.
 269       $output .= '<p><strong>' . $element[$count] . '</strong></p>';
 270     }
 271     else {
 272       // Following paragraphs are just output as routine paragraphs.
 273       $output .= '<p>' . $element[$count] . '</p>';
 274     }
 275   }
 276   return $output;
 277 }
 278 
 279 /**
 280  * Theming a simple list.
 281  *
 282  * This is just a simple wrapper around theme('item_list') but it's worth
 283  * showing how a custom theme function can be implemented.
 284  *
 285  * @see theme_item_list()
 286  */
 287 function theme_theming_example_list($variables) {
 288   $title = $variables['title'];
 289   $items = $variables['items'];
 290 
 291   // Add the title to the list theme and
 292   // state the list type. This defaults to 'ul'.
 293   // Add a css class so that you can modify the list styling.
 294   // We'll just call theme('item_list') to render.
 295 
 296   $variables = array(
 297     'items' => $items,
 298     'title' => $title,
 299     'type' => 'ol',
 300     'attributes' => array('class' => 'theming-example-list'),
 301   );
 302   $output = theme('item_list', $variables);
 303   return $output;
 304 }
 305 
 306 /**
 307  * Theming a simple form.
 308  *
 309  * Since our form is named theming_example_select_form(), the default
 310  * #theme function applied to is will be 'theming_example_select_form'
 311  * if it exists. The form could also have specified a different
 312  * #theme.
 313  *
 314  * Here we collect the title, theme it manually and
 315  * empty the form title. We also wrap the form in a div.
 316  */
 317 function theme_theming_example_select_form($variables) {
 318   $form = $variables['form'];
 319   $title = $form['choice']['#title'];
 320   $form['choice']['#title'] = '';
 321   $output = '<strong>' . $title . '</strong>';
 322   $form['choice']['#prefix'] = '<div class="container-inline">';
 323   $form['submit']['#suffix'] = '</div>';
 324   $output .= drupal_render_children($form);
 325   return $output;
 326 }
 327 
 328 /**
 329  * Implements template_preprocess() to prepare variables for use inside the
 330  * theming-example-text-form.tpl.php template file.
 331  *
 332  * In this example, we create a couple new variables, 'text_form' and
 333  * 'text_form_content', that clean up the form output.  Drupal will turn the
 334  * array keys in the $variables array into variables for use in the template.
 335  *
 336  * So $variables['text_form'] becomes available as $text_form in the template.
 337  *
 338  * @see theming-example-text-form.tpl.php
 339  */
 340 function template_preprocess_theming_example_text_form(&$variables) {
 341   $variables['text_form_content'] = array();
 342   $text_form_hidden = array();
 343 
 344   // Each form element is rendered and saved as a key in $text_form_content, to
 345   // give the themer the power to print each element independently in the
 346   // template file.  Hidden form elements have no value in the theme, so they
 347   // are grouped into a single element.
 348   foreach (element_children($variables['form']) as $key) {
 349     $type = $variables['form'][$key]['#type'];
 350     if ($type == 'hidden' || $type == 'token') {
 351       $text_form_hidden[] = drupal_render($variables['form'][$key]);
 352     }
 353     else {
 354       $variables['text_form_content'][$key] = drupal_render($variables['form'][$key]);
 355     }
 356   }
 357   $variables['text_form_content']['hidden'] = implode($text_form_hidden);
 358 
 359   // The entire form is then saved in the $text_form variable, to make it easy
 360   // for the themer to print the whole form.
 361   $variables['text_form'] = implode($variables['text_form_content']);
 362 }
 363 /**
 364  * @} End of "defgroup theming_example".
 365  */
";i:1;N;i:2;N;}i:2;i:1871;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16650;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"theming_example.test";i:1;i:2;i:2;i:16650;}i:2;i:16650;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:16650;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2524:"
   1 <?php
   2 /**
   3  * @file
   4  * Simpletest case for theming_example module.
   5  */
   6 
   7 /**
   8  * Functional tests for the theming example module.
   9  *
  10  * @ingroup theming_example
  11  */
  12 class ThemingExampleTestCase extends DrupalWebTestCase {
  13 
  14   public static function getInfo() {
  15     return array(
  16       'name' => 'Theming Example',
  17       'description' => 'Verify theming example functionality',
  18       'group' => 'Examples',
  19     );
  20   }
  21 
  22   function setUp() {
  23     // Enable the module.
  24     parent::setUp('theming_example');
  25   }
  26 
  27   /**
  28    * Verify the functionality of the example module.
  29    */
  30   function testThemingPage() {
  31     // no need to login for this test
  32     // Check that the main page has been themed (first line with <b>) and has content.
  33     $this->drupalGet('examples/theming_example');
  34     $this->assertRaw('<strong>Some examples of pages');
  35     $this->assertRaw('examples/theming_example/theming_example_select_form">Simple form 1</a>');
  36 
  37     // Visit the list demonstration page and check that css gets loaded
  38     // and do some spot checks on how the two lists were themed.
  39     $this->drupalGet('examples/theming_example/theming_example_list_page');
  40     $this->assertPattern('/@import.*theming_example.css/');
  41     $first_ul = $this->xpath('//ul[contains(@class,"render-version-list")]');
  42     $this->assertTrue($first_ul[0]->li[0] == 'First item');
  43     $second_ul = $this->xpath('//ol[contains(@class,"theming-example-list")]');
  44     $this->assertTrue($second_ul[0]->li[1] == 'Second item');
  45 
  46     // Visit the select form page to do spot checks.
  47     $this->drupalGet('examples/theming_example/theming_example_select_form');
  48     // We did explicit theming to accomplish the below...
  49     $this->assertRaw('<strong>Choose which ordering you want</strong>');
  50     $this->assertRaw('<div class="container-inline"><div class="form-item form-type-select form-item-choice">');
  51     $this->assertNoPattern('/@import.*theming_example.css/');
  52 
  53     // Visit the text form page and do spot checks.
  54     $this->drupalGet('examples/theming_example/theming_example_text_form');
  55     $this->assertText('Please input something!');
  56     $this->assertPattern('%</div>\s*<input +type="submit"%');   // If it were themed normally there would be a div wrapper here
  57   }
  58 }
";i:1;N;i:2;N;}i:2;i:16688;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:19220;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:19220;}}