a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"XMLRPC Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"xmlrpc_example.info";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:216:"
   1 name = XMLRPC example
   2 description = This is an example of how to implement client and server communications using XML-RPC.
   3 package = Example modules
   4 core = 7.x
   5 files[] = xmlrpc_example.test
";i:1;N;i:2;N;}i:2;i:68;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:293;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"xmlrpc_example.module";i:1;i:2;i:2;i:293;}i:2;i:293;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:293;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30331:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Module file for xmlrpc_example module.
   6  */
   7 
   8 /**
   9  * @defgroup xmlrpc_example Example: XML-RPC
  10  * @ingroup examples
  11  * @{
  12  * Demonstration of XML-RPC in Drupal 7.
  13  *
  14  * This is an example of how to implement and XML-RPC server by registering
  15  * callbacks to specific methods and how to make xmlrpc calls using the built-in
  16  * xmlrpc() factory provided by Drupal.
  17  *
  18  * For experimentation you may be interested in the
  19  * @link http://drupal.org/project/xmlrpctester XML-RPC Tester module @endlink.
  20  *
  21  * Note that the @link http://drupal.org/project/services Services module
  22  * @endlink is another common way to do XML-RPC at this time.
  23  *
  24  * @see hook_xmlrpc()
  25  * @see xmlrpc()
  26  * @see xmlrpc_errno()
  27  * @see xmlrpc_error_msg()
  28  */
  29 
  30 // This is the common part of the module, implementing all the code required
  31 // for the client and the server part (most of this code is UI related). The
  32 // menu definition is the only part shared in this implementation.
  33 //
  34 /**
  35  * Implements hook_menu().
  36  *
  37  * Registers all the demonstration forms.
  38  */
  39 function xmlrpc_example_menu() {
  40   $items['examples/xmlrpc'] = array(
  41     'title' => 'XML-RPC Example',
  42     'description' => 'Information about the XML-RPC example',
  43     'page callback' => 'xmlrpc_example_info',
  44     'access callback' => TRUE,
  45   );
  46   // This is the server configuration form menu entry. This form can be used to
  47   // configure the settings of the exposed services. An XML-RPC server does not
  48   // require a configuration form, and has been included here as an example.
  49   $items['examples/xmlrpc/server'] = array(
  50     'title'           => 'XML-RPC Server configuration',
  51     'description'     => 'Server configuration form',
  52     'page callback'   => 'drupal_get_form',
  53     'page arguments'  => array('xmlrpc_example_server_form'),
  54     'access callback' => TRUE,
  55     'weight'          => 0,
  56   );
  57   // This is the client form menu entry. This form is used to allow user
  58   // interaction with the services, but again, user interface is not required
  59   // to create an XML-RPC client with Drupal.
  60   $items['examples/xmlrpc/client'] = array(
  61     'title'           => 'XML-RPC Client form',
  62     'description'     => 'Demonstrates client side XML-RPC calls with Drupal',
  63     'page callback'   => 'drupal_get_form',
  64     'page arguments'  => array('xmlrpc_example_client_form'),
  65     'access callback' => TRUE,
  66     'weight'          => 1,
  67   );
  68   // This part is completely optional. It allows the modification of services
  69   // defined by this or other modules. This configuration form is used to
  70   // enable the hook_xmlrpc_alter API and alter current existing services.
  71   $items['examples/xmlrpc/alter'] = array(
  72     'title'           => 'XML-RPC Alterations',
  73     'description'     => 'Demonstrates how to alter defined XML-RPC services',
  74     'page callback'   => 'drupal_get_form',
  75     'page arguments'  => array('xmlrpc_example_alter_form'),
  76     'access callback' => TRUE,
  77     'weight'          => 2,
  78   );
  79   return $items;
  80 }
  81 
  82 /**
  83  * A simple landing-page information function.
  84  */
  85 function xmlrpc_example_info() {
  86   $server = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
  87 
  88   $options = array(
  89     'system.listMethods' => array(),
  90   );
  91   // Make the xmlrpc request and process the results.
  92   $supported_methods = xmlrpc($server, $options);
  93   if ($supported_methods === FALSE) {
  94     drupal_set_message(t('Error return from xmlrpc(): Error: @errno, Message: @message', array('@errno' => xmlrpc_errno(), '@message' => xmlrpc_error_msg())));
  95   }
  96 
  97   return array(
  98     'basic' => array(
  99       '#markup' => t('This XML-RPC example presents code that shows <ul><li><a href="!server">XML-RPC server code</a></li><li><a href="!client">XML-RPC client code</a></li><li>and <a href="!alter">an example hook_xmlrpc_alter() call</a></li></ul>',
 100         array(
 101           '!server' => url('examples/xmlrpc/server'),
 102           '!client' => url('examples/xmlrpc/client'),
 103           '!alter' => url('examples/xmlrpc/alter'),
 104         )
 105       ),
 106     ),
 107     'method_array' => array(
 108       '#markup' => theme(
 109         'item_list',
 110         array(
 111           'title' => t('These methods are supported by !server',
 112           array('!server' => $server)
 113           ),
 114           'items' => $supported_methods,
 115         )
 116       ),
 117     ),
 118   );
 119 }
 120 
 121 // This is the server part of the module, implementing a simple and little
 122 // server with just two simple services. The server is divided in two
 123 // different parts: the XML-RPC implementation (required) and a webform
 124 // interface (optional) to configure some settings in the server side.
 125 //
 126 // The XMLRPC server will define two different services:
 127 //
 128 // - subtract: perform the subtraction of two numbers. The minimum and maximum
 129 //   values returned by the server can be configured in the server configuration
 130 //   form.
 131 // - add: perform the addition of two numbers. The minimum and maximum values
 132 //   returned by the server can be configured in the server configuration form.
 133 //
 134 // If the result value for the operation is over the maximum limit, a custom
 135 // error number 10001 is returned. This is an arbitrary number and could be any
 136 // number.
 137 //
 138 // If the result value for the operation is below the minimum limit, a custom
 139 // error number 10002 is returned. Again, this value is arbitrary and could be
 140 // any other number. Client applications must know the meaning of the error
 141 // numbers returned by the server.
 142 //
 143 // The following code is the XML-RPC implementation of the server part.
 144 // The first step is to define the methods. This methods should be associated
 145 // to callbacks that will be defined later.
 146 //
 147 /**
 148  * Implements hook_xmlrpc().
 149  *
 150  * Provides Drupal with an array to map XML-RPC callbacks to existing functions.
 151  * These functions may be defined in other modules. The example implementation
 152  * defines specific functions for the example services.
 153  *
 154  * Note: Drupal's built-in XML-RPC server already includes several methods by
 155  * default:
 156  *
 157  * Service dicovery methods:
 158  * - system.listMethods: return a list of the methods the server has, by name.
 159  * - system.methodSignature: return a description of the argument format a
 160  * - system.methodHelp: returns a text description of a particular method.
 161  *   particular method expects.
 162  *
 163  * Other:
 164  * - system.multicall: perform several method calls in a single xmlrpc request.
 165  * - system.getCapabilities: determine if a given capability is supported.
 166  *
 167  * The methods defined by hook_xmlrpc() will be added to those provided by
 168  * default by Drupal's XML-RPC server.
 169  *
 170  * @see hook_xmlrpc()
 171  */
 172 function xmlrpc_example_xmlrpc() {
 173   $methods[] = array(
 174     // First argument is the method name.
 175     'xmlrpc_example.add',
 176     // Callback to execute when this method is requested.
 177     '_xmlrpc_example_server_add',
 178     // An array defines the types of output and input values for this method.
 179     array(
 180       // The first value is the return type, an integer in this case.
 181       'int',
 182       // First operand is an integer.
 183       'int',
 184       // Second operatnd is an integer.
 185       'int',
 186     ),
 187     // Include a little description that is shown when XML-RPC server is
 188     // requested for the implemented methods list.
 189     // Method description.
 190     t('Returns the sum of the two arguments.'),
 191   );
 192   // The subtract method is similar to the addition, only the method name,
 193   // callback and description are different.
 194   $methods[] = array(
 195     'xmlrpc_example.subtract',
 196     '_xmlrpc_example_server_subtract',
 197     array('int', 'int', 'int'),
 198     t('Return difference of the two arguments.'),
 199   );
 200 
 201   return $methods;
 202 }
 203 
 204 // The following code for the server is optional if the callbacks already exist.
 205 // A server may implement methods associated to callbacks like node_load(),
 206 // variable_get() or any other existing function (php functions as well).
 207 //
 208 // If the callbacks associated to the methods don't exist they must be
 209 // created. This implementation requires two specific callbacks:
 210 // - _xmlrpc_example_server_add()
 211 // - _xmlrpc_example_server_subtract()
 212 //
 213 //
 214 /**
 215  * This is the callback for the xmlrpc_example.add method.
 216  *
 217  * Sum the two arguments and return value or an error if the result is out of
 218  * the configured limits.
 219  *
 220  * @param $num1
 221  *   The first number to be summed.
 222  * @param $num2
 223  *   The second number to be summed.
 224  *
 225  * @return
 226  *   The sum of the arguments, or error if it is not in server defined bounds.
 227  *
 228  * @see xmlrpc_error()
 229  */
 230 function _xmlrpc_example_server_add($num1, $num2) {
 231   $sum = $num1 + $num2;
 232   // If result is not within maximum and minimum limits,
 233   // return corresponding error.
 234   $max = variable_get('xmlrpc_example_server_max', 10);
 235   $min = variable_get('xmlrpc_example_server_min', 0);
 236   if ($sum > $max) {
 237     return xmlrpc_error(10001, t('Result is over the upper limit (@max) defined by the server.', array('@max' => $max)));
 238   }
 239   if ($sum < $min) {
 240     return xmlrpc_error(10002, t('Result is below the lower limit defined by the server (@min).', array('@min' => $min)));
 241   }
 242   // Otherwise return the result.
 243   return $sum;
 244 }
 245 
 246 /**
 247  * This is the callback for the xmlrpc_example.subtract xmlrpc method.
 248  *
 249  * Return the difference of the two arguments, or an error if the result is out
 250  * of the configured limits.
 251  *
 252  * @param $num1
 253  *   First number
 254  * @param $num2
 255  *   Second number
 256  *
 257  * @return
 258  *   The difference of the two arguments, or error if it is not in server
 259  *   defined bounds.
 260  *
 261  * @see xmlrpc_error()
 262  */
 263 function _xmlrpc_example_server_subtract($num1, $num2) {
 264   $diference = $num1 - $num2;
 265   $max = variable_get('xmlrpc_example_server_max', 10);
 266   $min = variable_get('xmlrpc_example_server_min', 0);
 267 
 268   // If result is not within maximum and minimum limits,
 269   // return corresponding error.
 270   if ($diference > $max) {
 271     return xmlrpc_error(10001, t('Result is above the upper limit (@max) defined by the server.', array('@max' => $max)));
 272   }
 273   if ($diference < $min) {
 274     return xmlrpc_error(10002, t('Result is below the lower limit (@min) defined by the server.', array('@min' => $min)));
 275   }
 276   // Otherwise return the result.
 277   return $diference;
 278 }
 279 
 280 // User interface for the XML-RPC Server part.
 281 // A server does not require an interface at all. In this implementation we
 282 // use a server configuration form to set the limits available for the addition
 283 // and subtraction operations.
 284 //
 285 /**
 286  * Returns form array to configure the service options.
 287  *
 288  * Present a form to configure the service options. In this case the maximum
 289  * and minimum values for any of the operations (add or subtraction).
 290  */
 291 function xmlrpc_example_server_form() {
 292   $form = array();
 293   $form['explanation'] = array(
 294     '#markup' => '<div>' . t('This is the XML-RPC server configuration page.<br />Here you may define the maximum and minimum values for the addition or subtraction exposed services.<br />') . '</div>',
 295   );
 296   $form['xmlrpc_example_server_min'] = array(
 297     '#type' => 'textfield',
 298     '#title' => t('Enter the minimum value returned by the subtraction or addition methods'),
 299     '#description' => t('If the result of the operation is lower than this value, a custom XML-RPC error will be returned: 10002.'),
 300     '#default_value' => variable_get('xmlrpc_example_server_min', 0),
 301     '#size' => 5,
 302     '#required' => TRUE,
 303   );
 304   $form['xmlrpc_example_server_max'] = array(
 305     '#type' => 'textfield',
 306     '#title' => t('Enter the maximum value returned by sub or add methods'),
 307     '#description' => t('if the result of the operation is bigger than this value, a custom XML-RPC error will be returned: 10001.'),
 308     '#default_value' => variable_get('xmlrpc_example_server_max', 10),
 309     '#size' => 5,
 310     '#required' => TRUE,
 311   );
 312   $form['info'] = array(
 313     '#type' => 'markup',
 314     '#markup' => '<div>' . t('Use the <a href="!link">XML-RPC Client example form</a> to experiment', array('!link' => url('examples/xmlrpc/client'))),
 315   );
 316   if (variable_get('xmlrpc_example_alter_enabled', FALSE)) {
 317     $form['overridden'] = array(
 318       '#type' => 'markup',
 319       '#markup' => '<div><strong>' . t('Just a note of warning: The <a href="!link">alter form</a> has been used to disable the limits, so you may want to turn that off if you do not want it.', array('!link' => url('examples/xmlrpc/alter'))) . '</strong></div>',
 320     );
 321   }
 322   return system_settings_form($form);
 323 }
 324 
 325 
 326 // The server part of the module ends here.
 327 //
 328 // This is the client part of the module. If defines a form with two input
 329 // fields to call xmlrpc_example.add or xmlrpc_example.subtract methods on this
 330 // host. Please note that having a user interface to query an XML-RPC service is
 331 // not required. A method can be requested to a server using the xmlrpc()
 332 // function directly. We have included an user interface to make the testing
 333 // easier.
 334 //
 335 //  The client user interface part of the module starts here.
 336 //
 337 /**
 338  * Returns a form array to take input for two arguments.
 339  *
 340  * Present a form to get two arguments, and make a call to an XML-RPC server
 341  * using these arguments as input, showing the result in a message.
 342  */
 343 function xmlrpc_example_client_form() {
 344   $form = array();
 345   $form['explanation'] = array(
 346     '#markup' => '<div>' . t('This example demonstrates how to make XML-RPC calls with Drupal. <br />The "Request methods" button makes a request to the server and asks for the available list of methods, as a service discovery request. <br/>The "Add integers" and "Subtract integers" use the xmlrpc() function to act as a client, calling the XML-RPC server defined in this same example for some defined methods.<br />An XML-RPC error will result if the result in the addition or subtraction requested is out of bounds defined by the server. These error numbers are defined by the server. <br />The "Add and Subtract" button performs a multicall operation on the XML-RPC server: several requests in a single XML-RPC call.<br />') . '</div>',
 347   );
 348   // We are going to call add and subtract methods, and
 349   // they work with integer values.
 350   $form['num1'] = array(
 351     '#type' => 'textfield',
 352     '#title' => t('Enter an integer'),
 353     '#default_value' => 2,
 354     '#size' => 5,
 355     '#required' => TRUE,
 356   );
 357   $form['num2'] = array(
 358     '#type' => 'textfield',
 359     '#title' => t('Enter a second integer'),
 360     '#default_value' => 2,
 361     '#size' => 5,
 362     '#required' => TRUE,
 363   );
 364   // Include several buttons, each of them calling a different method.
 365   // This button submits a XML-RPC call to the system.listMethods method.
 366   $form['information'] = array(
 367     '#type' => 'submit',
 368     '#value' => t('Request methods'),
 369     '#submit' => array('xmlrpc_example_client_request_methods_submit'),
 370   );
 371   // This button submits a XML-RPC call to the xmlrpc_example.add method.
 372   $form['add'] = array(
 373     '#type' => 'submit',
 374     '#value' => t('Add the integers'),
 375     '#submit' => array('xmlrpc_example_client_add_submit'),
 376   );
 377   // This button submits a XML-RPC call to the xmlrpc_example.subtract method.
 378   $form['subtract'] = array(
 379     '#type' => 'submit',
 380     '#value' => t('Subtract the integers'),
 381     '#submit' => array('xmlrpc_example_client_subtract_submit'),
 382   );
 383   // This button submits a XML-RPC call to the system.multicall method.
 384   $form['add_subtract'] = array(
 385     '#type' => 'submit',
 386     '#value' => t('Add and Subtract'),
 387     '#submit' => array('xmlrpc_example_client_multicall_submit'),
 388   );
 389   if (variable_get('xmlrpc_example_alter_enabled', FALSE)) {
 390     $form['overridden'] = array(
 391       '#type' => 'markup',
 392       '#markup' => '<div><strong>' . t('Just a note of warning: The <a href="!link">alter form</a> has been used to disable the limits, so you may want to turn that off if you do not want it.', array('!link' => url('examples/xmlrpc/alter'))) . '</strong></div>',
 393     );
 394   }
 395   return $form;
 396 }
 397 
 398 /**
 399  * Submit handler to query system.listMethods.
 400  *
 401  * Submit: query the XML-RPC endpoint for the method system.listMethods
 402  * and report the result as a Drupal message. The result is a list of the
 403  * available methods in this XML-RPC server.
 404  *
 405  * Important note: Not all XML-RPC servers implement this method. Drupal's
 406  * built-in XML-RPC server implements this method by default.
 407  *
 408  * @param $form
 409  *   form array
 410  * @param $form_state
 411  *   form_state array
 412  *
 413  * @see xmlrpc()
 414  * @see xmlrpc_errno()
 415  * @see xmlrpc_error_msg()
 416  */
 417 function xmlrpc_example_client_request_methods_submit($form, &$form_state) {
 418   // First define the endpoint of the XML-RPC service, in this case this is our
 419   // own server.
 420   $server = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
 421   // Then we should define the method to call. xmlrpc() requires that all the
 422   // information related to the called method be passed as an array in the form
 423   // of 'method_name' => arguments_array
 424   $options = array(
 425     'system.listMethods' => array(),
 426   );
 427   // Make the xmlrpc request and process the results.
 428   $result = xmlrpc($server, $options);
 429   if ($result === FALSE) {
 430     drupal_set_message(
 431       t('Error return from xmlrpc(): Error: @errno, Message: @message',
 432       array('@errno' => xmlrpc_errno(), '@message' => xmlrpc_error_msg())),
 433       'error'
 434     );
 435   }
 436   else {
 437     drupal_set_message(
 438       t('The XML-RPC server returned this response: <pre>@response</pre>',
 439       array('@response' => print_r($result, TRUE)))
 440     );
 441   }
 442 }
 443 
 444 /**
 445  * Submit handler to query xmlrpc_example.add.
 446  *
 447  * Submit: query the XML-RPC endpoint for the method xmlrpc_example.add
 448  * and report the result as a Drupal message.
 449  *
 450  * @param $form
 451  *   form array
 452  * @param $form_state
 453  *   form_state array
 454  *
 455  * @see xmlrpc()
 456  * @see xmlrpc_errno()
 457  * @see xmlrpc_error_msg()
 458  */
 459 function xmlrpc_example_client_add_submit($form, &$form_state) {
 460   // First define the endpoint of the XML-RPC service, in this case is our
 461   // own server.
 462   $server = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
 463   // Then we should define the method to call. xmlrpc() requires that all the
 464   // information related to the called method is passed as an array in the form
 465   // of 'method_name' => arguments_array
 466   $options = array(
 467     'xmlrpc_example.add' => array(
 468       (int) $form_state['values']['num1'],
 469       (int) $form_state['values']['num2'],
 470     ),
 471   );
 472   // Make the xmlrpc request and process the results.
 473   $result = xmlrpc($server, $options);
 474   if ($result === FALSE) {
 475     drupal_set_message(
 476       t('Error return from xmlrpc(): Error: @errno, Message: @message',
 477       array('@errno' => xmlrpc_errno(), '@message' => xmlrpc_error_msg())),
 478       'error'
 479     );
 480   }
 481   else {
 482     drupal_set_message(
 483       t('The XML-RPC server returned this response: @response',
 484       array('@response' => print_r($result, TRUE)))
 485     );
 486   }
 487 }
 488 
 489 /**
 490  * Submit handler to query xmlrpc_example.subtract.
 491  *
 492  * Submit: query the XML-RPC endpoint for the method xmlrpc_example.subtract
 493  * and report the result as a Drupal message.
 494  *
 495  * @param $form
 496  *   form array
 497  * @param $form_state
 498  *   form_state array
 499  *
 500  * @see xmlrpc()
 501  * @see xmlrpc_errno()
 502  * @see xmlrpc_error_msg()
 503  * @see xmlrpc_example_client_add_submit()
 504  */
 505 function xmlrpc_example_client_subtract_submit($form, &$form_state) {
 506   $server = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
 507   $options = array(
 508     'xmlrpc_example.subtract' => array(
 509       (int) $form_state['values']['num1'],
 510       (int) $form_state['values']['num2'],
 511     ),
 512   );
 513   // Make the xmlrpc request and process the results.
 514   $result = xmlrpc($server, $options);
 515   if ($result === FALSE) {
 516     drupal_set_message(
 517       t('Error return from xmlrpc(): Error: @errno, Message: @message',
 518       array('@errno' => xmlrpc_errno(), '@message' => xmlrpc_error_msg())),
 519       'error'
 520     );
 521   }
 522   else {
 523     drupal_set_message(
 524       t('The XML-RPC server returned this response: @response',
 525       array('@response' => print_r($result, TRUE)))
 526     );
 527   }
 528 }
 529 
 530 /**
 531  * Submit a multicall request.
 532  *
 533  * Submit a multicall request: query the XML-RPC endpoint for the methods
 534  * xmlrpc_example.add and xmlrpc_example.subtract and report the result as a
 535  * Drupal message. Drupal's XML-RPC client builds the system.multicall request
 536  * automatically when there is more than one method to call.
 537  *
 538  * @param $form
 539  *   form array
 540  * @param $form_state
 541  *   form_state array
 542  *
 543  * @see xmlrpc()
 544  * @see xmlrpc_errno()
 545  * @see xmlrpc_error_msg()
 546  * @see xmlrpc_example_client_multicall_submit()
 547  */
 548 function xmlrpc_example_client_multicall_submit($form, &$form_state) {
 549   $server = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
 550 
 551   /*
 552    * Drupal's built-in xmlrpc server supports the system.multicall method.
 553    *
 554    * To make a multicall request, the main invoked method should be the
 555    * function 'system.multicall', and the arguments to make this call must be
 556    * defined as an array of single method calls, being the array keys the
 557    * service methods to be called, and the array elements the method arguments.
 558    *
 559    * See the code below this comment as example.
 560    */
 561 
 562   // Build an array of several calls, Drupal's xmlrpc built-in support will
 563   // construct the correct system.multicall request for the server.
 564   $options = array(
 565     'xmlrpc_example.add' => array(
 566       (int) $form_state['values']['num1'],
 567       (int) $form_state['values']['num2'],
 568     ),
 569     'xmlrpc_example.subtract' => array(
 570       (int) $form_state['values']['num1'],
 571       (int) $form_state['values']['num2'],
 572     ),
 573   );
 574   // Make the xmlrpc request and process the results.
 575   $result = xmlrpc($server, $options);
 576 
 577   if ($result === FALSE) {
 578     drupal_set_message(
 579       t('Error return from xmlrpc(): Error: @errno, Message: @message',
 580       array('@errno' => xmlrpc_errno(), '@message' => xmlrpc_error_msg()))
 581     );
 582   }
 583   else {
 584     drupal_set_message(
 585       t('The XML-RPC server returned this response: <pre>@response</pre>',
 586       array('@response' => print_r($result, TRUE)))
 587     );
 588   }
 589 }
 590 
 591 // The client part of the module ends here.
 592 //
 593 // The alteration part of the module starts here. hook_xmlrpc_alter() is
 594 // useful when you want to extend, limit or alter methods defined by other
 595 // modules. This part is not required to have an XML-RPC server or client
 596 // working, but is useful to understand what can we do using current xmlrpc
 597 // API provided by drupal.
 598 //
 599 // This code can be defined in other module to alter the methods exposed by
 600 // this xmlrpc demonstration server, or can be used to alter methods defined
 601 // by other modules implementing hook_xmlrpc()
 602 //
 603 // As with the rest of the example module, an user interface is not required to
 604 // make use of this hook. A configuration form is included to enable/disable
 605 // this functionality, but this part is optional if you want to implement
 606 // hook_xmlrpc_alter()
 607 //
 608 // This is the XML-RPC code for the alteration part. It will check if an option
 609 // to enable the functionality is enabled and then alter it. We alter the
 610 // 'xmlrpc_example.add' and 'xmlrpc_example.subtract' methods, changing the
 611 // associated callback with custom functions. The modified methods (with
 612 // new callbacks associated) will perform the addition or subtraction of the
 613 // integer inputs, but will never check for limits nor return errors.
 614 /**
 615  * Implements hook_xmlrpc_alter().
 616  *
 617  * Check to see if xmlrpc_example.add and xmlrpc_example.subtract methods are
 618  * defined and replace their callbacks with custom code.
 619  *
 620  * @see hook_xmlrpc_alter()
 621  */
 622 function xmlrpc_example_xmlrpc_alter(&$methods) {
 623 
 624   // Only perform alterations if instructed to do so.
 625   if (!variable_get('xmlrpc_example_alter_enabled', 0)) {
 626     return;
 627   }
 628   // Loop all defined methods (other modules may include additional methods).
 629   foreach ($methods as $index => $method) {
 630     // First element in the method array is the method name.
 631     if ($method[0] == 'xmlrpc_example.add') {
 632       // Replace current callback with custom callback
 633       // (second argument of the array).
 634       $methods[$index][1] = '_xmlrpc_example_alter_add';
 635     }
 636     // Do the same for the substraction method.
 637     if ($method[0] == 'xmlrpc_example.subtract') {
 638       $methods[$index][1] = '_xmlrpc_example_alter_subtract';
 639     }
 640   }
 641 }
 642 
 643 // Now we define the custom callbacks replacing the original defined by the
 644 // altered methods: xmlrpc_example.add and _xmlrpc_example.subtract. These
 645 // new callbacks will not check if the result of the operation is within the
 646 // limits defined by the server and will always return value of the operation.
 647 /**
 648  * Sum the two arguments without limit checking.
 649  *
 650  * This is the replacement callback for the xmlrpc_example.add xmlrpc method.
 651  *
 652  * @param $num1
 653  *   First number
 654  * @param $num2
 655  *   Second Number
 656  *
 657  * @return
 658  *   The sum of the arguments
 659  */
 660 function _xmlrpc_example_alter_add($num1, $num2) {
 661   return $num1 + $num2;
 662 }
 663 
 664 /**
 665  * Return the difference of the two arguments without limit checking.
 666  *
 667  * This is the replacement callback for xmlrpc_example.subtract xmlrpc method.
 668  *
 669  * @param $num1
 670  *   First number
 671  * @param $num2
 672  *   Second Number
 673  *
 674  * @return
 675  *   The difference of the two arguments
 676  */
 677 function _xmlrpc_example_alter_subtract($num1, $num2) {
 678   return $num1 - $num2;
 679 }
 680 
 681 
 682 // Our implementation of hook_xmlrpc_alter will work only if a system variable
 683 // is set to true, and we need a configuration form to enable/disable this
 684 // 'feature'. This is the user interface to enable or disable the
 685 // hook_xmlrpc_alter operations.
 686 /**
 687  * Present a form to enable/disable the code implemented in hook_xmlrpc_alter.
 688  */
 689 function xmlrpc_example_alter_form() {
 690   $form = array();
 691   $form['explanation'] = array(
 692     '#markup' => '<div>' . t('This is a configuration form to enable the alteration of XML-RPC methods using hook_xmlrpc_alter.<br />hook_xmlrpc_alter() can be used to alter the current defined methods by other modules. In this case as demonstration, we will overide current add and subtraction methods with others not being limited. Remember that this hook is optional and is not required to create XMLRPC services.<br />') . '</div>',
 693   );
 694   $form['xmlrpc_example_alter_enabled'] = array(
 695     '#type' => 'checkbox',
 696     '#title' => t('Overide current xmlrpc_example.add and xmlrpc_example.subtraction methods'),
 697     '#description' => t('If this checkbox is enabled, the default methods will be replaced with custom methods that ignore the XML-RPC server maximum and minimum restrictions.'),
 698     '#default_value' => variable_get('xmlrpc_example_alter_enabled', 0),
 699   );
 700   $form['info'] = array(
 701     '#markup' => '<div>' . t('Use the <a href="!link">client submission form</a> to see the results of checking this checkbox', array('!link' => url('examples/xmlrpc/client'))) . '</div>',
 702   );
 703   return system_settings_form($form);
 704 }
 705 /**
 706  * @} End of "defgroup xmlrpc_example".
 707  */
";i:1;N;i:2;N;}i:2;i:332;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30672;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"xmlrpc_example.test";i:1;i:2;i:2;i:30672;}i:2;i:30672;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30672;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6228:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Test case for the XML-RPC example module.
   6  */
   7 
   8 class XmlrpcExampleTestCase extends DrupalWebTestCase {
   9   protected $xmlrpc_url;
  10 
  11   public static function getInfo() {
  12     return array(
  13       'name' => 'XMLRPC example functionality',
  14       'description' => 'Test xmlrpc service implementation.',
  15       'group' => 'Examples',
  16     );
  17   }
  18 
  19   /**
  20    * Enable module.
  21    */
  22   function setUp() {
  23     parent::setUp('xmlrpc_example');
  24 
  25     // Init common variables.
  26     global $base_url;
  27     $this->xmlrpc_url = url($GLOBALS['base_url'] . '/xmlrpc.php', array('external' => TRUE));
  28   }
  29 
  30   /**
  31    * Perform several calls to the XML-RPC interface to test the services.
  32    */
  33   function testXmlrpcExampleBasic() {
  34     // Unit test functionality.
  35     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.add' => array(3, 4)));
  36     $this->assertEqual($result, 7, 'Successfully added 3+4 = 7');
  37 
  38     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.subtract' => array(4, 3)));
  39     $this->assertEqual($result, 1, 'Successfully subtracted 4-3 = 1');
  40 
  41     // Make a multicall request.
  42     $options = array(
  43       'xmlrpc_example.add' => array(5, 2),
  44       'xmlrpc_example.subtract' => array(5, 2),
  45     );
  46     $expected = array(7, 3);
  47     $result = xmlrpc($this->xmlrpc_url, $options);
  48     $this->assertEqual($result, $expected, 'Successfully called multicall request');
  49 
  50     // Verify default limits.
  51     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.subtract' => array(3, 4)));
  52     $this->assertEqual(xmlrpc_errno(), 10002, 'Results below minimum return custom error: 10002');
  53 
  54     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.add' => array(7, 4)));
  55     $this->assertEqual(xmlrpc_errno(), 10001, 'Results beyond maximum return custom error: 10001');
  56   }
  57 
  58   /**
  59    * Perform several calls using XML-RPC web client.
  60    */
  61   function testXmlrpcExampleClient() {
  62     // Now test the UI.
  63     // Add the integers.
  64     $edit = array('num1' => 3, 'num2' => 5);
  65     $this->drupalPost('examples/xmlrpc/client', $edit, t('Add the integers'));
  66     $this->assertText(t('The XML-RPC server returned this response: @num', array('@num' => 8)));
  67     // Subtract the integers.
  68     $edit = array('num1' => 8, 'num2' => 3);
  69     $result = $this->drupalPost('examples/xmlrpc/client', $edit, t('Subtract the integers'));
  70     $this->assertText(t('The XML-RPC server returned this response: @num', array('@num' => 5)));
  71     // Request available methods.
  72     $this->drupalPost('examples/xmlrpc/client', $edit, t('Request methods'));
  73     $this->assertText('xmlrpc_example.add', 'The XML-RPC Add method was found.');
  74     $this->assertText('xmlrpc_example.subtract', 'The XML-RPC Subtract method was found.');
  75     // Before testing multicall, verify that method exists.
  76     $this->assertText('system.multicall', 'The XML-RPC Multicall method was found.');
  77     // Verify multicall request.
  78     $edit = array('num1' => 5, 'num2' => 2);
  79     $this->drupalPost('examples/xmlrpc/client', $edit, t('Add and Subtract'));
  80     $this->assertText('[0] =&gt; 7', 'The XML-RPC server returned the addition result.');
  81     $this->assertText('[1] =&gt; 3', 'The XML-RPC server returned the subtraction result.');
  82   }
  83 
  84   /**
  85    * Perform several XML-RPC requests with different server settings.
  86    */
  87   function testXmlrpcExampleServer() {
  88     // Set different minimum and maxmimum valuesI.
  89     $options = array('xmlrpc_example_server_min' => 3, 'xmlrpc_example_server_max' => 7);
  90     $this->drupalPost('examples/xmlrpc/server', $options, t('Save configuration'));
  91     $this->assertText(t('The configuration options have been saved'), 'Results limited to >= 3 and <= 7');
  92 
  93     $edit = array('num1' => 8, 'num2' => 3);
  94     $this->drupalPost('examples/xmlrpc/client', $edit, t('Subtract the integers'));
  95     $this->assertText(t('The XML-RPC server returned this response: @num', array('@num' => 5)));
  96 
  97     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.add' => array(3, 4)));
  98     $this->assertEqual($result, 7, 'Successfully added 3+4 = 7');
  99 
 100     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.subtract' => array(4, 3)));
 101     $this->assertEqual(xmlrpc_errno(), 10002, 'subtracting 4-3 = 1 returns custom error: 10002');
 102 
 103     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.add' => array(7, 4)));
 104     $this->assertEqual(xmlrpc_errno(), 10001, 'Adding 7 + 4 = 11 returns custom error: 10001');
 105   }
 106 
 107   /**
 108    * Perform several XML-RPC requests altering the server behaviour with
 109    * hook_xmlrpc_alter API.
 110    */
 111   function testXmlrpcExampleAlter() {
 112     // Enable XML-RPC service altering functionality.
 113     $options = array('xmlrpc_example_alter_enabled' => TRUE);
 114     $this->drupalPost('examples/xmlrpc/alter', $options, t('Save configuration'));
 115     $this->assertText(t('The configuration options have been saved'), 'Results are not limited due to methods alteration');
 116 
 117     // After altering the functionality, the add and subtract methods have no
 118     // limits and should not return any error.
 119     $edit = array('num1' => 80, 'num2' => 3);
 120     $this->drupalPost('examples/xmlrpc/client', $edit, t('Subtract the integers'));
 121     $this->assertText(t('The XML-RPC server returned this response: @num', array('@num' => 77)));
 122 
 123     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.add' => array(30, 4)));
 124     $this->assertEqual($result, 34, 'Successfully added 30+4 = 34');
 125 
 126     $result = xmlrpc($this->xmlrpc_url, array('xmlrpc_example.subtract' => array(4, 30)));
 127     $this->assertEqual($result, -26, 'Successfully subtracted 4-30 = -26');
 128   }
 129 }
";i:1;N;i:2;N;}i:2;i:30709;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:36945;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:36945;}}