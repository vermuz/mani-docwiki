a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Filter Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"filter_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:186:"
   1 name = Filter example
   2 description = An example module showing how to define a custom filter.
   3 package = Example modules
   4 core = 7.x
   5 files[] = filter_example.test
";i:1;N;i:2;N;}i:2;i:67;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:262;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"filter_example.module";i:1;i:2;i:2;i:262;}i:2;i:262;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:262;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8936:"
   1 <?php
   2 /**
   3  * @file
   4  * Module file for filter_example.
   5  */
   6 
   7 /**
   8  * @defgroup filter_example Example: Filter
   9  * @ingroup examples
  10  * @{
  11  * Demonstrates the creation of filters.
  12 
  13  * This is an example outlining how a module can be used to define a filter
  14  * to be run on user-submitted content before it is output to the browser.
  15  *
  16  * To show all the capabilities of the filter system, we will define two filters
  17  * in this module. One will substitute the string "foo" with an
  18  * administratively-defined replacement string. The other will find a custom
  19  * XML tag, <time />, and replace it by the current time.
  20  *
  21  * Foo filter
  22  *
  23  * Drupal has several content formats (they are not filters), and in our example
  24  * the foo replacement can be configured for each one of them, allowing an html
  25  * or php replacement, so the module includes a settings callback, with options
  26  * to configure that replacements. Also, a Tips callback will help showing the
  27  * current replacement for the content type being edited.
  28  *
  29  * Time filter.
  30  *
  31  * This filter is a little trickier to implement than the previous one.
  32  * Since the input involves special HTML characters (< and >) we have to
  33  * run the filter before HTML is escaped/stripped by other filters. But
  34  * we want to use HTML in our result as well, and so if we run this filter
  35  * first our replacement string could be escaped or stripped. The solution
  36  * is to use the "prepare" operation to escape the special characters, and
  37  * to later replace our escaped version in the "process" step.
  38  */
  39 
  40 /**
  41  * Implements hook_menu().
  42  */
  43 function filter_example_menu() {
  44   $items['examples/filter_example'] = array(
  45     'title' => 'Filter Example',
  46     'page callback' => '_filter_example_information',
  47     'access callback' => TRUE,
  48   );
  49   return $items;
  50 }
  51 
  52 /**
  53  * Implements hook_help().
  54  */
  55 function filter_example_help($path, $arg) {
  56   switch ($path) {
  57     case 'admin/help#filter_example':
  58       return _filter_example_information();
  59   }
  60 }
  61 
  62 /**
  63  * Simply returns a little bit of information about the example.
  64  */
  65 function _filter_example_information() {
  66   return t("<p>This example provides two filters.</p><p>Foo Filter replaces
  67     'foo' with a configurable replacement.</p><p>Time Tag replaces the string
  68     '&lt;time /&gt;' with the current time.</p><p>To use these filters, go to !link and
  69     configure an input format, or create a new one.</p>",
  70     array('!link' => l("admin/config/content/formats", "admin/config/content/formats"))
  71   );
  72 }
  73 
  74 /**
  75  * Implements hook_filter_info().
  76  *
  77  * Here we define the different filters provided by the module. For this example,
  78  * time_filter is a very static and simple replacement, but it requires some
  79  * preparation of the string because of the special html tags < and >. The
  80  * foo_filter is more complex, including its own settings and inline tips.
  81  */
  82 function filter_example_filter_info() {
  83   $filters['filter_foo'] = array(
  84     'title' => t('Foo Filter (example)'),
  85     'description' => t('Every instance of "foo" in the input text will be replaced with a preconfigured replacement.'),
  86     'process callback'  => '_filter_example_filter_foo_process',
  87     'default settings' => array(
  88       'filter_example_foo' => 'bar',
  89     ),
  90     'settings callback' => '_filter_example_filter_foo_settings',
  91     'tips callback' => '_filter_example_filter_foo_tips',
  92   );
  93   $filters['filter_time'] = array(
  94     'title' => t('Time Tag (example)'),
  95     'description' => t('Every instance of the special &lt;time /&gt; tag will be replaced with the current date and time in the user\'s specified time zone.'),
  96     'prepare callback' => '_filter_example_filter_time_prepare',
  97     'process callback' => '_filter_example_filter_time_process',
  98     'tips callback' => '_filter_example_filter_time_tips',
  99   );
 100   return $filters;
 101 }
 102 
 103 /*
 104  * Foo filter
 105  *
 106  * Drupal has several text formats (they are not filters), and in our example
 107  * the foo replacement can be configured for each one of them, so the module
 108  * includes a settings callback, with options to configure those replacements.
 109  * Also, a Tips callback will help showing the current replacement
 110  * for the content type being edited.
 111  */
 112 
 113 /**
 114  * Settings callback for foo filter
 115  *
 116  * Make use of $format to have different replacements for every input format.
 117  * Since we allow the administrator to define the string that gets substituted
 118  * when "foo" is encountered, we need to provide an interface for this kind of
 119  * customization. The object format is also an argument of the callback.
 120  *
 121  * The settings defined in this form are stored in database by the filter
 122  * module, and they will be available in the $filter argument.
 123  */
 124 function _filter_example_filter_foo_settings($form, $form_state, $filter, $format, $defaults) {
 125   $settings['filter_example_foo'] = array(
 126     '#type' => 'textfield',
 127     '#title' => t('Substitution string'),
 128     '#default_value' => isset($filter->settings['filter_example_foo']) ? $filter->settings['filter_example_foo'] : $defaults['filter_example_foo'],
 129     '#description' => t('The string to substitute for "foo" everywhere in the text.')
 130   );
 131   return $settings;
 132 }
 133 
 134 /**
 135  * Foo filter process callback.
 136  *
 137  * The actual filtering is performed here. The supplied text should be returned,
 138  * once any necessary substitutions have taken place. The example just replaces
 139  * foo with our custom defined string in the settings page.
 140  */
 141 function _filter_example_filter_foo_process($text, $filter, $format) {
 142   $replacement = isset($filter->settings['filter_example_foo']) ? $filter->settings['filter_example_foo'] : 'bar';
 143   return str_replace('foo', $replacement, $text);
 144 }
 145 
 146 
 147 /**
 148  * Filter tips callback for foo filter.
 149  *
 150  * The tips callback allows filters to provide help text to users during the
 151  * content editing process. Short tips are provided on the content editing
 152  * screen, while long tips are provided on a separate linked page. Short tips
 153  * are optional, but long tips are highly recommended.
 154  */
 155 function _filter_example_filter_foo_tips($filter, $format, $long = FALSE) {
 156   $replacement = isset($filter->settings['filter_example_foo']) ? $filter->settings['filter_example_foo'] : 'bar';
 157   if (!$long) {
 158     // This string will be shown in the content add/edit form
 159     return t('<em>foo</em> replaced with %replacement.', array('%replacement' => $replacement));
 160   }
 161   else {
 162     return t('Every instance of "foo" in the input text will be replaced with a configurable value. You can configure this value and put whatever you want there. The replacement value is "%replacement".', array('%replacement' => $replacement));
 163   }
 164 }
 165 
 166 /**
 167  * Time filter prepare callback.
 168  *
 169  * We'll use [filter-example-time] as a replacement for the time tag.
 170  * Note that in a more complicated filter a closing tag may also be
 171  * required. For more information, see "Temporary placeholders and
 172  * delimiters" at http://drupal.org/node/209715.
 173  */
 174 function _filter_example_filter_time_prepare($text, $filter) {
 175   return preg_replace('!<time ?/>!', '[filter-example-time]', $text);
 176 }
 177 
 178 /**
 179  * Time filter process callback.
 180  *
 181  * Now, in the "process" step, we'll search for our escaped time tags and
 182  * do the real filtering: replace the xml tag with the date.
 183  */
 184 function _filter_example_filter_time_process($text, $filter) {
 185   return str_replace('[filter-example-time]', '<em>' . format_date(time()) . '</em>', $text);
 186 }
 187 
 188 
 189 /**
 190  * Filter tips callback for time filter.
 191  *
 192  * The tips callback allows filters to provide help text to users during the
 193  * content editing process. Short tips are provided on the content editing
 194  * screen, while long tips are provided on a separate linked page. Short tips
 195  * are optional, but long tips are highly recommended.
 196  */
 197 function _filter_example_filter_time_tips($filter, $format, $long = FALSE) {
 198   return t('<em>&lt;time /&gt;</em> is replaced with the current time.');
 199 }
 200 
 201 /**
 202  * @} End of "defgroup filter_example".
 203  */
";i:1;N;i:2;N;}i:2;i:301;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9246;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"filter_example.test";i:1;i:2;i:2;i:9246;}i:2;i:9246;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:9246;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3872:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test case for Testing the filter example module.
   6  *
   7  * This file contains the test cases to check if module is performing as
   8  * expected.
   9  */
  10 class FilterExampleTestCase extends DrupalWebTestCase {
  11   protected $web_user;
  12   protected $filtered_html;
  13   protected $full_html;
  14 
  15   public static function getInfo() {
  16     return array(
  17       'name' => 'Filter example functionality',
  18       'description' => 'Verify that content is processed by example filter.',
  19       'group' => 'Examples',
  20     );
  21   }
  22 
  23   /**
  24    * Enable modules and create user with specific permissions.
  25    */
  26   function setUp() {
  27     parent::setUp('filter_example');
  28 
  29     // Load the used input formats.
  30     $this->filtered_html = db_query_range('SELECT * FROM {filter_format} WHERE name = :name', 0, 1, array(':name' => 'Filtered HTML'))->fetchObject();
  31     $this->full_html = db_query_range('SELECT * FROM {filter_format} WHERE name = :name', 0, 1, array(':name' => 'Full HTML'))->fetchObject();
  32 
  33     // Create user.
  34     $this->web_user = $this->drupalCreateUser(array(
  35       'administer filters',
  36       filter_permission_name($this->filtered_html),
  37       filter_permission_name($this->full_html),
  38       'bypass node access',
  39     ));
  40   }
  41 
  42   /**
  43    * Login user, create an example node, and test blog functionality through the admin and user interfaces.
  44    */
  45   function testFilterExampleBasic() {
  46     // Login the admin user.
  47     $this->drupalLogin($this->web_user);
  48 
  49     // Enable both filters in format id 1 (default format)
  50     $edit = array(
  51       'filters[filter_time][status]' => TRUE,
  52       'filters[filter_foo][status]' => TRUE,
  53     );
  54     $this->drupalPost('admin/config/content/formats/' . $this->filtered_html->format, $edit, t('Save configuration'));
  55 
  56     // Create a content type to test the filters (with default format)
  57     $content_type = $this->drupalCreateContentType();
  58 
  59     // Create a test node
  60     $langcode = LANGUAGE_NONE;
  61     $edit = array(
  62       "title" => $this->randomName(),
  63       "body[$langcode][0][value]" => 'What foo is it? it is <time />',
  64     );
  65     $result = $this->drupalPost('node/add/' . $content_type->type, $edit, t('Save'));
  66     $this->assertResponse(200);
  67     $time = format_date(time());
  68     $this->assertRaw('What bar is it? it is <em>' . $time . '</em>');
  69 
  70     // Enable foo filter in other format id 2
  71     $edit = array(
  72       'filters[filter_foo][status]' => TRUE,
  73     );
  74     $this->drupalPost('admin/config/content/formats/' . $this->full_html->format, $edit, t('Save configuration'));
  75 
  76     // Change foo filter replacement with a random string in format id 2
  77     $replacement = $this->randomName();
  78     $options = array(
  79       'filters[filter_foo][settings][filter_example_foo]' => $replacement,
  80     );
  81     $this->drupalPost('admin/config/content/formats/' . $this->full_html->format, $options, t('Save configuration'));
  82 
  83     // Create a test node with content format 2
  84     $langcode = LANGUAGE_NONE;
  85     $edit = array(
  86       "title" => $this->randomName(),
  87       "body[$langcode][0][value]" => 'What foo is it? it is <time />',
  88       "body[$langcode][0][format]" => $this->full_html->format,
  89     );
  90     $result = $this->drupalPost('node/add/' . $content_type->type, $edit, t('Save'));
  91     $this->assertResponse(200);
  92 
  93     // Only foo filter is enabled
  94     $this->assertRaw("What " . $replacement . " is it", 'Foo filter successfully verified.');
  95   }
  96 }
";i:1;N;i:2;N;}i:2;i:9283;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13163;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:13163;}}