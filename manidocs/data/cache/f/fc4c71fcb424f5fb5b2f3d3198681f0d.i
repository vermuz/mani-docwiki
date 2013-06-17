a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"DBting Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"dbtng_example.info";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:185:"
  1 name = DBTNG example
   2 description = An example module showing how use the database API: DBTNG.
   3 package = Example modules
   4 core = 7.x
   5 files[] = dbtng_example.test
";i:1;N;i:2;N;}i:2;i:67;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:261;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"dbtng_example.install";i:1;i:2;i:2;i:261;}i:2;i:261;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:261;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3347:"
   1 <?php
   2 /**
   3  * @file
   4  * Install, update and uninstall functions for the dbtng_example module.
   5  */
   6 
   7 /**
   8  * Implements hook_install().
   9  *
  10  * In Drupal 7, there is no need to install schema using this hook, the schema
  11  * is already installed before this hook is called.
  12  *
  13  * We will create a default entry in the database.
  14  *
  15  * @see hook_install()
  16  * @ingroup dbtng_example
  17  */
  18 function dbtng_example_install() {
  19   // Outside of the .install file we would use drupal_write_record() to
  20   // populate the database, but it cannot be used here, so we'll use
  21   // db_insert().
  22 
  23   // Add a default entry.
  24   $fields = array(
  25     'name'    => 'John',
  26     'surname' => 'Doe',
  27     'age'     => 0,
  28   );
  29   db_insert('dbtng_example')
  30     ->fields($fields)
  31     ->execute();
  32 
  33   // Add another entry.
  34   $fields = array(
  35     'name'    => 'John',
  36     'surname' => 'Roe',
  37     'age'     => 100,
  38     'uid'     => 1,
  39   );
  40   db_insert('dbtng_example')
  41     ->fields($fields)
  42     ->execute();
  43 
  44 }
  45 
  46 /**
  47  * Implements hook_uninstall().
  48  *
  49  * As in hook_install, there is no need to uninstall schema, Drupal will do it
  50  * for us.
  51  *
  52  * @see hook_uninstall()
  53  * @ingroup dbtng_example
  54  */
  55 function dbtng_example_uninstall() {
  56   // nothing.
  57 }
  58 
  59 
  60 /**
  61  * Implements hook_schema().
  62  *
  63  * Defines the database tables used by this module.
  64  * Remember that the easiest way to create the code for hook_schema is with
  65  * the @link http://drupal.org/project/schema schema module @endlink
  66  *
  67  * @see hook_schema()
  68  * @ingroup dbtng_example
  69  */
  70 function dbtng_example_schema() {
  71 
  72   $schema['dbtng_example'] = array(
  73     'description' => 'Stores example person entries for demonstration purposes.',
  74     'fields' => array(
  75       'pid'  => array(
  76         'type' => 'serial',
  77         'not null' => TRUE,
  78         'description' => 'Primary Key: Unique person ID.',
  79       ),
  80       'uid' => array(
  81         'type' => 'int',
  82         'not null' => TRUE,
  83         'default' => 0,
  84         'description' => "Creator user's {users}.uid",
  85       ),
  86       'name' => array(
  87         'type' => 'varchar',
  88         'length' => 255,
  89         'not null' => TRUE,
  90         'default' => '',
  91         'description' => 'Name of the person.',
  92       ),
  93       'surname' => array(
  94         'type' => 'varchar',
  95         'length' => 255,
  96         'not null' => TRUE,
  97         'default' => '',
  98         'description' => 'Surname of the person.',
  99       ),
 100       'age' => array(
 101         'type' => 'int',
 102         'not null' => TRUE,
 103         'default' => 0,
 104         'size' => 'tiny',
 105         'description' => 'The age of the person in years.',
 106       )
 107     ),
 108     'primary key' => array('pid'),
 109     'indexes' => array(
 110       'name'    => array('name'),
 111       'surname' => array('surname'),
 112       'age'     => array('age'),
 113     ),
 114   );
 115 
 116   return $schema;
 117 }
";i:1;N;i:2;N;}i:2;i:300;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3656;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"dbtng_example.module";i:1;i:2;i:2;i:3656;}i:2;i:3656;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3656;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:19947:"
   1 <?php
   2 /**
   3  * @file
   4  * This is an example outlining how a module can make use of the new DBTNG
   5  * database API in Drupal 7.
   6  *
   7  * @todo Demonstrate transaction usage.
   8  *
   9  * General documentation is available at
  10  * @link database Database abstraction layer documentation @endlink and
  11  * at @link http://drupal.org/node/310069 @endlink.
  12  */
  13 
  14 /**
  15  * @defgroup dbtng_example Example: Database (DBTNG)
  16  * @ingroup examples
  17  * @{
  18  * Database examples, including DBTNG.
  19  *
  20  * 'DBTNG' means 'Database: The Next Generation.' Yes, Drupallers are nerds.
  21  *
  22  * General documentation is available at
  23  * @link database.inc database abstraction layer documentation @endlink and
  24  * at @link http://drupal.org/node/310069 Database API @endlink.
  25  *
  26  * The several examples here demonstrate basic database usage.
  27  *
  28  * In Drupal 6, the recommended method to save or update an entry in the
  29  * database was drupal_write_record() or db_query().
  30  *
  31  * In Drupal 7 and forward, the usage of db_query()
  32  * for INSERT, UPDATE, or DELETE is deprecated, because it is
  33  * database-dependent. Instead specific functions are provided to perform these
  34  * operations: db_insert(), db_update(), and db_delete() do the job now.
  35  * (Note that drupal_write_record() is also deprecated.)
  36  *
  37  * db_insert() example:
  38  * @code
  39  *   // INSERT INTO {dbtng_example} (name, surname) VALUES('John, 'Doe')
  40  *   db_insert('dbtng_example')
  41  *     ->fields(array('name' => 'John', 'surname' => 'Doe'))
  42  *     ->execute();
  43  * @endcode
  44  *
  45  * db_update() example:
  46  * @code
  47  *   // UPDATE {dbtng_example} SET name = 'Jane' WHERE name = 'John'
  48  *   db_update('dbtng_example')
  49  *     ->fields(array('name' => 'Jane'))
  50  *     ->condition('name', 'John')
  51  *     ->execute();
  52  * @endcode
  53  *
  54  * db_delete() example:
  55  * @code
  56  *   // DELETE FROM {dbtng_example} WHERE name = 'Jane'
  57  *   db_delete('dbtng_example')
  58  *     ->condition('name', 'Jane')
  59  *     ->execute();
  60  * @endcode
  61  *
  62  * See @link database Database Abstraction Layer @endlink
  63  * @see db_insert()
  64  * @see db_update()
  65  * @see db_delete()
  66  * @see drupal_write_record()
  67 */
  68 
  69 /**
  70  * Save an entry in the database.
  71  *
  72  * The underlying DBTNG function is db_insert().
  73  *
  74  * In Drupal 6, this would have been:
  75  * @code
  76  *   db_query(
  77  *     "INSERT INTO {dbtng_example} (name, surname, age)
  78  *       VALUES ('%s', '%s', '%d')",
  79  *     $entry['name'],
  80  *     $entry['surname'],
  81  *     $entry['age']
  82  *   );
  83  * @endcode
  84  *
  85  * Exception handling is shown in this example. It could be simplified
  86  * without the try/catch blocks, but since an insert will throw an exception
  87  * and terminate your application if the exception is not handled, it is best
  88  * to employ try/catch.
  89  *
  90  * @param $entry
  91  *   An array containing all the fields of the database record.
  92  *
  93  * @see db_insert()
  94  */
  95 function dbtng_example_entry_insert($entry) {
  96   $return_value = NULL;
  97   try {
  98     $return_value = db_insert('dbtng_example')
  99                     ->fields($entry)
 100                     ->execute();
 101   }
 102   catch (Exception $e) {
 103     drupal_set_message(t('db_insert failed. Message = %message, query= %query',
 104       array('%message' => $e->getMessage(), '%query' => $e->query_string)), 'error');
 105   }
 106   return $return_value;
 107 }
 108 
 109 /**
 110  * Update an entry in the database.
 111  *
 112  * The former, deprecated techniques used db_query() or drupal_write_record():
 113  * @code
 114  *  drupal_write_record('dbtng_example', $entry, $entry['pid']);
 115  * @endcode
 116  *
 117  * @code
 118  *  db_query(
 119  *    "UPDATE {dbtng_example}
 120  *     SET name = '%s', surname = '%s', age = '%d'
 121  *     WHERE pid = %d",
 122  *     $entry['pid']
 123  *  );
 124  * @endcode
 125  *
 126  * @param $entry
 127  *   An array containing all the fields of the item to be updated.
 128  *
 129  * @see db_update()
 130  */
 131 function dbtng_example_entry_update($entry) {
 132   try {
 133     // db_update()...->execute() returns the number of rows updated.
 134     $count = db_update('dbtng_example')
 135               ->fields($entry)
 136               ->condition('pid', $entry['pid'])
 137               ->execute();
 138   }
 139   catch (Exception $e) {
 140     drupal_set_message(t('db_update failed. Message = %message, query= %query',
 141       array('%message' => $e->getMessage(), '%query' => $e->query_string)), 'error');
 142   }
 143   return $count;
 144 }
 145 
 146 /**
 147  * Delete an entry from the database.
 148  *
 149  * The usage of db_query is deprecated except for static queries.
 150  * Formerly, a deletion might have been accomplished like this:
 151  * @code
 152  *  db_query("DELETE FROM {dbtng_example} WHERE pid = %d", $entry['pid]);
 153  * @endcode
 154  *
 155  * @param $entry
 156  *   An array containing at least the person identifier 'pid' element of the
 157  *   entry to delete.
 158  *
 159  * @see db_delete()
 160  */
 161 function dbtng_example_entry_delete($entry) {
 162   db_delete('dbtng_example')
 163     ->condition('pid', $entry['pid'])
 164     ->execute();
 165 
 166 }
 167 
 168 
 169 /**
 170  * Read from the database using a filter array.
 171  *
 172  * In Drupal 6, the standard function to perform reads was db_query(), and
 173  * for static queries, it still is.
 174  *
 175  * db_query() used an SQL query with placeholders and arguments as parameters.
 176  *
 177  * @code
 178  *  // Old way
 179  *  $query = "SELECT * FROM {dbtng_example} n WHERE n.uid = %d AND name = '%s'";
 180  *  $result = db_query($query, $uid, $name);
 181  * @endcode
 182  *
 183  * Drupal 7 DBTNG provides an abstracted interface that will work with a wide
 184  * variety of database engines.
 185  *
 186  * db_query() is deprecated except when doing a static query. The following is
 187  * perfectly acceptable in Drupal 7. See
 188  * @link http://drupal.org/node/310072 the handbook page on static queries @endlink
 189  *
 190  * @code
 191  *   // SELECT * FROM {dbtng_example} WHERE uid = 0 AND name = 'John'
 192  *   db_query(
 193  *     "SELECT * FROM {dbtng_example} WHERE uid = :uid and name = :name",
 194  *     array(':uid' => 0, ':name' => 'John')
 195  *   )->execute();
 196  * @endcode
 197  *
 198  * But for more dynamic queries, Drupal provides the db_select()
 199  * API method, so there are several ways to perform the same SQL query.
 200  * See the @link http://drupal.org/node/310075 handbook page on dynamic queries. @endlink
 201  *
 202  * @code
 203  *   // SELECT * FROM {dbtng_example} WHERE uid = 0 AND name = 'John'
 204  *   db_select('dbtng_example')
 205  *     ->fields('dbtng_example')
 206  *     ->condition('uid', 0)
 207  *     ->condition('name', 'John')
 208  *     ->execute();
 209  * @endcode
 210  *
 211  * Here is db_select with named placeholders:
 212  * @code
 213  *   // SELECT * FROM {dbtng_example} WHERE uid = 0 AND name = 'John'
 214  *   $arguments = array(':name' => 'John', ':uid' => 0);
 215  *   db_select('dbtng_example')
 216  *     ->fields('dbtng_example')
 217  *     ->where('uid = :uid AND name = :name', $arguments)
 218  *     ->execute();
 219  * @endcode
 220  *
 221  * Conditions are stacked and evaluated as AND and OR depending on the type of
 222  * query. For more information, read the conditional queries handbook page at:
 223  * http://drupal.org/node/310086
 224  *
 225  * The condition argument is an 'equal' evaluation by default, but this can be
 226  * altered:
 227  * @code
 228  *   // SELECT * FROM {dbtng_example} WHERE age > 18
 229  *   db_select('dbtng_example')
 230  *     ->fields('dbtng_example')
 231  *     ->condition('age', 18, '>')
 232  *     ->execute();
 233  * @endcode
 234  *
 235  * @param $entry
 236  *   An array containing all the fields used to search the entries in the table.
 237  * @return
 238  *   An object containing the loaded entries if found.
 239  *
 240  * @see db_select()
 241  * @see db_query()
 242  * @see http://drupal.org/node/310072
 243  * @see http://drupal.org/node/310075
 244  *
 245  */
 246 function dbtng_example_entry_load($entry = array()) {
 247   // Read all fields from the dbtng_example table.
 248   $select = db_select('dbtng_example', 'example');
 249   $select->fields('example');
 250 
 251   // Add each field and value as a condition to this query.
 252   foreach ($entry as $field => $value) {
 253     $select->condition($field, $value);
 254   }
 255   // Return the result in object format.
 256   return $select->execute()->fetchAll();
 257 }
 258 
 259 /**
 260  * Render a filtered list of entries in the database.
 261  *
 262  * DBTNG also helps processing queries that return several rows, providing the
 263  * found objects in the same query execution call.
 264  *
 265  * This function queries the database using a JOIN between users table and the
 266  * example entries, to provide the username that created the entry, and creates
 267  * a table with the results, processing each row.
 268  *
 269  * SELECT
 270  *  e.pid as pid, e.name as name, e.surname as surname, e.age as age
 271  *  u.name as username
 272  * FROM
 273  *  {dbtng_example} e
 274  * JOIN
 275  *  users u ON e.uid = u.uid
 276  * WHERE
 277  *  e.name = 'John' AND e.age > 18
 278  *
 279  * @see db_select()
 280  * @see http://drupal.org/node/310075
 281  */
 282 function dbtng_example_advanced_list() {
 283   $output = '';
 284 
 285   $select = db_select('dbtng_example', 'e');
 286   // Join the users table, so we can get the entry creator's username.
 287   $select->join('users', 'u', 'e.uid = u.uid');
 288   // Select these specific fields for the output.
 289   $select->addField('e', 'pid');
 290   $select->addField('u', 'name', 'username');
 291   $select->addField('e', 'name');
 292   $select->addField('e', 'surname');
 293   $select->addField('e', 'age');
 294   // Filter only persons named "John".
 295   $select->condition('e.name', 'John');
 296   // Filter only persons older than 18 years.
 297   $select->condition('e.age', 18, '>');
 298   // Make sure we only get items 0-49, for scalability reasons.
 299   $select->range(0, 50);
 300 
 301   // Now, loop all these entries and show them in a table. Note that there is no
 302   // db_fetch_* object or array function being called here. Also note that the
 303   // following line could have been written as
 304   // $entries = $select->execute()->fetchAll() which would return each selected
 305   // record as an object instead of an array.
 306   $entries = $select->execute()->fetchAll(PDO::FETCH_ASSOC);
 307   if (!empty($entries)) {
 308     $rows = array();
 309     foreach ($entries as $entry) {
 310       // Sanitize the data before handing it off to the theme layer.
 311       $rows[] = array_map('check_plain', $entry);
 312     }
 313     // Make a table for them.
 314     $header = array(t('Id'), t('Created by'), t('Name'), t('Surname'), t('Age'));
 315     $output .= theme('table', array('header' => $header, 'rows' => $rows));
 316   }
 317   else {
 318     drupal_set_message(t('No entries meet the filter criteria (Name = "John" and Age > 18).'));
 319   }
 320   return $output;
 321 }
 322 
 323 //// Helper functions ////
 324 
 325 /**
 326  * Implements hook_help().
 327  *
 328  * Show some help on each form provided by this module.
 329  */
 330 function dbtng_example_help($path) {
 331   $output = '';
 332   switch ($path) {
 333     case 'examples/dbtng':
 334       $output = t('Generate a list of all entries in the database. There is no filter in the query.');
 335       break;
 336     case 'examples/dbtng/advanced':
 337       $output  = t('A more complex list of entries in the database.') . ' ';
 338       $output .= t('Only the entries with name = "John" and age older than 18 years are shown, the username of the person who created the entry is also shown.');
 339       break;
 340     case 'examples/dbtng/update':
 341       $output = t('Demonstrates a database update operation.');
 342       break;
 343     case 'examples/dbtng/add':
 344       $output = t('Add an entry to the dbtng_example table.');
 345       break;
 346   }
 347   return $output;
 348 }
 349 
 350 /**
 351  * Implements hook_menu().
 352  *
 353  * Set up calls to drupal_get_form() for all our example cases.
 354  */
 355 function dbtng_example_menu() {
 356   $items = array();
 357 
 358   $items['examples/dbtng'] = array(
 359     'title' => 'DBTNG Example',
 360     'page callback' => 'dbtng_example_list',
 361     'access callback' => TRUE,
 362   );
 363   $items['examples/dbtng/list'] = array(
 364     'title' => 'List',
 365     'type' => MENU_DEFAULT_LOCAL_TASK,
 366     'weight' => -10,
 367   );
 368   $items['examples/dbtng/add'] = array(
 369     'title' => 'Add entry',
 370     'page callback' => 'drupal_get_form',
 371     'page arguments' => array('dbtng_example_form_add'),
 372     'access callback' => TRUE,
 373     'type' => MENU_LOCAL_TASK,
 374     'weight' => -9,
 375   );
 376   $items['examples/dbtng/update'] = array(
 377     'title' => 'Update entry',
 378     'page callback' => 'drupal_get_form',
 379     'page arguments' => array('dbtng_example_form_update'),
 380     'type' => MENU_LOCAL_TASK,
 381     'access callback' => TRUE,
 382     'weight' => -5,
 383   );
 384   $items['examples/dbtng/advanced'] = array(
 385     'title' => 'Advanced list',
 386     'page callback' => 'dbtng_example_advanced_list',
 387     'access callback' => TRUE,
 388     'type' => MENU_LOCAL_TASK,
 389   );
 390 
 391   return $items;
 392 }
 393 
 394 /**
 395  * Render a list of entries in the database.
 396  */
 397 function dbtng_example_list() {
 398   $output = '';
 399 
 400   // Get all entries in the dbtng_example table.
 401   if ($entries = dbtng_example_entry_load()) {
 402     $rows = array();
 403     foreach ($entries as $entry) {
 404       // Sanitize the data before handing it off to the theme layer.
 405       $rows[] = array_map('check_plain', (array) $entry);
 406     }
 407     // Make a table for them.
 408     $header = array(t('Id'), t('uid'), t('Name'), t('Surname'), t('Age'));
 409     $output .= theme('table', array('header' => $header, 'rows' => $rows));
 410   }
 411   else {
 412     drupal_set_message(t('No entries have been added yet.'));
 413   }
 414   return $output;
 415 }
 416 
 417 /**
 418  * Prepare a simple form to add an entry, with all the interesting fields.
 419  */
 420 function dbtng_example_form_add($form, &$form_state) {
 421   $form = array();
 422 
 423   $form['add'] = array(
 424     '#type'  => 'fieldset',
 425     '#title' => t('Add a person entry'),
 426   );
 427   $form['add']['name'] = array(
 428     '#type'  => 'textfield',
 429     '#title' => t('Name'),
 430     '#size'  => 15,
 431   );
 432   $form['add']['surname'] = array(
 433     '#type'  => 'textfield',
 434     '#title' => t('Surname'),
 435     '#size'  => 15,
 436   );
 437   $form['add']['age'] = array(
 438     '#type'  => 'textfield',
 439     '#title' => t('Age'),
 440     '#size'  => 5,
 441     '#description' => t("Values greater than 127 will cause an exception. Try it - it's a great example why exception handling is needed with DTBNG."),
 442   );
 443   $form['add']['submit'] = array(
 444     '#type'  => 'submit',
 445     '#value' => t('Add'),
 446   );
 447 
 448   return $form;
 449 }
 450 
 451 /**
 452  * Submit handler for 'add entry' form.
 453  */
 454 function dbtng_example_form_add_submit($form, &$form_state) {
 455   global $user;
 456 
 457   // Save the submitted entry.
 458   $entry = array(
 459     'name'    => $form_state['values']['name'],
 460     'surname' => $form_state['values']['surname'],
 461     'age'     => $form_state['values']['age'],
 462     'uid'     => $user->uid,
 463   );
 464   $return = dbtng_example_entry_insert($entry);
 465   if ($return) {
 466     drupal_set_message(t("Created entry @entry", array('@entry' => print_r($entry, TRUE))));
 467   }
 468 }
 469 
 470 /**
 471  * Sample UI to update a record.
 472  */
 473 function dbtng_example_form_update($form, &$form_state) {
 474   $form = array(
 475     '#prefix' => '<div id="updateform">',
 476     '#suffix' => '</div>',
 477   );
 478 
 479   $entries = dbtng_example_entry_load();
 480   $keyed_entries = array();
 481   if (empty($entries)) {
 482     $form['no_values'] = array(
 483       '#value' => t("No entries exist in the table dbtng_example table."),
 484     );
 485     return $form;
 486   }
 487 
 488   foreach ($entries as $entry) {
 489     $options[$entry->pid] = t("@pid: @name @surname (@age)", array('@pid' => $entry->pid, '@name' => $entry->name, '@surname' => $entry->surname, '@age' => $entry->age));
 490     $keyed_entries[$entry->pid] = $entry;
 491   }
 492   $default_entry = !empty($form_state['values']['pid']) ? $keyed_entries[$form_state['values']['pid']] : $entries[0];
 493 
 494   $form_state['entries'] = $keyed_entries;
 495 
 496   $form['pid'] = array(
 497     '#type' => 'select',
 498     '#options' => $options,
 499     '#title' => t('Choose entry to update'),
 500     '#default_value' => $default_entry->pid,
 501     '#ajax' => array(
 502       'wrapper' => 'updateform',
 503       'callback' => 'dbtng_example_form_update_callback',
 504     ),
 505   );
 506 
 507   $form['name'] = array(
 508     '#type' => 'textfield',
 509     '#title' => t('Updated first name'),
 510     '#size' => 15,
 511     '#default_value' => $default_entry->name,
 512   );
 513 
 514   $form['surname'] = array(
 515     '#type' => 'textfield',
 516     '#title' => t('Updated last name'),
 517     '#size' => 15,
 518     '#default_value' => $default_entry->surname,
 519   );
 520   $form['age'] = array(
 521     '#type' => 'textfield',
 522     '#title' => t('Updated age'),
 523     '#size' => 4,
 524     '#default_value' => $default_entry->age,
 525     '#description' => t("Values greater than 127 will cause an exception"),
 526   );
 527 
 528   $form['submit'] = array(
 529     '#type' => 'submit',
 530     '#value' => t('Update'),
 531   );
 532   return $form;
 533 }
 534 
 535 /**
 536  * AJAX callback handler for the pid select.
 537  *
 538  * When the pid changes, populates the defaults from the database in the form.
 539  */
 540 function dbtng_example_form_update_callback($form, $form_state) {
 541   $entry = $form_state['entries'][$form_state['values']['pid']];
 542   // Setting the #value of items is the only way I was able to figure out
 543   // to get replaced defaults on these items. #default_value will not do it
 544   // and shouldn't.
 545   foreach (array('name', 'surname', 'age') as $item) {
 546     $form[$item]['#value'] = $entry->$item;
 547   }
 548   return $form;
 549 }
 550 
 551 /**
 552  * Submit handler for 'update entry' form.
 553  */
 554 function dbtng_example_form_update_submit($form, &$form_state) {
 555   global $user;
 556 
 557   // Save the submitted entry.
 558   $entry = array(
 559     'pid' => $form_state['values']['pid'],
 560     'name' => $form_state['values']['name'],
 561     'surname' => $form_state['values']['surname'],
 562     'age' => $form_state['values']['age'],
 563     'uid' => $user->uid,
 564   );
 565   $count = dbtng_example_entry_update($entry);
 566   drupal_set_message(t("Updated entry @entry (@count row updated)", array('@count' => $count, '@entry' => print_r($entry, TRUE))));
 567 }
 568 /**
 569  * @} End of "defgroup dbtng_example".
 570  */
";i:1;N;i:2;N;}i:2;i:3694;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23650;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"dbtng_example.test";i:1;i:2;i:2;i:23650;}i:2;i:23650;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:23650;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5954:"
   1 <?php
   2 /**
   3  * @file
   4  * SimpleTests for dbtng_example module.
   5  */
   6 
   7 /**
   8  * Default test case for the dbtng_example module.
   9  */
  10 class DBTNGExampleUnitTestCase extends DrupalWebTestCase {
  11 
  12   public static function getInfo() {
  13     return array(
  14       'name' => 'DBTNG example unit and UI tests',
  15       'description' => 'Various unit tests on the dbtng example module.' ,
  16       'group' => 'Examples',
  17     );
  18   }
  19 
  20   function setUp() {
  21     parent::setUp('dbtng_example');
  22   }
  23 
  24   /**
  25    * Test default module installation, two entries in the database table.
  26    */
  27   function testInstall() {
  28     $result = dbtng_example_entry_load();
  29     $this->assertEqual(
  30       count($result),
  31       2,
  32       'Found two entries in the table after installing the module.'
  33     );
  34   }
  35 
  36 
  37   /**
  38    * Test the UI.
  39    */
  40   function testUI() {
  41     // Test the basic list.
  42     $this->drupalGet('examples/dbtng');
  43     $this->assertPattern("/John[td\/<>\w]+Doe/", "Text 'John Doe' found in table");
  44 
  45     //Test the add tab.
  46     // Add the new entry.
  47     $this->drupalPost('examples/dbtng/add',
  48       array('name'  => 'Some', 'surname' => 'Anonymous', 'age' => 33), t('Add'));
  49     // Now find the new entry.
  50     $this->drupalGet('examples/dbtng');
  51     $this->assertPattern("/Some[td\/<>\w]+Anonymous/", "Text 'Some Anonymous' found in table");
  52 
  53 
  54     // Try the update tab.
  55     // Find out the pid of our "anonymous" guy.
  56     $result = dbtng_example_entry_load(array('surname' => 'Anonymous'));
  57     $this->drupalGet("examples/dbtng");
  58     $this->assertEqual(
  59       count($result),
  60       1,
  61       'Found one entry in the table with surname = "Anonymous".'
  62     );
  63     $entry = $result[0];
  64     unset($entry->uid);
  65     $entry->name = 'NewFirstName';
  66     $this->drupalPost('examples/dbtng/update',
  67       (array)$entry, t('Update'));
  68     // Now find the new entry.
  69     $this->drupalGet('examples/dbtng');
  70     $this->assertPattern("/NewFirstName[td\/<>\w]+Anonymous/", "Text 'NewFirstName Anonymous' found in table");
  71 
  72     // Try the advanced tab.
  73     $this->drupalGet('examples/dbtng/advanced');
  74     $rows = $this->xpath("//*[@id='block-system-main']/div/table[1]/tbody/tr");
  75     $this->assertEqual(count($rows), 1, "One row found in advanced view");
  76     $this->assertFieldByXPath("//*[@id='block-system-main']/div/table[1]/tbody/tr/td[4]", "Roe", "Name 'Roe' Exists in advanced list");
  77   }
  78 
  79   /**
  80    * Test several combinations, adding entries, updating and deleting.
  81    */
  82   function testAPIExamples() {
  83     // Create a new entry.
  84     $entry = array(
  85       'name' => 'James',
  86       'surname' => 'Doe',
  87       'age' => 23,
  88     );
  89     dbtng_example_entry_insert($entry);
  90 
  91     // Save another entry
  92     $entry = array(
  93       'name' => 'Jane',
  94       'surname' => 'NotDoe',
  95       'age' => 19,
  96     );
  97     dbtng_example_entry_insert($entry);
  98 
  99     // Verify that 4 records are found in the database
 100     $result = dbtng_example_entry_load();
 101     $this->assertEqual(
 102       count($result),
 103       4,
 104       'Found a total of four entries in the table after creating two additional entries.'
 105     );
 106 
 107     // Verify 2 of these records have 'Doe' as surname
 108     $result = dbtng_example_entry_load(array('surname' => 'Doe'));
 109     $this->assertEqual(
 110       count($result),
 111       2,
 112       'Found two entries in the table with surname = "Doe".'
 113     );
 114 
 115     // Now find our not-Doe entry.
 116     $result = dbtng_example_entry_load(array('surname' => 'NotDoe'));
 117     $this->assertEqual(
 118       count($result),
 119       1,
 120       'Found one entry in the table with surname "NotDoe');
 121     // Our NotDoe will be changed to "NowDoe".
 122     $entry = $result[0];
 123     $entry->surname = "NowDoe";
 124     dbtng_example_entry_update((array)$entry);
 125 
 126     $result = dbtng_example_entry_load(array('surname' => 'NowDoe'));
 127     $this->assertEqual(
 128       count($result),
 129       1,
 130       "Found renamed 'NowDoe' surname");
 131 
 132     // Read only John Doe entry.
 133     $result = dbtng_example_entry_load(array('name' => 'John', 'surname' => 'Doe'));
 134     $this->assertEqual(
 135       count($result),
 136       1,
 137       'Found one entry for John Doe.'
 138     );
 139     // Get the entry
 140     $entry = (array) end($result);
 141     // Change age to 45
 142     $entry['age'] = 45;
 143     // Update entry in database
 144     dbtng_example_entry_update((array)$entry);
 145 
 146     // Find entries with age = 45
 147     // Read only John Doe entry.
 148     $result = dbtng_example_entry_load(array('surname' => 'NowDoe'));
 149     $this->assertEqual(
 150       count($result),
 151       1,
 152       'Found one entry with surname = Nowdoe.'
 153     );
 154 
 155     // Verify it is Jane NowDoe.
 156     $entry = (array) end($result);
 157     $this->assertEqual(
 158       $entry['name'],
 159       'Jane',
 160       'The name Jane is found in the entry'
 161     );
 162     $this->assertEqual(
 163       $entry['surname'],
 164       'NowDoe',
 165       'The surname NowDoe is found in the entry'
 166     );
 167 
 168     // Delete the entry.
 169     dbtng_example_entry_delete($entry);
 170 
 171     // Verify that now there are only 3 records
 172     $result = dbtng_example_entry_load();
 173     $this->assertEqual(
 174       count($result),
 175       3,
 176       'Found only three records, a record was deleted.'
 177     );
 178   }
 179 }
";i:1;N;i:2;N;}i:2;i:23686;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29648;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:29648;}}