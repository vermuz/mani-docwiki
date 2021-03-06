a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Node Access Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:36;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"node_access_example.info";i:1;i:2;i:2;i:36;}i:2;i:36;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:36;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:201:"
   1 name = Node access example
   2 description = Demonstrates how a module can use Drupal's node access system
   3 package = Example modules
   4 core = 7.x
   5 files[] = node_access_example.test
";i:1;N;i:2;N;}i:2;i:78;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:288;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"node_access_example.install";i:1;i:2;i:2;i:288;}i:2;i:288;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:288;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:673:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Install, update, and uninstall functions for the node_access_example module.
   6  */
   7 
   8 /**
   9  * Implements hook_schema().
  10  */
  11 function node_access_example_schema() {
  12   $schema['node_access_example'] = array(
  13     'description' => 'Example table for node_access_example module',
  14     'fields' => array(
  15       'nid'     => array('type' => 'int', 'unsigned' => TRUE, 'not null' => TRUE, 'default' => 0),
  16       'private' => array('type' => 'int', 'not null' => TRUE, 'default' => 0),
  17     ),
  18     'primary key' => array('nid'),
  19   );
  20 
  21   return $schema;
  22 }
";i:1;N;i:2;N;}i:2;i:333;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1015;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"node_access_example.module";i:1;i:2;i:2;i:1015;}i:2;i:1015;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1015;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20206:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Module file illustrating API-based node access.
   6  */
   7 
   8 /**
   9  * @defgroup node_access_example Example: Node Access
  10  * @ingroup examples
  11  * @{
  12  * Demonstrates node access.
  13  *
  14  * This is an example demonstrating how to grant or deny access to nodes
  15  * using the Drupal core API node access system.
  16  *
  17  * This module will add a 'private' flag for each node, which the node's
  18  * author can manage. Nodes marked private can only be viewed, edited,
  19  * or deleted by the author. However, not everything is as private as it
  20  * seems on the internet, and so we need to implement some ways to allow
  21  * other users to manage this 'private' content.
  22  *
  23  * We will use the node grant system to specify which users
  24  * are allowed to view, edit, or delete 'private' content. We will also
  25  * allow a user named 'foobar' to have edit privileges on private content
  26  * as well.
  27  *
  28  * In addition, we will provide a page which will show some minimal
  29  * instructions, and statistics on private nodes on the site.
  30  *
  31  * We use NodeAPI hooks to put a single marker on a node, called
  32  * 'private'. The marker is implemented by a database table which has one
  33  * row per node simply indicating that the node is private. If the "private"
  34  * marker is set, users other than the owner and privileged users are denied
  35  * access.
  36  *
  37  * Standard permissions are defined which allow users with
  38  * 'access any private content' or 'edit any private content' to override
  39  * the 'private' node access restrictions.
  40  *
  41  * A separate access realm grants privileges to each node's author, so that
  42  * they can always view, edit, and delete their own private nodes.
  43  *
  44  * The only page provided by this module gives a rundown of how many nodes
  45  * are marked private, and how many of those are accessible to the current
  46  * user. This demonstrates the use of the 'node_access' tag in node queries,
  47  * preventing disclosure of information which should not be shown to users
  48  * who don't have the proper permissions.
  49  *
  50  * Most relevant functions:
  51  * - node_access_example_permission()
  52  * - node_access_example_node_access()
  53  * - node_access_example_node_access_records()
  54  * - node_access_example_node_grants()
  55  *
  56  * Drupal's node access system has three layers.
  57  * - Overall override permissions. User 1 and any user with 'bypass node
  58  *   access' permission are automatically granted access.
  59  * - hook_node_access() gives each module the opportunity to approve or deny
  60  *   access. Any module that returns NODE_ACCESS_DENY from hook_node_access()
  61  *   will result in denial of access. If no module denies access and one or
  62  *   more modules allow access, then access is granted. hook_node_access() was
  63  *   introduced in Drupal 7.
  64  * - If no resolution has yet been reached, then the node_access table is used
  65  *   along with hook_node_grants(). (Drupal updates the node_access table when
  66  *   nodes are saved, by calling hook_node_access_records().)
  67  *
  68  * Note that the hook_node_grants()/hook_node_access_records() layer is a
  69  * first-grant-wins system, which means a module using it can't deny access to
  70  * a node. Contributed modules have been developed to overcome this
  71  * shortcoming, with their own APIs, such as
  72  * @link http://drupal.org/project/acl ACL. @endlink ACL, in fact, has emerged
  73  * as the more-or-less standard solution for fine-grained access control, and
  74  * you really should be reading up on it. Many modules use it, and if your
  75  * module implements another node access system, there could be chaos.
  76  *
  77  * A list of the many node access modules (and differing APIs) is here:
  78  * @link http://drupal.org/node/270000 Overview of Node Access Modules. @endlink
  79  * Note that this is Drupal 6 documentation, linked here so the reader can
  80  * understand the historical reasons for using contributed node access modules
  81  * such as ACL.
  82  *
  83  * @see node_access()
  84  * @see hook_node_access()
  85  * @see hook_node_grants()
  86  * @see hook_node_access_records()
  87  */
  88 
  89 /**
  90  * Implements hook_menu().
  91  *
  92  * This path provides a page, with some instructions for the user, and some
  93  * statistics about node access changes implemented by this module.
  94  *
  95  * @see hook_menu()
  96  */
  97 function node_access_example_menu() {
  98   $items['examples/node_access'] = array(
  99     'title' => 'Node Access Example',
 100     'page callback' => 'node_access_example_private_node_listing',
 101     'access callback' => TRUE,
 102   );
 103   return $items;
 104 }
 105 
 106 /**
 107  * Our hook_menu() page callback function.
 108  *
 109  * Information for the user about what nodes are marked private on the system
 110  * and which of those the user has access to.
 111  *
 112  * The queries showing what is accessible to the current user demonstrate the
 113  * use of the 'node_access' tag to make sure that we don't show inappropriate
 114  * information to unprivileged users.
 115  *
 116  * @return Page content.
 117  *
 118  * @see page_example
 119  */
 120 function node_access_example_private_node_listing() {
 121   $content = '<div>' . t('This example shows how a module can use the Drupal node access system to allow access to specific nodes. You will need to look at the code and then experiment with it by creating nodes, marking them private, and accessing them as various users.') . '</div>';
 122 
 123   // Find out how many nodes are marked private.
 124   $query = db_select('node', 'n');
 125   $query->addExpression('COUNT(n.nid)', 'private_count');
 126   $query->join('node_access_example', 'nae', 'nae.nid = n.nid');
 127   $num_private = $query
 128   ->condition('nae.private', 1)->execute()->fetchField();
 129 
 130   // Find out how many nodes owned by this user are marked private.
 131   $query = db_select('node', 'n');
 132   $query->addExpression('COUNT(n.nid)', 'private_count');
 133   $query->join('node_access_example', 'nae', 'nae.nid = n.nid');
 134   $num_personal = $query
 135   ->condition('n.uid', $GLOBALS['user']->uid)
 136   ->condition('nae.private', 1)
 137   ->execute()->fetchfield();
 138 
 139   $content .= '<div>' . t('There are currently @num private nodes in the system @num_personal are yours.', array('@num' => $num_private, '@num_personal' => $num_personal)) . '</div>';
 140 
 141   // Use a 'node_access' tag with a query to find out how many this user has
 142   // access to. This will be the standard way to make lists while respecting
 143   // node access restrictions.
 144   $query = db_select('node', 'n');
 145   $query->addExpression('COUNT(n.nid)', 'private_count');
 146   $query->addTag('node_access');
 147   $query->join('node_access_example', 'nae', 'nae.nid = n.nid');
 148   $num_private_accessible = $query->condition('nae.private', 1)->execute()->fetchField();
 149   $content .= '<div>' . t('You have access to @num private nodes.', array('@num' => $num_private_accessible)) . '</div>';
 150 
 151   // Use the key 'node_access' tag to get the key data from the nodes this
 152   // has access to.
 153   $query = db_select('node', 'n', array('fetch' => PDO::FETCH_ASSOC));
 154   $query->addTag('node_access');
 155   $query->join('node_access_example', 'nae', 'nae.nid = n.nid');
 156   $query->join('users', 'u', 'u.uid = n.uid');
 157   $result = $query->fields('n', array('nid', 'title', 'uid'))
 158   ->fields('u', array('name'))
 159   ->condition('nae.private', 1)->execute();
 160 
 161   $rows = array();
 162   foreach ($result as $node) {
 163     $node['nid'] = l($node['nid'], 'node/' . $node['nid']);
 164     $rows[] = array('data' => $node,  'class' => array('accessible'));
 165   }
 166   $content .= '<div>' . t('Accessible rows:') . theme('table', array('header' => array('nid', 'title', 'uid', 'username'), 'rows' => $rows)) . '</div>';
 167 
 168   return array('#markup' => $content);
 169 }
 170 
 171 /**
 172  * Implements hook_permission().
 173  *
 174  * We create two permissions, which we can use as a base for our grant/deny
 175  * decision:
 176  *
 177  * - 'access any private content' allows global access to content marked
 178  *   private by other users.
 179  * - 'edit any private content' allows global edit
 180  *   privileges, basically overriding the node access system.
 181  *
 182  * Note that the 'edit any * content' and 'delete any * content' permissions
 183  * will allow edit or delete permissions to the holder, regardless of what
 184  * this module does.
 185  *
 186  * @see hook_permissions()
 187  */
 188 function node_access_example_permission() {
 189   return array(
 190     'access any private content' => array(
 191       'title' => t('Access any private content'),
 192       'description' => t('May view posts of other users even though they are marked private.'),
 193     ),
 194     'edit any private content' => array(
 195       'title' => t('Edit any private content'),
 196       'description' => t('May edit posts of other users even though they are marked private.'),
 197     ),
 198   );
 199 }
 200 
 201 /**
 202  * Implements hook_node_access().
 203  *
 204  * Allows view and edit access to private nodes, when the account requesting
 205  * access has the username 'foobar'.
 206  *
 207  * hook_node_access() was introduced in Drupal 7. We use it here to demonstrate
 208  * allowing certain privileges to an arbitrary user.
 209  *
 210  * @see hook_node_access()
 211  */
 212 function node_access_example_node_access($node, $op, $account) {
 213   // If $node is a string, the node has not yet been created. We don't care
 214   // about that case.
 215   if (is_string($node)) {
 216     return NODE_ACCESS_IGNORE;
 217   }
 218   if (($op == 'view' || $op == 'update') && (!empty($account->name) && $account->name == 'foobar') && !empty($node->private)) {
 219     drupal_set_message(t('Access to node @nid allowed because requester name (@name) is specifically allowed', array('@name' => $node->name, '@uid' => $account->uid)));
 220     return NODE_ACCESS_ALLOW;
 221   }
 222   return NODE_ACCESS_IGNORE;
 223 }
 224 
 225 /**
 226  * Here we define a constant for our node access grant ID, for the
 227  * node_access_example_view and node_access_example_edit realms. This ID could
 228  * be any integer, but here we choose 23, because it is this author's favorite
 229  * number.
 230  */
 231 define('NODE_ACCESS_EXAMPLE_GRANT_ALL', 23);
 232 
 233 /**
 234  * Implements hook_node_grants().
 235  *
 236  * Tell the node access system what grant IDs the user belongs to for each
 237  * realm, based on the operation being performed.
 238  *
 239  * When the user tries to perform an operation on the node, Drupal calls
 240  * hook_node_grants() to determine grant ID and realm for the user. Drupal
 241  * looks up the grant ID and realm for the node, and compares them to the
 242  * grant ID and realm provided here. If grant ID and realm match for both
 243  * user and node, then the operation is allowed.
 244  *
 245  * Grant ID and realm are both determined per node, by your module in
 246  * hook_node_access_records().
 247  *
 248  * In our example, we've created three access realms: One for authorship, and
 249  * two that track with the permission system.
 250  *
 251  * We always add node_access_example_author to the list of grants, with a grant
 252  * ID equal to their user ID. We do this because in our model, authorship
 253  * always gives you permission to edit or delete your nodes, even if they're
 254  * marked private.
 255  *
 256  * Then we compare the user's permissions to the operation to determine whether
 257  * the user falls into the other two realms: node_access_example_view, and/or
 258  * node_access_example_edit. If the user has the 'access any private content'
 259  * permission we defined in hook_permission(), they're declared as belonging to
 260  * the node_access_example_realm. Similarly, if they have the 'edit any private
 261  * content' permission, we add the node_access_example_edit realm to the list
 262  * of grants they have.
 263  *
 264  * @see node_access_example_permission()
 265  * @see node_access_example_node_access_records()
 266  */
 267 function node_access_example_node_grants($account, $op) {
 268   // First grant a grant to the author for own content.
 269   $grants['node_access_example_author'] = array($account->uid);
 270 
 271   // Then, if "access any private content" is allowed to the account,
 272   // grant view, update, or delete as necessary.
 273   if ($op == 'view' && user_access('access any private content', $account)) {
 274     $grants['node_access_example_view'] = array(NODE_ACCESS_EXAMPLE_GRANT_ALL);
 275   }
 276 
 277   if (($op == 'update' || $op == 'delete') && user_access('edit any private content', $account)) {
 278     $grants['node_access_example_edit'] = array(NODE_ACCESS_EXAMPLE_GRANT_ALL);
 279   }
 280 
 281   return $grants;
 282 }
 283 
 284 /**
 285  * Implements hook_node_access_records().
 286  *
 287  * All node access modules must implement this hook. If the module is
 288  * interested in the privacy of the node passed in, return a list
 289  * of node access values for each grant ID we offer.
 290  *
 291  * In this example, for each node which is marked 'private,' we define
 292  * three realms:
 293  *
 294  * The first and second are realms are 'node_access_example_view' and
 295  * 'node_access_example_edit,' which have a single grant ID, 1. The
 296  * user is either a member of these realms or not, depending upon the
 297  * operation and the access permission set.
 298  *
 299  * The third is node_access_example_author. It gives the node
 300  * author special privileges. node_access_example_author has one grant ID for
 301  * every UID, and each user is automatically a member of the group where
 302  * GID == UID. This has the effect of giving each user their own grant ID
 303  * for nodes they authored, within this realm.
 304  *
 305  * Drupal calls this hook when a node is saved, or when access permissions
 306  * change in order to rebuild the node access database table(s).
 307  *
 308  * The array you return will define the realm and the grant ID for the
 309  * given node. This is stored in the {node_access} table for subsequent
 310  * comparison against the user's realm and grant IDs, which you'll
 311  * supply in hook_node_grants().
 312  *
 313  * Realm names and grant IDs are arbitrary. Official drupal naming
 314  * conventions do not cover access realms, but since all realms are
 315  * stored in the same database table, it's probably a good idea to
 316  * use descriptive names which follow the module name, such as
 317  * 'mymodule_realmname'.
 318  *
 319  * @see node_access_example_node_grants()
 320  */
 321 function node_access_example_node_access_records($node) {
 322   // We only care about the node if it's been marked private. If not, it is
 323   // treated just like any other node and we completely ignore it.
 324   if (!empty($node->private)) {
 325     $grants = array();
 326     $grants[] = array(
 327       'realm' => 'node_access_example_view',
 328       'gid' => NODE_ACCESS_EXAMPLE_GRANT_ALL,
 329       'grant_view' => 1,
 330       'grant_update' => 0,
 331       'grant_delete' => 0,
 332       'priority' => 0,
 333     );
 334     $grants[] = array(
 335       'realm' => 'node_access_example_edit',
 336       'gid' => NODE_ACCESS_EXAMPLE_GRANT_ALL,
 337       'grant_view' => 1,
 338       'grant_update' => 1,
 339       'grant_delete' => 1,
 340       'priority' => 0,
 341     );
 342 
 343     // For the node_access_example_author realm, the grant ID (gid) is
 344     // equivalent to the node author's user ID (UID).
 345     $grants[] = array(
 346       'realm' => 'node_access_example_author',
 347       'gid' => $node->uid,
 348       'grant_view' => 1,
 349       'grant_update' => 1,
 350       'grant_delete' => 1,
 351       'priority' => 0,
 352     );
 353     return $grants;
 354   }
 355   // Return nothing if the node has not been marked private.
 356 }
 357 
 358 /**
 359  * Implements hook_form_alter().
 360  *
 361  * This module adds a simple checkbox to the node form labeled private. If the
 362  * checkbox is checked, only the node author and users with
 363  * 'access any private content' privileges may see it.
 364  */
 365 function node_access_example_form_alter(&$form, $form_state) {
 366   if (!empty($form['#node_edit_form'])) {
 367     $form['node_access_example'] = array(
 368       '#type' => 'fieldset',
 369       '#title' => t('Node Access Example'),
 370       '#collapsible' => TRUE,
 371       '#collapsed' => FALSE,
 372       '#weight' => 8,
 373     );
 374 
 375     $form['node_access_example']['private'] = array(
 376       '#type' => 'checkbox',
 377       '#title' => t('Private'),
 378       '#description' => t('Check here if this content should be set private and only shown to privileged users.'),
 379       '#default_value' => isset($form['#node']->private) ? $form['#node']->private : FALSE,
 380     );
 381   }
 382 }
 383 
 384 /**
 385  * Implements hook_node_load().
 386  *
 387  * Gather and add the private setting for the nodes Drupal is loading.
 388  * @see nodeapi_example.module
 389  */
 390 function node_access_example_node_load($nodes, $types) {
 391   $result = db_query('SELECT nid, private FROM {node_access_example} WHERE nid IN(:nids)', array(':nids' => array_keys($nodes)));
 392   foreach ($result as $record) {
 393     $nodes[$record->nid]->private = $record->private;
 394   }
 395 }
 396 
 397 /**
 398  * Implements hook_node_delete().
 399  *
 400  * Delete the node_access_example record when the node is deleted.
 401  * @see nodeapi_example.module
 402  */
 403 function node_access_example_node_delete($node) {
 404   db_delete('node_access_example')->condition('nid', $node->nid)->execute();
 405 }
 406 
 407 /**
 408  * Implements hook_node_insert().
 409  *
 410  * Insert a new access record when a node is created.
 411  * @see nodeapi_example.module
 412  */
 413 function node_access_example_node_insert($node) {
 414   if (isset($node->private)) {
 415     db_insert('node_access_example')->fields(array('nid' => $node->nid, 'private' => (int)$node->private))->execute();
 416   }
 417   drupal_set_message(t('New node @nid was created and private=@private', array('@nid' => $node->nid, '@private' => !empty($node->private) ? 1 : 0)));
 418 }
 419 
 420 /**
 421  * Implements hook_node_update().
 422  *
 423  * If the record in the node_access_example table already exists, we must
 424  * update it. If it doesn't exist, we create it.
 425  * @see nodeapi_example.module
 426  */
 427 function node_access_example_node_update($node) {
 428   // Find out if there is already a node_access_example record.
 429   $exists =  db_query('SELECT nid FROM {node_access_example} WHERE nid = :nid', array(':nid' => $node->nid))->fetchField();
 430 
 431   // If there is already a record, update it with the new private value.
 432   if ($exists) {
 433     $num_updated = db_update('node_access_example')
 434     ->fields(array(
 435         'nid' => $node->nid,
 436         'private' => !empty($node->private) ? 1 : 0,
 437     ))
 438     ->condition('nid', $node->nid)
 439     ->execute();
 440     drupal_set_message(t("Updated node @nid to set private=@private (@num nodes actually updated)", array('@private' => $node->private, '@num' => $num_updated, '@nid' => $node->nid)));
 441   }
 442   // Otherwise, create a new record.
 443   else {
 444     node_access_example_node_insert($node);
 445     drupal_set_message(t('Inserted new node_access nid=@nid, private=@private', array('@nid' => $node->nid, '@private' => $node->private)));
 446   }
 447 }
 448 
 449 /**
 450  * @} End of "defgroup node_access_example".
 451  */
";i:1;N;i:2;N;}i:2;i:1059;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:21274;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"node_access_example.test";i:1;i:2;i:2;i:21274;}i:2;i:21274;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:21274;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:9663:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Tests for Node Access example module.
   6  */
   7 class NodeAccessExampleTestCase extends DrupalWebTestCase {
   8 
   9   public static function getInfo() {
  10     return array(
  11       'name' => 'Node Access Example functionality',
  12       'description' => 'Checks behavior of Node Access Example.',
  13       'group' => 'Examples',
  14     );
  15   }
  16 
  17   /**
  18    * Enable modules and create user with specific permissions.
  19    */
  20   public function setUp() {
  21     parent::setUp('node_access_example', 'search');
  22     node_access_rebuild();
  23   }
  24 
  25   /**
  26    * Test the "private" node access.
  27    *
  28    * - Create 3 users with "access content" and "create article" permissions.
  29    * - Each user creates one private and one not private article.
  30    * - Run cron to update search index.
  31    * - Test that each user can view the other user's non-private article.
  32    * - Test that each user cannot view the other user's private article.
  33    * - Test that each user finds only appropriate (non-private + own private)
  34    *   in search results.
  35    * - Create another user with 'view any private content'.
  36    * - Test that user 4 can view all content created above.
  37    * - Test that user 4 can search for all content created above.
  38    * - Test that user 4 cannot edit private content above.
  39    * - Create another user with 'edit any private content'
  40    * - Test that user 5 can edit private content.
  41    * - Test that user 5 can delete private content.
  42    * - Test listings of nodes with 'node_access' tag on database search.
  43    */
  44   function testNodeAccessBasic() {
  45     $num_simple_users = 3;
  46     $simple_users = array();
  47 
  48     // nodes keyed by uid and nid: $nodes[$uid][$nid] = $is_private;
  49     $nodes_by_user = array();
  50     $titles = array(); // Titles keyed by nid
  51     $private_nodes = array(); // Array of nids marked private.
  52     for ($i = 0; $i < $num_simple_users; $i++) {
  53       $simple_users[$i] = $this->drupalCreateUser(array('access content', 'create article content', 'search content'));
  54     }
  55     foreach ($simple_users as $web_user) {
  56       $this->drupalLogin($web_user);
  57       foreach (array(0 => 'Public', 1 => 'Private') as $is_private => $type) {
  58         $edit = array(
  59           'title' => t('@private_public Article created by @user', array('@private_public' => $type, '@user' => $web_user->name)),
  60         );
  61         if ($is_private) {
  62           $edit['private'] = TRUE;
  63           $edit['body[und][0][value]'] = 'private node';
  64         }
  65         else {
  66           $edit['body[und][0][value]'] = 'public node';
  67         }
  68         $this->drupalPost('node/add/article', $edit, t('Save'));
  69         debug(t('Created article with private=@private', array('@private' => $is_private)));
  70         $this->assertText(t('Article @title has been created', array('@title' => $edit['title'])));
  71         $nid = db_query('SELECT nid FROM {node} WHERE title = :title', array(':title' => $edit['title']))->fetchField();
  72         $this->assertText(t('New node @nid was created and private=@private', array('@nid' => $nid, '@private' => $is_private)));
  73         $private_status = db_query('SELECT private FROM {node_access_example} where nid = :nid', array(':nid' => $nid))->fetchField();
  74         $this->assertTrue($is_private == $private_status, 'Node was properly set to private or not private in node_access_example table.');
  75         if ($is_private) {
  76           $private_nodes[] = $nid;
  77         }
  78         $titles[$nid] = $edit['title'];
  79         $nodes_by_user[$web_user->uid][$nid] = $is_private;
  80       }
  81     }
  82     debug($nodes_by_user);
  83     $this->cronRun();  // Build the search index.
  84     foreach ($simple_users as $web_user) {
  85       $this->drupalLogin($web_user);
  86       // Check to see that we find the number of search results expected.
  87       $this->checkSearchResults('Private node', 1);
  88       // Check own nodes to see that all are readable.
  89       foreach (array_keys($nodes_by_user) as $uid) {
  90         // All of this user's nodes should be readable to same.
  91         if ($uid == $web_user->uid) {
  92           foreach ($nodes_by_user[$uid] as $nid => $is_private) {
  93             $this->drupalGet('node/' . $nid);
  94             $this->assertResponse(200);
  95             $this->assertTitle($titles[$nid] . ' | Drupal', 'Correct title for node found');
  96           }
  97         }
  98         else {
  99           // Otherwise, for other users, private nodes should get a 403,
 100           // but we should be able to read non-private nodes.
 101           foreach ($nodes_by_user[$uid] as $nid => $is_private) {
 102             $this->drupalGet('node/' . $nid);
 103             $this->assertResponse($is_private ? 403 : 200, format_string('Node @nid by user @uid should get a @response for this user (@web_user_uid)', array('@nid' => $nid, '@uid' => $uid, '@response' => $is_private ? 403 : 200, '@web_user_uid' => $web_user->uid)));
 104             if (!$is_private) {
 105               $this->assertTitle($titles[$nid] . ' | Drupal', 'Correct title for node was found');
 106             }
 107           }
 108         }
 109       }
 110 
 111       // Check to see that the correct nodes are shown on examples/node_access.
 112       $this->drupalGet('examples/node_access');
 113       $accessible = $this->xpath("//tr[contains(@class,'accessible')]");
 114       $this->assertEqual(count($accessible), 1, 'One private item accessible');
 115       foreach ($accessible as $row) {
 116         $this->assertEqual($row->td[2], $web_user->uid, 'Accessible row owned by this user');
 117       }
 118     }
 119 
 120     // Now test that a user with 'access any private content' can view content.
 121     $access_user = $this->drupalCreateUser(array('access content', 'create article content', 'access any private content', 'search content'));
 122     $this->drupalLogin($access_user);
 123 
 124     // Check to see that we find the number of search results expected.
 125     $this->checkSearchResults('Private node', 3);
 126 
 127     foreach ($nodes_by_user as $uid => $private_status) {
 128       foreach ($private_status as $nid => $is_private) {
 129         $this->drupalGet('node/' . $nid);
 130         $this->assertResponse(200);
 131       }
 132     }
 133 
 134     // Check to see that the correct nodes are shown on examples/node_access.
 135     // This user should be able to see all 3 of them.
 136     $this->drupalGet('examples/node_access');
 137     $accessible = $this->xpath("//tr[contains(@class,'accessible')]");
 138     $this->assertEqual(count($accessible), 3);
 139 
 140 
 141     // Test that a user named 'foobar' can edit any private node due to
 142     // node_access_example_node_access(). Note that this user will not be
 143     // able to search for private nodes, and will not have available nodes
 144     // shown on examples/node_access, because node_access() is not called
 145     // for node listings, only for actual access to a node.
 146     $edit_user = $this->drupalCreateUser(array('access comments', 'access content', 'post comments', 'skip comment approval', 'search content'));
 147     // Update the name of the user to 'foobar'.
 148     $num_updated = db_update('users')
 149       ->fields(array(
 150           'name' => 'foobar',
 151       ))
 152       ->condition('uid', $edit_user->uid)
 153       ->execute();
 154 
 155     $edit_user->name = 'foobar';
 156     $this->drupalLogin($edit_user);
 157 
 158     // Try to edit each of the private nodes.
 159     foreach ($private_nodes as $nid) {
 160       $body = $this->randomName();
 161       $edit = array('body[und][0][value]' => $body);
 162       $this->drupalPost('node/' . $nid . '/edit', $edit, t('Save'));
 163       $this->assertText(t('has been updated'), 'Node was updated by "foobar" user');
 164     }
 165 
 166     // Test that a privileged user can edit and delete private content.
 167     // This test should go last, as the nodes get deleted.
 168     $edit_user = $this->drupalCreateUser(array('access content', 'access any private content', 'edit any private content'));
 169     $this->drupalLogin($edit_user);
 170     foreach ($private_nodes as $nid) {
 171       $body = $this->randomName();
 172       $edit = array('body[und][0][value]' => $body);
 173       $this->drupalPost('node/' . $nid . '/edit', $edit, t('Save'));
 174       $this->assertText(t('has been updated'));
 175       $this->drupalPost('node/' . $nid . '/edit', array(), t('Delete'));
 176       $this->drupalPost(NULL, array(), t('Delete'));
 177       $this->assertText(t('has been deleted'));
 178     }
 179 
 180 
 181   }
 182 
 183   /**
 184    * On the search page, search for a string and assert the expected number
 185    * of results.
 186    * @param $search_query
 187    *   String to search for
 188    * @param $expected_result_count
 189    *   Expected result count
 190    */
 191   function checkSearchResults($search_query, $expected_result_count) {
 192     $this->drupalPost('search/node', array('keys' => $search_query), t('Search'));
 193     $search_results = $this->xpath("//ol[contains(@class, 'search-results')]/li");
 194     $this->assertEqual(count($search_results), $expected_result_count, 'Found the expected number of search results');
 195   }
 196 }
";i:1;N;i:2;N;}i:2;i:21316;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30987;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:30987;}}