a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"File Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"file_example.info";i:1;i:2;i:2;i:29;}i:2;i:29;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:232:"
   1 name = File example
   2 description = Examples of using the Drupal File API and Stream Wrappers.
   3 package = Example modules
   4 core = 7.x
   5 files[] = file_example_session_streams.inc
   6 files[] = file_example.test
";i:1;N;i:2;N;}i:2;i:64;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:305;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"file_example.module";i:1;i:2;i:2;i:305;}i:2;i:305;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:305;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22902:"
   1 <?php
   2 /**
   3  * @file
   4  * Examples demonstrating the Drupal File API (and Stream Wrappers).
   5  */
   6 
   7 /**
   8  * @defgroup file_example Example: Files
   9  * @ingroup examples
  10  * @{
  11  * Examples demonstrating the Drupal File API (and Stream Wrappers).
  12  *
  13  * The File Example module is a part of the Examples for Developers Project
  14  * and provides various Drupal File API Examples. You can download and
  15  * experiment with this code at the
  16  * @link http://drupal.org/project/examples Examples for Developers project page. @endlink
  17  *
  18  * See @link http://drupal.org/node/555118 Drupal File API @endlink for handbook
  19  * documentation on the File API and
  20  * @link file File summary on api.drupal.org @endlink for the function summary.
  21  */
  22 
  23 /**
  24  * Implements hook_menu() to set up the URLs (menu entries) for the
  25  * file examples.
  26  */
  27 function file_example_menu() {
  28   $items = array();
  29   $items['examples/file_example'] = array(
  30     'title' => 'File Example',
  31     'page callback' => 'file_example_intro',
  32     'access callback' => TRUE,
  33     'expanded' => TRUE,
  34   );
  35   $items['examples/file_example/fileapi'] = array(
  36     'title' => 'Use File API to read/write a file',
  37     'page callback' => 'drupal_get_form',
  38     'access arguments' => array('use file example'),
  39     'page arguments' => array('file_example_readwrite'),
  40   );
  41   $items['examples/file_example/access_session'] = array(
  42     'page callback' => 'file_example_session_contents',
  43     'access arguments' => array('use file example'),
  44     'type' => MENU_CALLBACK,
  45   );
  46   return $items;
  47 }
  48 
  49 
  50 /**
  51  * Implements hook_permission().
  52  */
  53 function file_example_permission() {
  54   return array(
  55     'use file example' =>  array(
  56       'title' => t('Use the examples in the File Example module'),
  57     ),
  58   );
  59 }
  60 
  61 /**
  62  * A simple introduction to the workings of this module.
  63  */
  64 function file_example_intro() {
  65   $markup = t('The file example module provides a form and code to demonstrate the Drupal 7 file api. Experiment with the form, and then look at the submit handlers in the code to understand the file api.');
  66   return array('#markup' => $markup);
  67 }
  68 /**
  69  * Form builder function for the file example readwrite and directory creation
  70  * example.
  71  *
  72  * A simple form that allows creation of a file, managed or unmanaged. It
  73  * also allows reading/deleting a file and creation of a directory.
  74  */
  75 function file_example_readwrite($form, &$form_state) {
  76   if (empty($_SESSION['file_example_default_file'])) {
  77     $_SESSION['file_example_default_file'] = 'session://drupal.txt';
  78   }
  79   $default_file = $_SESSION['file_example_default_file'];
  80   if (empty($_SESSION['file_example_default_directory'])) {
  81     $_SESSION['file_example_default_directory'] = 'session://directory1';
  82   }
  83   $default_directory = $_SESSION['file_example_default_directory'];
  84 
  85   $form['write_file'] = array(
  86     '#type' => 'fieldset',
  87     '#title' => t('Write to a file'),
  88   );
  89   $form['write_file']['write_contents'] = array(
  90     '#type' => 'textfield',
  91     '#title' => t('Enter something you would like to write to a file') . ' ' . date('m'),
  92     '#default_value' => t('Put some text here or just use this text'),
  93   );
  94 
  95   $form['write_file']['destination'] = array(
  96     '#type' => 'textfield',
  97     '#default_value' => $default_file,
  98     '#title' => t('Optional: Enter the streamwrapper saying where it should be written'),
  99     '#description' => t('This may be public://some_dir/test_file.txt or private://another_dir/some_file.txt, for example. If you include a directory, it must already exist. The default is "public://". Since this example supports session://, you can also use something like session://somefile.txt.'),
 100   );
 101 
 102   $form['write_file']['managed_submit'] = array(
 103     '#type' => 'submit',
 104     '#value' => t('Write managed file'),
 105     '#submit' => array('file_example_managed_write_submit'),
 106   );
 107   $form['write_file']['unmanaged_submit'] = array(
 108     '#type' => 'submit',
 109     '#value' => t('Write unmanaged file'),
 110     '#submit' => array('file_example_unmanaged_write_submit'),
 111   );
 112   $form['write_file']['unmanaged_php'] = array(
 113     '#type' => 'submit',
 114     '#value' => t('Unmanaged using PHP'),
 115     '#submit' => array('file_example_unmanaged_php_submit'),
 116   );
 117 
 118   $form['fileops'] = array(
 119     '#type' => 'fieldset',
 120     '#title' => t('Read from a file'),
 121   );
 122   $form['fileops']['fileops_file'] = array(
 123     '#type' => 'textfield',
 124     '#default_value' => $default_file,
 125     '#title' => t('Enter the URI of a file'),
 126     '#description' => t('This must be a stream-type description like public://some_file.txt or http://drupal.org or private://another_file.txt or (for this example) session://yet_another_file.txt.'),
 127   );
 128   $form['fileops']['read_submit'] = array(
 129     '#type' => 'submit',
 130     '#value' => t('Read the file and store it locally'),
 131     '#submit' => array('file_example_read_submit'),
 132   );
 133   $form['fileops']['delete_submit'] = array(
 134     '#type' => 'submit',
 135     '#value' => t('Delete file'),
 136     '#submit' => array('file_example_delete_submit'),
 137   );
 138   $form['fileops']['check_submit'] = array(
 139     '#type' => 'submit',
 140     '#value' => t('Check to see if file exists'),
 141     '#submit' => array('file_example_file_check_exists_submit'),
 142   );
 143 
 144   $form['directory'] = array(
 145     '#type' => 'fieldset',
 146     '#title' => t('Create or prepare a directory'),
 147   );
 148 
 149   $form['directory']['directory_name'] = array(
 150     '#type' => 'textfield',
 151     '#title' => t('Directory to create/prepare/delete'),
 152     '#default_value' => $default_directory,
 153     '#description' => t('This is a directory as in public://some/directory or private://another/dir.'),
 154   );
 155   $form['directory']['create_directory'] = array(
 156     '#type' => 'submit',
 157     '#value' => t('Create directory'),
 158     '#submit' => array('file_example_create_directory_submit'),
 159   );
 160   $form['directory']['delete_directory'] = array(
 161     '#type' => 'submit',
 162     '#value' => t('Delete directory'),
 163     '#submit' => array('file_example_delete_directory_submit'),
 164   );
 165   $form['directory']['check_directory'] = array(
 166     '#type' => 'submit',
 167     '#value' => t('Check to see if directory exists'),
 168     '#submit' => array('file_example_check_directory_submit'),
 169   );
 170 
 171   $form['debug'] = array(
 172     '#type' => 'fieldset',
 173     '#title' => t('Debugging'),
 174   );
 175   $form['debug']['show_raw_session'] = array(
 176     '#type' => 'submit',
 177     '#value' => t('Show raw $_SESSION contents'),
 178     '#submit' => array('file_example_show_session_contents_submit'),
 179   );
 180 
 181   return $form;
 182 }
 183 
 184 /**
 185  * Submit handler to write a managed file.
 186  *
 187  * The key functions used here are:
 188  * - file_save_data(), which takes a buffer and saves it to a named file and
 189  *   also creates a tracking record in the database and returns a file object.
 190  *   In this function we use FILE_EXISTS_RENAME (the default) as the argument,
 191  *   which means that if there's an existing file, create a new non-colliding
 192  *   filename and use it.
 193  * - file_create_url(), which converts a URI in the form public://junk.txt or
 194  *   private://something/test.txt into a URL like
 195  *   http://example.com/sites/default/files/junk.txt.
 196  */
 197 function file_example_managed_write_submit($form, &$form_state) {
 198   $data = $form_state['values']['write_contents'];
 199   $uri = !empty($form_state['values']['destination']) ? $form_state['values']['destination'] : NULL;
 200 
 201   // Managed operations work with a file object.
 202   $file_object = file_save_data($data, $uri, FILE_EXISTS_RENAME);
 203   if (!empty($file_object)) {
 204     $url = file_create_url($file_object->uri);
 205     $_SESSION['file_example_default_file'] = $file_object->uri;
 206     drupal_set_message(t('Saved managed file: %file to destination %destination (accessible via !url, actual uri=<span id="uri">@uri</span>)', array('%file' => print_r($file_object, TRUE), '%destination' => $uri, '@uri' => $file_object->uri, '!url' => l(t('this URL'), $url))));
 207   }
 208   else {
 209     drupal_set_message(t('Failed to save the managed file'), 'error');
 210   }
 211 }
 212 
 213 /**
 214  * Submit handler to write an unmanaged file.
 215  *
 216  * The key functions used here are:
 217  * - file_unmanaged_save_data(), which takes a buffer and saves it to a named
 218  *   file, but does not create any kind of tracking record in the database.
 219  *   This example uses FILE_EXISTS_REPLACE for the third argument, meaning
 220  *   that if there's an existing file at this location, it should be replaced.
 221  * - file_create_url(), which converts a URI in the form public://junk.txt or
 222  *   private://something/test.txt into a URL like
 223  *   http://example.com/sites/default/files/junk.txt.
 224  */
 225 
 226 function file_example_unmanaged_write_submit($form, &$form_state) {
 227   $data = $form_state['values']['write_contents'];
 228   $destination = !empty($form_state['values']['destination']) ? $form_state['values']['destination'] : NULL;
 229 
 230   // With the unmanaged file we just get a filename back.
 231   $filename = file_unmanaged_save_data($data, $destination, FILE_EXISTS_REPLACE);
 232   if ($filename) {
 233     $url = file_create_url($filename);
 234     $_SESSION['file_example_default_file'] = $filename;
 235     drupal_set_message(t('Saved file as %filename (accessible via !url, uri=<span id="uri">@uri</span>)', array('%filename' => $filename, '@uri' => $filename, '!url' => l(t('this URL'), $url))));
 236   }
 237   else {
 238     drupal_set_message(t('Failed to save the file'), 'error');
 239   }
 240 }
 241 
 242 
 243 
 244 /**
 245  * Submit handler to write an unmanaged file using plain PHP functions.
 246  *
 247  * The key functions used here are:
 248  * - file_unmanaged_save_data(), which takes a buffer and saves it to a named
 249  *   file, but does not create any kind of tracking record in the database.
 250  * - file_create_url(), which converts a URI in the form public://junk.txt or
 251  *   private://something/test.txt into a URL like
 252  *   http://example.com/sites/default/files/junk.txt.
 253  * - drupal_tempnam() generates a temporary filename for use.
 254  */
 255 
 256 function file_example_unmanaged_php_submit($form, &$form_state) {
 257   $data = $form_state['values']['write_contents'];
 258   $destination = !empty($form_state['values']['destination']) ? $form_state['values']['destination'] : NULL;
 259 
 260   if (empty($destination)) {
 261     // If no destination has been provided, use a generated name.
 262     $destination = drupal_tempnam('public://', 'file');
 263   }
 264 
 265   // With all traditional PHP functions we can use the stream wrapper notation
 266   // for a file as well.
 267   $fp = fopen($destination, 'w');
 268 
 269   // To demonstrate the fact that everything is based on streams, we'll do
 270   // multiple 5-character writes to put this to the file. We could easily
 271   // (and far more conveniently) write it in a single statement with
 272   // fwrite($fp, $data).
 273   $length = strlen($data);
 274   $write_size = 5;
 275   for ($i = 0; $i < $length; $i += $write_size) {
 276     $result = fwrite($fp, substr($data, $i, $write_size));
 277     if ($result === FALSE) {
 278       drupal_set_message(t('Failed writing to the file %file', array('%file' => $destination)), 'error');
 279       fclose($fp);
 280       return;
 281     }
 282   }
 283   $url = file_create_url($destination);
 284   $_SESSION['file_example_default_file'] = $destination;
 285   drupal_set_message(t('Saved file as %filename (accessible via !url, uri=<span id="uri">@uri</span>)', array('%filename' => $destination, '@uri' => $destination, '!url' => l(t('this URL'), $url))));
 286 }
 287 
 288 /**
 289  * Submit handler for reading a stream wrapper.
 290  *
 291  * Drupal now has full support for PHP's stream wrappers, which means that
 292  * instead of the traditional use of all the file functions
 293  * ($fp = fopen("/tmp/some_file.txt");) far more sophisticated and generalized
 294  * (and extensible) things can be opened as if they were files. Drupal itself
 295  * provides the public:// and private:// schemes for handling public and
 296  * private files. PHP provides file:// (the default) and http://, so that a
 297  * URL can be read or written (as in a POST) as if it were a file. In addition,
 298  * new schemes can be provided for custom applications, as will be demonstrated
 299  * below.
 300  *
 301  * Here we take the stream wrapper provided in the form. We grab the
 302  * contents with file_get_contents(). Notice that's it's as simple as that:
 303  * file_get_contents("http://example.com") or
 304  * file_get_contents("public://somefile.txt") just works. Although it's
 305  * not necessary, we use file_unmanaged_save_data() to save this file locally
 306  * and then find a local URL for it by using file_create_url().
 307  */
 308 function file_example_read_submit($form, &$form_state) {
 309   $uri = $form_state['values']['fileops_file'];
 310 
 311   if (!is_file($uri)) {
 312     drupal_set_message(t('The file %uri does not exist', array('%uri' => $uri)), 'error');
 313     return;
 314   }
 315 
 316   // Make a working filename to save this by stripping off the (possible)
 317   // file portion of the streamwrapper. If it's an evil file extension,
 318   // file_munge_filename() will neuter it.
 319   $filename = file_munge_filename(preg_replace('@^.*/@', '', $uri), '', TRUE);
 320   $buffer = file_get_contents($uri);
 321 
 322   if ($buffer) {
 323     $sourcename = file_unmanaged_save_data($buffer, 'public://' . $filename);
 324     if ($sourcename) {
 325       $url = file_create_url($sourcename);
 326       $_SESSION['file_example_default_file'] = $sourcename;
 327       drupal_set_message(t('The file was read and copied to %filename which is accessible at !url', array('%filename' => $sourcename, '!url' => l($url, $url))));
 328     }
 329     else {
 330       drupal_set_message(t('Failed to save the file'));
 331     }
 332   }
 333   else { // We failed to get the contents of the requested file
 334     drupal_set_message(t('Failed to retrieve the file %file', array('%file' => $uri)));
 335   }
 336 }
 337 
 338 /**
 339  * Submit handler to delete a file.
 340  */
 341 function file_example_delete_submit($form, &$form_state) {
 342 
 343   $uri = $form_state['values']['fileops_file'];
 344 
 345   // Since we don't know if the file is managed or not, look in the database
 346   // to see. Normally, code would be working with either managed or unmanaged
 347   // files, so this is not a typical situation.
 348   $file_object = file_example_get_managed_file($uri);
 349 
 350   // If a managed file, use file_delete().
 351   if (!empty($file_object)) {
 352     $result = file_delete($file_object);
 353     if ($result !== TRUE) {
 354       drupal_set_message(t('Failed deleting managed file %uri. Result was %result', array('%uri' => $uri, '%result' => print_r($result, TRUE))), 'error');
 355     }
 356     else {
 357       drupal_set_message(t('Successfully deleted managed file %uri', array('%uri' => $uri)));
 358       $_SESSION['file_example_default_file'] = $uri;
 359     }
 360   }
 361   // else use file_unmanaged_delete().
 362   else {
 363     $result = file_unmanaged_delete($uri);
 364     if ($result !== TRUE) {
 365       drupal_set_message(t('Failed deleting unmanaged file %uri', array('%uri' => $uri, 'error')));
 366     }
 367     else {
 368       drupal_set_message(t('Successfully deleted unmanaged file %uri', array('%uri' => $uri)));
 369       $_SESSION['file_example_default_file'] = $uri;
 370     }
 371   }
 372 }
 373 
 374 /**
 375  * Submit handler to check existence of a file.
 376  */
 377 function file_example_file_check_exists_submit($form, &$form_state) {
 378   $uri = $form_state['values']['fileops_file'];
 379   if (is_file($uri)) {
 380     drupal_set_message(t('The file %uri exists.', array('%uri' => $uri)));
 381   }
 382   else {
 383     drupal_set_message(t('The file %uri does not exist.', array('%uri' => $uri)));
 384   }
 385 
 386 }
 387 /**
 388  * Submit handler for directory creation.
 389  * Here we create a directory and set proper permissions on it using
 390  * file_prepare_directory().
 391  */
 392 function file_example_create_directory_submit($form, &$form_state) {
 393   $directory = $form_state['values']['directory_name'];
 394 
 395   // The options passed to file_prepare_directory are a bitmask, so we can
 396   // specify either FILE_MODIFY_PERMISSIONS (set permissions on the directory),
 397   // FILE_CREATE_DIRECTORY, or both together:
 398   // FILE_MODIFY_PERMISSIONS | FILE_CREATE_DIRECTORY.
 399   // FILE_MODIFY_PERMISSIONS will set the permissions of the directory by
 400   // by default to 0755, or to the value of the variable 'file_chmod_directory'.
 401   if (!file_prepare_directory($directory, FILE_MODIFY_PERMISSIONS | FILE_CREATE_DIRECTORY)) {
 402     drupal_set_message(t('Failed to create %directory.', array('%directory' => $directory)), 'error');
 403   }
 404   else {
 405     $result = is_dir($directory);
 406     drupal_set_message(t('Directory %directory is ready for use.', array('%directory' => $directory)));
 407     $_SESSION['file_example_default_directory'] = $directory;
 408   }
 409 }
 410 
 411 /**
 412  * Submit handler for directory deletion.
 413  *
 414  * @see file_unmanaged_delete_recursive()
 415  *
 416  */
 417 function file_example_delete_directory_submit($form, &$form_state) {
 418   $directory = $form_state['values']['directory_name'];
 419 
 420   $result = file_unmanaged_delete_recursive($directory);
 421   if (!$result) {
 422     drupal_set_message(t('Failed to delete %directory.', array('%directory' => $directory)), 'error');
 423   }
 424   else {
 425     drupal_set_message(t('Recursively deleted directory %directory.', array('%directory' => $directory)));
 426     $_SESSION['file_example_default_directory'] = $directory;
 427   }
 428 }
 429 
 430 /**
 431  * Submit handler to test directory existence.
 432  * This actually just checks to see if the directory is writable
 433  *
 434  * @param $form
 435  * @param $form_state
 436  */
 437 function file_example_check_directory_submit($form, &$form_state) {
 438   $directory = $form_state['values']['directory_name'];
 439   $result = is_dir($directory);
 440   if (!$result) {
 441     drupal_set_message(t('Directory %directory does not exist.', array('%directory' => $directory)));
 442   }
 443   else {
 444     drupal_set_message(t('Directory %directory exists.', array('%directory' => $directory)));
 445   }
 446 }
 447 
 448 /**
 449  * Utility submit function to show the contents of $_SESSION.
 450  */
 451 function file_example_show_session_contents_submit($form, &$form_state) {
 452   // If the devel module is installed, use it's nicer message format.
 453   if (module_exists('devel')) {
 454     dsm($_SESSION['file_example'], t('Entire $_SESSION["file_example"]'));
 455   }
 456   else {
 457     drupal_set_message('<pre>' . print_r($_SESSION['file_example'], TRUE) . '</pre>');
 458   }
 459 }
 460 
 461 /**
 462  * Utility function to check for and return a managed file.
 463  * In this demonstration code we don't necessarily know if a file is managed
 464  * or not, so often need to check to do the correct behavior. Normal code
 465  * would not have to do this, as it would be working with either managed or
 466  * unmanaged files.
 467  *
 468  * @param $uri
 469  *   The URI of the file, like public://test.txt.
 470  */
 471 function file_example_get_managed_file($uri) {
 472   $fid = db_query('SELECT fid FROM {file_managed} WHERE uri = :uri', array(':uri' => $uri))->fetchField();
 473   if (!empty($fid)) {
 474     $file_object = file_load($fid);
 475     return $file_object;
 476   }
 477   return FALSE;
 478 }
 479 
 480 /**
 481  * Implements hook_stream_wrappers().
 482  * hook_stream_wrappers() is Drupal's way of exposing the class that PHP will
 483  * use to provide a new stream wrapper class. In this case, we'll expose the
 484  * 'session' scheme, so a file reference like "session://example/example.txt"
 485  * is readable and writable as a location in the $_SESSION variable.
 486  *
 487  * @see FileExampleSessionStreamWrapper
 488  */
 489 function file_example_stream_wrappers() {
 490   $wrappers = array(
 491     'session' => array(
 492       'name' => t('Example: $_SESSION variable storage'),
 493       'class' => 'FileExampleSessionStreamWrapper',
 494       'description' => t('Store files in the $_SESSION variable as an example.'),
 495     ),
 496   );
 497   return $wrappers;
 498 }
 499 
 500 /**
 501  * Show the contents of a session file.
 502  *
 503  * This page callback function is called by the Menu API for the path
 504  * examples/file_example/access_session. Any extra path elements
 505  * beyond this are considered to be the session path. E.g.:
 506  * examples/file_example/access_session/foo/bar.txt would be the
 507  * equivalent of session://foo/bar.txt, which will map into
 508  * $_SESSION as keys: $_SESSION['foo']['bar.txt']
 509  *
 510  * @param $path-elements
 511  *   The elements of the path will come from Menu API as the
 512  *   function arguments. See explanation above.
 513  *
 514  * @return A message containing the contents of the session file.
 515  *
 516  * @see file_get_contents()
 517  */
 518 function file_example_session_contents() {
 519   $path_components = func_get_args();
 520   $session_path = 'session://' . join('/', $path_components);
 521   $content = file_get_contents($session_path);
 522   if ($content !== FALSE) {
 523     return t('Contents of @path :',
 524       array('@path' => check_plain($session_path))) . ' ' .
 525       print_r($content, TRUE);
 526   }
 527   return t('Unable to load contents of: @path',
 528     array('@path' => check_plain($session_path)));
 529 }
 530 
 531 /**
 532  * @} End of "defgroup file_example".
 533  */
";i:1;N;i:2;N;}i:2;i:342;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23253;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"file_example.test";i:1;i:2;i:2;i:23253;}i:2;i:23253;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:23253;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:5926:"
   1 <?php
   2 /**
   3  * @file
   4  * Tests for File Example.
   5  */
   6 
   7 class FileExampleTest extends DrupalWebTestCase {
   8 
   9   protected $privileged_user;
  10 
  11   public static function getInfo() {
  12     return array(
  13       'name' => 'File Example Functionality',
  14       'description' => 'Test File Example features and sample streamwrapper.',
  15       'group' => 'Examples',
  16     );
  17   }
  18   function setUp() {
  19     parent::setUp(array('file_example'));
  20     $privileged_user = $this->drupalCreateUser(array('use file example'));
  21     $this->drupalLogin($privileged_user);
  22   }
  23 
  24   /**
  25    * Test the basic File Example UI.
  26    * - Create a directory to work with
  27    * - Foreach scheme create and read files using each of the three methods.
  28    */
  29   function testFileExampleBasic() {
  30 
  31     $expected_text = array(
  32       t('Write managed file') => t('Saved managed file'),
  33       t('Write unmanaged file') => t('Saved file as'),
  34       t('Unmanaged using PHP') => t('Saved file as'),
  35     );
  36     // For each of the three buttons == three write types
  37     foreach (array(t('Write managed file'), t('Write unmanaged file'), t('Unmanaged using PHP')) as $button) {
  38       // For each scheme supported by Drupal + the session:// wrapper
  39       foreach (array('public', 'private', 'temporary', 'session') as $scheme) {
  40         // Create a directory for use.
  41         $dirname = $scheme . '://' . $this->randomName(10);
  42 
  43         // Directory does not yet exist; assert that.
  44         $edit = array(
  45           'directory_name' => $dirname,
  46         );
  47         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if directory exists'));
  48         $this->assertRaw(t('Directory %dirname does not exist', array('%dirname' => $dirname)), 'Verify that directory does not exist.');
  49 
  50         $this->drupalPost('examples/file_example/fileapi', $edit, t('Create directory'));
  51         $this->assertRaw(t('Directory %dirname is ready for use', array('%dirname' => $dirname)));
  52 
  53         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if directory exists'));
  54         $this->assertRaw(t('Directory %dirname exists', array('%dirname' => $dirname)), 'Verify that directory now does exist.');
  55 
  56         // Create a file in the directory we created.
  57         $content = $this->randomName(30);
  58         $filename = $dirname . '/' . $this->randomName(30) . '.txt';
  59 
  60         // Assert that the file we're about to create does not yet exist.
  61         $edit = array(
  62           'fileops_file' => $filename,
  63         );
  64         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if file exists'));
  65         $this->assertRaw(t('The file %filename does not exist', array('%filename' => $filename)), 'Verify that file does not yet exist.');
  66 
  67         debug(t('Processing button=%button, scheme=%scheme, dir=%dirname, file=%filename', array('%button' => $button, '%scheme' => $scheme, '%filename' => $filename, '%dirname' => $dirname)));
  68         $edit = array(
  69           'write_contents' => $content,
  70           'destination' => $filename,
  71         );
  72         $this->drupalPost('examples/file_example/fileapi', $edit, $button);
  73         $this->assertText($expected_text[$button]);
  74 
  75 
  76         // Capture the name of the output file, as it might have changed due
  77         // to file renaming.
  78         $element = $this->xpath('//span[@id="uri"]');
  79         $output_filename = (string)$element[0];
  80         debug($output_filename, 'Name of output file');
  81 
  82         // Click the link provided that is an easy way to get the data for
  83         // checking and make sure that the data we put in is what we get out.
  84         if (!in_array($scheme, array('private', 'temporary'))) {
  85           $this->clickLink(t('this URL'));
  86           $this->assertText($content);
  87         }
  88 
  89         // Verify that the file exists.
  90         $edit = array(
  91           'fileops_file' => $filename,
  92         );
  93         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if file exists'));
  94         $this->assertRaw(t('The file %filename exists', array('%filename' => $filename)), 'Verify that file now exists.');
  95 
  96         // Now read the file that got written above and verify that we can use
  97         // the writing tools.
  98         $edit = array(
  99           'fileops_file' => $output_filename,
 100         );
 101         $this->drupalPost('examples/file_example/fileapi', $edit, t('Read the file and store it locally'));
 102 
 103         $this->assertText(t('The file was read and copied'));
 104 
 105         $edit = array(
 106           'fileops_file' => $filename,
 107         );
 108         $this->drupalPost('examples/file_example/fileapi', $edit, t('Delete file'));
 109         $this->assertText(t('Successfully deleted'));
 110         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if file exists'));
 111         $this->assertRaw(t('The file %filename does not exist', array('%filename' => $filename)), 'Verify file has been deleted.');
 112 
 113         $edit = array(
 114           'directory_name' => $dirname,
 115         );
 116         $this->drupalPost('examples/file_example/fileapi', $edit, t('Delete directory'));
 117         $this->drupalPost('examples/file_example/fileapi', $edit, t('Check to see if directory exists'));
 118         $this->assertRaw(t('Directory %dirname does not exist', array('%dirname' => $dirname)), 'Verify that directory does not exist after deletion.');
 119       }
 120     }
 121   }
 122 }
";i:1;N;i:2;N;}i:2;i:23288;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:29223;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"file_example_session_streams.inc";i:1;i:2;i:2;i:29223;}i:2;i:29223;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:29223;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22906:"
   1 <?php
   2 /**
   3  * @file
   4  * Provides a demonstration session:// streamwrapper.
   5  *
   6  * This example is nearly fully functional, but has no known
   7  * practical use. It's an example and demonstration only.
   8  */
   9 
  10 /**
  11  * Example stream wrapper class to handle session:// streams.
  12  *
  13  * This is just an example, as it could have horrible results if much
  14  * information were placed in the $_SESSION variable. However, it does
  15  * demonstrate both the read and write implementation of a stream wrapper.
  16  *
  17  * A "stream" is an important Unix concept for the reading and writing of
  18  * files and other devices. Reading or writing a "stream" just means that you
  19  * open some device, file, internet site, or whatever, and you don't have to
  20  * know at all what it is. All the functions that deal with it are the same.
  21  * You can read/write more from/to the stream, seek a position in the stream,
  22  * or anything else without the code that does it even knowing what kind
  23  * of device it is talking to. This Unix idea is extended into PHP's
  24  * mindset.
  25  *
  26  * The idea of "stream wrapper" is that this can be extended indefinitely.
  27  * The classic example is HTTP: With PHP you can do a
  28  * file_get_contents("http://drupal.org/projects") as if it were a file,
  29  * because the scheme "http" is supported natively in PHP. So Drupal adds
  30  * the public:// and private:// schemes, and contrib modules can add any
  31  * scheme they want to. This example adds the session:// scheme, which allows
  32  * reading and writing the $_SESSION['file_example'] key as if it were a file.
  33  *
  34  * Note that because this implementation uses simple PHP arrays ($_SESSION)
  35  * it is limited to string values, so binary files will not work correctly.
  36  * Only text files can be used.
  37  *
  38  * @ingroup file_example
  39  */
  40 class FileExampleSessionStreamWrapper implements DrupalStreamWrapperInterface {
  41   /**
  42    * Stream context resource.
  43    *
  44    * @var Resource
  45    */
  46   public $context;
  47 
  48 
  49   /**
  50    * Instance URI (stream).
  51    *
  52    * These streams will be references as 'session://example_target'
  53    *
  54    * @var String
  55    */
  56   protected $uri;
  57 
  58   /**
  59    * The content of the stream.
  60    *
  61    * Since this trivial example just uses the $_SESSION variable, this is
  62    * simply a reference to the contents of the related part of
  63    * $_SESSION['file_example'].
  64    */
  65   protected $session_content;
  66 
  67   /**
  68    * Pointer to where we are in a directory read.
  69    */
  70   protected $directory_pointer;
  71 
  72   /**
  73    * List of keys in a given directory.
  74    */
  75   protected $directory_keys;
  76 
  77   /**
  78    * The pointer to the next read or write within the session variable.
  79    */
  80   protected $stream_pointer;
  81 
  82   public function __construct() {
  83     $_SESSION['file_example']['.isadir.txt'] = TRUE;
  84   }
  85 
  86   /**
  87    * Implements setUri().
  88    */
  89   function setUri($uri) {
  90     $this->uri = $uri;
  91   }
  92 
  93   /**
  94    * Implements getUri().
  95    */
  96   function getUri() {
  97     return $this->uri;
  98   }
  99 
 100   /**
 101    * Implements getTarget().
 102    *
 103    * The "target" is the portion of the URI to the right of the scheme.
 104    * So in session://example/test.txt, the target is 'example/test.txt'.
 105    */
 106   function getTarget($uri = NULL) {
 107     if (!isset($uri)) {
 108       $uri = $this->uri;
 109     }
 110 
 111     list($scheme, $target) = explode('://', $uri, 2);
 112 
 113     // Remove erroneous leading or trailing, forward-slashes and backslashes.
 114     // In the session:// scheme, there is never a leading slash on the target.
 115     return trim($target, '\/');
 116   }
 117 
 118   /**
 119    * Implements getMimeType().
 120    */
 121   static function getMimeType($uri, $mapping = NULL) {
 122     if (!isset($mapping)) {
 123       // The default file map, defined in file.mimetypes.inc is quite big.
 124       // We only load it when necessary.
 125       include_once DRUPAL_ROOT . '/includes/file.mimetypes.inc';
 126       $mapping = file_mimetype_mapping();
 127     }
 128 
 129     $extension = '';
 130     $file_parts = explode('.', basename($uri));
 131 
 132     // Remove the first part: a full filename should not match an extension.
 133     array_shift($file_parts);
 134 
 135     // Iterate over the file parts, trying to find a match.
 136     // For my.awesome.image.jpeg, we try:
 137     //   - jpeg
 138     //   - image.jpeg, and
 139     //   - awesome.image.jpeg
 140     while ($additional_part = array_pop($file_parts)) {
 141       $extension = drupal_strtolower($additional_part . ($extension ? '.' . $extension : ''));
 142       if (isset($mapping['extensions'][$extension])) {
 143         return $mapping['mimetypes'][$mapping['extensions'][$extension]];
 144       }
 145     }
 146 
 147     return 'application/octet-stream';
 148   }
 149 
 150   /**
 151    * Implements getDirectoryPath().
 152    *
 153    * In this case there is no directory string, so return an empty string.
 154    */
 155   public function getDirectoryPath() {
 156     return '';
 157   }
 158 
 159   /**
 160    * Overrides getExternalUrl().
 161    *
 162    * We have set up a helper function and menu entry to provide access to this
 163    * key via HTTP; normally it would be accessible some other way.
 164    */
 165   function getExternalUrl() {
 166     $path = $this->getLocalPath();
 167     $url = url('examples/file_example/access_session/' . $path, array('absolute' => TRUE));
 168     return $url;
 169   }
 170 
 171   /**
 172    * We have no concept of chmod, so just return TRUE.
 173    */
 174   function chmod($mode) {
 175     return TRUE;
 176   }
 177 
 178   /**
 179    * Implements realpath().
 180    */
 181   function realpath() {
 182     return 'session://' . $this->getLocalPath();
 183   }
 184 
 185   /**
 186    * Returns the local path.
 187    * Here we aren't doing anything but stashing the "file" in a key in the
 188    * $_SESSION variable, so there's not much to do but to create a "path"
 189    * which is really just a key in the $_SESSION variable. So something
 190    * like 'session://one/two/three.txt' becomes
 191    * $_SESSION['file_example']['one']['two']['three.txt'] and the actual path
 192    * is "one/two/three.txt".
 193    *
 194    * @param $uri
 195    *   Optional URI, supplied when doing a move or rename.
 196    */
 197   protected function getLocalPath($uri = NULL) {
 198     if (!isset($uri)) {
 199       $uri = $this->uri;
 200     }
 201 
 202     $path  = str_replace('session://', '', $uri);
 203     $path = trim($path, '/');
 204     return $path;
 205   }
 206 
 207   /**
 208    * Opens a stream, as for fopen(), file_get_contents(), file_put_contents()
 209    *
 210    * @param $uri
 211    *   A string containing the URI to the file to open.
 212    * @param $mode
 213    *   The file mode ("r", "wb" etc.).
 214    * @param $options
 215    *   A bit mask of STREAM_USE_PATH and STREAM_REPORT_ERRORS.
 216    * @param &$opened_path
 217    *   A string containing the path actually opened.
 218    *
 219    * @return
 220    *   Returns TRUE if file was opened successfully. (Always returns TRUE).
 221    *
 222    * @see http://php.net/manual/en/streamwrapper.stream-open.php
 223    */
 224   public function stream_open($uri, $mode, $options, &$opened_path) {
 225     $this->uri = $uri;
 226     // We make $session_content a reference to the appropriate key in the
 227     // $_SESSION variable. So if the local path were
 228     // /example/test.txt it $session_content would now be a
 229     // reference to $_SESSION['file_example']['example']['test.txt'].
 230     $this->session_content = &$this->uri_to_session_key($uri);
 231 
 232     // Reset the stream pointer since this is an open.
 233     $this->stream_pointer = 0;
 234     return TRUE;
 235   }
 236 
 237   /**
 238    * Return a reference to the correct $_SESSION key.
 239    *
 240    * @param $uri
 241    *   The uri: session://something
 242    * @param $create
 243    *   If TRUE, create the key
 244    *
 245    * @return
 246    *   A reference to the array at the end of the key-path, or
 247    *   FALSE if the path doesn't map to a key-path (and $create is FALSE).
 248    */
 249   protected function &uri_to_session_key($uri, $create = TRUE) {
 250     // Since our uri_to_session_key() method returns a reference, we
 251     // have to set up a failure flag variable.
 252     $fail = FALSE;
 253     $path = $this->getLocalPath($uri);
 254     $path_components = explode('/', $path);
 255     // Set up a reference to the root session:// 'directory.'
 256     $var = &$_SESSION['file_example'];
 257     // Handle case of just session://.
 258     if (count($path_components) < 1) {
 259       return $var;
 260     }
 261     // Walk through the path components and create keys in $_SESSION,
 262     // unless we're told not to create them.
 263     foreach ($path_components as $component) {
 264       if ($create || isset($var[$component])) {
 265         $var = &$var[$component];
 266       }
 267       else {
 268         // This path doesn't exist as keys, either because the
 269         // key doesn't exist, or because we're told not to create it.
 270         return $fail;
 271       }
 272     }
 273     return $var;
 274   }
 275 
 276   /**
 277    * Support for flock().
 278    *
 279    * The $_SESSION variable has no locking capability, so return TRUE.
 280    *
 281    * @param $operation
 282    *   One of the following:
 283    *   - LOCK_SH to acquire a shared lock (reader).
 284    *   - LOCK_EX to acquire an exclusive lock (writer).
 285    *   - LOCK_UN to release a lock (shared or exclusive).
 286    *   - LOCK_NB if you don't want flock() to block while locking (not
 287    *     supported on Windows).
 288    *
 289    * @return
 290    *   Always returns TRUE at the present time. (no support)
 291    *
 292    * @see http://php.net/manual/en/streamwrapper.stream-lock.php
 293    */
 294   public function stream_lock($operation) {
 295     return TRUE;
 296   }
 297 
 298   /**
 299    * Support for fread(), file_get_contents() etc.
 300    *
 301    * @param $count
 302    *   Maximum number of bytes to be read.
 303    *
 304    * @return
 305    *   The string that was read, or FALSE in case of an error.
 306    *
 307    * @see http://php.net/manual/en/streamwrapper.stream-read.php
 308    */
 309   public function stream_read($count) {
 310     if (is_string($this->session_content)) {
 311       $remaining_chars = drupal_strlen($this->session_content) - $this->stream_pointer;
 312       $number_to_read = min($count, $remaining_chars);
 313       if ($remaining_chars > 0) {
 314         $buffer = drupal_substr($this->session_content, $this->stream_pointer, $number_to_read);
 315         $this->stream_pointer += $number_to_read;
 316         return $buffer;
 317       }
 318     }
 319     return FALSE;
 320   }
 321 
 322   /**
 323    * Support for fwrite(), file_put_contents() etc.
 324    *
 325    * @param $data
 326    *   The string to be written.
 327    *
 328    * @return
 329    *   The number of bytes written (integer).
 330    *
 331    * @see http://php.net/manual/en/streamwrapper.stream-write.php
 332    */
 333   public function stream_write($data) {
 334     // Sanitize the data in a simple way since we're putting it into the
 335     // session variable.
 336     $data = check_plain($data);
 337     $this->session_content = substr_replace($this->session_content, $data, $this->stream_pointer);
 338     $this->stream_pointer += drupal_strlen($data);
 339     return drupal_strlen($data);
 340   }
 341 
 342   /**
 343    * Support for feof().
 344    *
 345    * @return
 346    *   TRUE if end-of-file has been reached.
 347    *
 348    * @see http://php.net/manual/en/streamwrapper.stream-eof.php
 349    */
 350   public function stream_eof() {
 351     return FALSE;
 352   }
 353 
 354   /**
 355    * Support for fseek().
 356    *
 357    * @param $offset
 358    *   The byte offset to got to.
 359    * @param $whence
 360    *   SEEK_SET, SEEK_CUR, or SEEK_END.
 361    *
 362    * @return
 363    *   TRUE on success.
 364    *
 365    * @see http://php.net/manual/en/streamwrapper.stream-seek.php
 366    */
 367   public function stream_seek($offset, $whence) {
 368     if (drupal_strlen($this->session_content) >= $offset) {
 369       $this->stream_pointer = $offset;
 370       return TRUE;
 371     }
 372     return FALSE;
 373   }
 374 
 375   /**
 376    * Support for fflush().
 377    *
 378    * @return
 379    *   TRUE if data was successfully stored (or there was no data to store).
 380    *   This always returns TRUE, as this example provides and needs no
 381    *   flush support.
 382    *
 383    * @see http://php.net/manual/en/streamwrapper.stream-flush.php
 384    */
 385   public function stream_flush() {
 386     return TRUE;
 387   }
 388 
 389   /**
 390    * Support for ftell().
 391    *
 392    * @return
 393    *   The current offset in bytes from the beginning of file.
 394    *
 395    * @see http://php.net/manual/en/streamwrapper.stream-tell.php
 396    */
 397   public function stream_tell() {
 398     return $this->stream_pointer;
 399   }
 400 
 401   /**
 402    * Support for fstat().
 403    *
 404    * @return
 405    *   An array with file status, or FALSE in case of an error - see fstat()
 406    *   for a description of this array.
 407    *
 408    * @see http://php.net/manual/en/streamwrapper.stream-stat.php
 409    */
 410   public function stream_stat() {
 411     return array(
 412       'size' => drupal_strlen($this->session_content),
 413     );
 414   }
 415 
 416   /**
 417    * Support for fclose().
 418    *
 419    * @return
 420    *   TRUE if stream was successfully closed.
 421    *
 422    * @see http://php.net/manual/en/streamwrapper.stream-close.php
 423    */
 424   public function stream_close() {
 425     $this->stream_pointer = 0;
 426     unset($this->session_content); // Unassign the reference.
 427     return TRUE;
 428   }
 429 
 430   /**
 431    * Support for unlink().
 432    *
 433    * @param $uri
 434    *   A string containing the uri to the resource to delete.
 435    *
 436    * @return
 437    *   TRUE if resource was successfully deleted.
 438    *
 439    * @see http://php.net/manual/en/streamwrapper.unlink.php
 440    */
 441   public function unlink($uri) {
 442     $path = $this->getLocalPath($uri);
 443     $path_components = preg_split('/\//', $path);
 444     $fail = FALSE;
 445     $unset = '$_SESSION[\'file_example\']';
 446     foreach ($path_components as $component) {
 447       $unset .= '[\'' . $component . '\']';
 448     }
 449     // TODO: Is there a better way to delete from an array?
 450     // drupal_array_get_nested_value() doesn't work because it only returns
 451     // a reference; unsetting a reference only unsets the reference.
 452     eval("unset($unset);");
 453     return TRUE;
 454   }
 455 
 456   /**
 457    * Support for rename().
 458    *
 459    * @param $from_uri,
 460    *   The uri to the file to rename.
 461    * @param $to_uri
 462    *   The new uri for file.
 463    *
 464    * @return
 465    *   TRUE if file was successfully renamed.
 466    *
 467    * @see http://php.net/manual/en/streamwrapper.rename.php
 468    */
 469   public function rename($from_uri, $to_uri) {
 470     $from_key = &$this->uri_to_session_key($from_uri);
 471     $to_key = &$this->uri_to_session_key($to_uri);
 472     if (is_dir($to_key) || is_file($to_key)) {
 473       return FALSE;
 474     }
 475     $to_key = $from_key;
 476     unset($from_key);
 477     return TRUE;
 478   }
 479 
 480   /**
 481    * Gets the name of the directory from a given path.
 482    *
 483    * @param $uri
 484    *   A URI.
 485    *
 486    * @return
 487    *   A string containing the directory name.
 488    *
 489    * @see drupal_dirname()
 490    */
 491   public function dirname($uri = NULL) {
 492     list($scheme, $target) = explode('://', $uri, 2);
 493     $target  = $this->getTarget($uri);
 494     if (strpos($target, '/')) {
 495       $dirname = preg_replace('@/[^/]*$@', '', $target);
 496     }
 497     else {
 498       $dirname = '';
 499     }
 500     return $scheme . '://' . $dirname;
 501   }
 502 
 503   /**
 504    * Support for mkdir().
 505    *
 506    * @param $uri
 507    *   A string containing the URI to the directory to create.
 508    * @param $mode
 509    *   Permission flags - see mkdir().
 510    * @param $options
 511    *   A bit mask of STREAM_REPORT_ERRORS and STREAM_MKDIR_RECURSIVE.
 512    *
 513    * @return
 514    *   TRUE if directory was successfully created.
 515    *
 516    * @see http://php.net/manual/en/streamwrapper.mkdir.php
 517    */
 518   public function mkdir($uri, $mode, $options) {
 519     // If this already exists, then we can't mkdir.
 520     if (is_dir($uri) || is_file($uri)) {
 521       return FALSE;
 522     }
 523 
 524     // Create the key in $_SESSION;
 525     $this->uri_to_session_key($uri, TRUE);
 526 
 527     // Place a magic file inside it to differentiate this from an empty file.
 528     $marker_uri = $uri . '/.isadir.txt';
 529     $this->uri_to_session_key($marker_uri, TRUE);
 530     return TRUE;
 531   }
 532 
 533   /**
 534    * Support for rmdir().
 535    *
 536    * @param $uri
 537    *   A string containing the URI to the directory to delete.
 538    * @param $options
 539    *   A bit mask of STREAM_REPORT_ERRORS.
 540    *
 541    * @return
 542    *   TRUE if directory was successfully removed.
 543    *
 544    * @see http://php.net/manual/en/streamwrapper.rmdir.php
 545    */
 546   public function rmdir($uri, $options) {
 547     $path = $this->getLocalPath($uri);
 548     $path_components = preg_split('/\//', $path);
 549     $fail = FALSE;
 550     $unset = '$_SESSION[\'file_example\']';
 551     foreach ($path_components as $component) {
 552       $unset .= '[\'' . $component . '\']';
 553     }
 554     // TODO: I really don't like this eval.
 555     debug($unset, 'array element to be unset');
 556     eval("unset($unset);");
 557 
 558     return TRUE;
 559   }
 560 
 561   /**
 562    * Support for stat().
 563    *
 564    * This important function goes back to the Unix way of doing things.
 565    * In this example almost the entire stat array is irrelevant, but the
 566    * mode is very important. It tells PHP whether we have a file or a
 567    * directory and what the permissions are. All that is packed up in a
 568    * bitmask. This is not normal PHP fodder.
 569    *
 570    * @param $uri
 571    *   A string containing the URI to get information about.
 572    * @param $flags
 573    *   A bit mask of STREAM_URL_STAT_LINK and STREAM_URL_STAT_QUIET.
 574    *
 575    * @return
 576    *   An array with file status, or FALSE in case of an error - see fstat()
 577    *   for a description of this array.
 578    *
 579    * @see http://php.net/manual/en/streamwrapper.url-stat.php
 580    */
 581   public function url_stat($uri, $flags) {
 582     // Get a reference to the $_SESSION key for this URI.
 583     $key = $this->uri_to_session_key($uri, FALSE);
 584     $return = FALSE; // Default to fail.
 585     $mode = 0;
 586 
 587     // We will call an array a directory and the root is always an array.
 588     if (is_array($key) && array_key_exists('.isadir.txt', $key)) {
 589       $mode = 0040000; // S_IFDIR means it's a directory.
 590     }
 591     elseif ($key !== FALSE) {
 592       $mode = 0100000; // S_IFREG, means it's a file.
 593     }
 594 
 595     if ($mode) {
 596       $size = 0;
 597       if ($mode == 0100000) {
 598         $size = drupal_strlen($key);
 599       }
 600 
 601       $mode |= 0777;  // There are no protections on this, so all writable.
 602       $return = array(
 603         'dev' => 0,
 604         'ino' => 0,
 605         'mode' => $mode,
 606         'nlink' => 0,
 607         'uid' => 0,
 608         'gid' => 0,
 609         'rdev' => 0,
 610         'size' => $size,
 611         'atime' => 0,
 612         'mtime' => 0,
 613         'ctime' => 0,
 614         'blksize' => 0,
 615         'blocks' => 0,
 616       );
 617     }
 618     return $return;
 619   }
 620 
 621   /**
 622    * Support for opendir().
 623    *
 624    * @param $uri
 625    *   A string containing the URI to the directory to open.
 626    * @param $options
 627    *   Unknown (parameter is not documented in PHP Manual).
 628    *
 629    * @return
 630    *   TRUE on success.
 631    *
 632    * @see http://php.net/manual/en/streamwrapper.dir-opendir.php
 633    */
 634   public function dir_opendir($uri, $options) {
 635     $var = &$this->uri_to_session_key($uri, FALSE);
 636     if ($var === FALSE || !array_key_exists('.isadir.txt', $var)) {
 637       return FALSE;
 638     }
 639 
 640     // We grab the list of key names, flip it so that .isadir.txt can easily
 641     // be removed, then flip it back so we can easily walk it as a list.
 642     $this->directory_keys = array_flip(array_keys($var));
 643     unset($this->directory_keys['.isadir.txt']);
 644     $this->directory_keys = array_keys($this->directory_keys);
 645     $this->directory_pointer = 0;
 646     return TRUE;
 647   }
 648 
 649   /**
 650    * Support for readdir().
 651    *
 652    * @return
 653    *   The next filename, or FALSE if there are no more files in the directory.
 654    *
 655    * @see http://php.net/manual/en/streamwrapper.dir-readdir.php
 656    */
 657   public function dir_readdir() {
 658     if ($this->directory_pointer < count($this->directory_keys)) {
 659       $next = $this->directory_keys[$this->directory_pointer];
 660       $this->directory_pointer++;
 661       return $next;
 662     }
 663     return FALSE;
 664   }
 665 
 666   /**
 667    * Support for rewinddir().
 668    *
 669    * @return
 670    *   TRUE on success.
 671    *
 672    * @see http://php.net/manual/en/streamwrapper.dir-rewinddir.php
 673    */
 674   public function dir_rewinddir() {
 675     $this->directory_pointer = 0;
 676   }
 677 
 678   /**
 679    * Support for closedir().
 680    *
 681    * @return
 682    *   TRUE on success.
 683    *
 684    * @see http://php.net/manual/en/streamwrapper.dir-closedir.php
 685    */
 686   public function dir_closedir() {
 687     $this->directory_pointer = 0;
 688     unset($this->directory_keys);
 689     return TRUE;
 690   }
 691 }
";i:1;N;i:2;N;}i:2;i:29273;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:52187;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:52187;}}