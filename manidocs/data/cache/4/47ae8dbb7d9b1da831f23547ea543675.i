a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"SimpleTest Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"simpletest_example.info";i:1;i:2;i:2;i:35;}i:2;i:35;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:35;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:214:"
   1 name = Simpletest Example
   2 description = Provides simpletest_example page node type.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = simpletest
   6 files[] = simpletest_example.test
";i:1;N;i:2;N;}i:2;i:76;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:299;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"simpletest_example.install";i:1;i:2;i:2;i:299;}i:2;i:299;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:299;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:703:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Install, update and uninstall functions for the simpletest_example module.
   6  */
   7 
   8 /**
   9  * Implements hook_install().
  10  */
  11 function simpletest_example_install() {
  12   // Ensure the simpletest_example node type is available.
  13   node_types_rebuild();
  14   $types = node_type_get_types();
  15   node_add_body_field($types['simpletest_example']);
  16 }
  17 
  18 /**
  19  * Adds a body field to the simpletest_example node type.
  20  */
  21 function simpletest_example_update_7001() {
  22   node_types_rebuild();
  23   $types = node_type_get_types();
  24   node_add_body_field($types['simpletest_example']);
  25 }
";i:1;N;i:2;N;}i:2;i:343;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1055;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"simpletest_example.module";i:1;i:2;i:2;i:1055;}i:2;i:1055;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1055;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4366:"
1 <?php
   2 
   3 /**
   4  * @file
   5  * Module file for simpletest_example
   6  */
   7 
   8 /**
   9  * @defgroup simpletest_example Example: Simpletest
  10  * @ingroup examples
  11  * @{
  12  * An example of simpletest tests to accompany the tutorial at
  13  * http://drupal.org/node/890654.
  14  *
  15  * This is built on a traditional node-type implementation.
  16  */
  17 
  18 /**
  19  * Implements hook_node_info().
  20  */
  21 function simpletest_example_node_info() {
  22   return array(
  23     'simpletest_example' => array(
  24       'name' => t('Simpletest Example Node Type'),
  25       'base' => 'simpletest_example',
  26       'description' => t('simpletest_example page node type.'),
  27   )
  28   );
  29 }
  30 
  31 /**
  32  * Implements hook_permission().
  33  *
  34  * In this case we're adding an addition permission that does the same
  35  * as the one the node module offers, just to demonstrate this error.
  36  */
  37 function simpletest_example_permission() {
  38   $perms = array();
  39   $perms['extra special edit any simpletest_example'] = array('title' => t('Extra special edit any Simpletest Example'), 'description' => t('Extra special edit any Simpletest Example'));
  40   return $perms;
  41 }
  42 
  43 /**
  44  * Implements hook_node_access().
  45  *
  46  * Demonstrates a bug that we'll find in our test.
  47  *
  48  * If this is running on the testbot, we don't want the error to show so will
  49  * work around it by testing to see if we're in the 'checkout' directory.
  50  */
  51 function simpletest_example_node_access($node, $op, $account) {
  52   // Don't get involved if this isn't a simpletest_example node, etc.
  53   $type = is_string($node) ? $node : $node->type;
  54   if ($type != 'simpletest_example' || ($op != 'update' && $op != 'delete')) {
  55     return NODE_ACCESS_IGNORE;
  56   }
  57 
  58   // This code has a BUG that we'll find in testing.
  59 
  60   // This is the incorrect version we'll use to demonstrate test failure.
  61   // The correct version should have ($op == 'update' || $op == 'delete').
  62   // The author had mistakenly always tested with User 1 so it always
  63   // allowed access and the bug wasn't noticed!
  64   if ( ($op == 'delete')  && (user_access('extra special edit any simpletest_example', $account) && ($account->uid == $node->uid))) {
  65     return NODE_ACCESS_ALLOW;
  66   }
  67 
  68   return NODE_ACCESS_DENY;
  69 }
  70 
  71 /**
  72  * Implements hook_form().
  73  *
  74  * Form for the node type.
  75  */
  76 function simpletest_example_form($node, $form_state) {
  77   $type = node_type_get_type($node);
  78   $form = array();
  79   if ($type->has_title) {
  80     $form['title'] = array(
  81       '#type' => 'textfield',
  82       '#title' => check_plain($type->title_label),
  83       '#required' => TRUE,
  84       '#default_value' => $node->title,
  85       '#maxlength' => 255,
  86       '#weight' => -5,
  87     );
  88   }
  89   return $form;
  90 }
  91 
  92 /**
  93  * Implements hook_menu().
  94  *
  95  * Provides an explanation.
  96  */
  97 function simpletest_example_menu() {
  98   $items['examples/simpletest_example'] = array(
  99     'title'           => 'Simpletest Example',
 100     'description'     => 'Explain the simpletest example and allow the error logic to be executed.',
 101     'page callback'   => '_simpletest_example_explanation',
 102     'access callback' => TRUE,
 103   );
 104   return $items;
 105 }
 106 
 107 /**
 108  * Returns an explanation of this module.
 109  */
 110 function _simpletest_example_explanation() {
 111 
 112   $explanation =  t("This Simpletest Example is designed to give an introductory tutorial to writing
 113     a simpletest test. Please see the <a href='http://drupal.org/node/890654'>associated tutorial</a>.");
 114   return $explanation;
 115 }
 116 
 117 /**
 118  * A simple self-contained function used to demonstrate unit tests.
 119  *
 120  * @see SimpletestUnitTestExampleTestCase
 121  */
 122 function simpletest_example_empty_mysql_date($date_string) {
 123   if (empty($date_string) || $date_string == '0000-00-00' || $date_string == '0000-00-00 00:00:00') {
 124     return true;
 125   }
 126   return false;
 127 }
 128 
 129 /**
 130  * @} End of "defgroup simpletest_example".
 131  */
";i:1;N;i:2;N;}i:2;i:1098;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5473;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"simpletest_example.test";i:1;i:2;i:2;i:5473;}i:2;i:5473;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5473;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6357:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * An example of simpletest tests to accompany the tutorial at
   6  * http://drupal.org/node/890654.
   7  */
   8 
   9 /**
  10  * The SimpletestExampleTestCase is a functional test case, meaning that it
  11  * actually exercises a particular sequence of actions through the web UI.
  12  * The majority of core test cases are done this way, but the Simpletest suite
  13  * also provides unit tests as demonstrated in the unit test case example later
  14  * in this file.
  15  *
  16  * Functional test cases are far slower to execute than unit test cases because
  17  * they require a complete Drupal install to be done for each test.
  18  *
  19  * @see DrupalWebTestCase
  20  * @see SimpletestUnitTestExampleTestCase
  21  */
  22 class SimpletestExampleTestCase extends DrupalWebTestCase {
  23   protected $privileged_user;
  24 
  25   public static function getInfo() {
  26     return array(
  27       'name' => 'Simpletest Example',
  28       'description' => 'Ensure that the simpletest_example content type provided functions properly.',
  29       'group' => 'Examples',
  30     );
  31   }
  32 
  33   public function setUp() {
  34     parent::setUp('simpletest_example');  // Enable any modules required for the test
  35     // Create and log in our user. The user has the arbitrary privilege
  36     // 'extra special edit any simpletest_example' which the code uses
  37     // to grant access.
  38     $this->privileged_user = $this->drupalCreateUser(array('create simpletest_example content', 'extra special edit any simpletest_example'));
  39     $this->drupalLogin($this->privileged_user);
  40   }
  41 
  42   // Create a simpletest_example node using the node form
  43   public function testSimpleTestExampleCreate() {
  44     // Create node to edit.
  45     $edit = array();
  46     $edit['title'] = $this->randomName(8);
  47     $edit["body[und][0][value]"] = $this->randomName(16);
  48     $this->drupalPost('node/add/simpletest-example', $edit, t('Save'));
  49     $this->assertText(t('Simpletest Example Node Type @title has been created.', array('@title' => $edit['title'])));
  50   }
  51 
  52   // Create a simpletest_example node and then see if our user can edit it
  53   public function testSimpleTestExampleEdit() {
  54     $settings = array(
  55       'type' => 'simpletest_example',
  56       'title' => $this->randomName(32),
  57       'body' => array(LANGUAGE_NONE => array(array($this->randomName(64)))),
  58     );
  59     $node = $this->drupalCreateNode($settings);
  60 
  61     // For debugging, we might output the node structure with $this->verbose()
  62     $this->verbose('Node created: ' . var_export($node, TRUE));
  63     // It would only be output if the testing settings had 'verbose' set.
  64 
  65     // We'll run this test normally, but not on the testbot, as it would
  66     // indicate that the examples module was failing tests.
  67     if (!$this->runningOnTestbot()) {
  68       // The debug() statement will output information into the test results.
  69       // It can also be used in Drupal 7 anywhere in code and will come out
  70       // as a drupal_set_message().
  71       debug('We are not running on the PIFR testing server, so will go ahead and catch the failure.');
  72       $this->drupalGet("node/{$node->nid}/edit");
  73       // Make sure we don't get a 401 unauthorized response:
  74       $this->assertResponse(200, 'User is allowed to edit the content.');
  75 
  76       // Looking for title text in the page to determine whether we were
  77       // successful opening edit form.
  78       $this->assertText(t("@title", array('@title' => $settings['title'])), "Found title in edit form");
  79     }
  80   }
  81 
  82   /**
  83    * Detect if we're running on PIFR testbot; skip intentional failure in that
  84    * case. It happens that on the testbot the site under test is in a directory
  85    * named 'checkout' or 'site_under_test'.
  86    *
  87    * @return boolean
  88    *   TRUE if running on testbot.
  89    */
  90   public function runningOnTestbot() {
  91     return (file_exists("../checkout") || file_exists("../site_under_test"));
  92   }
  93 }
  94 
  95 
  96 /**
  97  * Although most core test cases are based on DrupalWebTestCase and are
  98  * functional tests (exercising the web UI) we also have DrupalUnitTestCase,
  99  * which executes much faster because a Drupal install does not have to be
 100  * one. No environment is provided to a test case based on DrupalUnitTestCase;
 101  * it must be entirely self-contained.
 102  *
 103  * @see DrupalUnitTestCase
 104  */
 105 class SimpletestUnitTestExampleTestCase extends DrupalUnitTestCase {
 106 
 107   public static function getInfo() {
 108     return array(
 109       'name' => 'Simpletest Example unit tests',
 110       'description' => 'Test that simpletest_example_empty_mysql_date works properly.',
 111       'group' => 'Examples',
 112     );
 113   }
 114 
 115   function setUp() {
 116     drupal_load('module', 'simpletest_example');
 117     parent::setUp();
 118   }
 119 
 120   /**
 121    * Call simpletest_example_empty_mysql_date and check that it returns correct
 122    * result.
 123    *
 124    * Note that no environment is provided; we're just testing the correct
 125    * behavior of a function when passed specific arguments.
 126    */
 127   public function testSimpletestUnitTestExampleFunction() {
 128     $result = simpletest_example_empty_mysql_date(NULL);
 129     // Note that test assertion messages should never be translated, so
 130     // this string is not wrapped in t().
 131     $message = 'A NULL value should return TRUE.';
 132     $this->assertTrue($result, $message);
 133 
 134     $result = simpletest_example_empty_mysql_date('');
 135     $message = 'An empty string should return TRUE.';
 136     $this->assertTrue($result, $message);
 137 
 138     $result = simpletest_example_empty_mysql_date('0000-00-00');
 139     $message = 'An "empty" MySQL DATE should return TRUE.';
 140     $this->assertTrue($result, $message);
 141 
 142     $result = simpletest_example_empty_mysql_date(date('Y-m-d'));
 143     $message = 'A valid date should return FALSE.';
 144     $this->assertFalse($result, $message);
 145   }
 146 }
";i:1;N;i:2;N;}i:2;i:5514;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11879;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:11879;}}