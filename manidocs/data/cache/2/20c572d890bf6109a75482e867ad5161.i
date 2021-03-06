a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Node Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"node_example.info";i:1;i:2;i:2;i:29;}i:2;i:29;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:212:"
   1 name = Node example
   2 description = Demonstrates a custom content type and uses the field api.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = image
   6 files[] = node_example.test
";i:1;N;i:2;N;}i:2;i:64;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:285;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"node_example.module";i:1;i:2;i:2;i:285;}i:2;i:285;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:285;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:14079:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Module file for Node Example module.
   6  *
   7  * Part of the Examples for Developers project.
   8  */
   9 
  10 /**
  11  * @defgroup node_example Example: Node
  12  * @ingroup examples
  13  * @{
  14  * Example defining a node type in code.
  15  *
  16  * This is an example outlining how a module can be used to define a new
  17  * node type. Our example node type will allow users to specify multiple
  18  * "colors", a "quantity" and an "image" for their nodes; some kind of
  19  * rudimentary inventory-tracking system, perhaps?
  20  *
  21  * The basic pattern for defining a node type is to tell Drupal about the
  22  * node's fields and view modes. Drupal will then take over and manage
  23  * the storage for this node type. This differs from Drupal 6, where we
  24  * would have to handle all the database storage ourselves in the module.
  25  *
  26  * Remember that most node types do not require any custom code, as one
  27  * simply creates them using the Drupal user interface. Creating a node like
  28  * this in code is a special case.
  29  *
  30  * At absolute minimum, in order to provide a content type for
  31  * node, you have to implement hook_node_info() and hook_form().
  32  * Node can take care of the rest, if you want it to.
  33  *
  34  * First and foremost, defining a node type happens in
  35  * hook_node_info(). Our implementation of this hook gives
  36  * Drupal an array of information about the content type
  37  * we want to create.
  38  *
  39  * Next, since we want to add fields to our content type, we
  40  * implement hook_node_type_insert(), which gives us a chance
  41  * to modify recently-created content types.
  42  *
  43  * Drupal is able to handle deletion of our content, including
  44  * dependencies based on re-use of our field instances, so we don't
  45  * have to manage any of it.
  46  *
  47  * In previous versions of Drupal, "teaser" and "page" were node view modes.
  48  * In Drupal 7 we can define custom view modes to let the node know how it
  49  * should return it's data.  This module declares a custom view mode called
  50  * "example_node_list".
  51  *
  52  * Consult the @link http://drupal.org/node/707832 Field API Tutorial @endlink
  53  * and @link http://drupal.org/node/443536 Field API Handbook Page @endlink
  54  * and @link field Field API documentation @endlink.
  55  *
  56  * @see field_example.module
  57  */
  58 
  59 /**
  60  * Implements hook_menu().
  61  *
  62  * We are providing a default page to illustrate the use of our custom node view
  63  * mode that will live at http://example.com/?q=examples/node_example
  64  */
  65 function node_example_menu() {
  66   $items['examples/node_example'] = array(
  67     'page callback' => 'node_example_page',
  68     'access arguments' => array('access content'),
  69     'title' => 'Node Example',
  70   );
  71   return $items;
  72 }
  73 
  74 /**
  75  * Implements hook_node_info().
  76  *
  77  * We use hook_node_info() to define our node content type.
  78  */
  79 function node_example_node_info() {
  80   // We define the node type as an associative array.
  81   return array(
  82     'node_example' => array(
  83       'name' => t('Example Node Type'),
  84       // 'base' tells Drupal the base string for hook functions.
  85       // This is often the module name; if base is set to 'mymodule',
  86       // Drupal would call mymodule_insert() or similar for node
  87       // hooks. In our case, the base is 'node_example'.
  88       'base' => 'node_example',
  89       'description' => t('This is an example node type with a few fields.'),
  90       'title_label' => t('Example Title'),
  91       // We'll set the 'locked' attribute to TRUE, so users won't be
  92       // able to change the machine name of our content type.
  93       'locked' => TRUE,
  94     ),
  95   );
  96 }
  97 
  98 /**
  99  * Implements hook_node_type_insert().
 100  *
 101  * Much like hook_node_insert() lets us know that a node is being
 102  * inserted into the database, hook_node_type_insert() lets us know
 103  * that a new content type has been inserted.
 104  *
 105  * Since Drupal will at some point insert our new content type,
 106  * this gives us a chance to add the fields we want.
 107  *
 108  * It is called for all inserts to the content type database, so
 109  * we have to make sure we're only modifying the type we're
 110  * concerned with.
 111  */
 112 function node_example_node_type_insert($content_type) {
 113   if ($content_type->type == 'node_example') {
 114     // First we add the body field. Node API helpfully gives us
 115     // node_add_body_field().
 116     // We'll set the body label now, although we could also set
 117     // it along with our other instance properties later.
 118     $body_instance = node_add_body_field($content_type, t('Example Description'));
 119 
 120     // Add our example_node_list view mode to the body instance
 121     // display by instructing the body to display as a summary
 122     $body_instance['display']['example_node_list'] = array(
 123       'label' => 'hidden',
 124       'type' => 'text_summary_or_trimmed',
 125     );
 126 
 127     // Save our changes to the body field instance.
 128     field_update_instance($body_instance);
 129 
 130     // Create all the fields we are adding to our content type.
 131     foreach (_node_example_installed_fields() as $field) {
 132       field_create_field($field);
 133     }
 134 
 135     // Create all the instances for our fields.
 136     foreach (_node_example_installed_instances() as $instance) {
 137       $instance['entity_type'] = 'node';
 138       $instance['bundle'] = 'node_example';
 139       field_create_instance($instance);
 140     }
 141   }
 142 }
 143 
 144 /**
 145  * Implement hook_form().
 146  *
 147  * Drupal needs for us to provide a form that lets the user
 148  * add content. This is the form that the user will see if
 149  * they go to node/add/node-example.
 150  *
 151  * You can get fancy with this form, or you can just punt
 152  * and return the default form that node_content will provide.
 153  */
 154 function node_example_form($node, $form_state) {
 155   return node_content_form($node, $form_state);
 156 }
 157 
 158 /**
 159  * Callback that builds our content and returns it to the browser.
 160  *
 161  * This callback comes from hook_menu().
 162  *
 163  * @return
 164  *   a build array
 165  *   a renderable array showing a list of our nodes.
 166  *
 167  * @see node_load()
 168  * @see node_view()
 169  * @see node_example_field_formatter_view()
 170  */
 171 function node_example_page() {
 172   // We'll start building a renderable array that will be our page.
 173   // For now we just declare the array.
 174   $renderable_array = array();
 175   // We query the database and find all of the nodes for the type we defined.
 176   $sql = 'SELECT nid FROM {node} n WHERE n.type = :type AND n.status = :status';
 177   $result = db_query($sql,
 178     array(
 179       ':type' => 'node_example',
 180       ':status' => 1,
 181     )
 182   );
 183   $renderable_array['explanation'] = array(
 184     '#markup' => t("Node Example nodes you've created will be displayed here. Note that the color fields will be displayed differently in this list, than if you view the node normally. Click on the node title to see the difference. This is a result of using our 'example_node_list' node view type."),
 185     );
 186   // Loop through each of our node_example nodes and instruct node_view
 187   // to use our "example_node_list" view.
 188   // http://api.drupal.org/api/function/node_load/7
 189   // http://api.drupal.org/api/function/node_view/7
 190   foreach ($result as $row) {
 191     $node = node_load($row->nid);
 192     $renderable_array['node_list'][]= node_view($node, 'example_node_list');
 193   }
 194   return $renderable_array;
 195 }
 196 
 197 /**
 198  * Implements hook_entity_info_alter().
 199  *
 200  * We need to modify the default node entity info by adding a new view mode to
 201  * be used in functions like node_view() or node_build_content().
 202  */
 203 function node_example_entity_info_alter(&$entity_info) {
 204   // Add our new view mode to the list of view modes...
 205   $entity_info['node']['view modes']['example_node_list'] = array(
 206     'label' => t('Example Node List'),
 207     'custom settings' => TRUE,
 208   );
 209 }
 210 
 211 
 212 /**
 213  * Implements hook_field_formatter_info().
 214  */
 215 function node_example_field_formatter_info() {
 216   return array(
 217     'node_example_colors' => array(
 218       'label' => t('Node Example Color Handle'),
 219       'field types' => array('text'),
 220     ),
 221   );
 222 }
 223 
 224 /**
 225  * Implements hook_field_formatter_view().
 226  *
 227  * @todo: We need to provide a formatter for the colors that a user is allowed
 228  * to enter during node creation.
 229  */
 230 function node_example_field_formatter_view($object_type, $object, $field, $instance, $langcode, $items, $display) {
 231   $element = array();
 232   switch ($display['type']) {
 233     case 'node_example_colors':
 234       foreach ($items as $delta => $item) {
 235         $element[$delta]['#type'] = 'markup';
 236         $color = $item['safe_value'];
 237         $element[$delta]['#markup'] = theme('example_node_color', array('color' => $color));
 238       }
 239       break;
 240   }
 241 
 242   return $element;
 243 }
 244 
 245 /**
 246  * Implements hook_theme().
 247  *
 248  * This lets us tell Drupal about our theme functions and their arguments.
 249  */
 250 function node_example_theme($existing, $type, $theme, $path) {
 251   return array(
 252     'example_node_color' => array(
 253       'variables' => array('color' => NULL),
 254     ),
 255   );
 256 }
 257 
 258 /**
 259  * Implements hook_help().
 260  */
 261 function node_example_help($path, $arg) {
 262   switch ($path) {
 263     case 'examples/node_example':
 264       return "<p>" . t("The Node Example module provides a custom node type.
 265         You can create new Example Node nodes using the <a href='!nodeadd'>node add form</a>.",
 266         array('!nodeadd' => url('node/add/node-example'))) . "</p>";
 267   }
 268 }
 269 
 270 /**
 271  * A custom theme function.
 272  *
 273  * By using this function to format our node-specific information, themes
 274  * can override this presentation if they wish.  This is a simplifed theme
 275  * function purely for illustrative purposes.
 276  */
 277 function theme_example_node_color($variables) {
 278   $output = '<span style="background-color: #ccc; padding: 1em; margin-bottom: 1em; float: left; color: ' . $variables['color'] . '">' . $variables['color'] . '</span>';
 279   return $output;
 280 }
 281 
 282 /**
 283  * Define the fields for our content type.
 284  *
 285  * This big array is factored into this function for readability.
 286  *
 287  * @return
 288  *  An associative array specifying the fields we wish to add to our
 289  *  new node type.
 290  */
 291 function _node_example_installed_fields() {
 292   return array(
 293     'node_example_color' => array(
 294       'field_name' => 'node_example_color',
 295       'cardinality' => 3,
 296       'type'        => 'text',
 297       'settings'    => array(
 298         'max_length' => 60,
 299       ),
 300     ),
 301     'node_example_quantity' => array(
 302       'field_name'  => 'node_example_quantity',
 303       'cardinality' => 1,
 304       'type'        => 'text',
 305     ),
 306     'node_example_image' => array(
 307       'field_name' => 'node_example_image',
 308       'type'       => 'image',
 309       'cardinality' => 1,
 310     ),
 311   );
 312 }
 313 
 314 /**
 315  * Define the field instances for our content type.
 316  *
 317  * The instance lets Drupal know which widget to use to allow the user to enter
 318  * data and how to react in different view modes.  We are going to display a
 319  * page that uses a custom "node_example_list" view mode.  We will set a
 320  * cardinality of three allowing our content type to give the user three color
 321  * fields.
 322  *
 323  * This big array is factored into this function for readability.
 324  *
 325  * @return
 326  *  An associative array specifying the instances we wish to add to our new
 327  *  node type.
 328  */
 329 function _node_example_installed_instances() {
 330   return array(
 331     'node_example_color' => array(
 332       'field_name' => 'node_example_color',
 333       'label'       => t('The colors available for this object.'),
 334       'widget'      => array(
 335         'type'    => 'text_textfield',
 336       ),
 337       'display' => array(
 338         'example_node_list' => array(
 339           'label' => 'hidden',
 340           'type' => 'node_example_colors',
 341         ),
 342       ),
 343     ),
 344     'node_example_quantity' => array(
 345       'field_name'  => 'node_example_quantity',
 346       'label' => t('Quantity required'),
 347       'type'        => 'text',
 348       'widget'      => array(
 349         'type'    => 'text_textfield',
 350       ),
 351       'display' => array(
 352         'example_node_list' => array(
 353           'label' => 'hidden',
 354           'type' => 'hidden',
 355         ),
 356       ),
 357     ),
 358     'node_example_image' => array(
 359       'field_name'  => 'node_example_image',
 360       'label'       => t('Upload an image:'),
 361       'required'    => FALSE,
 362       'widget' => array(
 363         'type'    => 'image_image',
 364         'weight'  => 2.10,
 365       ),
 366       'display' => array(
 367         'example_node_list' => array(
 368           'label' => 'hidden',
 369           'type' => 'image_link_content__thumbnail',
 370         ),
 371       ),
 372     ),
 373   );
 374 }
 375 
 376 /**
 377  * @} End of "defgroup node_example".
 378  */
";i:1;N;i:2;N;}i:2;i:322;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14410;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"node_example.test";i:1;i:2;i:2;i:14410;}i:2;i:14410;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:14410;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4454:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Simpletest case for node_example module.
   6  *
   7  * Verify example module functionality.
   8  */
   9 
  10 /**
  11  * Functionality tests for node example module.
  12  */
  13 class NodeExampleTestCase extends DrupalWebTestCase {
  14 
  15   public static function getInfo() {
  16     return array(
  17       'name' => 'Node example',
  18       'description' => 'Verify the custom node type creation.',
  19       'group' => 'Examples',
  20     );
  21   }
  22 
  23   function setUp() {
  24     // Enable the module.
  25     parent::setUp('node_example');
  26   }
  27 
  28   /**
  29    * API-level content type test.
  30    *
  31    * This test will verify that when the module is installed, it:
  32    *   - Adds a new content type, node_example.
  33    *   - Attaches a body field.
  34    *   - Attaches three other fields.
  35    *   - Creates a view mode, example_node_list.
  36    */
  37   function testInstallation_api() {
  38     // At this point, the module should be installed.
  39     // First check for our content type.
  40     $node_type = node_type_get_type('node_example');
  41     $this->assertTrue($node_type, 'Node Example Type was created.', 'API');
  42 
  43     // How about the body field?
  44     $body = field_info_instance('node', 'body', 'node_example');
  45     $this->assertTrue($body, 'Node Example Type has a body field.', 'API');
  46 
  47     // Now look for our attached fields.
  48     // We made a handy function that tells us...
  49     $attached_fields = _node_example_installed_instances();
  50     foreach ($attached_fields as $field_name => $field_info) {
  51       $field = field_info_instance('node', $field_name, 'node_example');
  52       $this->assertTrue($field,
  53         'Field: ' . $field_name . ' was attached to node_example.', 'API');
  54     }
  55 
  56     // And that view mode...
  57     // entity_get_info() invokes hook_entity_info_alter(), so it's
  58     // a good place to verify that our code works.
  59     $entities = entity_get_info('node');
  60     $this->assertTrue(isset($entities['view modes']['example_node_list']),
  61       'Added example_node_list view mode.', 'API');
  62   }
  63 
  64   /**
  65    * Verify the functionality of the example module.
  66    */
  67   function testNodeCreation() {
  68     // Create and login user.
  69     $account = $this->drupalCreateUser(array('access content', 'create node_example content'));
  70     $this->drupalLogin($account);
  71 
  72     // Create a new node. The image makes it more complicated, so skip it.
  73     $edit = array(
  74       'title' => $this->randomName(),
  75       'node_example_color[und][0][value]' => 'red',
  76       'node_example_color[und][1][value]' => 'green',
  77       'node_example_color[und][2][value]' => 'blue',
  78       'node_example_quantity[und][0][value]' => 100,
  79     );
  80     $this->drupalPost('node/add/node-example', $edit, t('Save'));
  81     $this->assertText("Example Node Type " . $edit['title'] . " has been created", "Found node creation message");
  82     $this->assertPattern("/The colors available.*red.*green.*blue/", "Correct 'colors available' on node page");
  83 
  84     // Look on the examples page to make sure it shows up there also.
  85     $this->drupalGet('examples/node_example');
  86     $this->assertText($edit['title'], "Found random title string");
  87     $this->assertPattern("/red.*green.*blue/", "Correct 'colors available' on node example page");
  88 
  89   }
  90 
  91   /**
  92    * Check the value of body label.
  93    *
  94    * Checks whether body label has a value of "Example Description"
  95    */
  96 
  97   function testBodyLabel() {
  98     // Create and login user.
  99     $account = $this->drupalCreateUser(array('access content', 'create node_example content'));
 100     $this->drupalLogin($account);
 101 
 102     // Request a node add node-example page.
 103     // Test whether the body label equals 'Example Description'.
 104     // Use '$this->assertRaw' to make certain to test the body label and not some other text.
 105     $this->drupalGet('node/add/node-example');
 106     $this->assertResponse(200, 'node/add/node-example page found');
 107     $this->assertRaw('<label for="edit-body-und-0-value">Example Description </label>', 'Body label equals \'Example Description\'');
 108   }
 109 }
";i:1;N;i:2;N;}i:2;i:14445;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18907;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:18907;}}