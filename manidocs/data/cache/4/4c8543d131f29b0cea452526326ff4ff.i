a:33:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Form Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"form_example.info";i:1;i:2;i:2;i:29;}i:2;i:29;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:163:"
  1 name = Form example
   2 description = Examples of using the Drupal Form API.
   3 package = Example modules
   4 core = 7.x
   5 files[] = form_example.test
";i:1;N;i:2;N;}i:2;i:64;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:236;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"form_example.module";i:1;i:2;i:2;i:236;}i:2;i:236;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:236;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8452:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Examples demonstrating the Drupal Form API.
   6  */
   7 
   8 /**
   9  * @defgroup form_example Example: Form API
  10  * @ingroup examples
  11  * @{
  12  * Examples demonstrating the Drupal Form API.
  13  *
  14  * The Form Example module is a part of the Examples for Developers Project
  15  * and provides various Drupal Form API Examples. You can download and
  16  * experiment with this code at the
  17  * @link http://drupal.org/project/examples Examples for Developers project page. @endlink
  18  */
  19 
  20 /**
  21  * Implements hook_menu().
  22  *
  23  * Here we set up the URLs (menu entries) for the
  24  * form examples. Note that most of the menu items
  25  * have page callbacks and page arguments set, with
  26  * page arguments set to be functions in external files.
  27  */
  28 function form_example_menu() {
  29   $items = array();
  30   $items['examples/form_example'] = array(
  31     'title' => 'Form Example',
  32     'page callback' => 'form_example_intro',
  33     'access callback' => TRUE,
  34     'expanded' => TRUE,
  35   );
  36   $items['examples/form_example/tutorial'] = array(
  37     'title' => 'Form Tutorial',
  38     'page callback' => 'drupal_get_form',
  39     'page arguments' => array('form_example_tutorial_1'),
  40     'access callback' => TRUE,
  41     'description' => 'A set of ten tutorials',
  42     'file' => 'form_example_tutorial.inc',
  43     'type' => MENU_NORMAL_ITEM,
  44   );
  45   $items['examples/form_example/tutorial/1'] = array(
  46     'title' => '#1',
  47     'page callback' => 'drupal_get_form',
  48     'page arguments' => array('form_example_tutorial_1'),
  49     'access callback' => TRUE,
  50     'description' => 'Tutorial 1: Simplest form',
  51     'type' => MENU_DEFAULT_LOCAL_TASK,
  52     'file' => 'form_example_tutorial.inc',
  53   );
  54   $items['examples/form_example/tutorial/2'] = array(
  55     'title' => '#2',
  56     'page callback' => 'drupal_get_form',
  57     'page arguments' => array('form_example_tutorial_2'),
  58     'access callback' => TRUE,
  59     'description' => 'Tutorial 2: Form with a submit button',
  60     'type' => MENU_LOCAL_TASK,
  61     'file' => 'form_example_tutorial.inc',
  62   );
  63   $items['examples/form_example/tutorial/3'] = array(
  64     'title' => '#3',
  65     'page callback' => 'drupal_get_form',
  66     'page arguments' => array('form_example_tutorial_3'),
  67     'access callback' => TRUE,
  68     'description' => 'Tutorial 3: Fieldsets',
  69     'type' => MENU_LOCAL_TASK,
  70     'file' => 'form_example_tutorial.inc',
  71   );
  72   $items['examples/form_example/tutorial/4'] = array(
  73     'title' => '#4',
  74     'page callback' => 'drupal_get_form',
  75     'page arguments' => array('form_example_tutorial_4'),
  76     'access callback' => TRUE,
  77     'description' => 'Tutorial 4: Required fields',
  78     'type' => MENU_LOCAL_TASK,
  79     'file' => 'form_example_tutorial.inc',
  80   );
  81   $items['examples/form_example/tutorial/5'] = array(
  82     'title' => '#5',
  83     'page callback' => 'drupal_get_form',
  84     'page arguments' => array('form_example_tutorial_5'),
  85     'access callback' => TRUE,
  86     'description' => 'Tutorial 5: More element attributes',
  87     'type' => MENU_LOCAL_TASK,
  88     'file' => 'form_example_tutorial.inc',
  89   );
  90   $items['examples/form_example/tutorial/6'] = array(
  91     'title' => '#6',
  92     'page callback' => 'drupal_get_form',
  93     'page arguments' => array('form_example_tutorial_6'),
  94     'access callback' => TRUE,
  95     'description' => 'Tutorial 6: Form with a validate handler',
  96     'type' => MENU_LOCAL_TASK,
  97     'file' => 'form_example_tutorial.inc',
  98   );
  99   $items['examples/form_example/tutorial/7'] = array(
 100     'title' => '#7',
 101     'page callback' => 'drupal_get_form',
 102     'page arguments' => array('form_example_tutorial_7'),
 103     'access callback' => TRUE,
 104     'description' => 'Tutorial 7: Form with a submit handler',
 105     'type' => MENU_LOCAL_TASK,
 106     'file' => 'form_example_tutorial.inc',
 107   );
 108   $items['examples/form_example/tutorial/8'] = array(
 109     'title' => '#8',
 110     'page callback' => 'drupal_get_form',
 111     'page arguments' => array('form_example_tutorial_8'),
 112     'access callback' => TRUE,
 113     'description' => 'Tutorial 8: Basic multistep form',
 114     'type' => MENU_LOCAL_TASK,
 115     'file' => 'form_example_tutorial.inc',
 116   );
 117   $items['examples/form_example/tutorial/9'] = array(
 118     'title' => '#9',
 119     'page callback' => 'drupal_get_form',
 120     'page arguments' => array('form_example_tutorial_9'),
 121     'access callback' => TRUE,
 122     'description' => 'Tutorial 9: Form with dynamically added new fields',
 123     'type' => MENU_LOCAL_TASK,
 124     'file' => 'form_example_tutorial.inc',
 125     'weight' => 9,
 126   );
 127   $items['examples/form_example/tutorial/10'] = array(
 128     'title' => '#10',
 129     'page callback' => 'drupal_get_form',
 130     'page arguments' => array('form_example_tutorial_10'),
 131     'access callback' => TRUE,
 132     'description' => 'Tutorial 11: Form with file upload',
 133     'type' => MENU_LOCAL_TASK,
 134     'file' => 'form_example_tutorial.inc',
 135     'weight' => 10,
 136   );
 137   $items['examples/form_example/states'] = array(
 138     'title' => '#states example',
 139     'page callback' => 'drupal_get_form',
 140     'page arguments' => array('form_example_states_form'),
 141     'access callback' => TRUE,
 142     'description' => 'How to use the #states attribute in FAPI',
 143     'file' => 'form_example_states.inc',
 144   );
 145   $items['examples/form_example/wizard'] = array(
 146     'title' => 'Extensible wizard example',
 147     'page callback' => 'drupal_get_form',
 148     'page arguments' => array('form_example_wizard'),
 149     'access callback' => TRUE,
 150     'description' => 'A general approach to a wizard multistep form.',
 151     'file' => 'form_example_wizard.inc',
 152   );
 153   $items['examples/form_example/element_example'] = array(
 154     'title' => 'Element example',
 155     'page callback' => 'drupal_get_form',
 156     'page arguments' => array('form_example_element_demo_form'),
 157     'access callback' => TRUE,
 158     'file' => 'form_example_elements.inc',
 159     'weight' => 100,
 160   );
 161 
 162   return $items;
 163 }
 164 
 165 /**
 166  * Page callback for our general info page.
 167  */
 168 function form_example_intro() {
 169   $markup = t('The form example module provides a tutorial, extensible multistep example, an element example, and a #states example');
 170   return array('#markup' => $markup);
 171 }
 172 
 173 /**
 174  * Implements hook_help().
 175  */
 176 function form_example_help($path, $arg) {
 177   switch ($path) {
 178     case 'examples/form_example/tutorial':
 179       // TODO: Update the URL.
 180       $help = t('This form example tutorial for Drupal 7 is the code from the <a href="http://drupal.org/node/262422">Handbook 10-step tutorial</a>');
 181       break;
 182     case 'examples/form_example/element_example':
 183       $help = t('The Element Example shows how modules can provide their own Form API element types. Four different element types are demonstrated.');
 184       break;
 185   }
 186   if (!empty($help)) {
 187     return '<p>' . $help . '</p>';
 188   }
 189 }
 190 
 191 /**
 192  * Implements hook_element_info().
 193  *
 194  * To keep the various pieces of the example together in external files,
 195  * this just returns _form_example_elements().
 196  */
 197 function form_example_element_info() {
 198   require_once('form_example_elements.inc');
 199   return _form_example_element_info();
 200 }
 201 
 202 /**
 203  * Implements hook_theme().
 204  *
 205  * The only theme implementation is by the element example. To keep the various
 206  * parts of the example together, this actually returns
 207  * _form_example_element_theme().
 208  */
 209 function form_example_theme($existing, $type, $theme, $path) {
 210   require_once('form_example_elements.inc');
 211   return _form_example_element_theme($existing, $type, $theme, $path);
 212 }
 213 /**
 214  * @} End of "defgroup form_example".
 215  */
";i:1;N;i:2;N;}i:2;i:273;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8734;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"form_example.test";i:1;i:2;i:2;i:8734;}i:2;i:8734;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:8734;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:9619:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test file for form_example module.
   6  */
   7 
   8 /**
   9  * Default test case for the form_example module.
  10  */
  11 class FormExampleTestCase extends DrupalWebTestCase {
  12 
  13   public static function getInfo() {
  14     return array(
  15       'name' => 'Form Example',
  16       'description' => 'Various tests on the form_example module.' ,
  17       'group' => 'Examples',
  18     );
  19   }
  20 
  21   function setUp() {
  22     parent::setUp('form_example');
  23   }
  24 
  25   /**
  26    * Test each tutorial
  27    */
  28   function testTutorials() {
  29     // Tutorial #1
  30     $this->drupalGet('examples/form_example/tutorial');
  31     $this->assertText(t('#9'));
  32 
  33     // #2
  34     $this->drupalPost('examples/form_example/tutorial/2', array('name' => t('name')), t('Submit'));
  35 
  36     // #4
  37     $this->drupalPost('examples/form_example/tutorial/4',
  38       array('first' => t('firstname'), 'last' => t('lastname')), t('Submit'));
  39     $this->drupalPost('examples/form_example/tutorial/4', array(), t('Submit'));
  40     $this->assertText(t('First name field is required'));
  41     $this->assertText(t('Last name field is required'));
  42 
  43     // #5
  44     $this->drupalPost('examples/form_example/tutorial/5',
  45       array('first' => t('firstname'), 'last' => t('lastname')), t('Submit'));
  46     $this->assertText(t('Please enter your first name'));
  47     $this->drupalPost('examples/form_example/tutorial/4', array(), t('Submit'));
  48     $this->assertText(t('First name field is required'));
  49     $this->assertText(t('Last name field is required'));
  50 
  51     // #6
  52     $this->drupalPost('examples/form_example/tutorial/6',
  53       array('first' => t('firstname'), 'last' => t('lastname'), 'year_of_birth' => 1955),
  54       t('Submit'));
  55     $this->assertNoText(t('Enter a year between 1900 and 2000'));
  56     $this->drupalPost('examples/form_example/tutorial/6',
  57       array('first' => t('firstname'), 'last' => t('lastname'), 'year_of_birth' => 1855),
  58       t('Submit'));
  59 
  60     $this->assertText(t('Enter a year between 1900 and 2000'));
  61 
  62     // #7
  63     $this->drupalPost('examples/form_example/tutorial/7',
  64       array('first' => t('firstname'), 'last' => t('lastname'), 'year_of_birth' => 1955),
  65       t('Submit'));
  66     $this->assertText(t('The form has been submitted. name="firstname lastname", year of birth=1955'));
  67     $this->drupalPost('examples/form_example/tutorial/7',
  68       array('first' => t('firstname'), 'last' => t('lastname'), 'year_of_birth' => 1855),
  69       t('Submit'));
  70 
  71     $this->assertText(t('Enter a year between 1900 and 2000'));
  72 
  73       // #8
  74     $this->drupalPost('examples/form_example/tutorial/8',
  75       array('first' => t('firstname'), 'last' => t('lastname'), 'year_of_birth' => 1955),
  76       t('Next >>'));
  77 
  78     $this->drupalPost(NULL, array('color' => t('green')), t('<< Back'));
  79     $this->drupalPost(NULL, array(), t('Next >>'));
  80     $this->drupalPost(NULL, array('color' => t('red')), t('Submit'));
  81     $this->assertText(t('The form has been submitted. name="firstname lastname", year of birth=1955'));
  82     $this->assertText(t('And the favorite color is red'));
  83 
  84     // #9
  85     $url = 'examples/form_example/tutorial/9';
  86     for ($i = 1; $i <= 4; $i++) {
  87       if ($i > 1) {
  88         $url = NULL;  // later steps of multistep form take NULL.
  89       }
  90       $this->drupalPost($url,
  91         array("name[$i][first]" => "firstname $i", "name[$i][last]" => "lastname $i", "name[$i][year_of_birth]" => 1950 + $i),
  92         t('Add another name'));
  93       $this->assertText(t('Name #@num', array('@num' => $i + 1)));
  94     }
  95 
  96     // Now remove the last name added (#5).
  97     $this->drupalPost(NULL, array(), t('Remove latest name'));
  98     $this->assertNoText("Name #5");
  99 
 100     $this->drupalPost(NULL, array(), t('Submit'));
 101 
 102     $this->assertText('Form 9 has been submitted');
 103     for ($i = 1; $i <= 4; $i++) {
 104       $this->assertText(t('@num: firstname @num lastname @num (@year)', array('@num' => $i, '@year' => 1950 + $i)));
 105     }
 106 
 107     // #10
 108     $url = 'examples/form_example/tutorial/10';
 109 
 110     $this->drupalPost($url, array(), t('Submit'));
 111     $this->assertText(t('No file was uploaded.'));
 112 
 113     // Get sample images.
 114     $images = $this->drupalGetTestFiles('image');
 115     foreach ($images as $image) {
 116       $this->drupalPost($url, array('files[file]' => drupal_realpath($image->uri)), t('Submit'));
 117       $this->assertText(t('The form has been submitted and the image has been saved, filename: @filename.', array('@filename' => $image->filename)));
 118     }
 119   }
 120 
 121   /**
 122    * Test Wizard tutorial
 123    * @TODO improve this using drupal_form_submit
 124    */
 125   function testWizard() {
 126     // Is the wizard there
 127     $this->drupalGet('examples/form_example/wizard');
 128     $this->assertText(t('Extensible wizard example'));
 129 
 130     $first_name = $this->randomName(8);
 131     $last_name  = $this->randomName(8);
 132     $city = $this->randomName(8);
 133     $aunts_name = $this->randomName(8);
 134 
 135     // Submit the first step of the wizard
 136     $options = array(
 137       'first_name' => $first_name,
 138       'last_name'  => $last_name,
 139     );
 140     $this->drupalPost('examples/form_example/wizard', $options, t('Next'));
 141 
 142     // A label city is created, and two buttons appear, Preivous and Next
 143     $this->assertText(t('Hint: Do not enter "San Francisco", and do not leave this out.'));
 144 
 145     // Go back to the beginning and verify that the value is there.
 146     $this->drupalPost(NULL, array(), t('Previous'));
 147     $this->assertFieldByName('first_name', $first_name);
 148     $this->assertFieldByName('last_name', $last_name);
 149 
 150     // Go next. We should keep our values.
 151     $this->drupalPost(NULL, array(), t('Next'));
 152     $this->assertText(t('Hint: Do not enter "San Francisco", and do not leave this out.'));
 153 
 154     // Try "San Francisco".
 155     $this->drupalPost(NULL, array('city' => 'San Francisco'), t('Next'));
 156     $this->assertText(t('You were warned not to enter "San Francisco"'));
 157 
 158     // Try the real city.
 159     $this->drupalPost(NULL, array('city' => $city), t('Next'));
 160 
 161     // Enter the Aunt's name, but then the previous button.
 162     $this->drupalPost(NULL, array('aunts_name' => $aunts_name), t('Previous'));
 163     $this->assertFieldByName('city', $city);
 164 
 165     // Now go forward and then press finish; check for correct values.
 166     $this->drupalPost(NULL, array(), t('Next'));
 167     $this->drupalPost(NULL, array('aunts_name' => $aunts_name), t('Finish'));
 168 
 169     $this->assertRaw(t('[first_name] =&gt; @first_name', array('@first_name' => $first_name)));
 170     $this->assertRaw(t('[last_name] =&gt; @last_name', array('@last_name' => $last_name)));
 171     $this->assertRaw(t('[city] =&gt; @city', array('@city' => $city)));
 172     $this->assertRaw(t('[aunts_name] =&gt; @aunts_name', array('@aunts_name' => $aunts_name)));
 173   }
 174 
 175 
 176   /**
 177    * Test the element_example form for correct behavior.
 178    */
 179   function testElementExample() {
 180     // Make one basic POST with a set of values and check for correct responses.
 181     $edit = array(
 182       'a_form_example_textfield' => $this->randomName(),
 183       'a_form_example_checkbox' => TRUE,
 184       'a_form_example_element_discrete[areacode]' => sprintf('%03d', rand(0, 999)),
 185       'a_form_example_element_discrete[prefix]' => sprintf('%03d', rand(0, 999)),
 186       'a_form_example_element_discrete[extension]' => sprintf('%04d', rand(0, 9999)),
 187       'a_form_example_element_combined[areacode]' => sprintf('%03d', rand(0, 999)),
 188       'a_form_example_element_combined[prefix]' => sprintf('%03d', rand(0, 999)),
 189       'a_form_example_element_combined[extension]' => sprintf('%04d', rand(0, 9999)),
 190     );
 191     $this->drupalPost('examples/form_example/element_example', $edit, t('Submit'));
 192     $this->assertText(t('a_form_example_textfield has value @value', array('@value' => $edit['a_form_example_textfield'])));
 193     $this->assertText(t('a_form_example_checkbox has value 1'));
 194     $this->assertPattern(t('/areacode.*!areacode/', array('!areacode' => $edit['a_form_example_element_discrete[areacode]'])));
 195     $this->assertPattern(t('/prefix.*!prefix/', array('!prefix' => $edit['a_form_example_element_discrete[prefix]'])));
 196     $this->assertPattern(t('/extension.*!extension/', array('!extension' => $edit['a_form_example_element_discrete[extension]'])));
 197 
 198     $this->assertText(t('a_form_example_element_combined has value @value', array('@value' => $edit['a_form_example_element_combined[areacode]'] . $edit['a_form_example_element_combined[prefix]'] . $edit['a_form_example_element_combined[extension]'])));
 199 
 200     // Now flip the checkbox and check for correct behavior.
 201     $edit['a_form_example_checkbox'] = FALSE;
 202     $this->drupalPost('examples/form_example/element_example', $edit, t('Submit'));
 203     $this->assertText(t('a_form_example_checkbox has value 0'));
 204   }
 205 }
";i:1;N;i:2;N;}i:2;i:8769;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18397;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"form_example_elements.inc";i:1;i:2;i:2;i:18397;}i:2;i:18397;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:18397;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21154:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * This is an example demonstrating how a module can define custom form and
   6  * render elements.
   7  *
   8  * Form elements are already familiar to anyone who uses Form API. They share
   9  * history with render elements, which are explained in the
  10  * @link render_example.module Render Example @endlink. Examples
  11  * of core form elements are 'textfield', 'checkbox' and 'fieldset'. Drupal
  12  * utilizes hook_elements() to define these FAPI types, and this occurs in
  13  * the core function system_elements().
  14  *
  15  * Each form element has a #type value that determines how it is treated by
  16  * the Form API and how it is ultimately rendered into HTML.
  17  * hook_element_info() allows modules to define new element types, and tells
  18  * the Form API what default values they should automatically be populated with.
  19  *
  20  * By implementing hook_element_info() in your own module, you can create custom
  21  * form (or render) elements with their own properties, validation and theming.
  22  *
  23  * In this example, we define a series of elements that range from trivial
  24  * (a renamed textfield) to more advanced (a telephone number field with each
  25  * portion separately validated).
  26  *
  27  * Since each element can use arbitrary properties (like #process or #dropthis)
  28  * it can be quite complicated to figure out what all the properties actually
  29  * mean. This example won't undertake the exhaustive task of explaining them
  30  * all, as that would probably be impossible.
  31  */
  32 
  33 /**
  34  * @todo: Some additional magic things to explain:
  35  * - #process and process callback (and naming) (in forms)
  36  * - #value and value callback (and naming of the above)
  37  * - #theme and #theme_wrappers
  38  * - What is #return_value?
  39  * - system module provides the standard default elements.
  40  * - What are all the things that can be defined in hook_element_info() and
  41  *   where do the defaults come from?
  42  * - Form elements that have a type that has a matching type in the element
  43  *   array created by hook_element_info() get those items merged with them.
  44  * - #value_callback is called first by form_builder(). Its job is to figure
  45  *   out what the actual value of the element, using #default_value or whatever.
  46  * - #process is then called to allow changes to the whole element (like adding
  47  *   child form elements.)
  48  * - #return_value: chx: you need three different values for form API. You need
  49  *   the default value (#default_value), the value for the element if it gets
  50  *   checked )#return_value) and then #value which is either 0 or the
  51  *   #return_value
  52  */
  53 
  54 /**
  55  * Utility function providing data for form_example_element_info().
  56  *
  57  * This defines several new form element types.
  58  *
  59  * - form_example_textfield: This is actually just a textfield, but provides
  60  *   the new type. If more were to be done with it a theme function could be
  61  *   provided.
  62  * - form_example_checkbox: Nothing more than a regular checkbox, but uses
  63  *   an alternate theme function provided by this module.
  64  * - form_example_phonenumber_discrete: Provides a North-American style
  65  *   three-part phonenumber where the value of the phonenumber is managed
  66  *   as an array of three parts.
  67  * - form_example_phonenumber_combined: Provides a North-American style
  68  *   three-part phonenumber where the actual value is managed as a 10-digit
  69  *   string and only broken up into three parts for the user interface.
  70  *
  71  * form_builder() has significant discussion of #process and #value_callback.
  72  * See also hook_element_info().
  73  *
  74  * system_element_info() contains the Drupal default element types, which can
  75  * also be used as examples.
  76  */
  77 function _form_example_element_info() {
  78   // form_example_textfield is a trivial element based on textfield that
  79   // requires only a definition and a theme function. In this case we provide
  80   // the theme function using the parent "textfield" theme function, but it
  81   // would by default be provided in hook_theme(), by a "form_example_textfield"
  82   // theme implementation, provided by default by the function
  83   // theme_form_example_textfield().  Note that the 'form_example_textfield'
  84   // element type is completely defined here. There is no further code required
  85   // for it.
  86   $types['form_example_textfield'] = array(
  87     // #input = TRUE means that the incoming value will be used to figure out
  88     // what #value will be.
  89     '#input' => TRUE,
  90 
  91     // Use theme('textfield') to format this element on output.
  92     '#theme' => array('textfield'),
  93 
  94     // Do not provide autocomplete.
  95     '#autocomplete_path' => FALSE,
  96 
  97     // Allow theme('form_element') to control the markup surrounding this
  98     // value on output.
  99     '#theme_wrappers' => array('form_element'),
 100   );
 101 
 102   // form_example_checkbox is mostly a copy of the system-defined checkbox
 103   // element.
 104   $types['form_example_checkbox'] = array(
 105     '#input' => TRUE,  // This is an HTML <input>.
 106 
 107     // @todo: Explain #return_value.
 108     '#return_value' => TRUE,
 109 
 110     // Our #process array will use the standard process functions used for a
 111     // regular checkbox.
 112     '#process' => array('form_process_checkbox', 'ajax_process_form'),
 113 
 114     // Use theme('form_example_checkbox') to render this element on output.
 115     '#theme' => 'form_example_checkbox',
 116 
 117     // Use theme('form_element') to provide HTML wrappers for this element.
 118     '#theme_wrappers' => array('form_element'),
 119 
 120     // Place the title after the element (to the right of the checkbox).
 121     // This attribute affects the behavior of theme_form_element().
 122     '#title_display' => 'after',
 123 
 124     // We use the default function name for the value callback, so it does not
 125     // have to be listed explicitly. The pattern for the default function name
 126     // is form_type_TYPENAME_value().
 127     // '#value_callback' => 'form_type_form_example_checkbox_value',
 128   );
 129 
 130   // This discrete phonenumber element keeps its values as the separate elements
 131   // area code, prefix, extension.
 132   $types['form_example_phonenumber_discrete'] = array(
 133     // #input == TRUE means that the form value here will be used to determine
 134     // what #value will be.
 135     '#input' => TRUE,
 136 
 137     // #process is an array of callback functions executed when this element is
 138     // processed. Here it provides the child form elements which define
 139     // areacode, prefix, and extension.
 140     '#process' => array('form_example_phonenumber_discrete_process'),
 141 
 142     // validation handlers for this element. These are in addition to any
 143     // validation handlers that might
 144     '#element_validate' => array('form_example_phonenumber_discrete_validate'),
 145     '#autocomplete_path' => FALSE,
 146     '#theme_wrappers' => array('form_example_inline_form_element'),
 147   );
 148 
 149   // Define form_example_phonenumber_combined, which combines the phone
 150   // number into a single validated text string.
 151   $types['form_example_phonenumber_combined'] = array(
 152     '#input' => TRUE ,
 153     '#process' => array('form_example_phonenumber_combined_process'),
 154     '#element_validate' => array('form_example_phonenumber_combined_validate'),
 155     '#autocomplete_path' => FALSE,
 156     '#value_callback'   => 'form_example_phonenumber_combined_value',
 157     '#default_value' => array(
 158       'areacode' => '',
 159       'prefix' => '',
 160       'extension' => '',
 161     ),
 162     '#theme_wrappers' => array('form_example_inline_form_element'),
 163   );
 164   return $types;
 165 }
 166 
 167 
 168 /**
 169  * Builds the current combined value of the phone number only when the form
 170  * builder is not processing the input.
 171  *
 172  * @param $element
 173  * @param $input
 174  * @param $form_state
 175  *
 176  * @return array
 177  */
 178 function  form_example_phonenumber_combined_value(&$element, $input = FALSE, $form_state = NULL) {
 179   if (!$form_state['process_input']) {
 180     $matches = array();
 181     $match = preg_match('/^(\d{3})(\d{3})(\d{4})$/', $element['#default_value'], $matches);
 182     if ($match) {
 183       array_shift($matches); // get rid of the "all match" element
 184       list($element['areacode'], $element['prefix'], $element['extension']) = $matches;
 185     }
 186   }
 187   return $element;
 188 }
 189 
 190 /**
 191  * Value callback for form_example_checkbox element type.
 192  * Copied from form_type_checkbox_value().
 193  *
 194  * @param $element
 195  *   The form element whose value is being populated.
 196  * @param $input
 197  *   The incoming input to populate the form element. If this is FALSE, meaning
 198  *   there is no input, the element's default value should be returned.
 199  */
 200 function form_type_form_example_checkbox_value($element, $input = FALSE) {
 201   if ($input === FALSE) {
 202     return isset($element['#default_value']) ? $element['#default_value'] : 0;
 203   }
 204   else {
 205     return isset($input) ? $element['#return_value'] : 0;
 206   }
 207 }
 208 
 209 /**
 210  * Process callback for the discrete version of phonenumber.
 211  */
 212 function form_example_phonenumber_discrete_process($element, &$form_state, $complete_form) {
 213   // #tree = TRUE means that the values in $form_state['values'] will be stored
 214   // hierarchically. In this case, the parts of the element will appear in
 215   // $form_state['values'] as
 216   // $form_state['values']['<element_name>']['areacode'],
 217   // $form_state['values']['<element_name>']['prefix'],
 218   // etc. This technique is preferred when an element has member form
 219   // elements.
 220   $element['#tree'] = TRUE;
 221 
 222   // Normal FAPI field definitions, except that #value is defined.
 223   $element['areacode'] = array(
 224     '#type' => 'textfield',
 225     '#size' => 3,
 226     '#maxlength' => 3,
 227     '#value' => $element['#value']['areacode'],
 228     '#required' => TRUE,
 229     '#prefix' => '(',
 230     '#suffix' => ')',
 231   );
 232   $element['prefix'] =  array(
 233     '#type' => 'textfield',
 234     '#size' => 3,
 235     '#maxlength' => 3,
 236     '#required' => TRUE,
 237     '#value' => $element['#value']['prefix'],
 238   );
 239   $element['extension'] =  array(
 240     '#type' => 'textfield',
 241     '#size' => 4,
 242     '#maxlength' => 4,
 243     '#value' => $element['#value']['extension'],
 244   );
 245 
 246   return $element;
 247 }
 248 
 249 /**
 250  * Validation handler for the discrete version of the phone number.
 251  *
 252  * Uses regular expressions to check that:
 253  *  - the area code is a three digit number.
 254  *  - the prefix is numeric 3-digit number.
 255  *  - the extension is a numeric 4-digit number.
 256  *
 257  * Any problems are shown on the form element using form_error().
 258  */
 259 function form_example_phonenumber_discrete_validate($element, &$form_state) {
 260   if (isset($element['#value']['areacode'])) {
 261     if (0 == preg_match('/^\d{3}$/', $element['#value']['areacode'])) {
 262       form_error($element['areacode'], t('The area code is invalid.'));
 263     }
 264   }
 265   if (isset($element['#value']['prefix'])) {
 266     if (0 == preg_match('/^\d{3}$/', $element['#value']['prefix'])) {
 267       form_error($element['prefix'], t('The prefix is invalid.'));
 268     }
 269   }
 270   if (isset($element['#value']['extension'])) {
 271     if (0 == preg_match('/^\d{4}$/', $element['#value']['extension'])) {
 272       form_error($element['extension'], t('The extension is invalid.'));
 273     }
 274   }
 275   return $element;
 276 }
 277 
 278 /**
 279  * Process callback for the combined version of the phonenumber element.
 280  */
 281 function form_example_phonenumber_combined_process($element, &$form_state, $complete_form) {
 282   // #tree = TRUE means that the values in $form_state['values'] will be stored
 283   // hierarchically. In this case, the parts of the element will appear in
 284   // $form_state['values'] as
 285   // $form_state['values']['<element_name>']['areacode'],
 286   // $form_state['values']['<element_name>']['prefix'],
 287   // etc. This technique is preferred when an element has member form
 288   // elements.
 289 
 290   $element['#tree'] = TRUE;
 291 
 292   // Normal FAPI field definitions, except that #value is defined.
 293   $element['areacode'] = array(
 294     '#type' => 'textfield',
 295     '#size' => 3,
 296     '#maxlength' => 3,
 297     '#required' => TRUE,
 298     '#prefix' => '(',
 299     '#suffix' => ')',
 300   );
 301   $element['prefix'] =  array(
 302     '#type' => 'textfield',
 303     '#size' => 3,
 304     '#maxlength' => 3,
 305     '#required' => TRUE,
 306   );
 307   $element['extension'] =  array(
 308     '#type' => 'textfield',
 309     '#size' => 4,
 310     '#maxlength' => 4,
 311     '#required' => TRUE,
 312   );
 313 
 314   $matches = array();
 315   $match = preg_match('/^(\d{3})(\d{3})(\d{4})$/', $element['#default_value'], $matches);
 316   if ($match) {
 317     array_shift($matches); // get rid of the "all match" element
 318     list($element['areacode']['#default_value'], $element['prefix']['#default_value'], $element['extension']['#default_value']) = $matches;
 319   }
 320 
 321   return $element;
 322 }
 323 
 324 /**
 325  * Phone number validation function for the combined phonenumber.
 326  *
 327  * Uses regular expressions to check that:
 328  *  - the area code is a three digit number
 329  *  - the prefix is numeric 3-digit number
 330  *  - the extension is a numeric 4-digit number
 331  *
 332  * Any problems are shown on the form element using form_error().
 333  *
 334  * The combined value is then updated in the element.
 335  */
 336 function form_example_phonenumber_combined_validate($element, &$form_state) {
 337   $lengths = array(
 338     'areacode' => 3,
 339     'prefix' => 3,
 340     'extension' => 4,
 341   );
 342   foreach ($lengths as $member => $length) {
 343     $regex = '/^\d{' . $length . '}$/';
 344     if (!empty($element['#value'][$member]) && 0 == preg_match($regex, $element['#value'][$member])) {
 345       form_error($element[$member], t('@member is invalid', array('@member' => $member)));
 346     }
 347   }
 348 
 349   // Consolidate into the three parts into one combined value.
 350   $value = $element['areacode']['#value'] . $element['prefix']['#value'] . $element['extension']['#value'];
 351   form_set_value($element, $value, $form_state);
 352   return $element;
 353 }
 354 
 355 /**
 356  * Called by form_example_theme() to provide hook_theme().
 357  *
 358  * This is kept in this file so it can be with the theme functions it presents.
 359  * Otherwise it would get lonely.
 360  */
 361 function _form_example_element_theme() {
 362   return array(
 363     'form_example_inline_form_element' => array(
 364       'render element' => 'element',
 365       'file' => 'form_example_elements.inc',
 366     ),
 367     'form_example_checkbox' => array(
 368       'render element' => 'element',
 369       'file' => 'form_example_elements.inc',
 370     ),
 371   );
 372 }
 373 
 374 /**
 375  * Themes a custom checkbox.
 376  *
 377  * This doesn't actually do anything, but is here to show that theming can
 378  * be done here.
 379  */
 380 function theme_form_example_checkbox($variables) {
 381   $element = $variables['element'];
 382   return theme('checkbox', $element);
 383 }
 384 
 385 /**
 386  * Formats child form elements as inline elements.
 387  */
 388 function theme_form_example_inline_form_element($variables) {
 389   $element = $variables['element'];
 390 
 391   // Add element #id for #type 'item'.
 392   if (isset($element['#markup']) && !empty($element['#id'])) {
 393     $attributes['id'] = $element['#id'];
 394   }
 395   // Add element's #type and #name as class to aid with JS/CSS selectors.
 396   $attributes['class'] = array('form-item');
 397   if (!empty($element['#type'])) {
 398     $attributes['class'][] = 'form-type-' . strtr($element['#type'], '_', '-');
 399   }
 400   if (!empty($element['#name'])) {
 401     $attributes['class'][] = 'form-item-' . strtr($element['#name'], array(' ' => '-', '_' => '-', '[' => '-', ']' => ''));
 402   }
 403   // Add a class for disabled elements to facilitate cross-browser styling.
 404   if (!empty($element['#attributes']['disabled'])) {
 405     $attributes['class'][] = 'form-disabled';
 406   }
 407   $output = '<div' . drupal_attributes($attributes) . '>' . "\n";
 408 
 409   // If #title is not set, we don't display any label or required marker.
 410   if (!isset($element['#title'])) {
 411     $element['#title_display'] = 'none';
 412   }
 413   $prefix = isset($element['#field_prefix']) ? '<span class="field-prefix">' . $element['#field_prefix'] . '</span> ' : '';
 414   $suffix = isset($element['#field_suffix']) ? ' <span class="field-suffix">' . $element['#field_suffix'] . '</span>' : '';
 415 
 416   switch ($element['#title_display']) {
 417     case 'before':
 418       $output .= ' ' . theme('form_element_label', $variables);
 419       $output .= ' ' . '<div class="container-inline">' . $prefix . $element['#children'] . $suffix . "</div>\n";
 420       break;
 421 
 422     case 'invisible':
 423     case 'after':
 424       $output .= ' ' . $prefix . $element['#children'] . $suffix;
 425       $output .= ' ' . theme('form_element_label', $variables) . "\n";
 426       break;
 427 
 428     case 'none':
 429     case 'attribute':
 430       // Output no label and no required marker, only the children.
 431       $output .= ' ' . $prefix . $element['#children'] . $suffix . "\n";
 432       break;
 433   }
 434 
 435   if (!empty($element['#description'])) {
 436     $output .= ' <div class="description">' . $element['#description'] . "</div>\n";
 437   }
 438 
 439   $output .= "</div>\n";
 440 
 441   return $output;
 442 }
 443 
 444 /**
 445  * Simple form to demonstrate how to use the various new FAPI elements
 446  * we've defined.
 447  */
 448 function form_example_element_demo_form($form, &$form_state) {
 449   $form['a_form_example_textfield'] = array(
 450     '#type' => 'form_example_textfield',
 451     '#title' => t('Form Example textfield'),
 452     '#default_value' => variable_get('form_example_textfield', ''),
 453     '#description' => t('form_example_textfield is a new type, but it is actually uses the system-provided functions of textfield'),
 454   );
 455 
 456   $form['a_form_example_checkbox'] = array(
 457     '#type' => 'form_example_checkbox',
 458     '#title' => t('Form Example checkbox'),
 459     '#default_value' => variable_get('form_example_checkbox', FALSE),
 460     '#description' => t('Nothing more than a regular checkbox but with a theme provided by this module.')
 461   );
 462 
 463   $form['a_form_example_element_discrete'] = array(
 464     '#type' => 'form_example_phonenumber_discrete',
 465     '#title' => t('Discrete phone number'),
 466     '#default_value' => variable_get('form_example_element_discrete', array('areacode' => '999', 'prefix' => '999', 'extension' => '9999')),
 467     '#description' => t('A phone number : areacode (XXX), prefix (XXX) and extension (XXXX). This one uses a "discrete" element type, one which stores the three parts of the telephone number separately.'),
 468   );
 469 
 470   $form['a_form_example_element_combined'] = array(
 471     '#type' => 'form_example_phonenumber_combined',
 472     '#title' => t('Combined phone number'),
 473     '#default_value' => variable_get('form_example_element_combined', '0000000000'),
 474     '#description' => t('form_example_element_combined one uses a "combined" element type, one with a single 10-digit value which is broken apart when needed.'),
 475   );
 476 
 477   $form['submit'] = array(
 478     '#type' => 'submit',
 479     '#value' => t('Submit'),
 480   );
 481 
 482   return $form;
 483 }
 484 
 485 /**
 486  * Submit handler for form_example_element_demo_form().
 487  */
 488 function form_example_element_demo_form_submit($form, &$form_state) {
 489   // Exclude unnecessary elements.
 490   unset($form_state['values']['submit'], $form_state['values']['form_id'], $form_state['values']['op'], $form_state['values']['form_token'], $form_state['values']['form_build_id']);
 491 
 492   foreach ($form_state['values'] as $key => $value) {
 493     variable_set($key, $value);
 494     drupal_set_message(t('%name has value %value', array('%name' => $key, '%value' => print_r($value, TRUE))));
 495   }
 496 }
";i:1;N;i:2;N;}i:2;i:18440;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:39603;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"form_example_states.inc";i:1;i:2;i:2;i:39603;}i:2;i:39603;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:39603;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11171:"
  1 <?php
   2 
   3 /**
   4  * @file
   5  * An example of how to use the new #states Form API element, allowing
   6  * dynamic form behavior with very simple setup.
   7  */
   8 
   9 /**
  10  * This form shows off the #states system by dynamically showing parts of the
  11  * form based on the state of other parts.
  12  *
  13  * @ingroup form_example
  14  *
  15  * The basic idea is that you add a #states property to the element which is
  16  * to be changed based on some action elsewhere on the form. The #states
  17  * property lists a change which is to be made, and under what conditions
  18  * that change should be made.
  19  *
  20  * For example, in the 'tests_taken' form element below we have:
  21  * @code
  22  * '#states' => array(
  23  *   'visible' => array(
  24  *     ':input[name="student_type"]' => array('value' => 'high_school'),
  25  *   ),
  26  * ),
  27  * @endcode
  28  * Meaning that the element is to be made visible when the condition is met.
  29  * The condition is a combination of a jQuery selector (which selects the
  30  * element we want to test) and a condition for that element. In this case,
  31  * the condition is whether the return value of the 'student_type' element is
  32  * 'high_school'. If it is, this element will be visible.
  33  *
  34  * So the syntax is:
  35  * @code
  36  * '#states' => array(
  37  *   'action_to_take_on_this_form_element' => array(
  38  *     'jquery_selector_for_another_element' => array('condition_type' => value),
  39  *   ),
  40  * ),
  41  * @endcode
  42  *
  43  * If you need an action to take place only when two different conditions are
  44  * true, then you add both of those conditions to the action. See the
  45  * 'country_writein' element below for an example.
  46  *
  47  * Note that the easiest way to select a textfield, checkbox, or select is with
  48  * the @link http://api.jquery.com/input-selector/ ':input' jquery shortcut @endlink,
  49  * which selects any any of those.
  50  *
  51  * There are examples below of changing or hiding an element when a checkbox
  52  * is checked, when a textarea is filled, when a select has a given value.
  53  *
  54  * See drupal_process_states() for full documentation.
  55  *
  56  * See also @link http://api.drupal.org/api/drupal/developer--topics--forms_api_reference.html/7#states Form API Reference @endlink
  57  */
  58 function form_example_states_form($form, &$form_state) {
  59   $form['student_type'] = array(
  60     '#type' => 'radios',
  61     '#options' => array(
  62       'high_school'   => t('High School'),
  63       'undergraduate' => t('Undergraduate'),
  64       'graduate'      => t('Graduate'),
  65     ),
  66     '#title' => t('What type of student are you?')
  67   );
  68   $form['high_school'] = array(
  69     '#type' => 'fieldset',
  70     '#title' => t('High School Information'),
  71     // This #states rule says that the "high school" fieldset should only
  72     // be shown if the "student_type" form element is set to "High School".
  73     '#states' => array(
  74       'visible' => array(
  75         ':input[name="student_type"]' => array('value' => 'high_school'),
  76       ),
  77     ),
  78   );
  79 
  80   // High school information.
  81   $form['high_school']['tests_taken'] = array(
  82     '#type' => 'checkboxes',
  83     '#options' => drupal_map_assoc(array(t('SAT'), t('ACT'))),
  84     '#title' => t('What standardized tests did you take?'),
  85     // This #states rule says that this checkboxes array will be visible only
  86     // when $form['student_type'] is set to t('High School').
  87     // It uses the jQuery selector :input[name=student_type] to choose the
  88     // element which triggers the behavior, and then defines the "High School"
  89     // value as the one that triggers visibility.
  90     '#states' => array(
  91       'visible' => array(   // action to take.
  92         ':input[name="student_type"]' => array('value' => 'high_school'),
  93       ),
  94     ),
  95   );
  96 
  97   $form['high_school']['sat_score'] = array(
  98     '#type' => 'textfield',
  99     '#title' => t('Your SAT score:'),
 100     '#size' => 4,
 101 
 102     // This #states rule limits visibility to when the $form['tests_taken']
 103     // 'SAT' checkbox is checked."
 104     '#states' => array(
 105       'visible' => array(  // action to take.
 106         ':input[name="tests_taken[SAT]"]' => array('checked' => TRUE),
 107       ),
 108     ),
 109   );
 110   $form['high_school']['act_score'] = array(
 111     '#type' => 'textfield',
 112     '#title' => t('Your ACT score:'),
 113     '#size' => 4,
 114 
 115     // Set this element visible if the ACT checkbox above is checked.
 116     '#states' => array(
 117       'visible' => array(  // action to take.
 118         ':input[name="tests_taken[ACT]"]' => array('checked' => TRUE),
 119       ),
 120     ),
 121   );
 122 
 123   // Undergrad information.
 124   $form['undergraduate'] = array(
 125     '#type' => 'fieldset',
 126     '#title' => t('Undergraduate Information'),
 127     // This #states rule says that the "undergraduate" fieldset should only
 128     // be shown if the "student_type" form element is set to "Undergraduate".
 129     '#states' => array(
 130       'visible' => array(
 131         ':input[name="student_type"]' => array('value' => 'undergraduate'),
 132       ),
 133     ),
 134   );
 135 
 136   $form['undergraduate']['how_many_years'] = array(
 137     '#type' => 'select',
 138     '#title' => t('How many years have you completed?'),
 139     // The options here are integers, but since all the action here happens
 140     // using the DOM on the client, we will have to use strings to work with
 141     // them.
 142     '#options' => array(
 143       1 => t('One'),
 144       2 => t('Two'),
 145       3 => t('Three'),
 146       4 => t('Four'),
 147       5 => t('Lots'),
 148     ),
 149   );
 150 
 151   $form['undergraduate']['comment'] = array(
 152     '#type' => 'item',
 153     '#description' => t("Wow, that's a long time."),
 154     '#states' => array(
 155       'visible' => array(
 156         // Note that '5' must be used here instead of the integer 5.
 157         // The information is coming from the DOM as a string.
 158         ':input[name="how_many_years"]' => array('value' => '5'),
 159       ),
 160     ),
 161   );
 162   $form['undergraduate']['school_name'] = array(
 163     '#type' => 'textfield',
 164     '#title' => t('Your college or university:'),
 165   );
 166   $form['undergraduate']['school_country'] = array(
 167     '#type' => 'select',
 168     '#options' => drupal_map_assoc(array(t('UK'), t('Other'))),
 169     '#title' => t('In what country is your college or university located?'),
 170   );
 171   $form['undergraduate']['country_writein'] = array(
 172     '#type' => 'textfield',
 173     '#size' => 20,
 174     '#title' => t('Please enter the name of the country where your college or university is located.'),
 175 
 176     // Only show this field if school_country is set to 'Other'.
 177     '#states' => array(
 178       'visible' => array(  // Action to take: Make visible.
 179         ':input[name="school_country"]' => array('value' => t('Other')),
 180       ),
 181     ),
 182   );
 183 
 184   $form['undergraduate']['thanks'] = array(
 185     '#type' => 'item',
 186     '#description' => t('Thanks for providing both your school and your country.'),
 187     '#states' => array(
 188       // Here visibility requires that two separate conditions be true.
 189       'visible' => array(
 190         'input[name="school_country"]' => array('value' => t('Other')),
 191         'input[name="country_writein"]' => array('filled' => TRUE),
 192       ),
 193     ),
 194   );
 195   $form['undergraduate']['go_away'] = array(
 196     '#type' => 'submit',
 197     '#value' => t('Done with form'),
 198     '#states' => array(
 199       // Here visibility requires that two separate conditions be true.
 200       'visible' => array(
 201         'input[name="school_country"]' => array('value' => t('Other')),
 202         'input[name="country_writein"]' => array('filled' => TRUE),
 203       ),
 204     ),
 205   );
 206 
 207   // Graduate student information.
 208   $form['graduate'] = array(
 209     '#type' => 'fieldset',
 210     '#title' => t('Graduate School Information'),
 211     // This #states rule says that the "graduate" fieldset should only
 212     // be shown if the "student_type" form element is set to "Graduate".
 213     '#states' => array(
 214       'visible' => array(
 215         ':input[name="student_type"]' => array('value' => 'graduate'),
 216       ),
 217     ),
 218   );
 219   $form['graduate']['more_info'] = array(
 220     '#type' => 'textarea',
 221     '#title' => t('Please describe your graduate studies'),
 222   );
 223 
 224   $form['graduate']['info_provide'] = array(
 225     '#type' => 'checkbox',
 226     '#title' => t('Check here if you have provided information above'),
 227     '#disabled' => TRUE,
 228     '#states' => array(
 229       // Mark this checkbox checked if the "more_info" textarea has something
 230       // in it, if it's 'filled'.
 231       'checked' => array(      // Action to take: check the checkbox.
 232         ':input[name="more_info"]' => array('filled' => TRUE),
 233       ),
 234     ),
 235   );
 236 
 237   $form['average'] = array(
 238     '#type' => 'textfield',
 239     '#title' => t('Enter your average'),
 240     // To trigger a state when the same controlling element can have more than
 241     // one possible value, put all values in a higher-level array.
 242     '#states' => array(
 243       'visible' => array(
 244         ':input[name="student_type"]' => array(
 245           array('value' => 'high_school'),
 246           array('value' => 'undergraduate'),
 247         ),
 248       ),
 249     ),
 250   );
 251 
 252   $form['expand_more_info'] = array(
 253     '#type' => 'checkbox',
 254     '#title' => t('Check here if you want to add more information.'),
 255   );
 256   $form['more_info'] = array(
 257     '#type' => 'fieldset',
 258     '#title' => t('Additional Information'),
 259     '#collapsible' => TRUE,
 260     '#collapsed' => TRUE,
 261 
 262     // Expand the expand_more_info fieldset if the box is checked.
 263     '#states' => array(
 264       'expanded' => array(
 265         ':input[name="expand_more_info"]' => array('checked' => TRUE),
 266       ),
 267     ),
 268   );
 269   $form['more_info']['feedback'] = array(
 270     '#type' => 'textarea',
 271     '#title' => t('What do you have to say?'),
 272   );
 273 
 274   $form['submit'] = array(
 275     '#type' => 'submit',
 276     '#value' => t('Submit your information'),
 277   );
 278 
 279   return $form;
 280 }
 281 
 282 /**
 283  * Submit handler for form_example_states_form().
 284  */
 285 function form_example_states_form_submit($form, &$form_state) {
 286   drupal_set_message(t('Submitting values: @values', array('@values' => var_export($form_state['values'], TRUE))));
 287 }
";i:1;N;i:2;N;}i:2;i:39644;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:50824;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"form_example_tutorial.inc";i:1;i:2;i:2;i:50824;}i:2;i:50824;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:50824;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27058:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * This is the Form API Tutorial from the handbook.
   6  *
   7  * It goes through 10 form examples of increasing complexity to demonstrate
   8  * Drupal 7 Form API.
   9  *
  10  * Links are provided inline for the related handbook pages.
  11  *
  12  * @see http://drupal.org/node/262422
  13  */
  14 
  15 /**
  16  * Main Form tutorial page.
  17  *
  18  * @see form_example_tutorial_1()
  19  * @see form_example_tutorial_2()
  20  * @see form_example_tutorial_3()
  21  * @see form_example_tutorial_4()
  22  * @see form_example_tutorial_5()
  23  * @see form_example_tutorial_6()
  24  * @see form_example_tutorial_7()
  25  * @see form_example_tutorial_8()
  26  * @see form_example_tutorial_9()
  27  * @see form_example_tutorial_10()
  28  *
  29  * @ingroup form_example
  30  */
  31 function form_example_tutorial() {
  32   return t('This is a set of 10 form tutorials tied to the <a href="http://drupal.org/node/262422">Drupal handbook</a>.');
  33 }
  34 
  35 //////////////// Tutorial Example 1 //////////////////////
  36 
  37 /**
  38  * This first form function is from the @link http://drupal.org/node/717722 Form Tutorial handbook page @endlink
  39  *
  40  * It just creates a very basic form with a textfield.
  41  *
  42  * This function is called the "form constructor function". It builds the form.
  43  * It takes a two arguments, $form and $form_state, but if drupal_get_form()
  44  * sends additional arguments, they will be provided after $form_state.
  45  *
  46  * @ingroup form_example
  47  */
  48 function form_example_tutorial_1($form, &$form_state) {
  49 
  50   $form['description'] = array(
  51     '#type' => 'item',
  52     '#title' => t('A form with nothing but a textfield'),
  53   );
  54   // This is the first form element. It's a textfield with a label, "Name"
  55   $form['name'] = array(
  56     '#type' => 'textfield',
  57     '#title' => t('Name'),
  58   );
  59   return $form;
  60 }
  61 
  62 
  63 //////////////// Tutorial Example 2 //////////////////////
  64 
  65 /**
  66  * This is Example 2, a basic form with a submit button.
  67  *
  68  * @see http://drupal.org/node/717726
  69  * @ingroup form_example
  70  */
  71 function form_example_tutorial_2($form, &$form_state) {
  72   $form['description'] = array(
  73     '#type' => 'item',
  74     '#title' => t('A simple form with a submit button'),
  75   );
  76 
  77   $form['name'] = array(
  78     '#type' => 'textfield',
  79     '#title' => t('Name'),
  80   );
  81 
  82   // Adds a simple submit button that refreshes the form and clears its
  83   // contents. This is the default behavior for forms.
  84   $form['submit'] = array(
  85     '#type' => 'submit',
  86     '#value' => 'Submit',
  87   );
  88   return $form;
  89 }
  90 
  91 //////////////// Tutorial Example 3 //////////////////////
  92 
  93 /**
  94  * Example 3: A basic form with fieldsets.
  95  *
  96  * We establish a fieldset element and then place two text fields within
  97  * it, one for a first name and one for a last name. This helps us group
  98  * related content.
  99  *
 100  * Study the code below and you'll notice that we renamed the array of the first
 101  * and last name fields by placing them under the $form['name']
 102  * array. This tells Form API these fields belong to the $form['name'] fieldset.
 103  *
 104  * @ingroup form_example
 105  */
 106 function form_example_tutorial_3($form, &$form_state) {
 107   $form['description'] = array(
 108     '#type' => 'item',
 109     '#title' => t('A form with a fieldset'),
 110   );
 111 
 112   $form['name'] = array(
 113     '#type' => 'fieldset',
 114     '#title' => t('Name'),
 115   );
 116   $form['name']['first'] = array(
 117     '#type' => 'textfield',
 118     '#title' => t('First name'),
 119   );
 120   $form['name']['last'] = array(
 121     '#type' => 'textfield',
 122     '#title' => t('Last name'),
 123   );
 124 
 125 
 126   $form['submit'] = array(
 127     '#type' => 'submit',
 128     '#value' => 'Submit',
 129   );
 130   return $form;
 131 }
 132 
 133 
 134 //////////////// Tutorial Example 4 //////////////////////
 135 
 136 /**
 137  * Example 4: Basic form with required fields.
 138  *
 139  * @ingroup form_example
 140  */
 141 function form_example_tutorial_4($form, &$form_state) {
 142   $form['description'] = array(
 143     '#type' => 'item',
 144     '#title' => t('A form with required fields'),
 145   );
 146 
 147   $form['name'] = array(
 148     '#type' => 'fieldset',
 149     '#title' => t('Name'),
 150     // Make the fieldset collapsible.
 151     '#collapsible' => TRUE, // Added
 152     '#collapsed' => FALSE,  // Added
 153   );
 154 
 155   // Make these fields required.
 156   $form['name']['first'] = array(
 157     '#type' => 'textfield',
 158     '#title' => t('First name'),
 159     '#required' => TRUE, // Added
 160   );
 161   $form['name']['last'] = array(
 162     '#type' => 'textfield',
 163     '#title' => t('Last name'),
 164     '#required' => TRUE, // Added
 165   );
 166 
 167   $form['submit'] = array(
 168     '#type' => 'submit',
 169     '#value' => 'Submit',
 170   );
 171   return $form;
 172 }
 173 
 174 
 175 //////////////// Tutorial Example 5 //////////////////////
 176 
 177 /**
 178  * Example 5: Basic form with additional element attributes.
 179  *
 180  * This demonstrates additional attributes of text form fields.
 181  *
 182  * For a more extensive example on element types
 183  * @see http://drupal.org/node/751826
 184  *
 185  * See the @link http://api.drupal.org/api/file/developer/topics/forms_api.html complete form reference @endlink
 186  *
 187  * @ingroup form_example
 188  */
 189 function form_example_tutorial_5($form, &$form_state) {
 190   $form['description'] = array(
 191     '#type' => 'item',
 192     '#title' => t('A form with additional attributes'),
 193     '#description' => t('This one adds #default_value and #description'),
 194   );
 195   $form['name'] = array(
 196     '#type' => 'fieldset',
 197     '#title' => t('Name'),
 198     '#collapsible' => TRUE,
 199     '#collapsed' => FALSE,
 200   );
 201 
 202   $form['name']['first'] = array(
 203     '#type' => 'textfield',
 204     '#title' => t('First name'),
 205     '#required' => TRUE,
 206     '#default_value' => "First name", // added default value.
 207     '#description' => "Please enter your first name.", // added description
 208     '#size' => 20, // added
 209     '#maxlength' => 20, // added
 210   );
 211   $form['name']['last'] = array(
 212     '#type' => 'textfield',
 213     '#title' => t('Last name'),
 214     '#required' => TRUE,
 215   );
 216   $form['submit'] = array(
 217     '#type' => 'submit',
 218     '#value' => 'Submit',
 219   );
 220   return $form;
 221 }
 222 
 223 
 224 //////////////// Tutorial Example 6 //////////////////////
 225 
 226 /**
 227  * Example 6: A basic form with a validate handler.
 228  *
 229  * From http://drupal.org/node/717736
 230  * @see form_example_tutorial_6_validate()
 231  */
 232 function form_example_tutorial_6($form, &$form_state) {
 233   $form['description'] = array(
 234     '#type' => 'item',
 235     '#title' => t('A form with a validation handler'),
 236   );
 237 
 238   $form['name'] = array(
 239     '#type' => 'fieldset',
 240     '#title' => t('Name'),
 241     '#collapsible' => TRUE,
 242     '#collapsed' => FALSE,
 243   );
 244   $form['name']['first'] = array(
 245     '#type' => 'textfield',
 246     '#title' => t('First name'),
 247     '#required' => TRUE,
 248     '#default_value' => "First name",
 249     '#description' => "Please enter your first name.",
 250     '#size' => 20,
 251     '#maxlength' => 20,
 252   );
 253   $form['name']['last'] = array(
 254     '#type' => 'textfield',
 255     '#title' => t('Last name'),
 256     '#required' => TRUE,
 257   );
 258 
 259   // New form field added to permit entry of year of birth.
 260   // The data entered into this field will be validated with
 261   // the default validation function.
 262   $form['year_of_birth'] = array(
 263     '#type' => 'textfield',
 264     '#title' => "Year of birth",
 265     '#description' => 'Format is "YYYY"',
 266   );
 267 
 268   $form['submit'] = array(
 269     '#type' => 'submit',
 270     '#value' => 'Submit',
 271   );
 272   return $form;
 273 }
 274 
 275 
 276 
 277 /**
 278  * Now we add a handler/function to validate the data entered into the
 279  * "year of birth" field to make sure it's between the values of 1900
 280  * and 2000. If not, it displays an error. The value report is
 281  * $form_state['values'] (see http://drupal.org/node/144132#form-state).
 282  *
 283  * Notice the name of the function. It is simply the name of the form
 284  * followed by '_validate'. This is always the name of the default validation
 285  * function. An alternate list of validation functions could have been provided
 286  * in $form['#validate'].
 287  *
 288  * @see form_example_tutorial_6()
 289  */
 290 function form_example_tutorial_6_validate($form, &$form_state) {
 291   $year_of_birth = $form_state['values']['year_of_birth'];
 292   if ($year_of_birth && ($year_of_birth < 1900 || $year_of_birth > 2000)) {
 293     form_set_error('year_of_birth', t('Enter a year between 1900 and 2000.'));
 294   }
 295 }
 296 
 297 
 298 //////////////// Tutorial Example 7 //////////////////////
 299 
 300 /**
 301  * Example 7: With a submit handler.
 302  *
 303  * From the handbook page:
 304  * http://drupal.org/node/717740
 305  *
 306  * @see form_example_tutorial_7_validate()
 307  * @see form_example_tutorial_7_submit()
 308  * @ingroup form_example
 309  */
 310 function form_example_tutorial_7($form, &$form_state) {
 311   $form['description'] = array(
 312     '#type' => 'item',
 313     '#title' => t('A form with a submit handler'),
 314   );
 315   $form['name'] = array(
 316     '#type' => 'fieldset',
 317     '#title' => t('Name'),
 318     '#collapsible' => TRUE,
 319     '#collapsed' => FALSE,
 320   );
 321   $form['name']['first'] = array(
 322     '#type' => 'textfield',
 323     '#title' => t('First name'),
 324     '#required' => TRUE,
 325     '#default_value' => "First name",
 326     '#description' => "Please enter your first name.",
 327     '#size' => 20,
 328     '#maxlength' => 20,
 329   );
 330   $form['name']['last'] = array(
 331     '#type' => 'textfield',
 332     '#title' => t('Last name'),
 333     '#required' => TRUE,
 334   );
 335   $form['year_of_birth'] = array(
 336     '#type' => 'textfield',
 337     '#title' => "Year of birth",
 338     '#description' => 'Format is "YYYY"',
 339   );
 340   $form['submit'] = array(
 341     '#type' => 'submit',
 342     '#value' => 'Submit',
 343   );
 344   return $form;
 345 }
 346 
 347 
 348 /**
 349  * Validation function for form_example_tutorial_7().
 350  */
 351 function form_example_tutorial_7_validate($form, &$form_state) {
 352   $year_of_birth = $form_state['values']['year_of_birth'];
 353   if ($year_of_birth && ($year_of_birth < 1900 || $year_of_birth > 2000)) {
 354     form_set_error('year_of_birth', t('Enter a year between 1900 and 2000.'));
 355   }
 356 }
 357 
 358 /**
 359  * Submit function for form_example_tutorial_7().
 360  *
 361  * Adds a submit handler/function to our form to send a successful
 362  * completion message to the screen.
 363  */
 364 function form_example_tutorial_7_submit($form, &$form_state) {
 365   drupal_set_message(t('The form has been submitted. name="@first @last", year of birth=@year_of_birth',
 366     array('@first' => $form_state['values']['first'], '@last' => $form_state['values']['last'], '@year_of_birth' => $form_state['values']['year_of_birth'])));
 367 }
 368 
 369 
 370 //////////////// Tutorial Example 8 //////////////////////
 371 
 372 /**
 373  * Example 8: A simple multistep form with a Next and a Back button.
 374  *
 375  * Handbook page: http://drupal.org/node/717750.
 376  *
 377  * For more extensive multistep forms, see
 378  * @link form_example_wizard.inc form_example_wizard.inc @endlink
 379  *
 380  *
 381  * Adds logic to our form builder to give it two pages.
 382  * The @link ajax_example_wizard AJAX Example's Wizard Example @endlink
 383  * gives an AJAX version of this same idea.
 384  *
 385  * @see form_example_tutorial_8_page_two()
 386  * @see form_example_tutorial_8_page_two_back()
 387  * @see form_example_tutorial_8_page_two_submit()
 388  * @see form_example_tutorial_8_next_submit()
 389  * @see form_example_tutorial.inc
 390  * @ingroup form_example
 391  */
 392 function form_example_tutorial_8($form, &$form_state) {
 393 
 394   // Display page 2 if $form_state['page_num'] == 2
 395   if (!empty($form_state['page_num']) && $form_state['page_num'] == 2) {
 396     return form_example_tutorial_8_page_two($form, $form_state);
 397   }
 398 
 399   // Otherwise we build page 1.
 400   $form_state['page_num'] = 1;
 401 
 402   $form['description'] = array(
 403     '#type' => 'item',
 404     '#title' => t('A basic multistep form (page 1)'),
 405   );
 406 
 407   $form['first'] = array(
 408     '#type' => 'textfield',
 409     '#title' => t('First name'),
 410     '#description' => "Please enter your first name.",
 411     '#size' => 20,
 412     '#maxlength' => 20,
 413     '#required' => TRUE,
 414     '#default_value' => !empty($form_state['values']['first']) ? $form_state['values']['first'] : '',
 415   );
 416   $form['last'] = array(
 417     '#type' => 'textfield',
 418     '#title' => t('Last name'),
 419     '#default_value' => !empty($form_state['values']['last']) ? $form_state['values']['last'] : '',
 420   );
 421   $form['year_of_birth'] = array(
 422     '#type' => 'textfield',
 423     '#title' => "Year of birth",
 424     '#description' => 'Format is "YYYY"',
 425     '#default_value' => !empty($form_state['values']['year_of_birth']) ? $form_state['values']['year_of_birth'] : '',
 426   );
 427   $form['next'] = array(
 428     '#type' => 'submit',
 429     '#value' => 'Next >>',
 430     '#submit' => array('form_example_tutorial_8_next_submit'),
 431     '#validate' => array('form_example_tutorial_8_next_validate'),
 432   );
 433   return $form;
 434 }
 435 
 436 /**
 437  * Returns the form for the second page of form_example_tutorial_8().
 438  */
 439 function form_example_tutorial_8_page_two($form, &$form_state) {
 440   $form['description'] = array(
 441     '#type' => 'item',
 442     '#title' => t('A basic multistep form (page 2)'),
 443   );
 444 
 445   $form['color'] = array(
 446     '#type' => 'textfield',
 447     '#title' => t('Favorite color'),
 448     '#required' => TRUE,
 449     '#default_value' => !empty($form_state['values']['color']) ? $form_state['values']['color'] : '',
 450   );
 451   $form['submit'] = array(
 452     '#type' => 'submit',
 453     '#value' => t('Submit'),
 454     '#submit' => array('form_example_tutorial_8_page_two_submit'),
 455   );
 456   $form['back'] = array(
 457     '#type' => 'submit',
 458     '#value' => t('<< Back'),
 459     '#submit' => array('form_example_tutorial_8_page_two_back'),
 460     // We won't bother validating the required 'color' field, since they
 461     // have to come back to this page to submit anyway.
 462     '#limit_validation_errors' => array(),
 463   );
 464   return $form;
 465 }
 466 
 467 
 468 /**
 469  * Validate handler for the next button on first page.
 470  */
 471 function form_example_tutorial_8_next_validate($form, &$form_state) {
 472   $year_of_birth = $form_state['values']['year_of_birth'];
 473   if ($year_of_birth && ($year_of_birth < 1900 || $year_of_birth > 2000)) {
 474     form_set_error('year_of_birth', t('Enter a year between 1900 and 2000.'));
 475   }
 476 }
 477 
 478 /**
 479  * Submit handler for form_example_tutorial_8() next button.
 480  *
 481  * Capture the values from page one and store them away so they can be used
 482  * at final submit time.
 483  */
 484 function form_example_tutorial_8_next_submit($form, &$form_state) {
 485 
 486   // Values are saved for each page.
 487   // to carry forward to subsequent pages in the form.
 488   // and we tell FAPI to rebuild the form.
 489   $form_state['page_values'][1] = $form_state['values'];
 490 
 491   if (!empty($form_state['page_values'][2])) {
 492     $form_state['values'] = $form_state['page_values'][2];
 493   }
 494 
 495   // When form rebuilds, it will look at this to figure which page to build.
 496   $form_state['page_num'] = 2;
 497   $form_state['rebuild'] = TRUE;
 498 }
 499 
 500 /**
 501  * Back button handler submit handler.
 502  *
 503  * Since #limit_validation_errors = array() is set, values from page 2
 504  * will be discarded. We load the page 1 values instead.
 505  */
 506 function form_example_tutorial_8_page_two_back($form, &$form_state) {
 507   $form_state['values'] = $form_state['page_values'][1];
 508   $form_state['page_num'] = 1;
 509   $form_state['rebuild'] = TRUE;
 510 }
 511 
 512 /**
 513  * The page 2 submit handler.
 514  *
 515  * This is the final submit handler. Gather all the data together and output
 516  * it in a drupal_set_message().
 517  */
 518 function form_example_tutorial_8_page_two_submit($form, &$form_state) {
 519   // Normally, some code would go here to alter the database with the data
 520   // collected from the form. Instead sets a message with drupal_set_message()
 521   // to validate that the code worked.
 522   $page_one_values = $form_state['page_values'][1];
 523   drupal_set_message(t('The form has been submitted. name="@first @last", year of birth=@year_of_birth',
 524   array('@first' => $page_one_values['first'], '@last' => $page_one_values['last'], '@year_of_birth' => $page_one_values['year_of_birth'])));
 525 
 526   if (!empty($page_one_values['first2'])) {
 527     drupal_set_message(t('Second name: name="@first @last", year of birth=@year_of_birth',
 528     array('@first' => $page_one_values['first2'], '@last' => $page_one_values['last2'], '@year_of_birth' => $page_one_values['year_of_birth2'])));
 529   }
 530   drupal_set_message(t('And the favorite color is @color', array('@color' => $form_state['values']['color'])));
 531 
 532   // If we wanted to redirect on submission, set $form_state['redirect']. For
 533   // simple redirects, the value can be a string of the path to redirect to. For
 534   // example, to redirect to /node, one would specify the following:
 535   //
 536   // $form_state['redirect'] = 'node';
 537   //
 538   // For more complex redirects, this value can be set to an array of options to
 539   // pass to drupal_goto(). For example, to redirect to /foo?bar=1#baz, one
 540   // would specify the following:
 541   //
 542   // $form_state['redirect'] = array(
 543   //   'foo',
 544   //   array(
 545   //     'query' => array('bar' => 1),
 546   //     'fragment' => 'baz',
 547   //   ),
 548   // );
 549   //
 550   // The first element in the array is the path to redirect to, and the second
 551   // element in the array is the array of options. For more information on the
 552   // available options, see http://api.drupal.org/url.
 553 }
 554 
 555 //////////////// Tutorial Example 9 //////////////////////
 556 
 557 /**
 558  * Example 9: A form with a dynamically added new fields.
 559  *
 560  * This example adds default values so that when the form is rebuilt,
 561  * the form will by default have the previously-entered values.
 562  *
 563  * From handbook page http://drupal.org/node/717746.
 564  *
 565  * @see form_example_tutorial_9_add_name()
 566  * @see form_example_tutorial_9_remove_name()
 567  * @see form_example_tutorial_9_submit()
 568  * @see form_example_tutorial_9_validate()
 569  * @ingroup form_example
 570  */
 571 function form_example_tutorial_9($form, &$form_state) {
 572 
 573   // We will have many fields with the same name, so we need to be able to
 574   // access the form hierarchically.
 575   $form['#tree'] = TRUE;
 576 
 577   $form['description'] = array(
 578     '#type' => 'item',
 579     '#title' => t('A form with dynamically added new fields'),
 580   );
 581 
 582   if (empty($form_state['num_names'])) {
 583     $form_state['num_names'] = 1;
 584   }
 585 
 586   // Build the number of name fieldsets indicated by $form_state['num_names']
 587   for ($i = 1; $i <= $form_state['num_names']; $i++) {
 588     $form['name'][$i] = array(
 589       '#type' => 'fieldset',
 590       '#title' => t('Name #@num', array('@num' => $i)),
 591       '#collapsible' => TRUE,
 592       '#collapsed' => FALSE,
 593     );
 594 
 595     $form['name'][$i]['first'] = array(
 596       '#type' => 'textfield',
 597       '#title' => t('First name'),
 598       '#description' => t("Enter first name."),
 599       '#size' => 20,
 600       '#maxlength' => 20,
 601       '#required' => TRUE,
 602     );
 603     $form['name'][$i]['last'] = array(
 604       '#type' => 'textfield',
 605       '#title' => t('Enter Last name'),
 606       '#required' => TRUE,
 607     );
 608     $form['name'][$i]['year_of_birth'] = array(
 609       '#type' => 'textfield',
 610       '#title' => t("Year of birth"),
 611       '#description' => t('Format is "YYYY"'),
 612     );
 613   }
 614   $form['submit'] = array(
 615     '#type' => 'submit',
 616     '#value' => 'Submit',
 617   );
 618 
 619   // Adds "Add another name" button
 620   $form['add_name'] = array(
 621     '#type' => 'submit',
 622     '#value' => t('Add another name'),
 623     '#submit' => array('form_example_tutorial_9_add_name'),
 624   );
 625 
 626   // If we have more than one name, this button allows removal of the
 627   // last name.
 628   if ($form_state['num_names'] > 1) {
 629     $form['remove_name'] = array(
 630       '#type' => 'submit',
 631       '#value' => t('Remove latest name'),
 632       '#submit' => array('form_example_tutorial_9_remove_name'),
 633       // Since we are removing a name, don't validate until later.
 634       '#limit_validation_errors' => array(),
 635     );
 636   }
 637 
 638   return $form;
 639 }
 640 
 641 /**
 642  * Submit handler for "Add another name" button on form_example_tutorial_9().
 643  *
 644  * $form_state['num_names'] tells the form builder function how many name
 645  * fieldsets to build, so here we increment it.
 646  *
 647  * All elements of $form_state are persisted, so there's no need to use a
 648  * particular key, like the old $form_state['storage']. We can just use
 649  * $form_state['num_names'].
 650  */
 651 function form_example_tutorial_9_add_name($form, &$form_state) {
 652   // Everything in $form_state is persistent, so we'll just use
 653   // $form_state['add_name']
 654   $form_state['num_names']++;
 655 
 656   // Setting $form_state['rebuild'] = TRUE causes the form to be rebuilt again.
 657   $form_state['rebuild'] = TRUE;
 658 }
 659 
 660 
 661 function form_example_tutorial_9_remove_name($form, &$form_state) {
 662   if ($form_state['num_names'] > 1) {
 663     $form_state['num_names']--;
 664   }
 665 
 666   // Setting $form_state['rebuild'] = TRUE causes the form to be rebuilt again.
 667   $form_state['rebuild'] = TRUE;
 668 }
 669 
 670 /**
 671  * Validate function for form_example_tutorial_9().
 672  *
 673  * Adds logic to validate the form to check the validity of the new fields,
 674  * if they exist.
 675  */
 676 function form_example_tutorial_9_validate($form, &$form_state) {
 677 
 678   for ($i = 1; $i <= $form_state['num_names']; $i++) {
 679     $year_of_birth = $form_state['values']['name'][$i]['year_of_birth'];
 680 
 681     if ($year_of_birth && ($year_of_birth < 1900 || $year_of_birth > 2000)) {
 682       form_set_error("name][$i][year_of_birth", t('Enter a year between 1900 and 2000.'));
 683     }
 684   }
 685 }
 686 
 687 /**
 688  * Submit function for form_example_tutorial_9().
 689  */
 690 function form_example_tutorial_9_submit($form, &$form_state) {
 691   $output = t("Form 9 has been submitted.");
 692   for ($i = 1; $i <= $form_state['num_names']; $i++) {
 693     $output .= t("@num: @first @last (@date)... ", array('@num' => $i, '@first' => $form_state['values']['name'][$i]['first'],
 694       '@last' =>  $form_state['values']['name'][$i]['last'], '@date' =>  $form_state['values']['name'][$i]['year_of_birth']));
 695   }
 696   drupal_set_message($output);
 697 }
 698 
 699 //////////////// Tutorial Example 10 //////////////////////
 700 
 701 /**
 702  * Example 10: A form with a file upload field.
 703  *
 704  * This example allows the user to upload a file to Drupal which is stored
 705  * physically and with a reference in the database.
 706  *
 707  * @see form_example_tutorial_10_submit()
 708  * @see form_example_tutorial_10_validate()
 709  * @ingroup form_example
 710  */
 711 function form_example_tutorial_10($form_state) {
 712   // If you are familiar with how browsers handle files, you know that
 713   // enctype="multipart/form-data" is required. Drupal takes care of that, so
 714   // you don't need to include it yourself.
 715 
 716   $form['file'] = array(
 717     '#type' => 'file',
 718     '#title' => t('Image'),
 719     '#description' => t('Upload a file, allowed extensions: jpg, jpeg, png, gif'),
 720   );
 721 
 722   $form['submit'] = array(
 723     '#type' => 'submit',
 724     '#value' => t('Submit'),
 725   );
 726 
 727   return $form;
 728 }
 729 
 730 /**
 731  * Validate handler for form_example_tutorial_10().
 732  */
 733 function form_example_tutorial_10_validate($form, &$form_state) {
 734   $file = file_save_upload('file', array(
 735     'file_validate_is_image' => array(), // Validates file is really an image.
 736     'file_validate_extensions' => array('png gif jpg jpeg'), // Validate extensions.
 737   ));
 738   // If the file passed validation:
 739   if ($file) {
 740     // Move the file, into the Drupal file system
 741     if ($file = file_move($file, 'public://')) {
 742       // Save the file for use in the submit handler.
 743       $form_state['storage']['file'] = $file;
 744     }
 745     else {
 746       form_set_error('file', t('Failed to write the uploaded file to the site\'s file folder.'));
 747     }
 748   }
 749   else {
 750     form_set_error('file', t('No file was uploaded.'));
 751   }
 752 }
 753 
 754 /**
 755  * Submit handler for form_example_tutorial_10().
 756  */
 757 function form_example_tutorial_10_submit($form, &$form_state) {
 758   $file = $form_state['storage']['file'];
 759   // We are done with the file, remove it from storage.
 760   unset($form_state['storage']['file']);
 761   // Make the storage of the file permanent
 762   $file->status = FILE_STATUS_PERMANENT;
 763   // Save file status.
 764   file_save($file);
 765   // Set a response to the user.
 766   drupal_set_message(t('The form has been submitted and the image has been saved, filename: @filename.', array('@filename' => $file->filename)));
 767 }
";i:1;N;i:2;N;}i:2;i:50867;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:77934;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"form_example_wizard.inc";i:1;i:2;i:2;i:77934;}i:2;i:77934;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:77934;}i:30;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:12658:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Extensible wizard form example.
   6  */
   7 
   8 /**
   9  * Extensible wizard form example.
  10  *
  11  * This is an example of a multistep form using a wizard style. It will include
  12  * the 'Previous' and 'Next' buttons when required, and a 'Finish' button at the
  13  * last stage of the form submission.
  14  *
  15  * This example is an extensible skeleton that can include (even
  16  * programatically) more steps. The demonstration form includes three steps,
  17  * each step having its own validation functions.
  18  *
  19  * How to extend this example:
  20  * - Steps are defined in the _form_example_steps() function. Include or alter
  21  *   the steps as you require.
  22  * - For each step, implement the corresponding 'form' function (see
  23  *   'form_example_wizard_personal_info' for the first step in this example.)
  24  *   Each step is a regular form, and the wizard collects all the values of the
  25  *   included forms.
  26  * - Optionally, you may include custom validation functions using the regular
  27  *   validation hook (formname_validate). The wizard uses these validation
  28  *   functions for each step.
  29  * - The most important customization step is to change the submit handler and
  30  *   do whatever you want with the collected information. In this case, the
  31  *   example just shows the collected values in the various steps.
  32  * @ingroup form_example
  33  */
  34 
  35 /**
  36  * Returns the list of steps and their associated forms. This has been separated
  37  * to clarify and easy the understanding of this example. You should edit this
  38  * function to include the steps your wizard/multistep form requires.
  39  *
  40  * @return $array
  41  *
  42  * @ingroup form_example
  43  */
  44 function _form_example_steps() {
  45   return array(
  46       1 => array(
  47         'form' => 'form_example_wizard_personal_info',
  48       ),
  49       2 => array(
  50         'form' => 'form_example_wizard_location_info',
  51       ),
  52       3 => array(
  53         'form' => 'form_example_wizard_other_info',
  54       ),
  55     );
  56 }
  57 
  58 /**
  59  * The primary formbuilder function for the wizard form. This is the form that
  60  * you should call with drupal_get_form() from your code, and it will include
  61  * the rest of the step forms defined. You are not required to change this
  62  * function, as this will handle all the step actions for you.
  63  *
  64  * This form has two defined submit handlers to process the different steps:
  65  *  - Previous: handles the way to get back one step in the wizard.
  66  *  - Next:     handles each step form submission,
  67  *
  68  * The third handler, the finish button handler, is the default form _submit
  69  * handler used to process the information.
  70  *
  71  * You are not required to change the next or previous handlers, but you must
  72  * change the form_example_wizard_sbumit handler to perform the operations you
  73  * need on the collected information.
  74  *
  75  * @ingroup form_example
  76  */
  77 function form_example_wizard($form, &$form_state) {
  78 
  79   // Initialize a description of the steps for the wizard.
  80   if (empty($form_state['step'])) {
  81     $form_state['step'] = 1;
  82 
  83     // This array contains the function to be called at each step to get the
  84     // relevant form elements. It will also store state information for each
  85     // step.
  86     $form_state['step_information'] = _form_example_steps();
  87   }
  88   $step = &$form_state['step'];
  89   drupal_set_title(t('Extensible Wizard: Step @step', array('@step' => $step)));
  90 
  91   // Call the function named in $form_state['step_information'] to get the
  92   // form elements to display for this step.
  93   $form = $form_state['step_information'][$step]['form']($form, $form_state);
  94 
  95   // Show the 'previous' button if appropriate. Note that #submit is set to
  96   // a special submit handler, and that we use #limit_validation_errors to
  97   // skip all complaints about validation when using the back button. The
  98   // values entered will be discarded, but they will not be validated, which
  99   // would be annoying in a "back" button.
 100   if ($step > 1) {
 101     $form['prev'] = array(
 102       '#type' => 'submit',
 103       '#value' => t('Previous'),
 104       '#name' => 'prev',
 105       '#submit' => array('form_example_wizard_previous_submit'),
 106       '#limit_validation_errors' => array(),
 107     );
 108   }
 109 
 110   // Show the Next button only if there are more steps defined.
 111   if ($step < count($form_state['step_information'])) {
 112     // The Next button should be included on every step
 113     $form['next'] = array(
 114       '#type' => 'submit',
 115       '#value' => t('Next'),
 116       '#name' => 'next',
 117       '#submit' => array('form_example_wizard_next_submit'),
 118     );
 119   }
 120   else {
 121     // Just in case there are no more steps, we use the default submit handler
 122     // of the form wizard. Call this button Finish, Submit, or whatever you
 123     // want to show. When this button is clicked, the
 124     // form_example_wizard_submit handler will be called.
 125     $form['finish'] = array(
 126       '#type' => 'submit',
 127       '#value' => t('Finish'),
 128     );
 129   }
 130 
 131   // Include each validation function defined for the different steps.
 132   if (function_exists($form_state['step_information'][$step]['form'] . '_validate')) {
 133     $form['next']['#validate'] = array($form_state['step_information'][$step]['form'] . '_validate');
 134   }
 135 
 136   return $form;
 137 }
 138 
 139 /**
 140  * Submit handler for the "previous" button.
 141  * - Stores away $form_state['values']
 142  * - Decrements the step counter
 143  * - Replaces $form_state['values'] with the values from the previous state.
 144  * - Forces form rebuild.
 145  *
 146  * You are not required to change this function.
 147  *
 148  * @ingroup form_example
 149  */
 150 function form_example_wizard_previous_submit($form, &$form_state) {
 151   $current_step = &$form_state['step'];
 152   $form_state['step_information'][$current_step]['stored_values'] = $form_state['values'];
 153   if ($current_step > 1) {
 154     $current_step--;
 155     $form_state['values'] = $form_state['step_information'][$current_step]['stored_values'];
 156   }
 157   $form_state['rebuild'] = TRUE;
 158 }
 159 
 160 /**
 161  * Submit handler for the 'next' button.
 162  * - Saves away $form_state['values']
 163  * - Increments the step count.
 164  * - Replace $form_state['values'] from the last time we were at this page
 165  *   or with array() if we haven't been here before.
 166  * - Force form rebuild.
 167  *
 168  * You are not required to change this function.
 169  *
 170  * @param $form
 171  * @param $form_state
 172  *
 173  * @ingroup form_example
 174  */
 175 function form_example_wizard_next_submit($form, &$form_state) {
 176   $current_step = &$form_state['step'];
 177   $form_state['step_information'][$current_step]['stored_values'] = $form_state['values'];
 178 
 179   if ($current_step < count($form_state['step_information'])) {
 180     $current_step++;
 181     if (!empty($form_state['step_information'][$current_step]['stored_values'])) {
 182       $form_state['values'] = $form_state['step_information'][$current_step]['stored_values'];
 183     }
 184     else {
 185       $form_state['values'] = array();
 186     }
 187     $form_state['rebuild'] = TRUE;  // Force rebuild with next step.
 188     return;
 189   }
 190 }
 191 
 192 /**
 193  * The previous code was a 'skeleton' of a multistep wizard form. You are not
 194  * required to change a line on the previous code (apart from defining your own
 195  * steps in the _form_example_steps() function.
 196  *
 197  * All the code included from here is the content of the wizard, the steps of
 198  * the form.
 199  *
 200  * First, let's show the defined steps for the wizard example.
 201  * @ingroup form_example
 202  */
 203 
 204 /**
 205  * Returns form elements for the 'personal info' page of the wizard. This is the
 206  * first step of the wizard, asking for two textfields: first name and last
 207  * name.
 208  *
 209  * @ingroup form_example
 210  */
 211 function form_example_wizard_personal_info($form, &$form_state) {
 212   $form = array();
 213   $form['first_name'] = array(
 214     '#type' => 'textfield',
 215     '#title' => t('First Name'),
 216     '#default_value' => !empty($form_state['values']['first_name']) ? $form_state['values']['first_name'] : '',
 217   );
 218   $form['last_name'] = array(
 219     '#type' => 'textfield',
 220     '#title' => t('Last Name'),
 221     '#default_value' => !empty($form_state['values']['last_name']) ? $form_state['values']['last_name'] : '',
 222   );
 223   return $form;
 224 }
 225 
 226 /**
 227  * Returns form elements for the 'location info' page of the wizard. This is the
 228  * second step of the wizard. This step asks for a textfield value: a City. This
 229  * step also includes a validation declared later.
 230  *
 231  * @ingroup form_example
 232  */
 233 function form_example_wizard_location_info($form, &$form_state) {
 234   $form = array();
 235   $form['city'] = array(
 236     '#type' => 'textfield',
 237     '#title' => t('City'),
 238     '#description' => t('Hint: Do not enter "San Francisco", and do not leave this out.'),
 239     '#required' => TRUE,
 240     '#default_value' => !empty($form_state['values']['city']) ? $form_state['values']['city'] : '',
 241 
 242   );
 243   return $form;
 244 }
 245 
 246 /**
 247  * Custom validation form for the 'location info' page of the wizard.
 248  *
 249  * This is the validation function for the second step of the wizard.
 250  * The city cannot be empty or be "San Francisco".
 251  *
 252  * @ingroup form_example
 253  */
 254 function form_example_wizard_location_info_validate($form, &$form_state) {
 255   if ($form_state['values']['city'] == 'San Francisco') {
 256     form_set_error('city', t('You were warned not to enter "San Francisco"'));
 257   }
 258 }
 259 
 260 /**
 261  * Returns form elements for the 'other info' page of the wizard. This is the
 262  * thid and last step of the example wizard.
 263  *
 264  * @ingroup form_example
 265  */
 266 function form_example_wizard_other_info($form, &$form_state) {
 267   $form = array();
 268   $form['aunts_name'] = array(
 269     '#type' => 'textfield',
 270     '#title' => t("Your first cousin's aunt's Social Security number"),
 271     '#default_value' => !empty($form_state['values']['aunts_name']) ? $form_state['values']['aunts_name'] : '',
 272   );
 273   return $form;
 274 }
 275 
 276 // And now comes the magic of the wizard, the function that should handle all the
 277 // inputs from the user on each different step.
 278 /**
 279  * Wizard form submit handler.
 280  * - Saves away $form_state['values']
 281  * - Process all the form values.
 282  *
 283  * This demonstration handler just do a drupal_set_message() with the information
 284  * collected on each different step of the wizard.
 285  *
 286  * @param $form
 287  * @param $form_state
 288  *
 289  * @ingroup form_example
 290  */
 291 function form_example_wizard_submit($form, &$form_state) {
 292   $current_step = &$form_state['step'];
 293   $form_state['step_information'][$current_step]['stored_values'] = $form_state['values'];
 294 
 295   // In this case we've completed the final page of the wizard, so process the
 296   // submitted information.
 297   drupal_set_message(t('This information was collected by this wizard:'));
 298   foreach ($form_state['step_information'] as $index => $value) {
 299     // Remove FAPI fields included in the values (form_token, form_id and form_build_id
 300     // This is not required, you may access the values using $value['stored_values']
 301     // but I'm removing them to make a more clear representation of the collected
 302     // information as the complete array will be passed through drupal_set_message().
 303     unset($value['stored_values']['form_id']);
 304     unset($value['stored_values']['form_build_id']);
 305     unset($value['stored_values']['form_token']);
 306 
 307     // Now show all the values.
 308     drupal_set_message(t('Step @num collected the following values: <pre>@result</pre>', array('@num' => $index, '@result' => print_r($value['stored_values'], TRUE))));
 309   }
 310 }
";i:1;N;i:2;N;}i:2;i:77975;}i:31;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:90641;}i:32;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:90641;}}