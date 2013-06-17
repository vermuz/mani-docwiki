a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Batch Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"batch_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:190:"
   1 name = Batch example
   2 description = An example outlining how a module can define batch operations.
   3 package = Example modules
   4 core = 7.x
   5 files[] = batch_example.test
";i:1;N;i:2;N;}i:2;i:66;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:266;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"batch_example.install";i:1;i:2;i:2;i:266;}i:2;i:266;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:266;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3732:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Install, update, and uninstall functions for the batch_example module.
   6  */
   7 
   8 /**
   9  * Example of batch-driven update function.
  10  *
  11  * Because some update functions may require the batch API, the $sandbox
  12  * provides a place to store state. When $standbox['#finished'] == TRUE,
  13  * calls to this update function are completed.
  14  *
  15  * The $sandbox param provides a way to store data during multiple invocations.
  16  * When the $sandbox['#finished'] == 1, execution is complete.
  17  *
  18  * This dummy 'update' function changes no state in the system. It simply
  19  * loads each node.
  20  *
  21  * To make this update function run again and again, execute the query
  22  * "update system set schema_version = 0 where name = 'batch_example';"
  23  * and then run /update.php.
  24  *
  25  * @ingroup batch_example
  26  */
  27 function batch_example_update_7100(&$sandbox) {
  28   $ret = array();
  29 
  30   // Use the sandbox at your convenience to store the information needed
  31   // to track progression between successive calls to the function.
  32   if (!isset($sandbox['progress'])) {
  33     $sandbox['progress'] = 0;  // The count of nodes visited so far.
  34     // Total nodes that must be visited.
  35     $sandbox['max'] = db_query('SELECT COUNT(nid) FROM {node}')->fetchField();
  36     // A place to store messages during the run.
  37     $sandbox['messages'] = array();
  38     $sandbox['current_node'] = -1; // Last node read via the query.
  39   }
  40 
  41   // Process nodes by groups of 10 (arbitrary value).
  42   // When a group is processed, the batch update engine determines
  43   // whether it should continue processing in the same request or provide
  44   // progress feedback to the user and wait for the next request.
  45   $limit = 10;
  46 
  47   // Retrieve the next group of nids.
  48   $result = db_select('node', 'n')
  49     ->fields('n', array('nid'))
  50     ->orderBy('n.nid', 'ASC')
  51     ->where('n.nid > :nid', array(':nid' => $sandbox['current_node']))
  52     ->extend('PagerDefault')
  53     ->limit($limit)
  54     ->execute();
  55   foreach ($result as $row) {
  56     // Here we actually perform a dummy 'update' on the current node.
  57     $node = db_query('SELECT nid FROM {node} WHERE nid = :nid', array(':nid' => $row->nid))->fetchField();
  58 
  59     // Update our progress information.
  60     $sandbox['progress']++;
  61     $sandbox['current_node'] = $row->nid;
  62   }
  63 
  64   // Set the "finished" status, to tell batch engine whether this function
  65   // needs to run again. If you set a float, this will indicate the progress
  66   // of the batch so the progress bar will update.
  67   $sandbox['#finished'] = ($sandbox['progress'] >= $sandbox['max']) ? TRUE : ($sandbox['progress'] / $sandbox['max']);
  68 
  69   // Set up a per-run message; Make a copy of $sandbox so we can change it.
  70   // This is simply a debugging stanza to illustrate how to capture status
  71   // from each pass through hook_update_N().
  72   $sandbox_status = $sandbox;
  73   unset($sandbox_status['messages']);  // Don't want them in the output.
  74   $sandbox['messages'][] = t('$sandbox=') . print_r($sandbox_status, TRUE);
  75 
  76   if ($sandbox['#finished']) {
  77     // hook_update_N() may optionally return a string which will be displayed
  78     // to the user.
  79     $final_message = '<ul><li>' . implode('</li><li>', $sandbox['messages']) . "</li></ul>";
  80     return t('The batch_example demonstration update did what it was supposed to do: @message', array('@message' => $final_message));
  81   }
  82 }
";i:1;N;i:2;N;}i:2;i:305;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4047;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"batch_example.module";i:1;i:2;i:2;i:4047;}i:2;i:4047;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:4047;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11908:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Outlines how a module can use the Batch API.
   6  */
   7 
   8 /**
   9  * @defgroup batch_example Example: Batch API
  10  * @ingroup examples
  11  * @{
  12  * Outlines how a module can use the Batch API.
  13  *
  14  * Batches allow heavy processing to be spread out over several page
  15  * requests, ensuring that the processing does not get interrupted
  16  * because of a PHP timeout, while allowing the user to receive feedback
  17  * on the progress of the ongoing operations. It also can prevent out of memory
  18  * situations.
  19  *
  20  * The @link batch_example.install .install file @endlink also shows how the
  21  * Batch API can be used to handle long-running hook_update_N() functions.
  22  *
  23  * Two harmless batches are defined:
  24  * - batch 1: Load the node with the lowest nid 100 times.
  25  * - batch 2: Load all nodes, 20 times and uses a progressive op, loading nodes
  26  *   by groups of 5.
  27  * @see batch
  28  */
  29 
  30 /**
  31  * Implements hook_menu().
  32  */
  33 function batch_example_menu() {
  34   $items = array();
  35   $items['examples/batch_example'] = array(
  36     'title' => 'Batch example',
  37     'description' => 'Example of Drupal batch processing',
  38     'page callback' => 'drupal_get_form',
  39     'page arguments' => array('batch_example_simple_form'),
  40     'access callback' => TRUE,
  41   );
  42 
  43   return $items;
  44 }
  45 
  46 /**
  47  * Form builder function to allow choice of which batch to run.
  48  */
  49 function batch_example_simple_form() {
  50   $form['description'] = array(
  51     '#type' => 'markup',
  52     '#markup' => t('This example offers two different batches. The first does 1000 identical operations, each completed in on run; the second does 20 operations, but each takes more than one run to operate if there are more than 5 nodes.'),
  53   );
  54   $form['batch'] = array(
  55     '#type' => 'select',
  56     '#title' => 'Choose batch',
  57     '#options' => array(
  58       'batch_1' => t('batch 1 - 1000 operations, each loading the same node'),
  59       'batch_2' => t('batch 2 - 20 operations. each one loads all nodes 5 at a time'),
  60     ),
  61   );
  62   $form['submit'] = array(
  63     '#type' => 'submit',
  64     '#value' => 'Go',
  65   );
  66 
  67   // If no nodes, prevent submission.
  68   // Find out if we have a node to work with. Otherwise it won't work.
  69   $nid = batch_example_lowest_nid();
  70   if (empty($nid)) {
  71     drupal_set_message(t("You don't currently have any nodes, and this example requires a node to work with. As a result, this form is disabled."));
  72     $form['submit']['#disabled'] = TRUE;
  73   }
  74   return $form;
  75 }
  76 
  77 function batch_example_simple_form_submit($form, &$form_state) {
  78   $function = 'batch_example_' . $form_state['values']['batch'];
  79 
  80   $_SESSION['http_request_count'] = 0; // reset counter for debug information.
  81 
  82   // Execute the function named batch_example_1 or batch_example_2.
  83   $batch = $function();
  84   batch_set($batch);
  85 }
  86 
  87 
  88 /**
  89  * Batch 1 definition: Load the node with the lowest nid 1000 times.
  90  * This creates an operations array defining what batch 1 should do, including
  91  * what it should do when it's finished. In this case, each operation is the
  92  * same and by chance even has the same $nid to operate on, but we could have
  93  * a mix of different types of operations in the operations array.
  94  */
  95 function batch_example_batch_1() {
  96   $nid = batch_example_lowest_nid();
  97   $num_operations = 1000;
  98   drupal_set_message(t('Creating an array of @num operations', array('@num' => $num_operations)));
  99 
 100   $operations = array();
 101   // Set up an operations array with 1000 elements, each doing function
 102   // batch_example_op_1.
 103   // Each operation in the operations array means at least one new HTTP request,
 104   // running Drupal from scratch to accomplish the operation. If the operation
 105   // returns with $context['finished'] != TRUE, then it will be called again.
 106   // In this example, $context['finished'] is always TRUE.
 107   for ($i = 0; $i<$num_operations; $i++) {
 108 
 109     // Each operation is an array consisting of
 110     // - the function to call
 111     // - An array of arguments to that function
 112     $operations[] = array('batch_example_op_1', array($nid, t('(Operation @operation)', array('@operation' => $i))));
 113   }
 114   $batch = array(
 115     'operations' => $operations,
 116     'finished' => 'batch_example_finished',
 117   );
 118   return $batch;
 119 }
 120 
 121 /**
 122  * Batch operation for batch 1: load a node.
 123  * This is the function that is called on each operation in batch 1.
 124  */
 125 function batch_example_op_1($nid, $operation_details, &$context) {
 126   $node = node_load($nid, NULL, TRUE);
 127 
 128   // Store some results for post-processing in the 'finished' callback.
 129   // The contents of 'results' will be available as $results in the
 130   // 'finished' function (in this example, batch_example_finished()).
 131   $context['results'][] = $node->nid . ' : ' . check_plain($node->title);
 132 
 133   // Optional message displayed under the progressbar.
 134   $context['message'] = t('Loading node "@title"', array('@title' => $node->title)) . ' ' . $operation_details;
 135 
 136   _batch_example_update_http_requests();
 137 }
 138 
 139 /**
 140  * Batch 2 : Prepare a batch definition that will load all nodes 20 times.
 141  */
 142 function batch_example_batch_2() {
 143   $num_operations = 20;
 144 
 145   // Give helpful information about how many nodes are being operated on.
 146   $node_count = db_query('SELECT COUNT(DISTINCT nid) FROM {node}')->fetchField();
 147   drupal_set_message(t('There are @node_count nodes so each of the @num operations will require @count HTTP requests.', array('@node_count' => $node_count, '@num' => $num_operations, '@count' => ceil($node_count / 5))));
 148 
 149   $operations = array();
 150   // 20 operations, each one loads all nodes.
 151   for ($i = 0; $i < $num_operations; $i++) {
 152     $operations[] = array('batch_example_op_2', array(t('(Operation @operation)', array('@operation' => $i))));
 153   }
 154   $batch = array(
 155     'operations' => $operations,
 156     'finished' => 'batch_example_finished',
 157     // Message displayed while processing the batch. Available placeholders are:
 158     // @current, @remaining, @total, @percentage, @estimate and @elapsed.
 159     // These placeholders are replaced with actual values in _batch_process(),
 160     // using strtr() instead of t(). The values are determined based on the
 161     // number of operations in the 'operations' array (above), NOT by the number
 162     // of nodes that will be processed. In this example, there are 20
 163     // operations, so @total will always be 20, even though there are multiple
 164     // nodes per operation.
 165     // Defaults to t('Completed @current of @total.').
 166     'title' => t('Processing batch 2'),
 167     'init_message' => t('Batch 2 is starting.'),
 168     'progress_message' => t('Processed @current out of @total.'),
 169     'error_message' => t('Batch 2 has encountered an error.'),
 170   );
 171   return $batch;
 172 }
 173 
 174 /**
 175  * Batch operation for batch 2 : load all nodes, 5 by five
 176  * After each group of 5 control is returned to the batch API for later
 177  * continuation.
 178  */
 179 function batch_example_op_2($operation_details, &$context) {
 180   // Use the $context['sandbox'] at your convenience to store the
 181   // information needed to track progression between successive calls.
 182   if (empty($context['sandbox'])) {
 183     $context['sandbox'] = array();
 184     $context['sandbox']['progress'] = 0;
 185     $context['sandbox']['current_node'] = 0;
 186 
 187     // Save node count for the termination message.
 188     $context['sandbox']['max'] = db_query('SELECT COUNT(DISTINCT nid) FROM {node}')->fetchField();
 189   }
 190 
 191   // Process nodes by groups of 5 (arbitrary value).
 192   // When a group of five is processed, the batch update engine determines
 193   // whether it should continue processing in the same request or provide
 194   // progress feedback to the user and wait for the next request.
 195   // That way even though we're already processing at the operation level
 196   // the operation itself is interruptible.
 197   $limit = 5;
 198 
 199   // Retrieve the next group of nids.
 200   $result = db_select('node', 'n')
 201     ->fields('n', array('nid'))
 202     ->orderBy('n.nid', 'ASC')
 203     ->where('n.nid > :nid', array(':nid' => $context['sandbox']['current_node']))
 204     ->extend('PagerDefault')
 205     ->limit($limit)
 206     ->execute();
 207   foreach ($result as $row) {
 208     // Here we actually perform our dummy 'processing' on the current node.
 209     $node = node_load($row->nid, NULL, TRUE);
 210 
 211     // Store some results for post-processing in the 'finished' callback.
 212     // The contents of 'results' will be available as $results in the
 213     // 'finished' function (in this example, batch_example_finished()).
 214     $context['results'][] = $node->nid . ' : ' . check_plain($node->title) . ' ' . $operation_details;
 215 
 216     // Update our progress information.
 217     $context['sandbox']['progress']++;
 218     $context['sandbox']['current_node'] = $node->nid;
 219     $context['message'] = check_plain($node->title);
 220   }
 221 
 222   // Inform the batch engine that we are not finished,
 223   // and provide an estimation of the completion level we reached.
 224   if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
 225     $context['finished'] = ($context['sandbox']['progress'] >= $context['sandbox']['max']);
 226   }
 227   _batch_example_update_http_requests();
 228 }
 229 
 230 /**
 231  * Batch 'finished' callback used by both batch 1 and batch 2.
 232  */
 233 function batch_example_finished($success, $results, $operations) {
 234   if ($success) {
 235     // Here we could do something meaningful with the results.
 236     // We just display the number of nodes we processed...
 237     drupal_set_message(t('@count results processed in @requests HTTP requests.', array('@count' => count($results), '@requests' => _batch_example_get_http_requests())));
 238     drupal_set_message(t('The final result was "%final"', array('%final' => end($results))));
 239   }
 240   else {
 241     // An error occurred.
 242     // $operations contains the operations that remained unprocessed.
 243     $error_operation = reset($operations);
 244     drupal_set_message(t('An error occurred while processing @operation with arguments : @args', array('@operation' => $error_operation[0], '@args' => print_r($error_operation[0], TRUE))));
 245   }
 246 }
 247 
 248 /**
 249  * Utility function - simply queries and loads the lowest nid.
 250  * @return A nid or NULL if there are no nodes.
 251  */
 252 function batch_example_lowest_nid() {
 253   $select = db_select('node', 'n')
 254   ->fields('n', array('nid'))
 255   ->orderBy('n.nid', 'ASC')
 256   ->extend('PagerDefault')
 257   ->limit(1);
 258   $nid = $select->execute()->fetchField();
 259   return $nid;
 260 }
 261 
 262 /**
 263  * Utility function to count the HTTP requests in a session variable.
 264  */
 265 function _batch_example_update_http_requests() {
 266   $_SESSION['http_request_count']++;
 267 }
 268 
 269 function _batch_example_get_http_requests() {
 270   return !empty($_SESSION['http_request_count']) ? $_SESSION['http_request_count'] : 0;
 271 }
 272 /**
 273  * @} End of "defgroup batch_example".
 274  */
";i:1;N;i:2;N;}i:2;i:4085;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16002;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"batch_example.test";i:1;i:2;i:2;i:16002;}i:2;i:16002;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:16002;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1641:"
  1 <?php
   2 /**
   3  * @file
   4  * Test case for Testing the batch example module.
   5  *
   6  * This file contains the test cases to check if module is performing as
   7  * expected.
   8  */
   9 class BatchExampleTestCase extends DrupalWebTestCase {
  10   protected $web_user;
  11 
  12   public static function getInfo() {
  13     return array(
  14       'name' => 'Batch example functionality',
  15       'description' => 'Verify the defined batches.',
  16       'group' => 'Examples',
  17     );
  18   }
  19 
  20   /**
  21    * Enable modules and create user with specific permissions.
  22    */
  23   function setUp() {
  24     parent::setUp('batch_example');
  25     // Create user.
  26     $this->web_user = $this->drupalCreateUser();
  27   }
  28 
  29   /**
  30    * Login user, create 30 nodes and test both batch examples.
  31    */
  32   function testBatchExampleBasic() {
  33     // Login the admin user.
  34     $this->drupalLogin($this->web_user);
  35 
  36     // Create 30 nodes
  37     for ($count = 0; $count < 30; $count++) {
  38       $node = $this->drupalCreateNode();
  39     }
  40 
  41     // Launch Batch 1
  42     $result = $this->drupalPost('examples/batch_example', array('batch' => 'batch_1'), t('Go'));
  43     // Check that 1000 operations were performed.
  44     $this->assertText('1000 results processed');
  45 
  46     // Launch Batch 2
  47     $result = $this->drupalPost('examples/batch_example', array('batch' => 'batch_2'), t('Go'));
  48     // Check that 600 operations were performed.
  49     $this->assertText('600 results processed');
  50   }
  51 }
";i:1;N;i:2;N;}i:2;i:16038;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17687;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:17687;}}