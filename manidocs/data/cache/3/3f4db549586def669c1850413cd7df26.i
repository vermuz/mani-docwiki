a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Node API Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:33;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"nodeapi_example.info";i:1;i:2;i:2;i:33;}i:2;i:33;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:33;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:236:"
   1 name = NodeAPI example
   2 description = Demonstrates using the hook_node_* APIs (formerly hook_nodeapi) to alter a node from a different module.
   3 package = Example modules
   4 core = 7.x
   5 files[] = nodeapi_example.test
";i:1;N;i:2;N;}i:2;i:71;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:316;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"nodeapi_example.install";i:1;i:2;i:2;i:316;}i:2;i:316;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:316;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2829:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Install, update and uninstall functions for the nodeapi_example module.
   6  */
   7 
   8 /**
   9  * Implements hook_schema().
  10  *
  11  * @ingroup nodeapi_example
  12  */
  13 function nodeapi_example_schema() {
  14   $schema['nodeapi_example'] = array(
  15     'description' => 'Stores information of extended content.',
  16     'fields' => array(
  17       'nid'    => array(
  18         'description' => 'Node ID that the rating is applied to.',
  19         'type' => 'int',
  20         'unsigned' => TRUE,
  21         'not null' => TRUE,
  22         'default' => 0
  23       ),
  24       'vid'    => array(
  25         'description' => 'Revision ID, as we are tracking rating with node revisions',
  26         'type' => 'int',
  27         'unsigned' => TRUE,
  28         'not null' => TRUE,
  29         'default' => 0
  30       ),
  31       'rating' => array(
  32         'description' => 'The rating of the node.',
  33         'type' => 'int',
  34         'unsigned' => TRUE,
  35         'not null' => TRUE,
  36         'default' => 0
  37       ),
  38     ),
  39     'primary key' => array('vid'),
  40     'indexes' => array(
  41       'nid'   => array('nid'),
  42     ),
  43   );
  44 
  45   return $schema;
  46 }
  47 
  48 /**
  49  * Implements hook_uninstall().
  50  *
  51  * We need to clean up our variables data when uninstalling our module.
  52  *
  53  * Our implementation of nodeapi_example_form_alter() automatically
  54  * creates a nodeapi_example_node_type_<contentType> variable for each node type
  55  * the user wants to rate.
  56  *
  57  * To delete our variables we call variable_del for our variables'
  58  * namespace, 'nodeapi_example_node_type_'. Note that an average module would
  59  * have known variables that it had created, and it could just delete those
  60  * explicitly. For example, see render_example_uninstall(). It's important
  61  * not to delete variables that might be owned by other modules, so normally
  62  * we would just explicitly delete a set of known variables.
  63  *
  64  * hook_uninstall() will only be called when uninstalling a module, not when
  65  * disabling a module. This allows our data to stay in the database if the user
  66  * only disables our module without uninstalling it.
  67  *
  68  * @ingroup nodeapi_example
  69  */
  70 function nodeapi_example_uninstall() {
  71   // Simple DB query to get the names of our variables.
  72   $results = db_select('variable', 'v')
  73     ->fields('v', array('name'))
  74     ->condition('name', 'nodeapi_example_node_type_%', 'LIKE')
  75     ->execute();
  76   // Loop through and delete each of our variables.
  77   foreach ($results as $result) {
  78     variable_del($result->name);
  79   }
  80 }
";i:1;N;i:2;N;}i:2;i:357;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3195;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"nodeapi_example.module";i:1;i:2;i:2;i:3195;}i:2;i:3195;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3195;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:10759:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  *
   6  * Module implementation for nodeapi_example module.
   7  */
   8 
   9 /**
  10  * @defgroup nodeapi_example Example: NodeAPI
  11  * @ingroup examples
  12  * @{
  13  * Example using NodeAPI.
  14  *
  15  * This is an example demonstrating how a module can be used to extend existing
  16  * node types.
  17  *
  18  * hook_nodeapi() has been replaced in Drupal 7 with a set of different hooks
  19  * providing the same or improved functionality. See the NodeAPI hooks list
  20  * at api.drupal.org (linked below).
  21  *
  22  * We will add the ability for each node to have a "rating," which will be a
  23  * number from one to five. The rating will be tracked using the revision
  24  * system also, so every node revision may have different rating values.
  25  *
  26  * @see node_api_hooks
  27  */
  28 
  29 /**
  30  * Implements hook_form_alter().
  31  *
  32  * By implementing this hook, we're able to modify any form. We'll only make
  33  * changes to two types: a node's content type configuration and edit forms.
  34  *
  35  * We need to have a way for administrators to indicate which content types
  36  * should have our rating field added. This is done by inserting radios in
  37  * the node's content type configuration page.
  38  *
  39  * Changes made by this hook will be shown when editing the settings of any
  40  * content type.
  41  *
  42  * Optionally, hook_form_FORM_ID_alter() could be used with the function name
  43  * nodeapi_example_form_node_type_form_alter
  44  */
  45 function nodeapi_example_form_alter(&$form, $form_state, $form_id) {
  46   // First, check for the node type configuration form.
  47   if ($form_id == 'node_type_form') {
  48     // Alter the node type's configuration form to add our setting. We don't
  49     // need to worry about saving this value back to the variable, the form
  50     // we're altering will do it for us.
  51     $form['rating'] = array(
  52       '#type' => 'fieldset',
  53       '#title' => t('Rating settings'),
  54       '#collapsible' => TRUE,
  55       '#collapsed' => TRUE,
  56       '#group' => 'additional_settings',
  57       '#weight' => -1,
  58     );
  59 
  60     $form['rating']['nodeapi_example_node_type'] = array(
  61       '#type' => 'radios',
  62       '#title' => t('NodeAPI Example Rating'),
  63       '#default_value' => variable_get('nodeapi_example_node_type_' . $form['#node_type']->type, FALSE),
  64       '#options' => array(
  65         FALSE => t('Disabled'),
  66         TRUE => t('Enabled')
  67       ),
  68       '#description' => t('Should this node have a rating attached to it?'),
  69     );
  70   }
  71   // Here we check to see if the type and node field are set. If so, it could
  72   // be a node edit form.
  73   elseif (isset($form['type']) && isset($form['#node']) && $form['type']['#value'] . '_node_form' == $form_id) {
  74     // If the rating is enabled for this node type, we insert our control
  75     // into the form.
  76     $node = $form['#node'];
  77     if (variable_get('nodeapi_example_node_type_' . $form['type']['#value'], FALSE)) {
  78       $form['nodeapi_example_rating'] = array(
  79         '#type' => 'select',
  80         '#title' => t('Rating'),
  81         '#default_value' => isset($node->nodeapi_example_rating) ? $node->nodeapi_example_rating : '',
  82         '#options' => array(0 => t('Unrated'), 1, 2, 3, 4, 5),
  83         '#required' => TRUE,
  84         '#weight' => 0,
  85       );
  86     }
  87   }
  88 }
  89 
  90 /**
  91  * Implements hook_node_validate().
  92  *
  93  * Check that the rating attribute is set in the form submission, since the
  94  * field is required. If not, send error message.
  95  */
  96 function nodeapi_example_node_validate($node, $form) {
  97   if (variable_get('nodeapi_example_node_type_' . $node->type, FALSE)) {
  98     if (isset($node->nodeapi_example_rating) && !$node->nodeapi_example_rating) {
  99       form_set_error('nodeapi_example_rating', t('You must rate this content.'));
 100     }
 101   }
 102 }
 103 
 104 /**
 105  * Implements hook_node_load().
 106  *
 107  * Loads the rating information if available for any of the nodes in the
 108  * argument list.
 109  */
 110 function nodeapi_example_node_load($nodes, $types) {
 111   // We can use $types to figure out if we need to process any of these nodes.
 112   $our_types = array();
 113   foreach ($types as $type) {
 114     if (variable_get('nodeapi_example_node_type_' . $type, FALSE)) {
 115       $our_types[] = $type;
 116     }
 117   }
 118 
 119   // Now $our_types contains all the types from $types that we want
 120   // to deal with. If it's empty, we can safely return.
 121   if (!count($our_types)) {
 122     return;
 123   }
 124 
 125   // Now we need to make a list of revisions based on $our_types
 126   foreach ($nodes as $node) {
 127     // We are using the revision id instead of node id.
 128     if (variable_get('nodeapi_example_node_type_' . $node->type, FALSE)) {
 129       $vids[] = $node->vid;
 130     }
 131   }
 132   // Check if we should load rating for any of the nodes.
 133   if (!isset($vids) || !count($vids)) {
 134     return;
 135   }
 136 
 137   // When we read, we don't care about the node->nid; we look for the right
 138   // revision ID (node->vid).
 139   $result = db_select('nodeapi_example', 'e')
 140   ->fields('e', array('nid', 'vid', 'rating'))
 141   ->where('e.vid IN (:vids)', array(':vids' => $vids))
 142   ->execute();
 143 
 144   foreach ($result as $record) {
 145     $nodes[$record->nid]->nodeapi_example_rating = $record->rating;
 146   }
 147 }
 148 
 149 /**
 150  * Implements hook_node_insert().
 151  *
 152  * As a new node is being inserted into the database, we need to do our own
 153  * database inserts.
 154  */
 155 function nodeapi_example_node_insert($node) {
 156   if (variable_get('nodeapi_example_node_type_' . $node->type, FALSE)) {
 157     // Notice that we are ignoring any revision information using $node->nid
 158     db_insert('nodeapi_example')
 159     ->fields(array(
 160         'nid' => $node->nid,
 161         'vid' => $node->vid,
 162         'rating' => $node->nodeapi_example_rating,
 163     ))
 164     ->execute();
 165   }
 166 }
 167 
 168 /**
 169  * Implements hook_node_delete().
 170  *
 171  * When a node is deleted, we need to remove all related records from our table,
 172  * including all revisions. For the delete operations we use node->nid.
 173  */
 174 function nodeapi_example_node_delete($node) {
 175   // Notice that we're deleting even if the content type has no rating enabled.
 176   db_delete('nodeapi_example')
 177     ->condition('nid', $node->nid)
 178     ->execute();
 179 }
 180 
 181 /**
 182  * Implements hook_node_update().
 183  *
 184  * As an existing node is being updated in the database, we need to do our own
 185  * database updates.
 186  *
 187  * This hook is called when an existing node has been changed. We can't simply
 188  * update, since the node may not have a rating saved, thus no
 189  * database field. So we first check the database for a rating. If there is one,
 190  * we update it. Otherwise, we call nodeapi_example_node_insert() to create one.
 191  */
 192 function nodeapi_example_node_update($node) {
 193   if (variable_get('nodeapi_example_node_type_' . $node->type, FALSE)) {
 194     // Check first if this node has a saved rating.
 195     $rating = db_select('nodeapi_example', 'e')
 196       ->fields('e', array(
 197         'rating',
 198       ))
 199       ->where('e.vid = (:vid)', array(':vid' => $node->vid))
 200       ->execute()->fetchField();
 201 
 202     if ($rating) {
 203       // Node has been rated before.
 204       db_update('nodeapi_example')
 205         ->fields(array('rating' => $node->nodeapi_example_rating))
 206         ->condition('vid', $node->vid)
 207         ->execute();
 208     }
 209     else {
 210       // Node was not previously rated, so insert a new rating in database.
 211       nodeapi_example_node_insert($node);
 212     }
 213   }
 214 }
 215 
 216 /**
 217  * Implements hook_node_view().
 218  *
 219  * This is a typical implementation that simply runs the node text through
 220  * the output filters.
 221  *
 222  * Finally, we need to take care of displaying our rating when the node is
 223  * viewed. This operation is called after the node has already been prepared
 224  * into HTML and filtered as necessary, so we know we are dealing with an
 225  * HTML teaser and body. We will inject our additional information at the front
 226  * of the node copy.
 227  *
 228  * Using node API 'hook_node_view' is more appropriate than using a filter here,
 229  * because filters transform user-supplied content, whereas we are extending it
 230  * with additional information.
 231  */
 232 function nodeapi_example_node_view($node, $build_mode = 'full') {
 233   if (variable_get('nodeapi_example_node_type_' . $node->type, FALSE)) {
 234     // Make sure to set a rating, also for nodes saved previously and not yet rated.
 235     $rating = isset($node->nodeapi_example_rating) ? $node->nodeapi_example_rating : 0;
 236     $node->content['nodeapi_example'] = array(
 237       '#markup' => theme('nodeapi_example_rating', array('rating' => $rating)),
 238         '#weight' => -1,
 239     );
 240   }
 241 }
 242 
 243 /**
 244  * Implements hook_theme().
 245  *
 246  * This lets us tell Drupal about our theme functions and their arguments.
 247  */
 248 function nodeapi_example_theme() {
 249   return array(
 250     'nodeapi_example_rating' => array(
 251       'variables' => array('rating' => NULL),
 252   ),
 253   );
 254 }
 255 
 256 /**
 257  * A custom theme function.
 258  *
 259  * By using this function to format our rating, themes can override this
 260  * presentation if they wish; for example, they could provide a star graphic
 261  * for the rating. We also wrap the default presentation in a CSS class that
 262  * is prefixed by the module name. This way, style sheets can modify the output
 263  * without requiring theme code.
 264  */
 265 function theme_nodeapi_example_rating($variables) {
 266   $options = array(
 267     0 => t('Unrated'),
 268     1 => t('Poor'),
 269     2 => t('Needs improvement'),
 270     3 => t('Acceptable'),
 271     4 => t('Good'),
 272     5 => t('Excellent'),
 273   );
 274   $output = '<div class="nodeapi_example_rating">';
 275   $output .= t('Rating: %rating', array('%rating' => $options[(int) $variables['rating']]));
 276   $output .= '</div>';
 277   return $output;
 278 }
 279 
 280 /**
 281  * @} End of "defgroup nodeapi_example".
 282  */
";i:1;N;i:2;N;}i:2;i:3235;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14003;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"nodeapi_example.test";i:1;i:2;i:2;i:14003;}i:2;i:14003;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:14003;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8482:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test case for Testing the node API example module.
   6  *
   7  * This file contains the test cases to check if module is performing as
   8  * expected.
   9  */
  10 class NodeApiExampleTestCase extends DrupalWebTestCase {
  11   /**
  12    * User object to perform site browsing
  13    * @var object
  14    */
  15   protected $web_user;
  16 
  17   /**
  18    * Content type to attach the rating system
  19    * @var string
  20    */
  21   protected $type;
  22 
  23   public static function getInfo() {
  24     return array(
  25       'name' => 'Node API example functionality',
  26       'description' => 'Demonstrate Node API hooks that allow altering a node. These are the former hook_nodeapi.',
  27       'group' => 'Examples',
  28     );
  29   }
  30 
  31   /**
  32    * Enables modules and create user with specific permissions.
  33    */
  34   function setUp() {
  35     parent::setUp('nodeapi_example');
  36 
  37     // Create admin user. This module has no access control, so we can use a
  38     // trusted user. Revision access and revert permissions are required too.
  39     $this->web_user = $this->drupalCreateUser(array(
  40       'administer nodes', // Required to set revision checkbox
  41       'administer content types',
  42       'bypass node access',
  43       'view revisions',
  44       'revert revisions'
  45     ));
  46     // Login the admin user.
  47     $this->drupalLogin($this->web_user);
  48   }
  49 
  50   /**
  51    * Log user in, creates an example node, and uses the rating system.
  52    */
  53   function testNodeExampleBasic() {
  54 
  55     // Login the user.
  56     $this->drupalLogin($this->web_user);
  57 
  58     // Create custom content type
  59     $content_type = $this->drupalCreateContentType();
  60     $type = $content_type->type;
  61 
  62     // Go to edit the settings of this content type
  63     $this->drupalGet('admin/structure/types/manage/' . $type);
  64     $this->assertResponse(200);
  65 
  66     // Check if the new Rating options appear in the settings page
  67     $this->assertText(t('NodeAPI Example Rating'), 'Rating options found in content type.');
  68     $this->assertFieldByName('nodeapi_example_node_type', 1, 'Rating is Disabled by default.');
  69 
  70     // Disable the rating for this content type: 0 for Disabled, 1 for Enabled.
  71     $content_settings = array(
  72       'nodeapi_example_node_type' => 0,
  73     );
  74     $this->drupalPost('admin/structure/types/manage/' . $type, $content_settings, t('Save content type'));
  75     $this->assertResponse(200);
  76     $this->assertRaw(' has been updated.', 'Settings modified successfully for content type.');
  77 
  78     // Create an example node
  79     $langcode = LANGUAGE_NONE;
  80     $edit = array(
  81       "title" => $this->randomName(),
  82     );
  83     $this->drupalPost('node/add/' . $type, $edit, t('Save'));
  84     $this->assertResponse(200);
  85 
  86     // Check that the rating is not shown, as we have not yet enabled it
  87     $this->assertNoRaw('Rating: <em>', 'Extended rating information is not shown.');
  88 
  89     // Save current current url (we are viewing the new node)
  90     $node_url = $this->getUrl();
  91 
  92     // Enable the rating for this content type: 0 for Disabled, 1 for Enabled.
  93     $content_settings = array(
  94       'nodeapi_example_node_type' => TRUE,
  95     );
  96     $this->drupalPost('admin/structure/types/manage/' . $type, $content_settings, t('Save content type'));
  97     $this->assertResponse(200);
  98     $this->assertRaw(' has been updated.', 'Settings modified successfully for content type.');
  99 
 100     // Check previously create node. It should be not rated
 101     $this->drupalGet($node_url);
 102     $this->assertResponse(200);
 103     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Unrated'))), 'Content is not rated.');
 104 
 105     // Rate the content, 4 is for "Good"
 106     $rate = array(
 107       'nodeapi_example_rating' => 4,
 108     );
 109     $this->drupalPost($node_url . '/edit', $rate, t('Save'));
 110     $this->assertResponse(200);
 111 
 112     // Check that content has been rated
 113     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Good'))), 'Content is successfully rated.');
 114 
 115   }
 116 
 117   /**
 118    * Logs user in, creates an example node, and tests rating functionality with
 119    * a node using revisions.
 120    */
 121   function testNodeExampleRevision() {
 122 
 123     // Login the user.
 124     $this->drupalLogin($this->web_user);
 125 
 126     // Create custom content type
 127     $content_type = $this->drupalCreateContentType();
 128     $type = $content_type->type;
 129 
 130     // Go to edit the settings of this content type
 131     $this->drupalGet('admin/structure/types/manage/' . $type);
 132     $this->assertResponse(200);
 133 
 134     // Check if the new Rating options appear in the settings page
 135     $this->assertText(t('NodeAPI Example Rating'), 'Rating options found in content type.');
 136     $this->assertFieldByName('nodeapi_example_node_type', 1, 'Rating is Disabled by default.');
 137 
 138     // Disable the rating for this content type: 0 for Disabled, 1 for Enabled.
 139     $content_settings = array(
 140       'nodeapi_example_node_type' => 0,
 141     );
 142     $this->drupalPost('admin/structure/types/manage/' . $type, $content_settings, t('Save content type'));
 143     $this->assertResponse(200);
 144     $this->assertRaw(' has been updated.', 'Settings modified successfully for content type.');
 145 
 146     // Create an example node
 147     $langcode = LANGUAGE_NONE;
 148     $edit = array(
 149       "title" => $this->randomName(),
 150     );
 151     $this->drupalPost('node/add/' . $type, $edit, t('Save'));
 152     $this->assertResponse(200);
 153 
 154     // Check that the rating is not shown, as we have not yet enabled it
 155     $this->assertNoRaw('Rating: <em>', 'Extended rating information is not shown.');
 156 
 157     // Save current current url (we are viewing the new node)
 158     $node_url = $this->getUrl();
 159 
 160     // Enable the rating for this content type: 0 for Disabled, 1 for Enabled.
 161     $content_settings = array(
 162       'nodeapi_example_node_type' => TRUE,
 163     );
 164     $this->drupalPost('admin/structure/types/manage/' . $type, $content_settings, t('Save content type'));
 165     $this->assertResponse(200);
 166     $this->assertRaw(' has been updated.', 'Settings modified successfully for content type.');
 167 
 168     // Check previously create node. It should be not rated
 169     $this->drupalGet($node_url);
 170     $this->assertResponse(200);
 171     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Unrated'))), 'Content is not rated.');
 172 
 173     // Rate the content, 4 is for "Good"
 174     $rate = array(
 175       'nodeapi_example_rating' => 4,
 176     );
 177     $this->drupalPost($node_url . '/edit', $rate, t('Save'));
 178     $this->assertResponse(200);
 179 
 180     // Check that content has been rated
 181     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Good'))), 'Content is successfully rated.');
 182 
 183     // Rate the content to poor using a new revision, 1 is for "Poor"
 184     $rate = array(
 185       'nodeapi_example_rating' => 1,
 186       'revision'               => 1,
 187     );
 188     $this->drupalPost($node_url . '/edit', $rate, t('Save'));
 189     $this->assertResponse(200);
 190 
 191     // Check that content has been rated
 192     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Poor'))), 'Content is successfully rated.');
 193 
 194     //Now switch back to previous revision of the node.
 195     $this->drupalGet($node_url . '/revisions');
 196     // There is only a revision, so it must work just clicking the first link..
 197     $this->clickLink('revert');
 198     $revert_form = $this->getUrl();
 199     $this->drupalPost($revert_form, array(), t('Revert'));
 200 
 201     // Go back to the node page.
 202     $this->drupalGet($node_url);
 203     $this->assertResponse(200);
 204 
 205     // Check that content has been rated
 206     $this->assertRaw(t('Rating: %rating', array('%rating' => t('Good'))), 'Content rating matches reverted revision.');
 207 
 208   }
 209 
 210 }
";i:1;N;i:2;N;}i:2;i:14041;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22531;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:22531;}}