a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Pager Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"pager_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:171:"
   1 name = Pager example
   2 description = Demonstrates a page with content in a pager
   3 package = Example modules
   4 core = 7.x
   5 files[] = pager_example.test
";i:1;N;i:2;N;}i:2;i:66;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:246;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"pager_example.module";i:1;i:2;i:2;i:246;}i:2;i:246;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:246;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3274:"
   1 <?php
   2 // $Id$
   3 /**
   4  * @file
   5  * This is an example describing how a module can implement a pager in order
   6  * to reduce the number of output rows to the screen and allow a user
   7  * to scroll through multiple screens of output.
   8  *
   9  * See:
  10  * @link http://drupal.org/developing/api/database Database API @endlink
  11  * @link http://drupal.org/node/508796 Extenders @endlink
  12  */
  13 
  14 /**
  15  * @defgroup pager_example Example: Pager
  16  * @ingroup examples
  17  * @{
  18  * Example of a results pager.
  19  */
  20 
  21 /**
  22  * Implements hook_help().
  23  */
  24 function pager_help($path, $arg) {
  25   switch ($path) {
  26     case 'examples/pager_example':
  27       return '<p>' . t('The layout here is a themed as a table with a default limit of 10 rows per page. The limit can be changed in the code by changing the limit to some other value.  This can be extended to add a filter form as well so the user can choose how many they would like to see on each screen.') . '</p>';
  28   }
  29 }
  30 
  31 /**
  32  * Implements hook_menu().
  33  */
  34 function pager_example_menu() {
  35   $items['examples/pager_example'] = array(
  36     'title' => 'Pager example',
  37     'description' => 'Show a page with a long list across multiple pages',
  38     'page callback' => 'pager_example_page',
  39     'access callback' => TRUE
  40   );
  41   return $items;
  42 }
  43 
  44 /**
  45  * Build the pager query
  46  *
  47  * Uses the date_formats table since it is installed with ~35 rows
  48  * in it and we don't have to create fake data in order to show
  49  * this example.
  50  *
  51  * @return
  52  *   A render array completely set up with a pager.
  53  */
  54 function pager_example_page() {
  55   // we are going to output the results in a table with a nice header
  56   $header = array(
  57     array('data' => t('DFID')),
  58     array('data' => t('Format')),
  59     array('data' => t('Type')),
  60   );
  61 
  62   // we are extending the PagerDefault class here
  63   // it has a default of 10 rows per page
  64   // the extend('PagerDefault') part here does all the magic.
  65   $query = db_select('date_formats', 'd')->extend('PagerDefault');
  66   $query->fields('d', array('dfid', 'format', 'type'));
  67 
  68   $result = $query
  69     ->limit(10)         // this is where you change the number of rows
  70     ->orderBy('d.dfid')
  71     ->execute();
  72 
  73   $rows = array();
  74   foreach ($result as $row) {
  75     // normally we would add some nice formatting to our rows
  76     // but for our purpose we are simply going to add our row
  77     // to the array.
  78     $rows[] = array('data' => (array) $row);
  79   }
  80 
  81   // Create a render array ($build) which will be themed as a table with a
  82   // pager.
  83   $build['pager_table'] = array(
  84     '#theme' => 'table',
  85     '#header' => $header,
  86     '#rows' => $rows,
  87     '#empty' => t('There are no date formats found in the db'),
  88   );
  89 
  90   // attach the pager theme
  91   $build['pager_pager'] = array('#theme' => 'pager');
  92 
  93   return $build;
  94 }
  95 /**
  96  * @} End of "defgroup pager_example".
  97  */
";i:1;N;i:2;N;}i:2;i:284;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3567;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"pager_example.test";i:1;i:2;i:2;i:3567;}i:2;i:3567;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3567;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1679:"
   1 <?php
   2 // $Id$
   3 /**
   4  * @file
   5  * Simpletest case for pager_example module.
   6  */
   7 
   8 /**
   9  * Functionality tests for the pager example module.
  10  *
  11  * @ingroup pager_example
  12  */
  13 class PagerExampleTestCase extends DrupalWebTestCase {
  14 
  15   public static function getInfo() {
  16     return array(
  17       'name' => 'Pager Example',
  18       'description' => 'Verify the pager functionality',
  19       'group' => 'Examples',
  20     );
  21   }
  22 
  23   function setUp() {
  24     // Enable the module.
  25     parent::setUp('pager_example');
  26   }
  27 
  28   /**
  29    * Verify the functionality of the example module.
  30    */
  31   function testPagerPage() {
  32     // no need to login for this test
  33     $this->drupalGet('examples/pager_example');
  34     $this->assertText('next', 'Found next link');
  35     $this->assertText('last', 'Found last link');
  36 
  37     // on the first page we shouldn't see the first
  38     // or previous links
  39     $this->assertNoText('first', 'No first link on the first page');
  40     $this->assertNoText('previous', 'No previous link on the first page');
  41 
  42     // lets go to the second page
  43     $this->drupalGet('examples/pager_example', array('query' => array('page' => 1)));
  44     $this->assertText('next', 'Found next link');
  45     $this->assertText('last', 'Found last link');
  46 
  47     // on the second page we should also see the first
  48     // and previous links
  49     $this->assertText('first', 'Found first link');
  50     $this->assertText('previous', 'Found previous link');
  51   }
  52 }
";i:1;N;i:2;N;}i:2;i:3603;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5290;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5290;}}