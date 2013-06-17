a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Queue Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"queue_example.css";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:91:"
   1 .form-item-string-to-add, div.form-item-claim-time { 
   2   display: inline;
   3 }
";i:1;N;i:2;N;}i:2;i:65;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:165;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"queue_example.info";i:1;i:2;i:2;i:165;}i:2;i:165;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:165;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:167:"
   1 name = Queue example
   2 description = Examples of using the Drupal Queue API.
   3 package = Example modules
   4 core = 7.x
   5 files[] = queue_example.test
";i:1;N;i:2;N;}i:2;i:201;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:377;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"queue_example.module";i:1;i:2;i:2;i:377;}i:2;i:377;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:377;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:13444:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Examples demonstrating the Drupal Queue API.
   6  */
   7 
   8 /**
   9  * @defgroup queue_example Example: Queue
  10  * @ingroup examples
  11  * @{
  12  * Demonstrating the Queue API
  13  *
  14  * The Queue API provides a traditional FIFO (first-in-first-out) queue,
  15  * but also provides the concepts of:
  16  * - "Creating" a queued item, which means inserting it into a queue.
  17  * - "Claiming" a queued item, which essentially means requesting the next item
  18  *   from the queue and holding a lock on that item for a specified period of
  19  *   time.
  20  * - "Releasing" an item, which means giving up a claim but leaving the item in
  21  *   the queue.
  22  * - "Deleting" an item, which means finally removing it from the queue.
  23  *
  24  * This example demonstrates only basic queue functionality, and will use the
  25  * default queue implementation, which is SystemQueue, managed using
  26  * persistent database storage.
  27  *
  28  * @see system.queue.inc
  29  *
  30  * Further resources include the limited @link queue @endlink documentation and
  31  * @link http://www.ent.iastate.edu/it/Batch_and_Queue.pdf Batch vs Queue Presentation slides by John VanDyk @endlink
  32  * and @link http://sf2010.drupal.org/conference/sessions/batch-vs-queue-api-smackdown session video. @endlink
  33  */
  34 
  35 /**
  36  * Implements hook_menu().
  37  */
  38 function queue_example_menu() {
  39   $items = array();
  40   $items['queue_example/insert_remove'] = array(
  41     'title' => 'Queue Example: Insert and remove',
  42     'page callback' => 'drupal_get_form',
  43     'page arguments' => array('queue_example_add_remove_form'),
  44     'access callback' => TRUE,
  45   );
  46 
  47   return $items;
  48 }
  49 
  50 /**
  51  * Provides an interface to add items to the queue, to retrieve (claim)
  52  * an item from the head of the queue, and to claim and delete. Also
  53  * allows the user to run cron manually, so that claimed items can be
  54  * released.
  55  */
  56 function queue_example_add_remove_form($form, &$form_state) {
  57   // Simple counter that makes it possible to put auto-incrementing default
  58   // string into the string to insert.
  59   if (empty($form_state['storage']['insert_counter'])) {
  60     $form_state['storage']['insert_counter'] = 1;
  61   }
  62 
  63   $queue_name = !empty($form_state['values']['queue_name']) ? $form_state['values']['queue_name'] : 'queue_example_first_queue';
  64   $items = queue_example_retrieve_queue($queue_name);
  65 
  66   // Add CSS to make the form a bit denser.
  67   $form['#attached']['css'] = array(drupal_get_path('module', 'queue_example') . '/queue_example.css');
  68 
  69   $form['help'] = array(
  70     '#type' => 'markup',
  71     '#markup' => '<div>' . t('This page is an interface on the Drupal queue API. You can add new items to the queue, "claim" one (retrieve the next item and keep a lock on it), and delete one (remove it from the queue). Note that claims are not expired until cron runs, so there is a special button to run cron to perform any necessary expirations.') . '</div>',
  72   );
  73 
  74   $form['queue_name'] = array(
  75     '#type' => 'select',
  76     '#title' => t('Choose queue to examine'),
  77     '#options' => drupal_map_assoc(array('queue_example_first_queue', 'queue_example_second_queue')),
  78     '#default_value' => $queue_name,
  79   );
  80   $form['queue_show'] = array(
  81     '#type' => 'submit',
  82     '#value' => t('Show queue'),
  83     '#submit' => array('queue_example_show_queue'),
  84   );
  85   $form['status_fieldset'] = array(
  86     '#type' => 'fieldset',
  87     '#title' => t('Queue status for @name', array('@name' => $queue_name)),
  88     '#collapsible' => TRUE,
  89   );
  90   $form['status_fieldset']['status'] = array(
  91     '#type' => 'markup',
  92     '#markup' => theme('queue_items', array('items' => $items)),
  93   );
  94   $form['insert_fieldset'] = array(
  95     '#type' => 'fieldset',
  96     '#title' => t('Insert into @name', array('@name' => $queue_name)),
  97   );
  98   $form['insert_fieldset']['string_to_add'] = array(
  99     '#type' => 'textfield',
 100     '#size' => 10,
 101     '#default_value' => t('item @counter', array('@counter' => $form_state['storage']['insert_counter'])),
 102   );
 103   $form['insert_fieldset']['add_item'] = array(
 104     '#type' => 'submit',
 105     '#value' => t('Insert into queue'),
 106     '#submit' => array('queue_example_add_remove_form_insert'),
 107   );
 108   $form['claim_fieldset'] = array(
 109     '#type' => 'fieldset',
 110     '#title' => t('Claim from queue'),
 111     '#collapsible' => TRUE,
 112   );
 113 
 114   $form['claim_fieldset']['claim_time'] = array(
 115     '#type' => 'radios',
 116     '#title' => t('Claim time, in seconds'),
 117     '#options' => array(0 => t('none'), 5 => t('5 seconds'), 60 => t('60 seconds')),
 118     '#description' => t('This time is only valid if cron runs during this time period. You can run cron manually below.'),
 119     '#default_value' => !empty($form_state['values']['claim_time']) ? $form_state['values']['claim_time'] : 5,
 120   );
 121   $form['claim_fieldset']['claim_item'] = array(
 122     '#type' => 'submit',
 123     '#value' => t('Claim the next item from the queue'),
 124     '#submit' => array('queue_example_add_remove_form_claim'),
 125   );
 126   $form['claim_fieldset']['claim_and_delete_item'] = array(
 127     '#type' => 'submit',
 128     '#value' => t('Claim the next item and delete it'),
 129     '#submit' => array('queue_example_add_remove_form_delete'),
 130   );
 131   $form['claim_fieldset']['run_cron'] = array(
 132     '#type' => 'submit',
 133     '#value' => t('Run cron manually to expire claims'),
 134     '#submit' => array('queue_example_add_remove_form_run_cron'),
 135   );
 136   $form['delete_queue'] = array(
 137     '#type' => 'submit',
 138     '#value' => t('Delete the queue and items in it'),
 139     '#submit' => array('queue_example_add_remove_form_clear_queue'),
 140   );
 141   return $form;
 142 }
 143 
 144 /**
 145  * Submit function for the insert-into-queue button.
 146  */
 147 function queue_example_add_remove_form_insert($form, &$form_state) {
 148   // Get a queue (of the default type) called 'queue_example_queue'.
 149   // If the default queue class is SystemQueue this creates a queue that stores
 150   // its items in the database.
 151   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 152   $queue->createQueue();  // There is no harm in trying to recreate existing.
 153 
 154   // Queue the string.
 155   $queue->createItem($form_state['values']['string_to_add']);
 156   $count = $queue->numberOfItems();
 157   drupal_set_message(t('Queued your string (@string_to_add). There are now @count items in the queue.', array('@count' => $count, '@string_to_add' => $form_state['values']['string_to_add'])));
 158   $form_state['rebuild'] = TRUE;  // Allows us to keep information in $form_state.
 159   // Unsetting the string_to_add allows us to set the incremented default value
 160   // for the user so they don't have to type anything.
 161   unset($form_state['input']['string_to_add']);
 162   $form_state['storage']['insert_counter']++;
 163 }
 164 
 165 /**
 166  * Submit function for the show-queue button.
 167  */
 168 function queue_example_show_queue($form, &$form_state) {
 169   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 170   $queue->createQueue();  // There is no harm in trying to recreate existing.
 171 
 172   // Get the number of items.
 173   $count = $queue->numberOfItems();
 174 
 175   // Update the form item counter.
 176   $form_state['storage']['insert_counter'] = $count +1;
 177 
 178   // Unset the string_to_add textbox.
 179   unset($form_state['input']['string_to_add']);
 180 
 181   $form_state['rebuild'] = TRUE;
 182 }
 183 
 184 /**
 185  * Submit function for the "claim" button. Claims (retrieves) an item from
 186  * the queue and reports the results.
 187  */
 188 function queue_example_add_remove_form_claim($form, &$form_state) {
 189   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 190   $queue->createQueue();  // There is no harm in trying to recreate existing.
 191   $item = $queue->claimItem($form_state['values']['claim_time']);
 192   $count = $queue->numberOfItems();
 193   if (!empty($item)) {
 194     drupal_set_message(t('Claimed item id=@item_id string=@string for @seconds seconds. There are @count items in the queue.', array('@count' => $count, '@item_id' => $item->item_id, '@string' => $item->data, '@seconds' => $form_state['values']['claim_time'])));
 195   }
 196   else {
 197     drupal_set_message(t('There were no items in the queue available to claim. There are @count items in the queue.', array('@count' => $count)));
 198   }
 199   $form_state['rebuild'] = TRUE;
 200 }
 201 
 202 /**
 203  * Submit function for "Claim and delete" button.
 204  */
 205 function queue_example_add_remove_form_delete($form, &$form_state) {
 206   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 207   $queue->createQueue();  // There is no harm in trying to recreate existing.
 208   $count = $queue->numberOfItems();
 209   $item = $queue->claimItem(60);
 210   if (!empty($item)) {
 211     drupal_set_message(t('Claimed and deleted item id=@item_id string=@string for @seconds seconds. There are @count items in the queue.', array('@count' => $count, '@item_id' => $item->item_id, '@string' => $item->data, '@seconds' => $form_state['values']['claim_time'])));
 212     $queue->deleteItem($item);
 213     $count = $queue->numberOfItems();
 214     drupal_set_message(t('There are now @count items in the queue.', array('@count' => $count)));
 215   }
 216   else {
 217     $count = $queue->numberOfItems();
 218     drupal_set_message(t('There were no items in the queue available to claim/delete. There are currently @count items in the queue.', array('@count' => $count)));
 219   }
 220   $form_state['rebuild'] = TRUE;
 221 }
 222 
 223 /**
 224  * Submit function for "run cron" button.
 225  *
 226  * Runs cron (to release expired claims) and reports the results.
 227  */
 228 function queue_example_add_remove_form_run_cron($form, &$form_state) {
 229   drupal_cron_run();
 230   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 231   $queue->createQueue();  // There is no harm in trying to recreate existing.
 232   $count = $queue->numberOfItems();
 233   drupal_set_message(t('Ran cron. If claimed items expired, they should be expired now. There are now @count items in the queue', array('@count' => $count)));
 234   $form_state['rebuild'] = TRUE;
 235 }
 236 
 237 /**
 238  * Submit handler for clearing/deleting the queue.
 239  */
 240 function queue_example_add_remove_form_clear_queue($form, &$form_state) {
 241   $queue = DrupalQueue::get($form_state['values']['queue_name']);
 242   $queue->deleteQueue();
 243   drupal_set_message(t('Deleted the @queue_name queue and all items in it', array('@queue_name' => $form_state['values']['queue_name'])));
 244 }
 245 
 246 /**
 247  * Retrieves the queue from the database for display purposes only.
 248  *
 249  * It is not recommended to access the database directly, and this is only here
 250  * so that the user interface can give a good idea of what's going on in the
 251  * queue.
 252  *
 253  * @param $queue_name
 254  *   The name of the queue from which to fetch items.
 255  */
 256 function queue_example_retrieve_queue($queue_name) {
 257   $items = array();
 258   $result = db_query("SELECT item_id, data, expire, created FROM {queue} WHERE name = :name ORDER BY item_id",
 259     array(':name' => $queue_name),
 260     array('fetch' => PDO::FETCH_ASSOC));
 261   foreach ($result as $item) {
 262     $items[] = $item;
 263   }
 264   return $items;
 265 }
 266 
 267 /**
 268  * Themes the queue display.
 269  *
 270  * Again, this is not part of the demonstration of the queue API, but is here
 271  * just to make the user interface more understandable.
 272  *
 273  * @param $variables
 274  */
 275 function theme_queue_items($variables) {
 276   $items = $variables['items'];
 277   $rows = array();
 278   foreach ($items as &$item) {
 279     if ($item['expire'] > 0) {
 280       $item['expire'] = t("Claimed: expires %expire", array('%expire' => date('r', $item['expire'])));
 281     }
 282     else {
 283       $item['expire'] = t('Unclaimed');
 284     }
 285     $item['created'] = date('r', $item['created']);
 286     $item['content'] = check_plain(unserialize($item['data']));
 287     unset($item['data']);
 288     $rows[] = $item;
 289   }
 290   if (!empty($rows)) {
 291     $header = array(t('Item ID'), t('Claimed/Expiration'), t('Created'), t('Content/Data'));
 292     $output = theme('table', array('header' => $header, 'rows' => $rows));
 293     return $output;
 294   }
 295   else {
 296     return t('There are no items in the queue.');
 297   }
 298 }
 299 
 300 /**
 301  * Implements hook_theme().
 302  */
 303 function queue_example_theme() {
 304   return array(
 305     'queue_items' => array(
 306       'variables' => array('items' => NULL),
 307     ),
 308   );
 309 }
 310 /**
 311  * @} End of "defgroup queue_example".
 312  */
";i:1;N;i:2;N;}i:2;i:415;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13868;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"queue_example.test";i:1;i:2;i:2;i:13868;}i:2;i:13868;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:13868;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3052:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test the queue example module.
   6  */
   7 class QueueExampleTestCase extends DrupalWebTestCase {
   8 
   9   public static function getInfo() {
  10     return array(
  11       'name' => 'Queue Example functionality',
  12       'description' => 'Test Queue Example functionality',
  13       'group' => 'Examples',
  14     );
  15   }
  16 
  17   /**
  18    * Enable modules and create user with specific permissions.
  19    */
  20   function setUp() {
  21     parent::setUp('queue_example');
  22   }
  23 
  24   /**
  25    * Login user, create an example node, and test blog functionality through the admin and user interfaces.
  26    */
  27   function testQueueExampleBasic() {
  28 
  29     // Load the queue with 5 items.
  30     for ($i = 1; $i <= 5; $i++) {
  31       $edit = array('queue_name' => 'queue_example_first_queue', 'string_to_add' => "boogie$i");
  32       $this->drupalPost('queue_example/insert_remove', $edit, t('Insert into queue'));
  33       $this->assertText(t('There are now @number items in the queue', array('@number' => $i)));
  34     }
  35     // Claim each of the 5 items with a claim time of 0 seconds.
  36     for ($i = 1; $i <= 5; $i++) {
  37       $edit = array('queue_name' => 'queue_example_first_queue', 'claim_time' => 0);
  38       $this->drupalPost(NULL, $edit, t('Claim the next item from the queue'));
  39       $this->assertPattern(t('%Claimed item id=.*string=@string for 0 seconds.%', array('@string' => "boogie$i")));
  40     }
  41     $edit = array('queue_name' => 'queue_example_first_queue', 'claim_time' => 0);
  42     $this->drupalPost(NULL, $edit, t('Claim the next item from the queue'));
  43     $this->assertText(t('There were no items in the queue available to claim'));
  44 
  45     // Sleep a second so we can make sure that the timeouts actually time out.
  46     // Local systems work fine with this but apparently the PIFR server is so
  47     /// fast that it needs a sleep before the cron run.
  48     sleep(1);
  49 
  50     // Run cron to release expired items.
  51     $this->drupalPost(NULL, array(), t('Run cron manually to expire claims'));
  52 
  53     $queue_items = queue_example_retrieve_queue('queue_example_first_queue');
  54 
  55     // Claim and delete each of the 5 items which should now be available.
  56     for ($i = 1; $i <= 5; $i++) {
  57       $edit = array('queue_name' => 'queue_example_first_queue', 'claim_time' => 0);
  58       $this->drupalPost(NULL, $edit, t('Claim the next item and delete it'));
  59       $this->assertPattern(t('%Claimed and deleted item id=.*string=@string for 0 seconds.%', array('@string' => "boogie$i")));
  60     }
  61     // Verify that nothing is left to claim.
  62     $edit = array('queue_name' => 'queue_example_first_queue', 'claim_time' => 0);
  63     $this->drupalPost(NULL, $edit, t('Claim the next item from the queue'));
  64     $this->assertText(t('There were no items in the queue available to claim'));
  65   }
  66 }
";i:1;N;i:2;N;}i:2;i:13904;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16964;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:16964;}}