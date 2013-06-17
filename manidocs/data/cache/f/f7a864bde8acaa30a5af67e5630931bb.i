a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Trigger Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"trigger_example.info";i:1;i:2;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:32;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:258:"
   1 name = Trigger example
   2 description = An example showing how a module can provide triggers that can have actions associated with them.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = trigger
   6 files[] = trigger_example.test
";i:1;N;i:2;N;}i:2;i:70;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:337;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"trigger_example.module";i:1;i:2;i:2;i:337;}i:2;i:337;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:337;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:13527:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Trigger definition example module.
   6  */
   7 
   8 /**
   9  * @defgroup trigger_example Example: Trigger
  10  * @ingroup examples
  11  * @{
  12  *
  13  * Trigger definition example module.
  14  *
  15  * Triggers and actions are a pair of special-purpose functions allowing some
  16  * Drupal programming without using PHP. Using the
  17  * appropriate action in a specific event, a site administrator can
  18  * add new functionality. Examples are:
  19  *  - Send an email after a node is published or edited.
  20  *  - Display a message after a user has logged in.
  21  *  - Display a message and send an email after a node has been deleted.
  22  *
  23  * A Trigger is a special function able to enqueue actions. The trigger module
  24  * provides the interface allowing us to associate certain actions with certain
  25  * triggers.
  26  *
  27  * Actions are functions intended to be run by triggers.
  28  *
  29  * A trigger should build the appropriate context for the action to be fired.
  30  * Actions are very often
  31  * grouped by functionality: examples are 'user', 'node', 'taxonomy'. When some
  32  * actions are grouped it is because they expect the same arguments. This way,
  33  * you can enqueue as many actions understanding the 'user' object as you want.
  34  *
  35  * Not all actions can be used in all triggers because they require different
  36  * contexts. But some actions
  37  * are generic enough to not require special objects in their
  38  * contexts, and so can be used on every available trigger. This 'group' type
  39  * is used by actions to be available for this trigger.
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
  52  * This module describes how to create triggers and actions for Drupal. In this
  53  * example we are providing two triggers:
  54  *
  55  * - A custom trigger, in its simplest form. We provide a page with a button.
  56  *   This button does nothing at all, but when you click (and submit the empty
  57  *   form), any actions you have configured will be executed.
  58  *
  59  * - A trigger which extends the capabilities of User triggers.
  60  *   This creates a new event which fires the first time a user ever logs in.
  61  *   In the module we will create it, and then provide a trigger for
  62  *   the administrator to be able to enqueue actions. They will be executed
  63  *   only the first time the user logs in the system.
  64  *
  65  * See:
  66  *
  67  * @link http://drupal.org/node/375833 Creating Triggers @endlink
  68  *
  69  * @link http://drupal.org/node/172152 Writing Actions @endlink
  70  *
  71  * @link http://drupal.org/node/199254 Triggers and Actions in Drupal 6 @endlink
  72  *
  73  * @see hook_trigger_info()
  74  * @see hook_trigger_info_alter()
  75  * Also see the @link action_example.module Action Example @endlink.
  76  */
  77 
  78 /**
  79  * Implements hook_trigger_info().
  80  *
  81  * We call hook_trigger_info when we are defining the triggers we provide.
  82  * Triggers are the events that make fire any number of assigned actions. In
  83  * this example, we are registering our three new triggers, providing the group
  84  * (system, user..), the callback 'hook' (only informative, does not require a
  85  * real hook) function and the label to be shown in the triggers interface.
  86  *
  87  * Example: In the group (a tab) 'system', for the 'mail' functionality, show:
  88  * An email is sent by Drupal.
  89  */
  90 function trigger_example_trigger_info() {
  91   return array(
  92     'user' => array(
  93       'user_first_time_login' => array(
  94         'label' => t('After a user has logged in for the first time'),
  95       ),
  96     ),
  97     'trigger_example' => array(
  98       'triggersomething' => array(
  99         'label' => t('After the triggersomething button is clicked'),
 100       ),
 101     ),
 102   );
 103 }
 104 
 105 /**
 106  * Triggers are used most of the time to do something when an event happens.
 107  * The most common type of event is a hook invocation,
 108  * but that is not the only possibility.
 109  *
 110  */
 111 
 112 /**
 113  * triggersomething trigger: Run actions associated with an arbitrary event.
 114  *
 115  * Here pressing a button is a trigger. We have defined a
 116  * custom function as a trigger (trigger_example_triggersomething).
 117  * It will ask for all actions attached to the 'triggersomething' event,
 118  * prepare a basic 'context' for them
 119  * and run all of them. This could have been implemented by a hook
 120  * implementation, but in this demonstration, it will just be called in a
 121  * form's submit.
 122  *
 123  * This function is executed during the submission of the example form defined
 124  * in this module.
 125  *
 126  * @param $options
 127  *   Array of arguments used to call the triggersomething function, if any.
 128  */
 129 function trigger_example_triggersomething($options = array()) {
 130   // Ask the trigger module for all actions enqueued for the 'triggersomething' trigger.
 131   $aids = trigger_get_assigned_actions('triggersomething');
 132   // prepare a basic context, indicating group and "hook", and call all the
 133   // actions with this context as arguments.
 134   $context = array(
 135     'group' => 'trigger_example',
 136     'hook' => 'triggersomething'
 137   );
 138   actions_do(array_keys($aids), (object) $options, $context);
 139 }
 140 
 141 
 142 /**
 143  * The next trigger is more complex, we are providing a trigger for a
 144  * new event: "user first time login". We need to create this event
 145  * first.
 146  */
 147 
 148 /**
 149  * Implements hook_user_login().
 150  *
 151  * User first login trigger: Run actions on user first login.
 152  *
 153  * The event "User first time login" does not exist, we should create it before
 154  * it can be used. We use hook_user_login to be informed when a user logs in and
 155  * try to find if the user has previously logged in before. If the user has not
 156  * accessed previously, we make a call to our trigger function.
 157  */
 158 function trigger_example_user_login(&$edit, $account, $category = NULL) {
 159   // Verify user has never accessed the site: last access was creation date.
 160   if ($account->access == 0) {
 161     // Call the aproppriate trigger function
 162     _trigger_example_first_time_login('user_first_time_login', $edit, $account, $category);
 163   }
 164 }
 165 
 166 /**
 167  * Trigger function for "User first time login"
 168  *
 169  * This trigger is a user-type triggers, so is grouped with other user-type
 170  * triggers. It needs to provide all the context that user-type triggers
 171  * provide.  For this example, we are going to copy the trigger.module
 172  * implementation for the 'User has logged in' event.
 173  *
 174  * This function will run all the actions assigned to the
 175  * 'user_first_time_login' trigger.
 176  *
 177  * For testing you can use an update query like this to reset a user to
 178  * "never logged in":
 179  * @code
 180  * update users set access=created where name='test1';
 181  * @endcode
 182  *
 183  * @param string $hook
 184  *   The trigger identification.
 185  * @param array  $edit
 186  *   Modifications for the account object (should be empty).
 187  * @param object $account
 188  *   User object that has logged in.
 189  * @param string $category
 190  *   Category of the profile.
 191  */
 192 function _trigger_example_first_time_login($hook, &$edit, $account, $category = NULL) {
 193   // Keep objects for reuse so that changes actions make to objects can persist.
 194   static $objects;
 195   // Get all assigned actions for the 'user_first_time_login' trigger.
 196   $aids = trigger_get_assigned_actions($hook);
 197   $context = array(
 198     'group' => 'user',
 199     'hook' => $hook,
 200     'form_values' => &$edit,
 201   );
 202   // Instead of making a call to actions_do for all triggers, doing this loop
 203   // we provide the oportunity for actions to alter the account object, and
 204   // the next action should have this altered account object as argument.
 205   foreach ($aids as $aid => $info) {
 206     $type = $info['type'];
 207     if ($type != 'user') {
 208       if (!isset($objects[$type])) {
 209         $objects[$type] = _trigger_normalize_user_context($type, $account);
 210       }
 211       $context['user'] = $account;
 212       actions_do($aid, $objects[$type], $context);
 213     }
 214     else {
 215       actions_do($aid, $account, $context, $category);
 216     }
 217   }
 218 }
 219 
 220 /**
 221  * Helper functions for the module interface to test the triggersomething trigger.
 222  */
 223 
 224 /**
 225  * Implements hook_help().
 226  */
 227 function trigger_example_help($path, $arg) {
 228   switch ($path) {
 229     case 'examples/trigger_example':
 230       $explanation = t(
 231         'Click the button on this page to call trigger_example_triggersomething()
 232         and fire the triggersomething event. First, you need to create an action
 233         and assign it to the "After the triggersomething button is clicked" trigger,
 234         or nothing will happen.  Use the <a href="@actions-url">Actions settings page</a>
 235         and assign these actions to the triggersomething event on the
 236         <a href="@triggers-url">Triggers settings page</a>. <br/><br/>
 237         The other example is the "user never logged in before" example. For that one,
 238         assign an action to the "After a user has logged in for the first time" trigger
 239         and then log a user in.', array('@actions-url' => url('admin/config/system/actions'), '@triggers-url' => url('admin/structure/trigger/trigger_example')));
 240       return "<p>$explanation</p>";
 241     case 'admin/structure/trigger/system':
 242       return t('you can assign actions to run everytime an email is sent by Drupal');
 243     case 'admin/structure/trigger/trigger_example':
 244       $explanation = t(
 245       "A trigger is a system event. For the trigger example, it's just a button-press.
 246       To demonstrate the trigger example, choose to associate the 'display a message to the user'
 247       action with the 'after the triggersomething button is pressed' trigger.");
 248       return "<p>$explanation</p>";
 249   }
 250 }
 251 
 252 /**
 253  * Implements hook_menu().
 254  *
 255  * Provides a form that can be used to fire the module's triggers.
 256  */
 257 function trigger_example_menu() {
 258   $items['examples/trigger_example'] = array(
 259     'title'           => 'Trigger Example',
 260     'description'     => 'Provides a form to demonstrate the trigger example.',
 261     'page callback'   => 'drupal_get_form',
 262     'page arguments'  => array('trigger_example_form'),
 263     'access callback' => TRUE,
 264   );
 265   return $items;
 266 }
 267 
 268 /**
 269  * Trigger example test form.
 270  *
 271  * Provides a button to run the triggersomething event.
 272  */
 273 function trigger_example_form($form_state) {
 274   $form['triggersomething'] = array(
 275     '#type'  => 'submit',
 276     '#value' => t('Run triggersomething event'),
 277   );
 278   return $form;
 279 }
 280 
 281 /**
 282  * Submit handler for the trigger_example_form().
 283  */
 284 function trigger_example_form_submit($form, $form_state) {
 285   // If the user clicked the button, then run the triggersomething trigger.
 286   if ($form_state['values']['op'] == t('Run triggersomething event')) {
 287     trigger_example_triggersomething();
 288   }
 289 }
 290 
 291 
 292 /**
 293  * Optional usage of hook_trigger_info_alter().
 294  *
 295  * This function is not required to write your own triggers, but it may be
 296  * useful when you want to alter existing triggers.
 297  */
 298 
 299 /**
 300  * Implements hook_trigger_info_alter().
 301  *
 302  * We call hook_trigger_info_alter when we want to change an existing trigger.
 303  * As mentioned earlier, this hook is not required to create your own triggers,
 304  * and should only be used when you need to alter current existing triggers. In
 305  * this example implementation a little change is done to the existing trigger
 306  * provided by core: 'cron'
 307  *
 308  * @param $triggers
 309  *   Array of trigger information returned by hook_trigger_info()
 310  *   implementations.
 311  *
 312  * @see hook_trigger_info()
 313  */
 314 function trigger_example_trigger_info_alter(&$triggers) {
 315   // Make a simple change to an existing core trigger, altering the label
 316   // "When cron runs" to our custom label "On cron execution"
 317   $triggers['system']['cron']['label'] = t('On cron execution');
 318 }
";i:1;N;i:2;N;}i:2;i:377;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13913;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"trigger_example.test";i:1;i:2;i:2;i:13913;}i:2;i:13913;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:13913;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3308:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * test file for trigger_example module.
   6  */
   7 
   8 /**
   9  * Default test case for the trigger_example module.
  10  */
  11 class TriggerExampleTestCase extends DrupalWebTestCase {
  12 
  13   public static function getInfo() {
  14     return array(
  15       'name' => 'Trigger example',
  16       'description' => 'Perform various tests on trigger_example module.' ,
  17       'group' => 'Examples',
  18     );
  19   }
  20 
  21   function setUp() {
  22     parent::setUp('trigger', 'trigger_example');
  23   }
  24 
  25   /**
  26    * Test assigning a configurable action to the triggersomething event.
  27    */
  28   function testTriggersomethingEvent() {
  29     // Create an administrative user.
  30     $test_user = $this->drupalCreateUser(array('administer actions'));
  31     $this->drupalLogin($test_user);
  32 
  33     // Create a configurable action for display a message to the user
  34     $hash = drupal_hash_base64('system_message_action');
  35     $action_label = $this->randomName();
  36     $edit = array(
  37       'actions_label' => $action_label,
  38       'message' => $action_label,
  39     );
  40     $this->drupalPost('admin/config/system/actions/configure/' . $hash, $edit, t('Save'));
  41     $aid = db_query('SELECT aid FROM {actions} WHERE callback = :callback', array(':callback' => 'system_message_action'))->fetchField();
  42     // $aid is likely 3 but if we add more uses for the sequences table in
  43     // core it might break, so it is easier to get the value from the database.
  44     $edit = array('aid' => drupal_hash_base64($aid));
  45 
  46     // Note that this only works because there's just one item on the page.
  47     $this->drupalPost('admin/structure/trigger/trigger_example', $edit, t('Assign'));
  48 
  49     // Request triggersomething form and submit.
  50     $this->drupalPost('examples/trigger_example', array(), t('Run triggersomething event'));
  51     // Verify the message is shown to the user.
  52     $this->assertText($action_label, 'The triggersomething event executed the action.');
  53   }
  54 
  55   function testUserLogin() {
  56     // Create an administrative user.
  57     $admin_user = $this->drupalCreateUser(array('administer actions'));
  58     $this->drupalLogin($admin_user);
  59 
  60     // Create a configurable action for display a message to the user
  61     $hash = drupal_hash_base64('system_message_action');
  62     $action_label = $this->randomName();
  63     $edit = array(
  64       'actions_label' => $action_label,
  65       'message' => $action_label,
  66     );
  67     $this->drupalPost('admin/config/system/actions/configure/' . $hash, $edit, t('Save'));
  68     $aid = db_query('SELECT aid FROM {actions} WHERE callback = :callback', array(':callback' => 'system_message_action'))->fetchField();
  69     $edit = array('aid' => drupal_hash_base64($aid));
  70 
  71     // Find the correct trigger
  72     $this->drupalPost('admin/structure/trigger/user', $edit, t('Assign'), array(), array(), 'trigger-user-first-time-login-assign-form');
  73 
  74     $test_user = $this->drupalCreateUser();
  75     $this->drupalLogin($test_user);
  76     $this->assertText($action_label);
  77   }
  78 }
";i:1;N;i:2;N;}i:2;i:13951;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17267;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:17267;}}