a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Contextual Links Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:41;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"contextual-links-example-object.tpl.php";i:1;i:2;i:2;i:41;}i:2;i:41;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:41;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1757:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Default theme implementation to display a sample object with contextual links.
   6  *
   7  * Available variables:
   8  * - $title: The sanitized title of the object.
   9  * - $content: The sanitized content of the object.
  10  * These are defined in template_preprocess_contextual_links_example_object()
  11  * and represent whichever variables you might actually use to display the
  12  * main content of your module's object.
  13  *
  14  * Standard variables (required for contextual links):
  15  * - $classes: String of classes that can be used to style contextually through
  16  *   CSS.
  17  * - $title_prefix (array): An array containing additional output populated by
  18  *   modules, intended to be displayed in front of the main title tag that
  19  *   appears in the template.
  20  * - $title_suffix (array): An array containing additional output populated by
  21  *   modules, intended to be displayed after the main title tag that appears in
  22  *   the template.
  23  * The above variables are a subset of those which Drupal provides to all
  24  * templates, and they must be printed in your template file in order for
  25  * contextual links to be properly attached. For example, the core Contextual
  26  * Links module adds the renderable contextual links themselves inside
  27  * $title_suffix, so they will appear immediately after the object's title in
  28  * the HTML. (This placement is for accessibility reasons, among others.)
  29  */
  30 ?>
  31 <div class="<?php print $classes; ?>">
  32   <?php print render($title_prefix); ?>
  33   <h2><?php print $title; ?></h2>
  34   <?php print render($title_suffix); ?>
  35   <?php print $content; ?>
  36 </div>
";i:1;N;i:2;N;}i:2;i:98;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1864;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"contextual_links_example.info";i:1;i:2;i:2;i:1864;}i:2;i:1864;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1864;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:225:"
   1 name = Contextual links example
   2 description = Demonstrates how to use contextual links for enhancing the user experience.
   3 package = Example modules
   4 core = 7.x
   5 files[] = contextual_links_example.test
";i:1;N;i:2;N;}i:2;i:1911;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2145;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"contextual_links_example.module";i:1;i:2;i:2;i:2145;}i:2;i:2145;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2145;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17861:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Shows how to use Drupal's contextual links functionality.
   6  *
   7  * @see http://drupal.org/node/1089922
   8  */
   9 
  10 /**
  11  * @defgroup contextual_links_example Example: Contextual Links
  12  * @ingroup examples
  13  * @{
  14  * Example of implementing contextual links.
  15  */
  16 
  17 /**
  18  * Implements hook_menu().
  19  *
  20  * Drupal's menu system allows you to indicate that particular menu items
  21  * should be displayed as contextual links. If you hover over a block or node
  22  * while logged in as an administrator (and with the Contextual Links module
  23  * enabled) you'll see a small gear icon appear. Click on this icon, and the
  24  * list of items that appears in the exposed menu are what Drupal calls
  25  * "contextual links".
  26  *
  27  * Contextual links allow site administrators to quickly perform actions
  28  * related to elements on a page, without having to hunt through the
  29  * administrative interface. As such, you should usually attach them to objects
  30  * that appear on the main part of a Drupal site and limit them to a few common
  31  * tasks that are frequently performed (for example, "edit" or "configure").
  32  * Do not rely on contextual links being present for your module to work
  33  * correctly, since they are a convenience feature only. Within Drupal core,
  34  * the Contextual Links module must be enabled (and the user viewing the page
  35  * must have the "access contextual links" permission) in order for the
  36  * contextual links corresponding to actions that the user can perform to
  37  * actually be injected into the page's HTML.
  38  *
  39  * Three examples of contextual links are provided here. Although none are
  40  * difficult to implement, they are presented in order of increasing
  41  * complexity:
  42  * - Attaching contextual links to a node.
  43  * - Attaching contextual links to a block.
  44  * - Attaching contextual links to an arbitrary piece of content defined by
  45  *   your module.
  46  *
  47  * @see contextual_links_example_block_info()
  48  * @see contextual_links_example_block_view()
  49  * @see contextual_links_overview_page()
  50  */
  51 function contextual_links_example_menu() {
  52   // First example (attaching contextual links to a node):
  53   //
  54   // Many modules add tabs to nodes underneath the node/<nid> path. If the path
  55   // you are adding corresponds to a commonly performed action on the node, you
  56   // can choose to expose it as a contextual link. Since the Node module
  57   // already has code to display all contextual links underneath the node/<nid>
  58   // path (such as "Edit" and "Delete") when a node is being rendered outside
  59   // of its own page (for example, when a teaser of the node is being displayed
  60   // on the front page of the site), you only need to inform Drupal's menu
  61   // system that your path is a contextual link also, and it will automatically
  62   // appear with the others. In the example below, we add a contextual link
  63   // named "Example action" to the list.
  64   $items['node/%node/example-action'] = array(
  65     'title' => 'Example action',
  66     'page callback' => 'drupal_get_form',
  67     'page arguments' => array('contextual_links_example_node_action_form', 1),
  68     'access callback' => TRUE,
  69     // To be displayed as a contextual link, a menu item should be defined as
  70     // one of the node's local tasks.
  71     'type' => MENU_LOCAL_TASK,
  72     // To make the local task display as a contextual link, specify the
  73     // optional 'context' argument. The most common method is to set both
  74     // MENU_CONTEXT_PAGE and MENU_CONTEXT_INLINE (shown below), which causes
  75     // the link to display as both a tab on the node page and as an entry in
  76     // the contextual links dropdown. This is recommended for most cases
  77     // because not all users who have permission to visit the "Example action"
  78     // page will necessarily have access to contextual links, and they still
  79     // need a way to get to the page via the user interface.
  80     'context' => MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE,
  81     // If we give the item a large weight, we can make it display as the last
  82     // tab on the page, as well as the last item inside the contextual links
  83     // dropdown.
  84     'weight' => 80,
  85   );
  86 
  87   // Second example (attaching contextual links to a block):
  88   //
  89   // If your module provides content that is displayed in a block, you can
  90   // attach contextual links to the block that allow actions to be performed on
  91   // it. This is useful for administrative pages that affect the content
  92   // wherever it is displayed or used on the site. For configuration options
  93   // that only affect the appearance of the content in the block itself, it is
  94   // better to implement hook_block_configure() rather than creating a separate
  95   // administrative page (this allows your options to appear when an
  96   // administrator clicks the existing "Configure block" contextual link
  97   // already provided by the Block module).
  98   //
  99   // In the code below, we assume that your module has a type of object
 100   // ("contextual links example object") that will be displayed in a block. The
 101   // code below defines menu items for this object using a standard pattern,
 102   // with "View" and "Edit object" as the object's local tasks, and makes the
 103   // "Edit object" item display as a contextual link in addition to a tab. Once
 104   // the contextual links are defined here, additional steps are required to
 105   // actually display the content in a block and attach the contextual links to
 106   // the block itself. This occurs in contextual_links_example_block_info() and
 107   // contextual_links_example_block_view().
 108   $items['examples/contextual-links/%contextual_links_example_object'] = array(
 109     'title' => 'Contextual links example object',
 110     'page callback' => 'contextual_links_example_object_page',
 111     'page arguments' => array(2),
 112     'access callback' => TRUE,
 113   );
 114   $items['examples/contextual-links/%contextual_links_example_object/view'] = array(
 115     'title' => 'View',
 116     'type' => MENU_DEFAULT_LOCAL_TASK,
 117     'weight' => -10,
 118   );
 119   $items['examples/contextual-links/%contextual_links_example_object/edit'] = array(
 120     'title' => 'Edit object',
 121     'page callback' => 'drupal_get_form',
 122     'page arguments' => array('contextual_links_example_object_edit_form', 2),
 123     'access callback' => TRUE,
 124     'type' => MENU_LOCAL_TASK,
 125     // As in our first example, this is the line of code that makes "Edit
 126     // "object" display as a contextual link in addition to as a tab.
 127     'context' => MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE,
 128   );
 129 
 130   // Third example (attaching contextual links directly to your module's
 131   // content):
 132   //
 133   // Sometimes your module may want to display its content in an arbitrary
 134   // location and attach contextual links there. For example, you might
 135   // display your content in a listing on its own page and then attach the
 136   // contextual links directly to each piece of content in the listing. Here,
 137   // we will reuse the menu items and contextual links that were defined for
 138   // our example object above, and display them in a listing in
 139   // contextual_links_overview_page().
 140   $items['examples/contextual-links'] = array(
 141     'title' => 'Contextual Links Example',
 142     'page callback' => 'contextual_links_overview_page',
 143     'access callback' => TRUE,
 144   );
 145 
 146   return $items;
 147 }
 148 
 149 /**
 150  * Menu loader callback for the object defined by this module.
 151  *
 152  * @param $id
 153  *   The ID of the object to load.
 154  *
 155  * @return
 156  *   A fully loaded object, or FALSE if the object does not exist.
 157  */
 158 function contextual_links_example_object_load($id) {
 159   // In a real use case, this function might load an object from the database.
 160   // For the sake of this example, we just define a stub object with a basic
 161   // title and content for any numeric ID that is passed in.
 162   if (is_numeric($id)) {
 163     $object = new stdClass();
 164     $object->id = $id;
 165     $object->title = t('Title for example object @id', array('@id' => $id));
 166     $object->content = t('This is the content of example object @id.', array('@id' => $id));
 167     return $object;
 168   }
 169   else {
 170     return FALSE;
 171   }
 172 }
 173 
 174 /**
 175  * Implements hook_block_info().
 176  */
 177 function contextual_links_example_block_info() {
 178   // Define the block that will display our module's content.
 179   $blocks['example']['info'] = t('Contextual links example block');
 180   return $blocks;
 181 }
 182 
 183 /**
 184  * Implements hook_block_view().
 185  */
 186 function contextual_links_example_block_view($delta = '') {
 187   if ($delta == 'example') {
 188     // Display our module's content inside a block. In a real use case, we
 189     // might define a new block for each object that exists. For the sake of
 190     // this example, though, we only define one block and hardcode it to always
 191     // display object #1.
 192     $id = 1;
 193     $object = contextual_links_example_object_load($id);
 194     $block['subject'] = t('Contextual links example block for object @id', array('@id' => $id));
 195     $block['content'] = array(
 196       // In order to attach contextual links, the block's content must be a
 197       // renderable array. (Normally this would involve themed output using
 198       // #theme, but for simplicity we just use HTML markup directly here.)
 199       '#type' => 'markup',
 200       '#markup' => filter_xss($object->content),
 201       // Contextual links are attached to the block array using the special
 202       // #contextual_links property. The #contextual_links property contains an
 203       // array, keyed by the name of each module that is attaching contextual
 204       // links to it.
 205       '#contextual_links' => array(
 206         'contextual_links_example' => array(
 207           // Each element is itself an array, containing two elements which are
 208           // combined together to form the base path whose contextual links
 209           // should be attached. The two elements are split such that the first
 210           // is the static part of the path and the second is the dynamic part.
 211           // (This split is for performance reasons.) For example, the code
 212           // below tells Drupal to load the menu item corresponding to the path
 213           // "examples/contextual-links/$id" and attach all this item's
 214           // contextual links (which were defined in hook_menu()) to the object
 215           // when it is rendered. If the contextual links you are attaching
 216           // don't have any dynamic elements in their path, you can pass an
 217           // empty array as the second element.
 218           'examples/contextual-links',
 219           array($id),
 220         ),
 221       ),
 222     );
 223     // Since we are attaching our contextual links to a block, and the Block
 224     // module takes care of rendering the block in such a way that contextual
 225     // links are supported, we do not need to do anything else here. When the
 226     // appropriate conditions are met, the contextual links we have defined
 227     // will automatically appear attached to the block, next to the "Configure
 228     // block" link that the Block module itself provides.
 229     return $block;
 230   }
 231 }
 232 
 233 /**
 234  * Menu callback; displays a listing of objects defined by this module.
 235  *
 236  * @see contextual_links_example_theme()
 237  * @see contextual-links-example-object.tpl.php
 238  * @see contextual_links_example_block_view()
 239  */
 240 function contextual_links_overview_page() {
 241   $build = array();
 242 
 243   // For simplicity, we will hardcode this example page to list five of our
 244   // module's objects.
 245   for ($id = 1; $id <= 5; $id++) {
 246     $object = contextual_links_example_object_load($id);
 247     $build[$id] = array(
 248       // To support attaching contextual links to an object that we are
 249       // displaying on our own, the object must be themed in a particular way.
 250       // See contextual_links_example_theme() and
 251       // contextual-links-example-object.tpl.php for more discussion.
 252       '#theme' => 'contextual_links_example_object',
 253       '#object' => $object,
 254       // Contextual links are attached to the block using the special
 255       // #contextual_links property. See contextual_links_example_block_view()
 256       // for discussion of the syntax used here.
 257       '#contextual_links' => array(
 258         'contextual_links_example' => array(
 259           'examples/contextual-links',
 260           array($id),
 261         ),
 262       ),
 263     );
 264   }
 265 
 266   return $build;
 267 }
 268 
 269 /**
 270  * Implements hook_theme().
 271  *
 272  * @see template_preprocess_contextual_links_example_object()
 273  */
 274 function contextual_links_example_theme() {
 275   // The core Contextual Links module imposes two restrictions on how an object
 276   // must be themed in order for it to display the object's contextual links in
 277   // the user interface:
 278   // - The object must use a template file rather than a theme function. See
 279   //   contextual-links-example-object.tpl.php for more information on how the
 280   //   template file should be structured.
 281   // - The first variable passed to the template must be a renderable array. In
 282   //   this case, we accomplish that via the most common method, by passing a
 283   //   single renderable element.
 284   return array(
 285     'contextual_links_example_object' => array(
 286       'template' => 'contextual-links-example-object',
 287       'render element' => 'element',
 288     ),
 289   );
 290 }
 291 
 292 /**
 293  * Process variables for contextual-links-example-object.tpl.php.
 294  *
 295  * @see contextual_links_overview_page()
 296  */
 297 function template_preprocess_contextual_links_example_object(&$variables) {
 298   // Here we take the object that is being themed and define some useful
 299   // variables that we will print in the template file.
 300   $variables['title'] = filter_xss($variables['element']['#object']->title);
 301   $variables['content'] = filter_xss($variables['element']['#object']->content);
 302 }
 303 
 304 /**
 305  * Menu callback; displays an object defined by this module on its own page.
 306  *
 307  * @see contextual_links_overview_page()
 308  */
 309 function contextual_links_example_object_page($object) {
 310   // Here we render the object but without the #contextual_links property,
 311   // since we don't want contextual links to appear when the object is already
 312   // being displayed on its own page.
 313   $build = array(
 314     '#theme' => 'contextual_links_example_object',
 315     '#object' => $object,
 316   );
 317 
 318   return $build;
 319 }
 320 
 321 /**
 322  * Form callback; display the form for editing our module's content.
 323  *
 324  * @ingroup forms
 325  * @see contextual_links_example_object_edit_form_submit()
 326  */
 327 function contextual_links_example_object_edit_form($form, &$form_state, $object) {
 328   $form['text'] = array(
 329     '#markup' => t('This is the page that would allow you to edit object @id.', array('@id' => $object->id)),
 330     '#prefix' => '<p>',
 331     '#suffix' => '</p>',
 332   );
 333   $form['object_id'] = array(
 334     '#type' => 'value',
 335     '#value' => $object->id,
 336   );
 337 
 338   $form['actions'] = array('#type' => 'actions');
 339   $form['actions']['submit'] = array(
 340     '#type' => 'submit',
 341     '#value' => t('Submit'),
 342   );
 343 
 344   return $form;
 345 }
 346 
 347 /**
 348  * Submit handler for contextual_links_example_object_edit_form().
 349  */
 350 function contextual_links_example_object_edit_form_submit($form, &$form_state) {
 351   drupal_set_message(t('Object @id was edited.', array('@id' => $form_state['values']['object_id'])));
 352 }
 353 
 354 /**
 355  * Form callback; display the form for performing an example action on a node.
 356  *
 357  * @ingroup forms
 358  * @see contextual_links_example_node_action_form_submit()
 359  */
 360 function contextual_links_example_node_action_form($form, &$form_state, $node) {
 361   $form['text'] = array(
 362     '#markup' => t('This is the page that would allow you to perform an example action on node @nid.', array('@nid' => $node->nid)),
 363     '#prefix' => '<p>',
 364     '#suffix' => '</p>',
 365   );
 366   $form['nid'] = array(
 367     '#type' => 'value',
 368     '#value' => $node->nid,
 369   );
 370 
 371   $form['actions'] = array('#type' => 'actions');
 372   $form['actions']['submit'] = array(
 373     '#type' => 'submit',
 374     '#value' => t('Submit'),
 375   );
 376 
 377   return $form;
 378 }
 379 
 380 /**
 381  * Submit handler for contextual_links_example_node_action_form().
 382  */
 383 function contextual_links_example_node_action_form_submit($form, &$form_state) {
 384   drupal_set_message(t('The example action was performed on node @nid.', array('@nid' => $form_state['values']['nid'])));
 385 }
 386 /**
 387  * @} End of "defgroup contextual_links_example".
 388  */
";i:1;N;i:2;N;}i:2;i:2194;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:20064;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"contextual_links_example.test";i:1;i:2;i:2;i:20064;}i:2;i:20064;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:20064;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2545:"
  1 <?php
   2 
   3 /**
   4  * @file
   5  * Functional tests for the contextual_links_example module.
   6  */
   7 
   8 /**
   9  * Functional tests for the contextual_links_example module.
  10  *
  11  * @ingroup contextual_links_example
  12  */
  13 class ContextualLinksExampleTestCase extends DrupalWebTestCase {
  14   protected $web_user;
  15 
  16   public static function getInfo() {
  17     return array(
  18       'name' => 'Contextual links example functionality',
  19       'description' => 'Tests the behavior of the contextual links provided by the Contextual links example module.',
  20       'group' => 'Examples',
  21     );
  22   }
  23 
  24   /**
  25    * Enable modules and create user with specific permissions.
  26    */
  27   public function setUp() {
  28     parent::setUp('contextual', 'contextual_links_example');
  29     $this->web_user = $this->drupalCreateUser(array('access contextual links', 'administer blocks'));
  30     $this->drupalLogin($this->web_user);
  31   }
  32 
  33   /**
  34    * Test the various contextual links that this module defines and displays.
  35    */
  36   function testContextualLinksExample() {
  37     // Create a node and promote it to the front page. Then view the front page
  38     // and verify that the "Example action" contextual link works.
  39     $node = $this->drupalCreateNode(array('type' => 'page', 'promote' => 1));
  40     $this->drupalGet('');
  41     $this->clickLink(t('Example action'));
  42     $this->assertUrl('node/' . $node->nid . '/example-action', array('query' => array('destination' => 'node')));
  43 
  44     // Visit our example overview page and click the third contextual link.
  45     // This should take us to a page for editing the third object we defined.
  46     $this->drupalGet('examples/contextual-links');
  47     $this->clickLink('Edit object', 2);
  48     $this->assertUrl('examples/contextual-links/3/edit', array('query' => array('destination' => 'examples/contextual-links')));
  49 
  50     // Enable our module's block, go back to the front page, and click the
  51     // "Edit object" contextual link that we expect to be there.
  52     $edit['blocks[contextual_links_example_example][region]'] = 'sidebar_first';
  53     $this->drupalPost('admin/structure/block', $edit, t('Save blocks'));
  54     $this->drupalGet('');
  55     $this->clickLink('Edit object');
  56     $this->assertUrl('examples/contextual-links/1/edit', array('query' => array('destination' => 'node')));
  57   }
  58 }
";i:1;N;i:2;N;}i:2;i:20111;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22664;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:22664;}}