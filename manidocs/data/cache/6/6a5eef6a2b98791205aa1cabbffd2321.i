a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Block Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"block_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:208:"
   1 name = Block Example
   2 description = An example outlining how a module can define blocks.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = block
   6 files[] = block_example.test
";i:1;N;i:2;N;}i:2;i:67;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:285;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"block_example.install";i:1;i:2;i:2;i:285;}i:2;i:285;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:285;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:316:"
   1 <?php
   2 /**
   3  * @file
   4  * Install, update and uninstall functions for the block_example module.
   5  */
   6 
   7 /**
   8  * Implements hook_uninstall().
   9  *
  10  * @ingroup block_example
  11  */
  12 function block_example_uninstall() {
  13   variable_del('block_example_string');
  14 }
";i:1;N;i:2;N;}i:2;i:324;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:649;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"block_example.module";i:1;i:2;i:2;i:649;}i:2;i:649;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:649;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:10480:"
   1 <?php
   2 /**
   3  * @file
   4  * Module file for block_example.
   5  */
   6 
   7 /**
   8  * @defgroup block_example Example: Block
   9  * @ingroup examples
  10  * @{
  11  * Demonstrates code creation of blocks.
  12  *
  13  * This is an example outlining how a module can define blocks that can be
  14  * displayed on various pages of a site, or how to alter blocks provided by
  15  * other modules.
  16  */
  17 
  18 /**
  19  * Implements hook_menu().
  20  *
  21  * Provides a default page to explain what this module does.
  22  */
  23 function block_example_menu() {
  24   $items['examples/block_example'] = array(
  25     'page callback' => 'block_example_page',
  26     'access callback' => TRUE,
  27     'title' => 'Block Example',
  28   );
  29   return $items;
  30 }
  31 
  32 /**
  33  * Simple page function to explain what the block example is about.
  34  */
  35 function block_example_page() {
  36   $page = array(
  37     '#type' => 'markup',
  38     '#markup' => t('The Block Example provides two sample blocks which demonstrate the various block APIs. To experiment with the blocks, enable and configure them on <a href="@url">the block admin page</a>.', array('@url' => url('admin/structure/block'))),
  39   );
  40   return $page;
  41 }
  42 /**
  43  * Implements hook_block_info().
  44  *
  45  * This hook declares what blocks are provided by the module.
  46  */
  47 function block_example_block_info() {
  48   // This hook returns an array, each component of which is an array of block
  49   // information. The array keys are the 'delta' values used in other block
  50   // hooks.
  51 
  52   // The required block information is a block description, which is shown
  53   // to the site administrator in the list of possible blocks. You can also
  54   // provide initial settings for block weight, status, etc.
  55 
  56   // Many options are defined in hook_block_info():
  57   $blocks['example_configurable_text'] = array(
  58     // info: The name of the block.
  59     'info' => t('Example: configurable text string'),
  60     // Block caching options (per role, per user, etc.)
  61     'cache' => DRUPAL_CACHE_PER_ROLE, // default
  62   );
  63 
  64   // This sample shows how to provide default settings. In this case we'll
  65   // enable the block in the first sidebar and make it visible only on
  66   // 'node/*' pages. See the hook_block_info() documentation for these.
  67   $blocks['example_empty'] = array(
  68     'info' => t('Example: empty block'),
  69     'status' => TRUE,
  70     'region' => 'sidebar_first',  // Not usually provided.
  71     'visibility' => BLOCK_VISIBILITY_LISTED,  // Not usually provided.
  72     'pages' => 'node/*', // Not usually provided here.
  73   );
  74 
  75   $blocks['example_uppercase'] = array(
  76     // info: The name of the block.
  77     'info' => t('Example: uppercase this please'),
  78     'status' => TRUE,
  79     'region' => 'sidebar_first',  // Not usually provided.
  80   );
  81 
  82   return $blocks;
  83 }
  84 
  85 /**
  86  * Implements hook_block_configure().
  87  *
  88  * This hook declares configuration options for blocks provided by this module.
  89  */
  90 function block_example_block_configure($delta = '') {
  91   // The $delta parameter tells us which block is being configured.
  92   // In this example, we'll allow the administrator to customize
  93   // the text of the 'configurable text string' block defined in this module.
  94 
  95   $form = array();
  96   if ($delta == 'example_configurable_text') {
  97     // All we need to provide is the specific configuration options for our
  98     // block. Drupal will take care of the standard block configuration options
  99     // (block title, page visibility, etc.) and the save button.
 100     $form['block_example_string'] = array(
 101       '#type' => 'textfield',
 102       '#title' => t('Block contents'),
 103       '#size' => 60,
 104       '#description' => t('This text will appear in the example block.'),
 105       '#default_value' => variable_get('block_example_string',  t('Some example content.')),
 106     );
 107   }
 108   return $form;
 109 }
 110 
 111 /**
 112  * Implements hook_block_save().
 113  *
 114  * This hook declares how the configured options for a block
 115  * provided by this module are saved.
 116  */
 117 function block_example_block_save($delta = '', $edit = array()) {
 118   // We need to save settings from the configuration form.
 119   // We need to check $delta to make sure we are saving the right block.
 120   if ($delta == 'example_configurable_text') {
 121     // Have Drupal save the string to the database.
 122     variable_set('block_example_string', $edit['block_example_string']);
 123   }
 124   return;
 125 }
 126 
 127 /**
 128  * Implements hook_block_view().
 129  *
 130  * This hook generates the contents of the blocks themselves.
 131  */
 132 function block_example_block_view($delta = '') {
 133   //The $delta parameter tells us which block is being requested.
 134   switch ($delta) {
 135     case 'example_configurable_text':
 136       // The subject is displayed at the top of the block. Note that it
 137       // should be passed through t() for translation. The title configured
 138       // for the block using Drupal UI supercedes this one.
 139       $block['subject'] = t('Title of first block (example_configurable_text)');
 140       // The content of the block is typically generated by calling a custom
 141       // function.
 142       $block['content'] = block_example_contents($delta);
 143       break;
 144     case 'example_empty':
 145       $block['subject'] = t('Title of second block (example_empty)');
 146       $block['content'] = block_example_contents($delta);
 147       break;
 148     case 'example_uppercase':
 149       $block['subject'] = t("uppercase this please");
 150       $block['content'] = t("This block's title will be changed to uppercase. Any other block with 'uppercase' in the subject or title will also be altered. If you change this block's title through the UI to omit the word 'uppercase', it will still be altered to uppercase as the subject key has not been changed.");
 151       break;
 152   }
 153   return $block;
 154 }
 155 
 156 /**
 157  * A module-defined block content function.
 158  */
 159 function block_example_contents($which_block) {
 160   switch ($which_block) {
 161     case 'example_configurable_text':
 162       // Modules would typically perform some database queries to fetch the
 163       // content for their blocks. Here, we'll just use the variable set in the
 164       // block configuration or, if none has set, a default value.
 165       // Block content can be returned in two formats: renderable arrays
 166       // (as here) are preferred though a simple string will work as well.
 167       // Block content created through the UI defaults to a string.
 168       return array('#markup' => variable_get('block_example_string',  t('A default value. This block was created at %time', array('%time' => date('c')))));
 169     case 'example_empty':
 170       // It is possible that a block not have any content, since it is
 171       // probably dynamically constructed. In this case, Drupal will not display
 172       // the block at all. This block will not be displayed.
 173       return;
 174   }
 175 }
 176 
 177 /*
 178  * The following hooks can be used to alter blocks
 179  * provided by your own or other modules.
 180  */
 181 
 182 /**
 183  * Implements hook_block_list_alter().
 184  *
 185  * This hook allows you to add, remove or modify blocks in the block list. The
 186  * block list contains the block definitions. This example requires
 187  * search module and the search block enabled
 188  * to see how this hook implementation works.
 189  *
 190  * You may also be interested in hook_block_info_alter(), which allows changes
 191  * to the behavior of blocks.
 192  */
 193 function block_example_block_list_alter(&$blocks) {
 194   // We are going to make the search block sticky on bottom of regions. For
 195   // this example, we will modify the block list and append the search block at
 196   // the end of the list, so even if the administrator configures the block to
 197   // be on the top of the region, it will demote to bottom again.
 198   foreach ($blocks as $bid => $block) {
 199     if (($block->module == 'search') && ($block->delta == 'form')) {
 200       // Remove the block from the list and append to the end.
 201       unset($blocks[$bid]);
 202       $blocks[$bid] = $block;
 203       break;
 204     }
 205   }
 206 }
 207 
 208 /**
 209  * Implements hook_block_view_alter().
 210  *
 211  * This hook allows you to modify the output of any block in the system.
 212  *
 213  * In addition, instead of hook_block_view_alter(), which is called for all
 214  * blocks, you can also use hook_block_view_MODULE_DELTA_alter() to alter a
 215  * specific block. To change only our block using
 216  * hook_block_view_MODULE_DELTA_alter, we would use the function:
 217  * block_example_block_view_block_example_example_configurable_text_alter()
 218  *
 219  * We are going to uppercase the subject (the title of the block as shown to the
 220  * user) of any block if the string "uppercase" appears in the block title or
 221  * subject. Default block titles are set programmatically in the subject key;
 222  * titles created through the UI are saved in the title key. This module creates
 223  * an example block to demonstrate this effect (default title set
 224  * programmatically as subject).  You can also demonstrate the effect of this
 225  * hook by creating a new block whose title has the string 'uppercase' in it
 226  * (set as title through the UI).
 227  */
 228 function block_example_block_view_alter(&$data, $block) {
 229   // We'll search for the string 'uppercase'.
 230   if ((!empty($block->title) && stristr($block->title, 'uppercase')) || (!empty($data['subject']) && stristr($data['subject'], 'uppercase'))) {
 231     // This will uppercase the default title.
 232     $data['subject'] = isset($data['subject']) ? drupal_strtoupper($data['subject']) : '';
 233     // This will uppercase a title set in the UI.
 234     $block->title = isset($block->title) ? drupal_strtoupper($block->title) : '';
 235   }
 236 }
 237 /**
 238  * @} End of "defgroup block_example".
 239  */
";i:1;N;i:2;N;}i:2;i:687;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11176;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"block_example.test";i:1;i:2;i:2;i:11176;}i:2;i:11176;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:11176;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4814:"
   1 <?php
   2 /**
   3  * @file
   4  * Test case for testing the block example module.
   5  */
   6 class BlockExampleTestCase extends DrupalWebTestCase {
   7   protected $web_user;
   8 
   9   public static function getInfo() {
  10     return array(
  11       'name' => 'Block example functionality',
  12       'description' => 'Test the configuration options and block created by Block Example module.',
  13       'group' => 'Examples',
  14     );
  15   }
  16 
  17   /**
  18    * Enable modules and create user with specific permissions.
  19    */
  20   function setUp() {
  21     parent::setUp('block_example', 'search');
  22     // Create user. Search content permission granted for the search block to
  23     // be shown.
  24     $this->web_user = $this->drupalCreateUser(array('administer blocks', 'search content', 'access contextual links'));
  25   }
  26 
  27   /**
  28    * Login user, create an example node, and test block functionality through
  29    * the admin and user interfaces.
  30    */
  31   function testBlockExampleBasic() {
  32     // Login the admin user.
  33     $this->drupalLogin($this->web_user);
  34 
  35     // Find the blocks in the settings page.
  36     $this->drupalGet('admin/structure/block');
  37     $this->assertRaw(t('Example: configurable text string'), 'Block configurable-string found.');
  38     $this->assertRaw(t('Example: empty block'), 'Block empty-block found.');
  39 
  40     // Verify the default settings for block are processed.
  41     $this->assertFieldByName('blocks[block_example_example_empty][region]', 'sidebar_first', 'Empty block is enabled in first sidebar successfully verified.');
  42     $this->assertFieldByName('blocks[block_example_example_configurable_text][region]', -1, 'Configurable text block is disabled in first sidebar successfully verified.');
  43 
  44     // Verify that blocks are not shown
  45     $this->drupalGet('/');
  46     $this->assertNoRaw(t('Title of first block (example_configurable_text)'), 'Block configurable test not found.');
  47     $this->assertNoRaw(t('Title of second block (example_empty)'), 'Block empty not found.');
  48 
  49     // Enable the Configurable text block and verify
  50     $this->drupalPost('admin/structure/block', array('blocks[block_example_example_configurable_text][region]' => 'sidebar_first'), t('Save blocks'));
  51     $this->assertFieldByName('blocks[block_example_example_configurable_text][region]', 'sidebar_first', 'Configurable text block is enabled in first sidebar successfully verified.');
  52 
  53     // Verify that blocks are there. Empty block will not be shown, because it is empty
  54     $this->drupalGet('/');
  55     $this->assertRaw(t('Title of first block (example_configurable_text)'), 'Block configurable text found.');
  56 
  57     // Change content of configurable text block
  58     $string = $this->randomName();
  59     $this->drupalPost('admin/structure/block/manage/block_example/example_configurable_text/configure', array('block_example_string' => $string), t('Save block'));
  60 
  61     // Verify that new content is shown
  62     $this->drupalGet('/');
  63     $this->assertRaw($string, 'Content of configurable text block successfully verified.');
  64 
  65     // Make sure our example uppercased block is shown as altered by the
  66     // hook_block_view_alter().
  67     $this->assertRaw(t('UPPERCASE THIS PLEASE'));
  68 
  69     // Create a new block and make sure it gets uppercased.
  70     $post = array(
  71       'title' => t('configurable block to be uppercased'),
  72       'info' => t('configurable block to be uppercased'),
  73       'body[value]' => t('body of new  block'),
  74       'regions[bartik]' => 'sidebar_first',
  75     );
  76     $this->drupalPost('admin/structure/block/add', $post, t('Save block'));
  77     $this->drupalGet('/');
  78     $this->assertRaw(('CONFIGURABLE BLOCK TO BE UPPERCASED'));
  79 
  80     // Verify that search block is at the bottom of the region.
  81 
  82     // Enable the search block on top of sidebar_first.
  83     $block_options = array(
  84       'blocks[search_form][region]' => 'sidebar_first',
  85       'blocks[search_form][weight]' => -9,
  86     );
  87     $this->drupalPost('admin/structure/block', $block_options, t('Save blocks'));
  88 
  89     // The first 'configure block' link should be from our configurable block,
  90     // the second from the Navigation menu, and the fifth (#4) from
  91     // search block if it was successfully pushed to the bottom.
  92     $this->drupalGet('/');
  93     $this->clickLink('Configure block', 4);
  94     $this->assertText(t("'@search' block", array('@search' => t('Search form'))), 'hook_block_info_alter successfully verified.');
  95   }
  96 }
";i:1;N;i:2;N;}i:2;i:11212;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16034;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:16034;}}