a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Action Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"action_example.info";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:226:"
   1 name = Action example
   2 description = Demonstrates providing actions that can be associated to triggers.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = trigger
   6 files[] = action_example.test
";i:1;N;i:2;N;}i:2;i:69;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:305;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"action_example.module";i:1;i:2;i:2;i:305;}i:2;i:305;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:305;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17832:"
  1 <?php
   2 
   3 /**
   4  * @file
   5  * Action definition example module.
   6  */
   7 
   8 /**
   9  * @defgroup action_example Example: Action
  10  * @ingroup examples
  11  * @{
  12  * Creating actions in Drupal 7
  13  *
  14  * Triggers and actions are a matched pair of Drupal features allowing some
  15  * Drupal programming without using PHP. Using the appropriate action in a
  16  * specific event, a site administrator can add new functionality.
  17  *
  18  * Examples are:
  19  *  - Send an email after a node is published or edited.
  20  *  - Display a message after a user has logged in.
  21  *  - Display a message and send an email after a node has been deleted.
  22  *
  23  * A trigger is a special function which can enqueue actions. The trigger module
  24  * provides the interface allowing us to associate certain actions with certain
  25  * triggers.
  26  *
  27  * Actions are the functions designed to be run by triggers.
  28  *
  29  * A trigger should build the appropriate context for the action to be fired.
  30  * Actions are very often grouped by functionality: examples are 'user', 'node',
  31  * 'taxonomy'. When actions are grouped it is because they expect the same
  32  * arguments. This way, you can enqueue as many actions understanding the 'user'
  33  * object as you want.
  34  *
  35  * Not all actions can be used in all triggers because they require different
  36  * contexts. But some actions are generic enough that they do not require
  37  * special objects in their contexts, and so can be used on every available
  38  * trigger. This 'group' type is used by actions to be available for this
  39  * trigger.
  40  *
  41  * What are good candidates to be triggers? Any function can be a trigger, as
  42  * long as it has the code to call the enqueued actions, but to make Drupal
  43  * more extensible, you will find hooks (from Drupal and contributed modules)
  44  * very good candidates. A trigger should build the arguments, ask for enqueued
  45  * actions and run them. You may define a function being a trigger, and run it
  46  * through a button in the front page, or you may prepare a trigger for a hook,
  47  * and everytime that hook is fired, your trigger will be.
  48  *
  49  * What are good candidates to be actions? any function is a possible action,
  50  * the only problem is finding a trigger able to run it.
  51  *
  52  * This module describes how to create actions for Drupal. In this
  53  * example we are providing three actions:
  54  *
  55  * - A generic action that can be used in any trigger, which is the most
  56  *   basic example of an action.
  57  *
  58  * - An action which which extends the capabilities of User triggers, even if
  59  *   associated with node or comment events.
  60  *
  61  * - An action which extends the capabilities of node triggers, but limited
  62  *   to certain events only, and using a customizable option.
  63  *
  64  * @see trigger_example
  65  * @see hook_action_info()
  66  * @see @link http://drupal.org/node/172152 Writing Actions in Drupal 6 @endlink
  67  * @see @link http://drupal.org/node/199254 Triggers and Actions in Drupal 6 @endlink
  68  */
  69 
  70 /**
  71  * Implements hook_action_info().
  72  *
  73  * We call hook_action_info when we are defining the actions we provide.
  74  * Actions are the actions fired by the associated triggers. In this example,
  75  * we are registering our three new actions, providing the unique name (using
  76  * Drupal's convention modulename_description_action), an easy to understand
  77  * description of what the action does, the 'object' expected by this action
  78  * (default options from core are node, user, comment and system, however other
  79  * trigger modules may declare new object types), which are the triggers allowed
  80  * to use these action, and if some customization is available. Please, note
  81  * that the function name is not required to finish as _action to be declared as
  82  * a Drupal action, and that only information provided by hook_trigger_info()
  83  * will be considered for valid actions creation.
  84  *
  85  * These are the actions being provided in hook_action_info()
  86  *
  87  * - action_example_basic_action: this action is a dummy function which can be
  88  *   used by any trigger. The label describes that the action will do nothing,
  89  *   but is enough for a basic example. Type is set to system, so users will not
  90  *   be confused about the scope of this action (expecting a node, user, or any
  91  *   other object). This action is not configurable, and will appear as
  92  *   available in the list of action under the menu entry:
  93  *   'admin/config/system/actions.
  94  * - action_example_unblock_user_action: Unblocks a user.
  95  * - action_example_node_sticky_action: This action is a complex action that is
  96  *   only available to Node type triggers, and can only be associated with the
  97  *   events node presave, node insert and node update. The action does not
  98  *   exist by default and it has to be created by user configuration. This makes
  99  *   it an "advanced action" in Drupal, so-called because it requires
 100  *   configuration or customization.
 101  *   In this example action, the action will promote nodes and make them sticky
 102  *   during presave, insert, or update, but only for particular users. As an
 103  *   advanced action, it first needs to be created in the actions management
 104  *   page (admin/config/system/actions). At the bottom of that page a selection
 105  *   list shows a list of advanced actions that will includes the option
 106  *   'Promote to frontpage and sticky on top any content created by :'
 107  *   Selecting this option and clicking the 'Create' button, a configuration
 108  *   form will ask for an author name. When this action is associated to any
 109  *   of the possible Node trigger events, it will only be effective if the
 110  *   author of the content matches the author configured by the action.
 111  *
 112  * @return
 113  *   An associative array of action descriptions. The keys of the array
 114  *   are the names of the action functions, and each corresponding value
 115  *   is an associative array with the following key-value pairs:
 116  *   - 'type': The type of object this action acts upon. Core actions have types
 117  *     'node', 'user', 'comment', and 'system', but additional types can be
 118  *     used, as long as the trigger and action agree on them.
 119  *   - 'label': The human-readable name of the action, which should be passed
 120  *     through the t() function for translation.
 121  *   - 'configurable': If FALSE, then the action doesn't require any extra
 122  *     configuration. If TRUE, then your module must define a form function with
 123  *     the same name as the action function with '_form' appended (e.g., the
 124  *     form for 'node_assign_owner_action' is 'node_assign_owner_action_form'.)
 125  *     This function takes $context as its only parameter, and is paired with
 126  *     the usual _submit function, and possibly an _validate function.
 127  *   - 'triggers': An array of the triggers that can trigger this
 128  *     action. For example: array('node_insert', 'user_update'). You can also
 129  *     declare support for any trigger by returning array('any') for this value.
 130  *   - 'behavior': (optional) A machine-readable array of behaviors of this
 131  *     action, used to signal additionally required actions that may need to be
 132  *     triggered. Currently recognized behaviors by Trigger module:
 133  *     - 'changes_property': If an action with this behavior is assigned to a
 134  *       trigger other than a "presave" hook, any save actions also assigned to
 135  *       this trigger are moved later in the list. If no save action is present,
 136  *       one will be added.
 137  *       Modules that are processing actions (like Trigger module) should take
 138  *       special care in the "presave" hook, in which case a dependent "save"
 139  *       action should NOT be invoked.
 140  *
 141  * @see hook_action_info()
 142  */
 143 function action_example_action_info() {
 144   return array(
 145     'action_example_basic_action' => array(
 146       'label' => t('Action Example: A basic example action that does nothing'),
 147       'type' => 'system',
 148       'configurable' => FALSE,
 149       'triggers' => array('any'),
 150     ),
 151     'action_example_unblock_user_action' => array(
 152       'label' => t('Action Example: Unblock a user'),
 153       'type' => 'user',
 154       'configurable' => FALSE,
 155       'triggers' => array('any'),
 156     ),
 157     'action_example_node_sticky_action' => array(
 158       'type' => 'node',
 159       'label' => t('Action Example: Promote to frontpage and sticky on top any content created by :'),
 160       'configurable' => TRUE,
 161       'behavior' => array('changes_property'),
 162       'triggers' => array('node_presave', 'node_insert', 'node_update'),
 163     ),
 164   );
 165 }
 166 
 167 
 168 
 169 /**
 170  * Implements hook_menu().
 171  *
 172  * Provides a menu entry which explains what the module does.
 173  */
 174 function action_example_menu() {
 175   $items['examples/action_example'] = array(
 176     'title'           => 'Action Example',
 177     'description'     => 'Provides a basic information page.',
 178     'page callback'   => '_action_example_page',
 179     'access callback' => TRUE,
 180   );
 181   return $items;
 182 }
 183 
 184 
 185 /**
 186  * A simple page to explain to the developer what to do.
 187  */
 188 function _action_example_page() {
 189   return t("The Action Example provides three example actions which can be configured on the <a href='@actions_url'>Actions configuration page</a> and assigned to triggers on the <a href='@triggers_url'>Triggers configuration page</a>.", array('@actions_url' => url('admin/config/system/actions'), '@triggers_url' => url('admin/structure/trigger/node')));
 190 }
 191 
 192 /**
 193  * Action function for action_example_basic_action.
 194  *
 195  * This action is not expecting any type of entity object, and can be used with
 196  * any trigger type or any event.
 197  *
 198  * @param $entity
 199  *   An optional entity object.
 200  * @param $context
 201  *   Array with parameters for this action: depends on the trigger.
 202  *
 203  * @see action_example_action_info()
 204  */
 205 function action_example_basic_action(&$entity, $context = array()) {
 206   //
 207   // In this case we are ignoring the entity and the context. This case of
 208   // action is useful when your action does not depend on the context, and
 209   // the function must do something regardless the scope of the trigger.
 210   // Simply announces that the action was executed using a message.
 211 
 212   drupal_set_message(t('action_example_basic_action fired'));
 213   watchdog('action_example', 'action_example_basic_action fired.');
 214 }
 215 
 216 /**
 217  * Action function for action_example_unblock_user_action.
 218  *
 219  * This action is expecting an entity object user, node or comment. If none of
 220  * the above is provided (because it was not called from an user/node/comment
 221  * trigger event, then the action will be taken on the current logged in user.
 222  *
 223  * Unblock an user. This action can be fired from different trigger types:
 224  * - User trigger: this user will be unblocked.
 225  * - Node/Comment trigger: the author of the node or comment will be unblocked.
 226  * - Other: (including system or custom defined types), current user will be
 227  *   unblocked. (Yes, this seems like an incomprehensible use-case.)
 228  *
 229  * @param $entity
 230  *   An optional user object (could be a user, or an author if context is
 231  *   node or comment)
 232  * @param $context
 233  *   Array with parameters for this action: depends on the trigger. The context
 234  *   is not used in this example.
 235  */
 236 function action_example_unblock_user_action(&$entity, $context = array()) {
 237 
 238   // First we check that entity is a user object. If this is the case, then this
 239   // is a user-type trigger.
 240   if (isset($entity->uid)) {
 241     $uid = $entity->uid;
 242   }
 243   elseif (isset($context['uid'])) {
 244     $uid = $context['uid'];
 245   }
 246   // If neither of those are valid, then block the current user.
 247   else {
 248     $uid = $GLOBALS['user']->uid;
 249   }
 250   $account = user_load($uid);
 251   $account = user_save($account, array('status' => 1));
 252   watchdog('action_example', 'Unblocked user %name.', array('%name' => $account->name));
 253   drupal_set_message(t('Unblocked user %name', array('%name' => $account->name)));
 254 }
 255 
 256 /**
 257  * Form function for action_example_node_sticky_action.
 258  *
 259  * Since we defined action_example_node_sticky_action as 'configurable' => TRUE,
 260  * this action requires a configuration form to create/configure the action.
 261  * In this circumstance, Drupal will attempt to call a function named by
 262  * combining the action name (action_example_node_sticky_action) and _form, in
 263  * this case yielding action_example_node_sticky_action_form.
 264  *
 265  * In Drupal, actions requiring creation and configuration are called 'advanced
 266  * actions', because they must be customized to define their functionality.
 267  *
 268  * The 'action_example_node_sticky_action' allows creating rules to promote and
 269  * set sticky content created by selected users on certain events. A form is
 270  * used to configure which user is affected by this action, and this form
 271  * includes the standard _validate and _submit hooks.
 272  */
 273 
 274 
 275 /**
 276  * Generates settings form for action_example_node_sticky_action().
 277  *
 278  * @param $context
 279  *   An array of options of this action (in case it is being edited)
 280  *
 281  * @return array $form
 282  *
 283  * @see action_example_action_info()
 284  */
 285 function action_example_node_sticky_action_form($context) {
 286   /*
 287   * We return a configuration form to set the requirements that will
 288   * match this action before being executed. This is a regular Drupal form and
 289   * may include any type of information you want, but all the fields of the
 290   * form will be saved into the $context variable.
 291   *
 292   * In this case we are promoting all content types submitted by this user, but
 293   * it is possible to extend these conditions providing more options in the
 294   * settings form.
 295   */
 296   $form['author'] = array(
 297     '#title' => t('Author name'),
 298     '#type' => 'textfield',
 299     '#description' => t('Any content created, presaved or updated by this user will be promoted to front page and set as sticky.'),
 300     '#default_value' => isset($context['author']) ? $context['author'] : '',
 301   );
 302   // Verify user permissions and provide an easier way to fill this field.
 303   if (user_access('access user profiles')) {
 304     $form['author']['#autocomplete_path'] = 'user/autocomplete';
 305   }
 306   // No more options, return the form.
 307   return $form;
 308 }
 309 
 310 /**
 311  * Validates settings form for action_example_node_sticky_action().
 312  * Verifies that user exists before continuing.
 313  */
 314 function action_example_node_sticky_action_validate($form, $form_state) {
 315   if (! $account = user_load_by_name($form_state['values']['author']) ) {
 316     form_set_error('author', t('Please, provide a valid username'));
 317   }
 318 }
 319 
 320 /**
 321  * Submit handler for action_example_node_sticky_action.
 322  *
 323  * Returns an associative array of values which will be available in the
 324  * $context when an action is executed.
 325  */
 326 function action_example_node_sticky_action_submit($form, $form_state) {
 327   return array('author' => $form_state['values']['author']);
 328 }
 329 
 330 /**
 331  * Action function for action_example_node_sticky_action.
 332  *
 333  * Promote and set sticky flag. This is the special action that has been
 334  * customized using the configuration form, validated with the validation
 335  * function, and submitted with the submit function.
 336  *
 337  * @param $node
 338  *   A node object provided by the associated trigger.
 339  * @param $context
 340  *   Array with the following elements:
 341  *   - 'author': username of the author's content this function will promote and
 342  *     set as sticky.
 343  */
 344 function action_example_node_sticky_action($node, $context) {
 345   if (function_exists('dsm')) {
 346     dsm($node, 'action_example_node_sticky_action is firing. Here is the $node');
 347     dsm($context, 'action_example_node_sticky_action is firing. Here is the $context');
 348   }
 349   // Get the user configured for this special action.
 350   $account = user_load_by_name($context['author']);
 351   // Is the node created by this user? then promote and set as sticky.
 352   if ($account->uid == $node->uid) {
 353     $node->promote = NODE_PROMOTED;
 354     $node->sticky  = NODE_STICKY;
 355     watchdog('action', 'Set @type %title to sticky and promoted by special action for user %username.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%username' => $account->name));
 356     drupal_set_message(t('Set @type %title to sticky and promoted by special action for user %username.', array('@type' => node_type_get_name($node), '%title' => $node->title, '%username' => $account->name)));
 357   }
 358 }
 359 /**
 360  * @} End of "defgroup action_example".
 361  */
";i:1;N;i:2;N;}i:2;i:345;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18187;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"action_example.test";i:1;i:2;i:2;i:18187;}i:2;i:18187;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:18187;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3872:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * test file for action_example module.
   6  */
   7 
   8 /**
   9  * Default test case for the action_example module.
  10  */
  11 class ActionExampleTestCase extends TriggerWebTestCase {
  12 
  13   public static function getInfo() {
  14     return array(
  15       'name' => 'Action example',
  16       'description' => 'Perform various tests on action_example module.' ,
  17       'group' => 'Examples',
  18     );
  19   }
  20 
  21   function setUp() {
  22     parent::setUp('trigger', 'action_example');
  23   }
  24 
  25  /**
  26    * Test Action Example.
  27    *
  28    * 1. action_example_basic_action: Configure a action_example_basic_action to
  29    *    happen when user logs in.
  30    * 2. action_example_unblock_user_action: When a user's profile is being
  31    *    viewed, unblock that user.
  32    * 3. action_example_node_sticky_action: Create a user, configure that user
  33    *    to always be stickied using advanced configuration. Have the user
  34    *    create content; verify that it gets stickied.
  35    */
  36   function testActionExample() {
  37     // Create an administrative user.
  38     $admin_user = $this->drupalCreateUser(array('administer actions', 'access comments', 'access content', 'post comments', 'skip comment approval', 'create article content', 'access user profiles', 'administer users'));
  39     $this->drupalLogin($admin_user);
  40 
  41     // 1. Assign basic action; then logout and login user and see if it puts
  42     // the message on the screen.
  43     $hash = drupal_hash_base64('action_example_basic_action');
  44     $edit = array('aid' => $hash);
  45     $this->drupalPost('admin/structure/trigger/user', $edit, t('Assign'), array(), array(), 'trigger-user-login-assign-form');
  46 
  47     $this->drupalLogout();
  48     $this->drupalLogin($admin_user);
  49     $this->assertText(t('action_example_basic_action fired'));
  50 
  51     // 2. Unblock: When a user's profile is being viewed, unblock.
  52     $normal_user = $this->drupalCreateUser();
  53     user_save($normal_user, array('status' => 0));  // Blocked user.
  54     $normal_user = user_load($normal_user->uid, TRUE);
  55     $this->assertFalse($normal_user->status, 'Normal user status has been set to blocked');
  56 
  57     $hash = drupal_hash_base64('action_example_unblock_user_action');
  58     $edit = array('aid' => $hash);
  59     $this->drupalPost('admin/structure/trigger/user', $edit, t('Assign'), array(), array(), 'trigger-user-view-assign-form');
  60 
  61     $this->drupalGet("user/$normal_user->uid");
  62     $normal_user = user_load($normal_user->uid, TRUE);
  63     $this->assertTrue($normal_user->status, 'Normal user status has been set to unblocked');
  64     $this->assertRaw(t('Unblocked user %name', array('%name' => $normal_user->name)));
  65 
  66     // 3. Create a user whose posts are always to be stickied.
  67     $sticky_user = $this->drupalCreateUser(array('access comments', 'access content', 'post comments', 'skip comment approval', 'create article content'));
  68 
  69     $action_label = $this->randomName();
  70     $edit = array(
  71       'actions_label' => $action_label,
  72       'author' => $sticky_user -> name,
  73     );
  74     $aid = $this->configureAdvancedAction('action_example_node_sticky_action', $edit);
  75     $edit = array('aid' => drupal_hash_base64($aid));
  76     $this->drupalPost('admin/structure/trigger/node', $edit, t('Assign'), array(), array(), 'trigger-node-insert-assign-form');
  77     // Now create a node and verify that it gets stickied.
  78     $this->drupalLogout();
  79     $this->drupalLogin($sticky_user);
  80     $node = $this->drupalCreateNode();
  81     $this->assertTrue($node->sticky, 'Node was set to sticky on creation');
  82   }
  83 }
";i:1;N;i:2;N;}i:2;i:18225;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:22105;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:22105;}}