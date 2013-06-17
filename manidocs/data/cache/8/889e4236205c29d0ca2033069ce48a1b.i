a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Field Permission Example";i:1;i:2;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:39;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"field_permission_example.css";i:1;i:2;i:2;i:39;}i:2;i:39;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:39;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:518:"
   1 /**
   2  * @file
   3  * CSS for Field Example.
   4  */
   5 .stickynote {
   6 background:#fefabc;
   7 padding:0.8em;
   8 font-family:cursive;
   9 font-size:1.1em;
  10 color: #000;
  11 width:15em;
  12 
  13 -moz-transform: rotate(2deg);
  14 -webkit-transform: rotate(2deg);
  15 -o-transform: rotate(2deg);
  16 -ms-transform: rotate(2deg);
  17 transform: rotate(2deg);
  18 
  19 box-shadow: 0px 4px 6px #333;
  20 -moz-box-shadow: 0px 4px 6px #333;
  21 -webkit-box-shadow: 0px 4px 6px #333;
  22 }
";i:1;N;i:2;N;}i:2;i:85;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:612;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"field_permission_example.info";i:1;i:2;i:2;i:612;}i:2;i:612;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:612;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:203:"
   1 name = Field Permission Example
   2 description = A Field API Example: Fieldnote with Permissions
   3 package = Example modules
   4 core = 7.x
   5 files[] = tests/field_permission_example.test
";i:1;N;i:2;N;}i:2;i:659;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:871;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"field_permission_example.install";i:1;i:2;i:2;i:871;}i:2;i:871;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:871;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1001:"
   1 <?php
   2 /**
   3  * @file
   4  * Install function for the field_permission_example module.
   5  */
   6 
   7 /**
   8  * Implements hook_field_schema().
   9  *
  10  * Defines the database schema of the field, using the format used by the
  11  * Schema API.
  12  *
  13  * We only want a simple text field, similar to the body of a node.
  14  *
  15  * Note that this field has only a normal text (which translates to
  16  * 16k of text in MySQL), and so therefore doesn't have an index.
  17  * More complex schema would probably have at least one indexed
  18  * column.
  19  *
  20  * @see http://drupal.org/node/146939
  21  * @see schemaapi
  22  * @see hook_field_schema()
  23  * @ingroup field_permission_example
  24  */
  25 function field_permission_example_field_schema($field) {
  26   $columns = array(
  27     'notes' => array('type' => 'text', 'size' => 'normal', 'not null' => FALSE),
  28   );
  29   return array(
  30     'columns' => $columns,
  31   );
  32 }
";i:1;N;i:2;N;}i:2;i:921;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1931;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"field_permission_example.module";i:1;i:2;i:2;i:1931;}i:2;i:1931;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1931;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:13855:"
   1 <?php
   2 /**
   3  * @file
   4  * An example field using the Field Types API.
   5  */
   6 
   7 /**
   8  * @defgroup field_permission_example Example: Field Permissions
   9  * @ingroup examples
  10  * @{
  11  * Example using permissions on a Field API field.
  12  *
  13  * This example is a relatively simple text field you can attach to
  14  * any fieldable entity.
  15  *
  16  * In this module we demonstrate how to limit access to a field.
  17  * Drupal's Field API gives you two operations to permit or restrict:
  18  * view and edit. So you can then decide who gets to see fields,
  19  * who can edit them, and who can manage them.
  20  *
  21  * Our field is called field_permission_example_fieldnote. It has a
  22  * simple default widget of a text area, and a default formatter
  23  * that applies a CSS style to make it look like a sticky note.
  24  *
  25  * In addition to demonstrating how to set up permissions-based
  26  * access to a field, this module also demonstrates the absolute
  27  * minimum required to implement a field, since it doesn't have
  28  * any field settings. The tests also have a generalized
  29  * field testing class, called FieldTestGeneric, which can be easily
  30  * subclassed and reused for other fields.
  31  *
  32  * If you wish to use this code as skeleton code for a field without
  33  * permissions, you can simply remove field_permission_exampe_permission()
  34  * and field_permission_field_access(). Also field_permission_example_menu()
  35  * and _field_permission_example_page() are vestigial to the Examples
  36  * project.
  37  *
  38  * How does it work?
  39  *
  40  * You can install this module and go to path /examples/field_permission_example
  41  * for an introduction on how to use this field. Or see the same content at
  42  * _field_permission_example_page().
  43  *
  44  * OK, how does the code work?
  45  *
  46  * As with any permission system, we implement hook_permission() in
  47  * order to define a few permissions. In our case, users will want
  48  * to either view or edit fieldnote fields. And, similar to the way
  49  * node permissions work, we'll also include a context of either
  50  * their own content or any content. So that gives us 4 permissions
  51  * which administrators can assign to various roles. See
  52  * field_permission_example_permission() for the list.
  53  *
  54  * With our permissions defined in hook_permission(), we can now
  55  * handle requests for access. Those come in through
  56  * hook_field_access(), which we've implemented as
  57  * field_permission_example_field_acces(). This function determines
  58  * whether the user has the ability to view or edit the field
  59  * in question by calling user_access(). We also give special edit
  60  * access to users with the 'bypass node access' and
  61  * 'administer content types' permissions, defined by the node module.
  62  *
  63  * One tricky part is that our field won't always be attached to
  64  * nodes. It could be attached to any type of entity. This means
  65  * that there's no general way to figure out if the user 'owns'
  66  * the entity or not. Since this is a simple example, we'll just
  67  * check for 'any' access to unknown entity types. We'll also
  68  * limit our known entity types to node and user, since those
  69  * are easy to demonstrate.
  70  *
  71  * In a real application, we'd have use-case specific permissions
  72  * which might be more complex than these. Or perhaps simpler.
  73  *
  74  * You can see a more complex field implementation in
  75  * field_example.module.
  76  *
  77  * @see field_example
  78  * @see field_example.module
  79  * @see field_types
  80  * @see field
  81  */
  82 
  83 /**
  84  * Implements hook_permission().
  85  *
  86  * We want to let site administrators figure out who should
  87  * be able to view, edit, and administer our field.
  88  *
  89  * Field permission operations can only be view or edit, in the
  90  * context of one's own content or that of others. Constrast
  91  * with content types where we also have to worry about who can
  92  * create or delete content.
  93  */
  94 function field_permission_example_permission() {
  95   // Note: This would be very easy to generate programatically,
  96   // but it's all typed out here for clarity.
  97   // The key text is the machine name of the permission.
  98   $perms['view own fieldnote'] = array('title' => t('View own fieldnote'));
  99   $perms['edit own fieldnote'] = array('title' => t('Edit own fieldnote'));
 100   $perms['view any fieldnote'] = array('title' => t('View any fieldnote'));
 101   $perms['edit any fieldnote'] = array('title' => t('Edit any fieldnote'));
 102 
 103   return $perms;
 104 }
 105 
 106 /**
 107  * Implements hook_field_access().
 108  *
 109  * We want to make sure that fields aren't being seen or edited
 110  * by those who shouldn't.
 111  *
 112  * We have to build a permission string similar to those in
 113  * hook_permission() in order to ask Drupal whether the user
 114  * has that permission. Permission strings will end up being
 115  * like 'view any fieldnote' or 'edit own fieldnote'.
 116  *
 117  * The tricky thing here is that a field can be attached to any type
 118  * of entity, so it's not always trivial to figure out whether
 119  * $account 'owns' the entity. We'll support access restrictions for
 120  * user and node entity types, and be permissive with others,
 121  * since that's easy to demonstrate.
 122  *
 123  * @see field_permission_example_permissions()
 124  */
 125 function field_permission_example_field_access($op, $field, $entity_type, $entity, $account) {
 126   // This hook will be invoked for every field type, so we have to
 127   // check that it's the one we're interested in.
 128   if ($field['type'] == 'field_permission_example_fieldnote') {
 129     // First we'll check if the user has the 'superuser'
 130     // permissions that node provides. This way administrators
 131     // will be able to administer the content types.
 132     if (user_access('bypass node access', $account)) {
 133       drupal_set_message(t('User can bypass node access.'));
 134       return TRUE;
 135     }
 136     if (user_access('administer content types', $account)) {
 137       drupal_set_message(t('User can administer content types.'));
 138       return TRUE;
 139     }
 140     // Now check for our own permissions.
 141     // $context will end up being either 'any' or 'own.'
 142     $context = 'any';
 143     switch ($entity_type) {
 144       case 'user':
 145       case 'node':
 146         // While administering the field itself, $entity will be
 147         // NULL, so we have to check it.
 148         if ($entity) {
 149           if ($entity->uid == $account->uid) $context = 'own';
 150         }
 151     }
 152     // Assemble a permission string, such as
 153     // 'view any fieldnote'
 154     $permission = $op . ' ' . $context . ' fieldnote';
 155     // Finally, ask Drupal if this account has that permission.
 156     $access = user_access($permission, $account);
 157     $status = 'FALSE';
 158     if ($access) $status = 'TRUE';
 159     drupal_set_message($permission . ': ' . $status);
 160     return $access;
 161   }
 162   // We have no opinion on field types other than our own.
 163   return TRUE;
 164 }
 165 
 166 /**
 167  * Implements hook_field_info().
 168  *
 169  * Provides the description of the field.
 170  */
 171 function field_permission_example_field_info() {
 172   return array(
 173     // We name our field as the associative name of the array.
 174     'field_permission_example_fieldnote' => array(
 175       'label' => t('Fieldnote'),
 176       'description' => t('Place a note-taking field on entities, with granular permissions.'),
 177       'default_widget' => 'field_permission_example_widget',
 178       'default_formatter' => 'field_permission_example_formatter',
 179     ),
 180   );
 181 }
 182 
 183 /**
 184  * Implements hook_field_is_empty().
 185  *
 186  * hook_field_is_emtpy() is where Drupal asks us if this field is empty.
 187  * Return TRUE if it does not contain data, FALSE if it does. This lets
 188  * the form API flag an error when required fields are empty.
 189  */
 190 function field_permission_example_field_is_empty($item, $field) {
 191   return empty($item['notes']);
 192 }
 193 
 194 /**
 195  * Implements hook_field_formatter_info().
 196  *
 197  * We need to tell Drupal about our excellent field formatter.
 198  *
 199  * It's some text in a div, styled to look like a sticky note.
 200  *
 201  * @see field_permission_example_field_formatter_view()
 202  */
 203 function field_permission_example_field_formatter_info() {
 204   return array(
 205     // This formatter simply displays the text in a text field.
 206     'field_permission_example_formatter' => array(
 207       'label' => t('Simple text-based formatter'),
 208       'field types' => array('field_permission_example_fieldnote'),
 209     ),
 210   );
 211 }
 212 
 213 /**
 214  * Implements hook_field_formatter_view().
 215  *
 216  * Here we output the field for general consumption.
 217  *
 218  * The field will have a sticky note appearance, thanks to some
 219  * simple CSS.
 220  *
 221  * Note that all of the permissions and access logic happens
 222  * in hook_field_access(), and none of it is here.
 223  */
 224 function field_permission_example_field_formatter_view($entity_type, $entity, $field, $instance, $langcode, $items, $display) {
 225   $element = array();
 226 
 227   switch ($display['type']) {
 228     case 'field_permission_example_formatter':
 229       foreach ($items as $delta => $item) {
 230         $element[$delta] = array(
 231           // We wrap the fieldnote content up in a div tag.
 232           '#type' => 'html_tag',
 233           '#tag' => 'div',
 234           '#value' => check_plain($item['notes']),
 235           // Let's give the note a nice sticky-note CSS appearance.
 236           '#attributes' => array(
 237             'class' => 'stickynote',
 238             ),
 239           // ..And this is the CSS for the stickynote.
 240           '#attached' => array(
 241             'css' => array(drupal_get_path('module', 'field_permission_example') .
 242               '/field_permission_example.css'),
 243             ),
 244         );
 245       }
 246       break;
 247   }
 248   return $element;
 249 }
 250 
 251 /**
 252  * Implements hook_field_widget_info().
 253  *
 254  * We're implementing just one widget: A basic textarea.
 255  *
 256  * @see field_permission_example_field_widget_form()
 257  */
 258 function field_permission_example_field_widget_info() {
 259   return array(
 260     'field_permission_example_widget' => array(
 261       'label' => t('Field note textarea'),
 262       'field types' => array('field_permission_example_fieldnote'),
 263     ),
 264   );
 265 }
 266 
 267 /**
 268  * Implements hook_field_widget_form().
 269  *
 270  * Drupal wants us to create a form for our field. We'll use
 271  * something very basic like a default textarea.
 272  *
 273  * @see field_permission_example_field_widget_info()
 274  */
 275 function field_permission_example_field_widget_form(&$form, &$form_state, $field, $instance, $langcode, $items, $delta, $element) {
 276   // Grab the existing value for the field.
 277   $value = isset($items[$delta]['notes']) ? $items[$delta]['notes'] : '';
 278   // Grab a reference to the form element.
 279   $widget = $element;
 280   // Set up the delta for our return element.
 281   $widget['#delta'] = $delta;
 282 
 283   // Figure out which widget we need to generate.
 284   // In our case, there's only one type.
 285   switch ($instance['widget']['type']) {
 286     case 'field_permission_example_widget':
 287       $widget += array(
 288         '#type' => 'textarea',
 289         '#default_value' => $value,
 290       );
 291       break;
 292   }
 293 
 294   $element['notes'] = $widget;
 295   return $element;
 296 }
 297 
 298 /**
 299  * Implements hook_menu().
 300  *
 301  * Provides a simple user interface that gives the developer some clues.
 302  */
 303 function field_permission_example_menu() {
 304   $items['examples/field_permission_example'] = array(
 305     'title' => 'Field Permission Example',
 306     'page callback' => '_field_permission_example_page',
 307     'access callback' => TRUE,
 308   );
 309   return $items;
 310 }
 311 
 312 /**
 313  * A simple page to explain to the developer what to do.
 314  *
 315  * @see field_permission_example.module
 316  */
 317 function _field_permission_example_page() {
 318   $page = t("<p>The Field Permission Example module shows how you can restrict view and edit permissions within your field implementation. It adds a new field type called Fieldnote. Fieldnotes appear as simple text boxes on the create/edit form, and as sticky notes when viewed. By 'sticky note' we mean 'Post-It Note' but that's a trademarked term.</p><p>To see this field in action, add it to a content type or user profile. Go to the permissions page (");
 319   $page .= l('admin/people/permissions', 'admin/people/permissions');
 320   $page .= t(") and look at the 'Field Permission Example' section. This allows you to change which roles can see and edit Fieldnote fields.</p><p>Creating different users with different capabilities will let you see these behaviors in action. Fieldnote helpfully displays a message telling you which permissions it is trying to resolve for the current field/user combination.</p><p>Definitely look through the code to see various implementation details.</p>");
 321   return $page;
 322 }
 323 /**
 324  * @} End of "defgroup field_permission_example".
 325  */
";i:1;N;i:2;N;}i:2;i:1980;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15844;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"field_permission_example.test";i:1;i:2;i:2;i:15844;}i:2;i:15844;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:15844;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:21542:"
   1 <?php
   2 /**
   3  * @file
   4  * Tests for Field Permission Example.
   5  *
   6  * @ingroup field_permission_example
   7  */
   8 
   9 /**
  10  * A generic field testing class.
  11  *
  12  * Subclass this one to test your specific field type
  13  * and get some basic unit testing for free.
  14  *
  15  * Since Simpletest only looks through one class definition
  16  * to find test functions, we define generic tests as
  17  * 'code_testWhatever' or 'form_testWhatever'. Subclasses
  18  * can then implement shim test methods that just call the
  19  * generic tests.
  20  *
  21  * 'code_' and 'form_' prefixes denote the type of test:
  22  * using code only, or through Drupal page forms.
  23  */
  24 class GenericFieldTest extends DrupalWebTestCase {
  25 
  26   // Our tests will generate some random field instance
  27   // names. We store them here so many functions can act on them.
  28   protected $instance_names;
  29 
  30   public static function getInfo() {
  31     return array(
  32       'name' => 'Generic Field Test',
  33       'description' => 'Someone neglected to override GenericFieldTest::getInfo().',
  34       'group' => 'Examples',
  35     );
  36   }
  37 
  38   protected function getFieldTypes() {
  39     return array('these_are_not', 'valid_field_types', 'please_override');
  40   }
  41 
  42   protected function getModule() {
  43     return 'this-is-not-a-module-name-please-override';
  44   }
  45 
  46   /**
  47    * Simpletest's setUp().
  48    *
  49    * We want to be able to subclass this class, so we jump
  50    * through a few hoops in order to get the modules from args
  51    * and add our own.
  52    *
  53    * @access public
  54    * @return void
  55    */
  56   function setUp() {
  57     $this->instance_names = array();
  58     $modules = func_get_args();
  59     if (isset($modules[0]) && is_array($modules[0])) {
  60       $modules = $modules[0];
  61     }
  62     $modules[] = 'node';
  63     $modules[] = 'field_ui';
  64     parent::setUp($modules);
  65   }
  66 
  67   /**
  68    * Verify that all required fields are specified in hook_field_info().
  69    *
  70    * The full list is label, description, settings, instance_settings,
  71    * default_widget, default_formatter, no_ui.
  72    *
  73    * Some are optional, and we won't check for those.
  74    *
  75    * In a sane world, this would be a unit test, rather than a
  76    * web test, but module_implements is unavailable to us
  77    * in unit tests.
  78    *
  79    * @see hook_field_info()
  80    */
  81   function runTestGenericFieldInfo() {
  82     $field_types = $this->getFieldTypes();
  83     $module = $this->getModule();
  84     $info_keys = array(
  85       'label',
  86       'description',
  87       'default_widget',
  88       'default_formatter',
  89     );
  90     // We don't want to use field_info_field_types()
  91     // because there is a hook_field_info_alter().
  92     // We're testing the module here, not the rest of
  93     // the system. So invoke hook_field_info() ourselves.
  94     $modules = module_implements('field_info');
  95     $this->assertTrue(in_array($module, $modules),
  96       'Module ' . $module . ' implements hook_field_info()');
  97 
  98     foreach ($field_types as $field_type) {
  99       $field_info = module_invoke($module, 'field_info');
 100       $this->assertTrue(isset($field_info[$field_type]),
 101         'Module ' . $module . ' defines field type ' . $field_type);
 102       $field_info = $field_info[$field_type];
 103       foreach ($info_keys as $key) {
 104         $this->assertTrue(
 105           isset($field_info[$key]),
 106           $field_type . "'s " . $key . ' is set.'
 107         );
 108       }
 109     }
 110   }
 111 
 112   /**
 113    * Add all testable fields as instances to a content type.
 114    *
 115    * As a side-effect: Store the names of the instances created
 116    * in $this->$instance_names.
 117    *
 118    * @param $node_type
 119    *   A content type object. If none is provided, one will be generated.
 120    * @return
 121    *   The content type object that has the fields attached.
 122    */
 123   function code_testGenericAddAllFields($node_type = NULL) {
 124     $this->instance_names = array();
 125     if (!$node_type)
 126       $node_type = $this->drupalCreateContentType();
 127     foreach ($this->getFieldTypes() as $field_type) {
 128       $instance_name = drupal_strtolower($this->randomName(32));
 129       $field = array(
 130         'field_name' => $instance_name,
 131         'type' => $field_type,
 132       );
 133       $field = field_create_field($field);
 134       $instance = array(
 135         'field_name' => $instance_name,
 136         'entity_type' => 'node',
 137         'bundle' => $node_type->name,
 138         'label' => drupal_strtolower($this->randomName(20)),
 139       );
 140       // Finally create the instance.
 141       $instance = field_create_instance($instance);
 142       // Reset the caches...
 143       _field_info_collate_fields(TRUE);
 144       // Grab this instance.
 145       $verify_instance = field_info_instance('node', $instance_name, $node_type->name);
 146       $this->assertTrue($verify_instance, 'Instance object exists.');
 147       $this->assertTrue(
 148         $verify_instance != NULL, //) && ($verify_instance['type'] == $field_type),
 149         'field_info_instance() says ' . $instance_name . ' (' . $node_type->name . ') was created.'
 150       );
 151       $this->instance_names[] = $instance_name;
 152     }
 153     return $node_type;
 154   }
 155 
 156   /**
 157    * Remove all fields in $this->field_names.
 158    *
 159    * @access public
 160    * @param mixed $node_type (default: NULL)
 161    *   A content type object. If none is specified,
 162    *   the test fails.
 163    * @return void
 164    */
 165   function code_testGenericRemoveAllFields($node_type = NULL) {
 166     if (!$node_type) $this->fail('No node type.');
 167     if (count($this->instance_names) < 1) {
 168       $this->fail('There are no instances to remove.');
 169       return;
 170     }
 171     foreach ($this->instance_names as $instance_name) {
 172       $instance = field_info_instance('node', $instance_name, $node_type->name);
 173       $this->assertTrue($instance, "Instance exists, now we'll delete it.");
 174       field_delete_field($instance_name);
 175       $instance = field_info_instance('node', $instance_name, $node_type->name);
 176       $this->assertFalse($instance, 'Instance was deleted.');
 177     }
 178     $this->instance_names = array();
 179   }
 180 
 181   /**
 182    * Add and delete all field types through Form API.
 183    *
 184    * @access public
 185    * @return void
 186    */
 187   function form_testGenericFieldNodeAddDeleteForm() {
 188     // Create and login user.
 189     $account = $this->drupalCreateUser(array(
 190       'administer content types',
 191       ));
 192     $this->drupalLogin($account);
 193 
 194     // Add a content type.
 195     $node_type = $this->drupalCreateContentType();
 196 
 197     // Add all our testable fields.
 198     $field_names = $this->form_AddAllFields($node_type);
 199 
 200     // Now let's delete all the fields.
 201     foreach ($field_names as $field_name) {
 202       // This is the path for the 'delete' link on field admin page.
 203       $this->drupalGet('admin/structure/types/manage/' .
 204         $node_type->name . '/fields/field_' . $field_name . '/delete');
 205       // Click the 'delete' button.
 206       $this->drupalPost(NULL, array(), t('Delete'));
 207       $this->assertText(t('The field @field has been deleted from the @type content type.',
 208         array('@field' => $field_name, '@type' => $node_type->name)));
 209     }
 210   }
 211 
 212   /**
 213    * Add all fields using Form API.
 214    *
 215    * @access protected
 216    * @param mixed $node_type (default: NULL)
 217    *   A content type object. If none is specified,
 218    *   the test fails.
 219    * @return void
 220    */
 221   protected function form_AddAllFields($node_type = NULL) {
 222     if (!$node_type) $this->fail('No content type specified.');
 223     // Get all our field types.
 224     $field_types = $this->getFieldTypes();
 225     // Keep a list of no_ui fields so we can tell the user.
 226     $unsafe_field_types = array();
 227     $field_names = array();
 228 
 229     $manage_path = 'admin/structure/types/manage/' . $node_type->name . '/fields';
 230     foreach ($field_types as $field_type) {
 231       // Get the field info.
 232       $field_info = field_info_field_types($field_type);
 233       // Exclude no_ui field types.
 234       if (isset($field_info['no_ui']) && $field_info['no_ui']) {
 235         $unsafe_field_types[] = $field_type;
 236       }
 237       else {
 238         // Generate a name for our field.
 239         // 26 is max length for field name.
 240         $field_name = drupal_strtolower($this->randomName(26));
 241         $field_names[$field_type] = $field_name;
 242         // Create the field through Form API.
 243         $this->form_CreateField($manage_path, $field_type, $field_name,
 244           $field_info['default_widget'], 1);
 245       }
 246     }
 247 
 248     // Tell the user which fields we couldn't test.
 249     if (!empty($unsafe_field_types))
 250       debug(
 251         'Unable to attach these no_ui fields: ' .
 252         implode(', ', $unsafe_field_types)
 253       );
 254 
 255     // Somehow clicking "save" isn't enough, and we have to
 256     // rebuild a few caches.
 257     node_types_rebuild();
 258     menu_rebuild();
 259     return $field_names;
 260   }
 261 
 262   /**
 263    * Create a field using the content type management form.
 264    *
 265    * @access protected
 266    * @param mixed $manage_path
 267    *   Path to our content type management form.
 268    * @param mixed $field_type
 269    *   The type of field we're adding.
 270    * @param mixed $field_name
 271    *   The name of the field instance we want.
 272    * @param mixed $widget_type
 273    *   Which widget would we like?
 274    * @param mixed $cardinality
 275    *   Cardinality for this field instance.
 276    * @return void
 277    */
 278   protected function form_CreateField($manage_path, $field_type, $field_name, $widget_type, $cardinality) {
 279     // $manage_path is the field edit form for our content type.
 280     $this->drupalGet($manage_path);
 281     $edit = array(
 282       'fields[_add_new_field][label]' => $field_name,
 283       'fields[_add_new_field][field_name]' => $field_name,
 284       'fields[_add_new_field][type]' => $field_type,
 285       'fields[_add_new_field][widget_type]' => $widget_type,
 286     );
 287     $this->drupalPost(NULL, $edit, t('Save'));
 288 
 289     // Assume there are no settings for this,
 290     // so just press the button.
 291     $this->drupalPost(NULL, array(), t('Save field settings'));
 292 
 293     $edit = array('field[cardinality]' => (string)$cardinality);
 294     $this->drupalPost(NULL, $edit, t('Save settings'));
 295 
 296     debug(t('Saved settings for field !field_name with widget !widget_type and cardinality !cardinality', array('!field_name' => $field_name, '!widget_type' => $widget_type, '!cardinality' => $cardinality)));
 297 
 298     $this->assertText(t('Saved @name configuration.', array('@name' => $field_name)));
 299   }
 300 
 301     /**
 302    * Create a node with some field content.
 303    *
 304    * Returns a node object for the created node.
 305    */
 306   function createFieldContentForUser(
 307       $account = NULL,
 308       $content = 'testable_content',
 309       $node_type = NULL,
 310       $instance_name = '',
 311       $column = NULL
 312     ) {
 313     if (!$column) {
 314       $this->fail('No column name given.');
 315       return NULL;
 316     }
 317     if (!$account) {
 318       $account = $this->drupalCreateUser(array(
 319         'bypass node access',
 320         'administer content types',
 321         ));
 322     }
 323     $this->drupalLogin($account);
 324 
 325     if (!$node_type)
 326       $node_type = $this->code_testGenericAddAllFields();
 327 
 328     if (!$instance_name)
 329       $instance_name = reset($this->instance_names);
 330 
 331     $field = array();
 332     $field[LANGUAGE_NONE][0][$column] = $content;
 333 
 334     $settings = array(
 335       'type' => $node_type->name,
 336       $instance_name => $field,
 337     );
 338     $node = $this->drupalCreateNode($settings);
 339 
 340     $this->assertTrue($node, 'Node of type ' . $node->type . ' allegedly created.');
 341 
 342     $node = node_load($node->nid);
 343     debug('Loaded node id: ' . $node->nid);
 344     $this->assertTrue($node->$instance_name, 'Field actually created.');
 345     $field = $node->$instance_name;
 346     $this->assertTrue($field[LANGUAGE_NONE][0][$column] == $content,
 347       'Content was stored properly on the field.');
 348     return $node;
 349   }
 350 
 351 }
 352 
 353 class FieldTestPermissionsExample extends GenericFieldTest {
 354 
 355   /**
 356    * Tell DrupalWebCase which modules to enable.
 357    *
 358    * @access public
 359    * @return void
 360    */
 361   function setUp() {
 362     parent::setUp(array('field_permission_example'));
 363   }
 364 
 365   /**
 366    * Override getInfo().
 367    *
 368    * @access public
 369    * @static
 370    * @return void
 371    */
 372   public static function getInfo() {
 373     return array(
 374       'name' => 'Field Permission Example',
 375       'description' => 'Various tests on the functionality of the Fieldnote field.',
 376       'group' => 'Examples',
 377     );
 378   }
 379 
 380   /**
 381    * Tell our object which field types to test.
 382    *
 383    * @access public
 384    * @return void
 385    */
 386   function getFieldTypes() {
 387     return array('field_permission_example_fieldnote');
 388   }
 389 
 390   /**
 391    * Tell our object which module we're dealing with.
 392    *
 393    * In an ideal world, this would be supplied to the test object.
 394    *
 395    * @access public
 396    * @return void
 397    */
 398   function getModule() {
 399     return 'field_permission_example';
 400   }
 401 
 402   /**
 403    * Override createFieldContentForUser()
 404    *
 405    * We override so we can make sure $column is set to 'notes'.
 406    */
 407   function createFieldContentForUser(
 408       $account = NULL,
 409       $content = 'fieldnote_testable_content',
 410       $node_type = NULL,
 411       $instance_name = '',
 412       $column = 'notes'
 413     ) {
 414     return parent::createFieldContentForUser($account, $content, $node_type, $instance_name, $column);
 415   }
 416 
 417 
 418   /**
 419    * Test of hook_field_info() and other implementation
 420    * requirements.
 421    *
 422    * @see GenericFieldTest->runTestGenericFieldInfo()
 423    */
 424   function testFieldnoteInfo() {
 425     $this->runTestGenericFieldInfo();
 426   }
 427 
 428   /**
 429    * Add and remove the field through Form API.
 430    *
 431    * @access public
 432    * @return void
 433    */
 434   function testAddRemoveFieldnoteForm() {
 435     $this->form_testGenericFieldNodeAddDeleteForm();
 436   }
 437 
 438   /**
 439    * Add and remove the field through code.
 440    *
 441    * @access public
 442    * @return void
 443    */
 444   function testAddRemoveFieldnoteCode() {
 445     $node_type = $this->code_testGenericAddAllFields();
 446     $this->code_testGenericRemoveAllFields($node_type);
 447   }
 448 
 449   function testFieldnoteViewPerms() {
 450     // We create two sets of content so we can get a few
 451     // test cases out of the way.
 452     $view_own_content = $this->randomName(23);
 453     $view_any_content = $this->randomName(23);
 454     $view_own_node = $this->createFieldContentForUser(NULL, $view_own_content);
 455     // Get the type of the node so we can create another one.
 456     $node_type = node_type_load($view_own_node->type);
 457     $view_any_node = $this->createFieldContentForUser(NULL, $view_any_content, $node_type);
 458 
 459     // there should be a node now, with some lovely content,
 460     // but it's the wrong user for the view-own test.
 461     $view_own_account = $this->drupalCreateUser(array(
 462       'view own fieldnote'
 463     ));
 464     debug("Created user with 'view own fieldnote' permission.");
 465 
 466     // Now change the user id for the test node.
 467     $view_own_node = node_load($view_own_node->nid);
 468     $view_own_node->uid = $view_own_account->uid;
 469     node_save($view_own_node);
 470     $view_own_node = node_load($view_own_node->nid);
 471     $this->assertTrue($view_own_node->uid == $view_own_account->uid, 'New user assigned to node.');
 472 
 473 
 474     // Now we want to look at the page with the field and
 475     // check that we can see it.
 476     $this->drupalLogin($view_own_account);
 477 
 478     $this->drupalGet('node/' . $view_own_node->nid);
 479     // Check that the field content is present.
 480     $output_strings = $this->xpath("//div[contains(@class,'stickynote')]/text()");
 481     $this->assertEqual((string)reset($output_strings), $view_own_content);
 482     debug("'view own fieldnote' can view own field.");
 483 
 484     // This account shouldn't be able to see the field on the
 485     // 'view any' node.
 486     $this->drupalGet('node/' . $view_any_node->nid);
 487     // Check that the field content is not present.
 488     $output_strings = $this->xpath("//div[contains(@class,'stickynote')]/text()");
 489     $this->assertNotEqual((string)reset($output_strings), $view_any_content);
 490     debug("'view own fieldnote' cannot view other field.");
 491 
 492     // Now, to test for 'view any fieldnote' we create another user
 493     // with that permission, and try to look at the same node.
 494     $view_any_account = $this->drupalCreateUser(array(
 495       'view any fieldnote'
 496     ));
 497     debug("Created user with 'view any fieldnote' permission.");
 498     $this->drupalLogin($view_any_account);
 499     // This account should be able to see the field on the
 500     // 'view any' node.
 501     $this->drupalGet('node/' . $view_any_node->nid);
 502     // Check that the field content is present.
 503     $output_strings = $this->xpath("//div[contains(@class,'stickynote')]/text()");
 504     $this->assertEqual((string)reset($output_strings), $view_any_content);
 505     debug("'view any fieldnote' can view other field.");
 506   }
 507 
 508 
 509 
 510   function testFieldnoteEditPerms() {
 511     // Note that this is mostly identical to testFieldnoteViewPerms()
 512     // and could probably be refactored.
 513 
 514     // We create two sets of content so we can get a few
 515     // test cases out of the way.
 516     $edit_own_content = $this->randomName(23);
 517     $edit_any_content = $this->randomName(23);
 518     $edit_own_node = $this->createFieldContentForUser(NULL, $edit_own_content);
 519     // Get the type of the node so we can create another one.
 520     $node_type = node_type_load($edit_own_node->type);
 521     $edit_any_node = $this->createFieldContentForUser(NULL, $edit_any_content, $node_type);
 522 
 523     $edit_own_account = $this->drupalCreateUser(array(
 524       'edit own ' . $node_type->name . ' content',
 525       'edit own fieldnote',
 526     ));
 527     debug("Created user with 'edit own fieldnote' permission.");
 528 
 529     // Now change the user id for the test node.
 530     $edit_own_node = node_load($edit_own_node->nid);
 531     $edit_own_node->uid = $edit_own_account->uid;
 532     node_save($edit_own_node);
 533     $edit_own_node = node_load($edit_own_node->nid);
 534     $this->assertTrue($edit_own_node->uid == $edit_own_account->uid, 'New edit test user assigned to node.');
 535 
 536     // Now we want to look at the page with the field and
 537     // check that we can see it.
 538     $this->drupalLogin($edit_own_account);
 539 
 540     $this->drupalGet('node/' . $edit_own_node->nid . '/edit');
 541     $this->assertText($edit_own_content, "'edit own fieldnote' can edit own fieldnote.");
 542 
 543     // This account shouldn't be able to edit the field on the
 544     // 'edit any' node.
 545     $this->drupalGet('node/' . $edit_any_node->nid . '/edit');
 546     $this->assertNoText($edit_any_content, "'edit own fieldnote' can not edit any fieldnote.");
 547 
 548     // Now, to test for 'edit any fieldnote' we create another user
 549     // with that permission, and try to edit at the same node.
 550     // We have to add the ability to edit any node content, as well
 551     // or Drupal will deny us access to the page.
 552     $edit_any_account = $this->drupalCreateUser(array(
 553       'edit any ' . $node_type->name . ' content',
 554       'edit any fieldnote',
 555     ));
 556     debug("Created user with 'edit any fieldnote' permission.");
 557     $this->drupalLogin($edit_any_account);
 558     // This account should be able to see the field on the
 559     // 'edit any' node.
 560     $this->drupalGet('node/' . $edit_any_node->nid . '/edit');
 561     $this->assertText($edit_any_content, "'edit any fieldnote' can edit any fieldnote.");
 562   }
 563 
 564 }
";i:1;N;i:2;N;}i:2;i:15891;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:37441;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:37441;}}