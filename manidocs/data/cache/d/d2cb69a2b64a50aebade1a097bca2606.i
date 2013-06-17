a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Token Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"token_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:211:"
   1 name = Token example
   2 description = An example module showing how to define and use tokens.
   3 package = Example modules
   4 core = 7.x
   5 dependencies[] = token
   6 files[] = token_example.test
";i:1;N;i:2;N;}i:2;i:66;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:286;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"token_example.module";i:1;i:2;i:2;i:286;}i:2;i:286;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:286;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8071:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * An example module showing how to define and use tokens.
   6  *
   7  * The Token module provides an API for providing tokens to other modules.
   8  * Tokens are small bits of text that can be placed into larger documents
   9  * via simple placeholders, like %site-name or [user].
  10  */
  11 
  12 /**
  13  * @defgroup token_example Example: Token API
  14  * @ingroup examples
  15  * @{
  16  * Examples using the Token API.
  17  *
  18  * The Token module provides an API for providing tokens to other modules.
  19  * Tokens are small bits of text that can be placed into larger documents
  20  * via simple placeholders, like %site-name or [user].
  21  *
  22  * Drupal 7 documentation on Token can be found here:
  23  * http://drupal.org/documentation/modules/token
  24  *
  25  * A list of existing tokens can be found here:
  26  * http://drupal.org/node/390482#drupal7tokenslist
  27  *
  28  * This example is part of the Examples for Developers Project which you can
  29  * download and experiment with here: http://drupal.org/project/examples
  30  */
  31 
  32 /**
  33  * Implements hook_menu().
  34  */
  35 function token_example_menu() {
  36   $items['examples/token'] = array(
  37     'title' => 'Token example',
  38     'description' => 'Test replacement tokens in real time.',
  39     'page callback' => 'drupal_get_form',
  40     'page arguments' => array('token_example_example_form'),
  41     'access callback' => TRUE,
  42   );
  43   return $items;
  44 }
  45 
  46 /**
  47  * Implements hook_entity_info_alter().
  48  *
  49  * @todo Remove this when the testbot can properly pick up dependencies
  50  * for contrib modules.
  51  */
  52 function token_example_entity_info_alter(&$info) {
  53   if (isset($info['taxonomy_term'])) {
  54     $info['taxonomy_term']['token type'] = 'term';
  55   }
  56   if (isset($info['taxonomy_vocabulary'])) {
  57     $info['taxonomy_vocabulary']['token type'] = 'vocabulary';
  58   }
  59 }
  60 
  61 /**
  62  * Form builder; display lists of supported token entities and text to tokenize.
  63  */
  64 function token_example_example_form($form, &$form_state) {
  65   $entities = entity_get_info();
  66   $token_types = array();
  67 
  68   // Scan through the list of entities for supported token entities.
  69   foreach ($entities as $entity => $info) {
  70     $object_callback = "_token_example_get_{$entity}";
  71     if (function_exists($object_callback) && $objects = $object_callback()) {
  72       $form[$entity] = array(
  73         '#type' => 'select',
  74         '#title' => $info['label'],
  75         '#options' => array(0 => t('Not selected')) + $objects,
  76         '#default_value' => isset($form_state['storage'][$entity]) ? $form_state['storage'][$entity] : 0,
  77         '#access' => !empty($objects),
  78       );
  79 
  80       // Build a list of supported token types based on the available entites.
  81       if ($form[$entity]['#access']) {
  82         $token_types[$entity] = !empty($info['token type']) ? $info['token type'] : $entity;
  83       }
  84     }
  85   }
  86 
  87   $form['text'] = array(
  88     '#type' => 'textarea',
  89     '#title' => t('Enter your text here'),
  90     '#default_value' => 'Hello [current-user:name]!'
  91   );
  92 
  93   // Display the results of tokenized text.
  94   if (!empty($form_state['storage']['text'])) {
  95     $form['text']['#default_value'] = $form_state['storage']['text'];
  96 
  97     $data = array();
  98     foreach ($entities as $entity => $info) {
  99       if (!empty($form_state['storage'][$entity])) {
 100         $objects = entity_load($entity, array($form_state['storage'][$entity]));
 101         if ($objects) {
 102           $data[$token_types[$entity]] = reset($objects);
 103         }
 104       }
 105     }
 106 
 107     // Display the tokenized text.
 108     $form['text_tokenized'] = array(
 109       '#type' => 'item',
 110       '#title' => t('Result'),
 111       '#markup' => token_replace($form_state['storage']['text'], $data),
 112     );
 113   }
 114 
 115   $form['submit'] = array(
 116     '#type' => 'submit',
 117     '#value' => t('Submit'),
 118   );
 119 
 120   if (module_exists('token')) {
 121     $form['token_tree'] = array(
 122       '#theme' => 'token_tree',
 123       '#token_types' => $token_types,
 124     );
 125   }
 126   else {
 127     $form['token_tree'] = array(
 128       '#markup' => '<p>' . t('Enable the <a href="@drupal-token">Token module</a> to view the available token browser.', array('@drupal-token' => 'http://drupal.org/project/token')) . '</p>',
 129     );
 130   }
 131 
 132   return $form;
 133 }
 134 
 135 /**
 136  * Submit callback; store the submitted values into storage.
 137  */
 138 function token_example_example_form_submit($form, &$form_state) {
 139   $form_state['storage'] = $form_state['values'];
 140   $form_state['rebuild'] = TRUE;
 141 }
 142 
 143 /**
 144  * Builds a list of available content.
 145  */
 146 function _token_example_get_node() {
 147   if (!user_access('access content') && !user_access('bypass node access')) {
 148     return array();
 149   }
 150 
 151   $node_query = db_select('node', 'n');
 152   $node_query->fields('n', array('nid', 'title'));
 153   $node_query->condition('n.status', NODE_PUBLISHED);
 154   $node_query->orderBy('n.created', 'DESC');
 155   $node_query->range(0, 10);
 156   $node_query->addTag('node_access');
 157   $nodes = $node_query->execute()->fetchAllKeyed();
 158   $nodes = array_map('check_plain', $nodes);
 159   return $nodes;
 160 }
 161 
 162 /**
 163  * Builds a list of available comments.
 164  */
 165 function _token_example_get_comment() {
 166   if (!module_exists('comment') || (!user_access('access comments') && !user_access('administer comments'))) {
 167     return array();
 168   }
 169 
 170   $comment_query = db_select('comment', 'c');
 171   $comment_query->innerJoin('node', 'n', 'n.nid = c.nid');
 172   $comment_query->fields('c', array('cid', 'subject'));
 173   $comment_query->condition('n.status', NODE_PUBLISHED);
 174   $comment_query->condition('c.status', COMMENT_PUBLISHED);
 175   $comment_query->orderBy('c.created', 'DESC');
 176   $comment_query->range(0, 10);
 177   $comment_query->addTag('node_access');
 178   $comments = $comment_query->execute()->fetchAllKeyed();
 179   $comments = array_map('check_plain', $comments);
 180   return $comments;
 181 }
 182 
 183 /**
 184  * Builds a list of available user accounts.
 185  */
 186 function _token_example_get_user() {
 187   if (!user_access('access user profiles') &&
 188       !user_access('administer users')) {
 189     return array();
 190   }
 191 
 192   $account_query = db_select('users', 'u');
 193   $account_query->fields('u', array('uid', 'name'));
 194   $account_query->condition('u.uid', 0, '>');
 195   $account_query->condition('u.status', 1);
 196   $account_query->range(0, 10);
 197   $accounts = $account_query->execute()->fetchAllKeyed();
 198   $accounts = array_map('check_plain', $accounts);
 199   return $accounts;
 200 }
 201 
 202 /**
 203  * Builds a list of available taxonomy terms.
 204  */
 205 function _token_example_get_taxonomy_term() {
 206   $term_query = db_select('taxonomy_term_data', 'ttd');
 207   $term_query->fields('ttd', array('tid', 'name'));
 208   $term_query->range(0, 10);
 209   $term_query->addTag('term_access');
 210   $terms = $term_query->execute()->fetchAllKeyed();
 211   $terms = array_map('check_plain', $terms);
 212   return $terms;
 213 }
 214 
 215 /**
 216  * Builds a list of available files.
 217  */
 218 function _token_example_get_file() {
 219   $file_query = db_select('file_managed', 'f');
 220   $file_query->fields('f', array('fid', 'filename'));
 221   $file_query->range(0, 10);
 222   $files = $file_query->execute()->fetchAllKeyed();
 223   $files = array_map('check_plain', $files);
 224   return $files;
 225 }
 226 /**
 227  * @} End of "defgroup token_example".
 228  */
";i:1;N;i:2;N;}i:2;i:324;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8404;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"token_example.test";i:1;i:2;i:2;i:8404;}i:2;i:8404;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:8404;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2392:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test cases for Testing the token example module.
   6  */
   7 
   8 class TokenExampleTestCase extends DrupalWebTestCase {
   9 
  10   protected $web_user;
  11 
  12   public static function getInfo() {
  13     return array(
  14       'name' => 'Token example functionality',
  15       'description' => 'Verify the token example interface.',
  16       'group' => 'Examples',
  17     );
  18   }
  19 
  20   function setUp() {
  21     parent::setUp('token_example');
  22     $this->web_user = $this->drupalCreateUser();
  23     $this->drupalLogin($this->web_user);
  24   }
  25 
  26   function testInterface() {
  27     $filtered_id = db_query("SELECT format FROM {filter_format} WHERE name = 'Filtered HTML'")->fetchField();
  28     $default_format_id = filter_default_format($this->web_user);
  29 
  30     $this->drupalGet('examples/token');
  31     $this->assertNoFieldByName('node');
  32     $this->assertNoFieldByName('user');
  33 
  34     $edit = array(
  35       'text' => 'User [current-user:name] is trying the token example!',
  36     );
  37     $this->drupalPost(NULL, $edit, t('Submit'));
  38     $this->assertText('User ' . $this->web_user->name . ' is trying the token example!');
  39 
  40     // Create a node and then make the 'Plain text' text format the default.
  41     $node = $this->drupalCreateNode(array('title' => 'Example node', 'status' => NODE_PUBLISHED));
  42     db_update('filter_format')
  43       ->fields(array('weight' => -10))
  44       ->condition('name', 'Plain text')
  45       ->execute();
  46 
  47     $this->drupalGet('examples/token');
  48 
  49     $edit = array(
  50       'text' => 'Would you like to view the [node:type-name] [node:title] with text format [node:body-format] (ID [node:body-format:id])?',
  51       'node' => $node->nid,
  52     );
  53     $this->drupalPost(NULL, $edit, t('Submit'));
  54     $this->assertText('Would you like to view the Basic page Example node with text format Filtered HTML (ID ' . $filtered_id . ')?');
  55 
  56     $edit = array(
  57       'text' => 'Your default text format is [default-format:name] (ID [default-format:id]).',
  58     );
  59     $this->drupalPost(NULL, $edit, t('Submit'));
  60     $this->assertText('Your default text format is Filtered HTML (ID ' . $default_format_id . ')');
  61   }
  62 }
";i:1;N;i:2;N;}i:2;i:8440;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10841;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"token_example.tokens.inc";i:1;i:2;i:2;i:10841;}i:2;i:10841;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10841;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5139:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Token callbacks for the token_example module.
   6  */
   7 
   8 /**
   9  * Implements hook_token_info().
  10  *
  11  * @ingroup token_example
  12  */
  13 function token_example_token_info() {
  14   // Add two different token types. The first is the generic text format. The
  15   // second is the user's default text format, which is itself a 'format' token
  16   // type so it can be used directly.
  17   $info['types']['format'] = array(
  18     'name' => t('Text formats'),
  19     'description' => t('Tokens related to text formats.'),
  20     'needs-data' => 'format',
  21   );
  22   $info['types']['default-format'] = array(
  23     'name' => t('Default text format'),
  24     'description' => t("Tokens related to the currently logged in user's default text format."),
  25     'type' => 'format',
  26   );
  27 
  28   // Tokens for the text format token type.
  29   $info['tokens']['format']['id'] = array(
  30     'name' => t('ID'),
  31     'description' => t("The unique ID of the text format."),
  32   );
  33   $info['tokens']['format']['name'] = array(
  34     'name' => t('Name'),
  35     'description' => t("The name of the text format."),
  36   );
  37 
  38   // Node tokens.
  39   $info['tokens']['node']['body-format'] = array(
  40     'name' => t('Body text format'),
  41     'description' => t("The name of the text format used on the node's body field."),
  42     'type' => 'format',
  43   );
  44 
  45   // Comment tokens.
  46   if (module_exists('comment')) {
  47     $info['tokens']['comment']['body-format'] = array(
  48       'name' => t('Body text format'),
  49       'description' => t("The name of the text format used on the comment's body field."),
  50       'type' => 'format',
  51     );
  52   }
  53 
  54   return $info;
  55 }
  56 
  57 /**
  58  * Implements hook_tokens().
  59  *
  60  * @ingroup token_example
  61  */
  62 function token_example_tokens($type, $tokens, array $data = array(), array $options = array()) {
  63   $replacements = array();
  64   $sanitize = !empty($options['sanitize']);
  65 
  66   // Text format tokens.
  67   if ($type == 'format' && !empty($data['format'])) {
  68     $format = $data['format'];
  69 
  70     foreach ($tokens as $name => $original) {
  71       switch ($name) {
  72         case 'id':
  73           // Since {filter_format}.format is an integer and not user-entered
  74           // text, it does not need to ever be sanitized.
  75           $replacements[$original] = $format->format;
  76           break;
  77         case 'name':
  78           // Since the format name is user-entered text, santize when requested.
  79           $replacements[$original] = $sanitize ? filter_xss($format->name) : $format->name;
  80           break;
  81       }
  82     }
  83   }
  84 
  85   // Default format tokens.
  86   if ($type == 'default-format') {
  87     $default_id = filter_default_format();
  88     $default_format = filter_format_load($default_id);
  89     $replacements += token_generate('format', $tokens, array('format' => $default_format), $options);
  90   }
  91 
  92   // Node tokens.
  93   if ($type == 'node' && !empty($data['node'])) {
  94     $node = $data['node'];
  95 
  96     foreach ($tokens as $name => $original) {
  97       switch ($name) {
  98         case 'body-format':
  99           if ($items = field_get_items('node', $node, 'body')) {
 100             $format = filter_format_load($items[0]['format']);
 101             $replacements[$original] = $sanitize ? filter_xss($format->name) : $format->name;
 102           }
 103           break;
 104       }
 105     }
 106 
 107     // Chained token relationships.
 108     if ($format_tokens = token_find_with_prefix($tokens, 'body-format')) {
 109       if ($items = field_get_items('node', $node, 'body')) {
 110         $body_format = filter_format_load($items[0]['format']);
 111         $replacements += token_generate('format', $format_tokens, array('format' => $body_format), $options);
 112       }
 113     }
 114   }
 115 
 116   // Comment tokens.
 117   if ($type == 'comment' && !empty($data['comment'])) {
 118     $comment = $data['comment'];
 119 
 120     foreach ($tokens as $name => $original) {
 121       switch ($name) {
 122         case 'body-format':
 123           if ($items = field_get_items('comment', $comment, 'comment_body')) {
 124             $format = filter_format_load($items[0]['format']);
 125             $replacements[$original] = $sanitize ? filter_xss($format->name) : $format->name;
 126           }
 127           break;
 128       }
 129     }
 130 
 131     // Chained token relationships.
 132     if ($format_tokens = token_find_with_prefix($tokens, 'body-format')) {
 133       if ($items = field_get_items('comment', $comment, 'comment_body')) {
 134         $body_format = filter_format_load($items[0]['format']);
 135         $replacements += token_generate('format', $format_tokens, array('format' => $body_format), $options);
 136       }
 137     }
 138   }
 139 
 140   return $replacements;
 141 }
";i:1;N;i:2;N;}i:2;i:10883;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16030;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:16030;}}