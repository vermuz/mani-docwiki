a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Entity Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"entity_example.info";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:301:"
   1 name = Entity Example
   2 description = A simple entity example showing the main steps required to set up your own entity.
   3 core = 7.x
   4 package = Example modules
   5 dependencies[] = field
   6 files[] = entity_example.test
   7 configure = admin/structure/entity_example_basic/manage
";i:1;N;i:2;N;}i:2;i:68;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:378;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"entity_example.install";i:1;i:2;i:2;i:378;}i:2;i:378;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:378;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2535:"
  1 <?php
   2 /**
   3  * @file
   4  * Install for a basic entity - need to create the base table for our entity.
   5  * This table can have as many columns as you need to keep track of
   6  * entity-specific data that will not be added via attached fields.
   7  * The minimum information for the entity to work is an id and an entity name.
   8  */
   9 
  10 /**
  11  * Implements hook_schema().
  12  *
  13  * @ingroup entity_example
  14  */
  15 function entity_example_schema() {
  16   $schema = array();
  17 
  18   // The name of the table can be any name we choose. However, namespacing the
  19   // table with the module name is best practice.
  20   $schema['entity_example_basic'] = array(
  21     'description' => 'The base table for our basic entity.',
  22       'fields' => array(
  23         'basic_id' => array(
  24           'description' => 'Primary key of the basic entity.',
  25           'type' => 'serial',
  26           'unsigned' => TRUE,
  27           'not null' => TRUE,
  28         ),
  29         // If we allow multiple bundles, then the schema must handle that;
  30         // We'll put it in the 'bundle_type' field to avoid confusion with the
  31         // entity type.
  32         'bundle_type' => array(
  33           'description' => 'The bundle type',
  34           'type' => 'text',
  35           'size' => 'medium',
  36           'not null' => TRUE
  37         ),
  38         // Additional properties are just things that are common to all
  39         // entities and don't require field storage.
  40         'item_description' => array(
  41           'description' => 'A description of the item',
  42           'type' => 'varchar',
  43           'length' => 255,
  44           'not null' => TRUE,
  45           'default' => '',
  46         ),
  47         'created' => array(
  48           'description' => 'The Unix timestamp of the entity creation time.',
  49           'type' => 'int',
  50           'not null' => TRUE,
  51           'default' => 0,
  52         ),
  53       ),
  54     'primary key' => array('basic_id'),
  55   );
  56 
  57   return $schema;
  58 }
  59 
  60 
  61 /*
  62  * Implements hook_uninstall().
  63  *
  64  * At uninstall time we'll notify field.module that the entity was deleted
  65  * so that attached fields can be cleaned up.
  66  *
  67  * @ingroup entity_example
  68  */
  69 function entity_example_uninstall() {
  70   field_attach_delete_bundle('entity_example_basic' , 'first_example_bundle' );
  71 }
";i:1;N;i:2;N;}i:2;i:418;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2962;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"entity_example.module";i:1;i:2;i:2;i:2962;}i:2;i:2962;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2962;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:23430:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Implements the basic functionality required to create and display an entity.
   6  *
   7  * This example does not use the
   8  * @link http://drupal.org/project/entity Entity API module @endlink, which is
   9  * used by many entity implementations and is recommended by many.
  10  *
  11  * An example of use of creating and managing entities using the Entity API
  12  * module is provided in the
  13  * @link http://drupal.org/project/model Model Entity module @endlink.
  14  *
  15  * @todo: Reference the ronald_istos article series
  16  * @todo: Reference the Drupal module development book
  17  * @todo: Add a single field
  18  */
  19 
  20 /**
  21  * @defgroup entity_example Example: Entity
  22  * @ingroup examples
  23  * @{
  24  * Example creating a core Entity API entity.
  25  *
  26  * Note that this example does not use or demonstrate the contrib Entity API,
  27  * which you can find here: http://drupal.org/project/entity
  28  */
  29 
  30 /**
  31  * Implements hook_entity_info().
  32  *
  33  * This is the fundamental description of the entity.
  34  *
  35  * It provides a single entity with a single bundle and without revision
  36  * support.
  37  */
  38 function entity_example_entity_info() {
  39   $info['entity_example_basic'] = array(
  40     // A human readable label to identify our entity.
  41     'label' => t('Example Basic Entity'),
  42 
  43     // The controller for our Entity, extending the Drupal core controller.
  44     'controller class' => 'EntityExampleBasicController',
  45 
  46     // The table for this entity defined in hook_schema()
  47     'base table' => 'entity_example_basic',
  48 
  49     // Returns the uri elements of an entity
  50     'uri callback' => 'entity_example_basic_uri',
  51 
  52     // IF fieldable == FALSE, we can't attach fields.
  53     'fieldable' => TRUE,
  54 
  55     // entity_keys tells the controller what database fields are used for key
  56     // functions. It is not required if we don't have bundles or revisions.
  57     // Here we do not support a revision, so that entity key is omitted.
  58     'entity keys' => array(
  59       'id' => 'basic_id' , // The 'id' (basic_id here) is the unique id.
  60       'bundle' => 'bundle_type' // Bundle will be determined by the 'bundle_type' field
  61     ),
  62     'bundle keys' => array(
  63       'bundle' => 'bundle_type',
  64     ),
  65 
  66     // FALSE disables caching. Caching functionality is handled by Drupal core.
  67     'static cache' => TRUE,
  68 
  69     // Bundles are alternative groups of fields or configuration
  70     // associated with a base entity type.
  71     'bundles' => array(
  72       'first_example_bundle' => array(
  73         'label' => 'First example bundle',
  74         // 'admin' key is used by the Field UI to provide field and
  75         // display UI pages.
  76         'admin' => array(
  77           'path' => 'admin/structure/entity_example_basic/manage',
  78           'access arguments' => array('administer entity_example_basic entities'),
  79         ),
  80       ),
  81     ),
  82     // View modes allow entities to be displayed differently based on context.
  83     // As a demonstration we'll support "Tweaky", but we could have and support
  84     // multiple display modes.
  85     'view modes' => array(
  86       'tweaky' => array(
  87         'label' => t('Tweaky'),
  88         'custom settings' =>  FALSE,
  89       ),
  90     )
  91   );
  92 
  93   return $info;
  94 }
  95 
  96 /**
  97  * Fetch a basic object.
  98  *
  99  * This function ends up being a shim between the menu system and
 100  * entity_example_basic_load_multiple().
 101  *
 102  * This function gets its name from the menu system's wildcard
 103  * naming conventions. For example, /path/%wildcard would end
 104  * up calling wildcard_load(%wildcard value). In our case defining
 105  * the path: examples/entity_example/basic/%entity_example_basic in
 106  * hook_menu() tells Drupal to call entity_example_basic_load().
 107  *
 108  * @param $basic_id
 109  *   Integer specifying the basic entity id.
 110  * @param $reset
 111  *   A boolean indicating that the internal cache should be reset.
 112  * @return
 113  *   A fully-loaded $basic object or FALSE if it cannot be loaded.
 114  *
 115  * @see entity_example_basic_load_multiple()
 116  * @see entity_example_menu()
 117  */
 118 function entity_example_basic_load($basic_id = NULL, $reset = FALSE) {
 119   $basic_ids = (isset($basic_id) ? array($basic_id) : array());
 120   $basic = entity_example_basic_load_multiple($basic_ids, array(), $reset);
 121   return $basic ? reset($basic) : FALSE;
 122 }
 123 
 124 /**
 125  * Loads multiple basic entities.
 126  *
 127  * We only need to pass this request along to entity_load(), which
 128  * will in turn call the load() method of our entity controller class.
 129  */
 130 function entity_example_basic_load_multiple($basic_ids = FALSE, $conditions = array(), $reset = FALSE) {
 131   return entity_load('entity_example_basic', $basic_ids, $conditions, $reset);
 132 }
 133 
 134 /**
 135  * Implements the uri callback.
 136  */
 137 function entity_example_basic_uri($basic) {
 138   return array(
 139     'path' => 'examples/entity_example/basic/' . $basic->basic_id,
 140   );
 141 }
 142 
 143 /**
 144  * Implements hook_menu().
 145  */
 146 function entity_example_menu() {
 147   $items['examples/entity_example'] = array(
 148     'title' => 'Entity Example',
 149     'page callback' => 'entity_example_info_page',
 150     'access arguments' => array('view any entity_example_basic entity'),
 151   );
 152 
 153   // This provides a place for Field API to hang its own
 154   // interface and has to be the same as what was defined
 155   // in basic_entity_info() above.
 156   $items['admin/structure/entity_example_basic/manage'] = array(
 157     'title' => 'Administer entity_example_basic entity type',
 158     'page callback' => 'entity_example_basic_list_entities',
 159     'access arguments' => array('administer entity_example_basic entities'),
 160   );
 161 
 162   // Add example entities.
 163   $items['admin/structure/entity_example_basic/manage/add'] = array(
 164     'title' => 'Add an Entity Example Basic Entity',
 165     'page callback' => 'entity_example_basic_add',
 166     'access arguments' => array('create entity_example_basic entities'),
 167     'type' => MENU_LOCAL_ACTION,
 168   );
 169 
 170   // List of all entity_example_basic entities.
 171   $items['admin/structure/entity_example_basic/manage/list'] = array(
 172     'title' => 'List',
 173     'type' => MENU_DEFAULT_LOCAL_TASK,
 174   );
 175 
 176   // The page to view our entities - needs to follow what
 177   // is defined in basic_uri and will use load_basic to retrieve
 178   // the necessary entity info.
 179   $items['examples/entity_example/basic/%entity_example_basic'] = array(
 180     'title callback' => 'entity_example_basic_title',
 181     'title arguments' => array(3),
 182     'page callback' => 'entity_example_basic_view',
 183     'page arguments' => array(3),
 184     'access arguments' => array('view any entity_example_basic entity'),
 185   );
 186 
 187   // 'View' tab for an individual entity page.
 188   $items['examples/entity_example/basic/%entity_example_basic/view'] = array(
 189     'title' => 'View',
 190     'type' => MENU_DEFAULT_LOCAL_TASK,
 191     'weight' => -10,
 192   );
 193 
 194   // 'Edit' tab for an individual entity page.
 195   $items['examples/entity_example/basic/%entity_example_basic/edit'] = array(
 196     'title' => 'Edit',
 197     'page callback' => 'drupal_get_form',
 198     'page arguments' => array('entity_example_basic_form', 3),
 199     'access arguments' => array('edit any entity_example_basic entity'),
 200     'type' => MENU_LOCAL_TASK,
 201   );
 202 
 203   // Add example entities.
 204   $items['examples/entity_example/basic/add'] = array(
 205     'title' => 'Add an Entity Example Basic Entity',
 206     'page callback' => 'entity_example_basic_add',
 207     'access arguments' => array('create entity_example_basic entities'),
 208   );
 209 
 210   return $items;
 211 }
 212 
 213 /**
 214  * Basic information for the page.
 215  */
 216 function entity_example_info_page() {
 217   $content['preface'] = array(
 218     '#type' => 'item',
 219     '#markup' => t('The entity example provides a simple example entity.')
 220   );
 221   if (user_access('administer entity_example_basic entities')) {
 222     $content['preface']['#markup'] =  t('You can administer these and add fields and change the view !link.',
 223       array('!link' => l(t('here'), 'admin/structure/entity_example_basic/manage'))
 224     );
 225   }
 226   $content['table'] = entity_example_basic_list_entities();
 227 
 228   return $content;
 229 }
 230 
 231 /**
 232  * Implements hook_permission().
 233  */
 234 function entity_example_permission() {
 235   $permissions = array(
 236     'administer entity_example_basic entities' =>  array(
 237       'title' => t('Administer entity_example_basic entities'),
 238     ),
 239     'view any entity_example_basic entity' => array(
 240       'title' => t('View any Entity Example Basic entity'),
 241     ),
 242     'edit any entity_example_basic entity' => array(
 243       'title' => t('Edit any Entity Example Basic entity'),
 244     ),
 245     'create entity_example_basic entities' => array(
 246       'title' => t('Create Entity Example Basic Entities'),
 247     ),
 248   );
 249   return $permissions;
 250 }
 251 
 252 /**
 253  * Returns a render array with all entity_example_basic entities.
 254  *
 255  * In this basic example we know that there won't be many entities,
 256  * so we'll just load them all for display. See pager_example.module
 257  * to implement a pager. Most implementations would probably do this
 258  * with the contrib Entity API module, or a view using views module,
 259  * but we avoid using non-core features in the Examples project.
 260  *
 261  * @see pager_example.module
 262  */
 263 function entity_example_basic_list_entities() {
 264   $content = array();
 265   // Load all of our entities.
 266   $entities = entity_example_basic_load_multiple();
 267   if (!empty($entities)) {
 268     foreach ( $entities as $entity ) {
 269       // Create tabular rows for our entities.
 270       $rows[] = array(
 271         'data' => array(
 272           'id' => $entity->basic_id,
 273           'item_description' => l($entity->item_description, 'examples/entity_example/basic/' . $entity->basic_id),
 274           'bundle' => $entity->bundle_type,
 275         ),
 276       );
 277     }
 278     // Put our entities into a themed table. See theme_table() for details.
 279     $content['entity_table'] = array(
 280       '#theme' => 'table',
 281       '#rows' => $rows,
 282       '#header' => array(t('ID'), t('Item Description'), t('Bundle')),
 283     );
 284   }
 285   else {
 286     // There were no entities. Tell the user.
 287     $content[] = array(
 288       '#type' => 'item',
 289       '#markup' => t('No entity_example_basic entities currently exist.'),
 290     );
 291   }
 292   return $content;
 293 }
 294 
 295 /**
 296  * Callback for a page title when this entity is displayed.
 297  */
 298 function entity_example_basic_title($entity) {
 299   return t('Entity Example Basic (item_description=@item_description)', array('@item_description' => $entity->item_description));
 300 }
 301 
 302 /**
 303  * Menu callback to display an entity.
 304  *
 305  * As we load the entity for display, we're responsible for invoking a number
 306  * of hooks in their proper order.
 307  *
 308  * @see hook_entity_prepare_view()
 309  * @see hook_entity_view()
 310  * @see hook_entity_view_alter()
 311  */
 312 function entity_example_basic_view($entity, $view_mode = 'tweaky') {
 313   // Our entity type, for convenience.
 314   $entity_type = 'entity_example_basic';
 315   // Start setting up the content.
 316   $entity->content = array(
 317     '#view_mode' => $view_mode,
 318   );
 319   // Build fields content - this is where the Field API really comes in to play.
 320   // The task has very little code here because it all gets taken care of by
 321   // field module.
 322   // field_attach_prepare_view() lets the fields load any data they need
 323   // before viewing.
 324   field_attach_prepare_view($entity_type, array($entity->basic_id => $entity),
 325     $view_mode);
 326   // We call entity_prepare_view() so it can invoke hook_entity_prepare_view()
 327   // for us.
 328   entity_prepare_view($entity_type, array($entity->basic_id => $entity));
 329   // Now field_attach_view() generates the content for the fields.
 330   $entity->content += field_attach_view($entity_type, $entity, $view_mode);
 331 
 332   // OK, Field API done, now we can set up some of our own data.
 333   $entity->content['created'] = array(
 334     '#type' => 'item',
 335     '#title' => t('Created date'),
 336     '#markup' => format_date($entity->created),
 337   );
 338   $entity->content['item_description'] = array(
 339     '#type' => 'item',
 340     '#title' => t('Item Description'),
 341     '#markup' => $entity->item_description,
 342   );
 343 
 344   // Now to invoke some hooks. We need the language code for
 345   // hook_entity_view(), so let's get that.
 346   global $language ;
 347   $langcode = $language->language ;
 348   // And now invoke hook_entity_view().
 349   module_invoke_all('entity_view', $entity, $entity_type, $view_mode,
 350     $langcode);
 351   // Now invoke hook_entity_view_alter().
 352   drupal_alter(array('entity_example_basic_view', 'entity_view'),
 353     $entity->content, $entity_type);
 354 
 355   // And finally return the content.
 356   return $entity->content;
 357 }
 358 
 359 /**
 360  * Implements hook_field_extra_fields().
 361  *
 362  * This exposes the "extra fields" (usually properties that can be configured
 363  * as if they were fields) of the entity as pseudo-fields
 364  * so that they get handled by the Entity and Field core functionality.
 365  * Node titles get treated in a similar manner.
 366  */
 367 function entity_example_field_extra_fields() {
 368   $form_elements['item_description'] = array(
 369     'label' => t('Item Description'),
 370     'description' => t('Item Description (an extra form field)'),
 371     'weight' => -5,
 372   );
 373   $display_elements['created'] = array(
 374     'label' => t('Creation date'),
 375     'description' => t('Creation date (an extra display field)'),
 376     'weight' => 0,
 377   );
 378   $display_elements['item_description'] = array(
 379     'label' => t('Item Description'),
 380     'description' => t('Just like title, but trying to point out that it is a separate property'),
 381     'weight' => 0,
 382   );
 383 
 384   // Since we have only one bundle type, we'll just provide the extra_fields
 385   // for it here.
 386   $extra_fields['entity_example_basic']['first_example_bundle']['form'] = $form_elements;
 387   $extra_fields['entity_example_basic']['first_example_bundle']['display'] = $display_elements;
 388 
 389   return $extra_fields;
 390 }
 391 
 392 /**
 393  * Provides a wrapper on the edit form to add a new entity.
 394  */
 395 function entity_example_basic_add() {
 396   // Create a basic entity structure to be used and passed to the validation
 397   // and submission functions.
 398   $entity = entity_get_controller('entity_example_basic')->create();
 399   return drupal_get_form('entity_example_basic_form', $entity);
 400 }
 401 
 402 /**
 403  * Form function to create an entity_example_basic entity.
 404  *
 405  * The pattern is:
 406  * - Set up the form for the data that is specific to your
 407  *   entity: the columns of your base table.
 408  * - Call on the Field API to pull in the form elements
 409  *   for fields attached to the entity.
 410  */
 411 function entity_example_basic_form($form, &$form_state, $entity) {
 412   $form['item_description'] = array(
 413     '#type' => 'textfield',
 414     '#title' => t('Item Description'),
 415     '#required' => TRUE,
 416     '#default_value' => $entity->item_description,
 417   );
 418 
 419   $form['basic_entity'] = array(
 420     '#type' => 'value',
 421     '#value' => $entity,
 422   );
 423 
 424   field_attach_form('entity_example_basic', $entity, $form, $form_state);
 425 
 426   $form['submit'] = array(
 427     '#type' => 'submit',
 428     '#value' => t('Save'),
 429     '#weight' => 100,
 430   );
 431   $form['delete'] = array(
 432     '#type' => 'submit',
 433     '#value' => t('Delete'),
 434     '#submit' => array('entity_example_basic_edit_delete'),
 435     '#weight' => 200,
 436   );
 437 
 438   return $form;
 439 }
 440 
 441 
 442 /**
 443  * Validation handler for entity_example_basic_add_form form.
 444  * We pass things straight through to the Field API to handle validation
 445  * of the attached fields.
 446  */
 447 function entity_example_basic_form_validate($form, &$form_state) {
 448   field_attach_form_validate('entity_example_basic', $form_state['values']['basic_entity'], $form, $form_state);
 449 }
 450 
 451 
 452 /**
 453  * Form submit handler: submits basic_add_form information
 454  */
 455 function entity_example_basic_form_submit($form, &$form_state) {
 456   $entity = $form_state['values']['basic_entity'];
 457   $entity->item_description = $form_state['values']['item_description'];
 458   field_attach_submit('entity_example_basic', $entity, $form, $form_state);
 459   $entity = entity_example_basic_save($entity);
 460   $form_state['redirect'] = 'examples/entity_example/basic/' . $entity->basic_id;
 461 }
 462 
 463 /**
 464  * Form deletion handler.
 465  *
 466  * @todo: 'Are you sure?' message.
 467  */
 468 function entity_example_basic_edit_delete( $form , &$form_state ) {
 469   $entity = $form_state['values']['basic_entity'];
 470   entity_example_basic_delete($entity);
 471   drupal_set_message(t('The entity %item_description (ID %id) has been deleted',
 472     array('%item_description' => $entity->item_description, '%id' => $entity->basic_id))
 473   );
 474   $form_state['redirect'] = 'examples/entity_example';
 475 }
 476 
 477 /**
 478  * We save the entity by calling the controller.
 479  */
 480 function entity_example_basic_save(&$entity) {
 481   return entity_get_controller('entity_example_basic')->save($entity);
 482 }
 483 
 484 /**
 485  * Use the controller to delete the entity.
 486  */
 487 function entity_example_basic_delete($entity) {
 488   entity_get_controller('entity_example_basic')->delete($entity);
 489 }
 490 
 491 /**
 492  * EntityExampleBasicControllerInterface definition.
 493  *
 494  * We create an interface here because anyone could come along and
 495  * use hook_entity_info_alter() to change our controller class.
 496  * We want to let them know what methods our class needs in order
 497  * to function with the rest of the module, so here's a handy list.
 498  *
 499  * @see hook_entity_info_alter()
 500  */
 501 
 502 interface EntityExampleBasicControllerInterface
 503   extends DrupalEntityControllerInterface {
 504   public function create();
 505   public function save($entity);
 506   public function delete($entity);
 507 }
 508 
 509 /**
 510  * EntityExampleBasicController extends DrupalDefaultEntityController.
 511  *
 512  * Our subclass of DrupalDefaultEntityController lets us add a few
 513  * important create, update, and delete methods.
 514  */
 515 class EntityExampleBasicController
 516   extends DrupalDefaultEntityController
 517   implements EntityExampleBasicControllerInterface {
 518 
 519   /**
 520    * Create and return a new entity_example_basic entity.
 521    */
 522   public function create() {
 523     $entity = new stdClass();
 524     $entity->type = 'entity_example_basic';
 525     $entity->basic_id = 0;
 526     $entity->bundle_type = 'first_example_bundle';
 527     $entity->item_description = '';
 528     return $entity;
 529   }
 530 
 531   /**
 532    * Saves the custom fields using drupal_write_record()
 533    */
 534   public function save($entity) {
 535     // If our entity has no basic_id, then we need to give it a
 536     // time of creation.
 537     if (empty($entity->basic_id)) {
 538       $entity->created = time();
 539     }
 540     // Invoke hook_entity_presave().
 541     module_invoke_all('entity_presave', $entity, 'entity_example_basic');
 542     // The 'primary_keys' argument determines whether this will be an insert
 543     // or an update. So if the entity already has an ID, we'll specify
 544     // basic_id as the key.
 545     $primary_keys = $entity->basic_id ? 'basic_id' : array();
 546     // Write out the entity record.
 547     drupal_write_record('entity_example_basic', $entity, $primary_keys);
 548     // We're going to invoke either hook_entity_update() or
 549     // hook_entity_insert(), depending on whether or not this is a
 550     // new entity. We'll just store the name of hook_entity_insert()
 551     // and change it if we need to.
 552     $invocation = 'entity_insert';
 553     // Now we need to either insert or update the fields which are
 554     // attached to this entity. We use the same primary_keys logic
 555     // to determine whether to update or insert, and which hook we
 556     // need to invoke.
 557     if (empty($primary_keys)) {
 558       field_attach_insert('entity_example_basic', $entity);
 559     }
 560     else {
 561       field_attach_update('entity_example_basic', $entity);
 562       $invocation = 'entity_update';
 563     }
 564     // Invoke either hook_entity_update() or hook_entity_insert().
 565     module_invoke_all($invocation, $entity, 'entity_example_basic');
 566     return $entity;
 567   }
 568 
 569   /**
 570    * Delete a single entity.
 571    *
 572    * Really a convenience function for delete_multiple().
 573    */
 574   public function delete($entity) {
 575     $this->delete_multiple(array($entity));
 576   }
 577 
 578   /**
 579    * Delete one or more entity_example_basic entities.
 580    *
 581    * Deletion is unfortunately not supported in the base
 582    * DrupalDefaultEntityController class.
 583    *
 584    * @param $basic_ids
 585    *   An array of entity IDs or a single numeric ID.
 586    */
 587   public function delete_multiple($entities) {
 588     $basic_ids = array();
 589     if (!empty($entities)) {
 590       $transaction = db_transaction();
 591       try {
 592         foreach ($entities as $entity) {
 593           // Invoke hook_entity_delete().
 594           module_invoke_all('entity_delete', $entity, 'entity_example_basic');
 595           field_attach_delete('entity_example_basic', $entity);
 596           $basic_ids[] = $entity->basic_id;
 597         }
 598         db_delete('entity_example_basic')
 599           ->condition('basic_id', $basic_ids, 'IN')
 600           ->execute();
 601       }
 602       catch (Exception $e) {
 603         $transaction->rollback();
 604         watchdog_exception('entity_example', $e);
 605         throw $e;
 606       }
 607     }
 608   }
 609 }
 610 
 611 /**
 612  * @} End of "defgroup entity_example".
 613  */
";i:1;N;i:2;N;}i:2;i:3001;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:26440;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"entity_example.test";i:1;i:2;i:2;i:26440;}i:2;i:26440;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:26440;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:6623:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Tests for entity_example module.
   6  *
   7  * Verify example module functionality.
   8  */
   9 
  10 /**
  11  * Functionality tests for enitity example module.
  12  *
  13  * @ingroup entity_example
  14  */
  15 class EntityExampleTestCase extends DrupalWebTestCase {
  16 
  17   public static function getInfo() {
  18     return array(
  19       'name' => 'Entity example',
  20       'description' => 'Basic entity example tests',
  21       'group' => 'Examples',
  22     );
  23   }
  24 
  25   function setUp() {
  26     // Enable the module.
  27     parent::setUp('entity_example');
  28 
  29     // Create and login user with access.
  30     $permissions = array(
  31       'access content',
  32       'view any entity_example_basic entity',
  33       'edit any entity_example_basic entity',
  34       'create entity_example_basic entities',
  35       'administer entity_example_basic entities',
  36       'administer site configuration',
  37     );
  38     $account = $this->drupalCreateUser($permissions);
  39     $this->drupalLogin($account);
  40 
  41     // Attach a field
  42     $field = array(
  43       'field_name' => 'entity_example_test_text' ,
  44       'type' => 'text'
  45     );
  46     field_create_field($field);
  47     $instance = array(
  48       'label' => 'Subject',
  49       'field_name' => 'entity_example_test_text',
  50       'entity_type' => 'entity_example_basic',
  51       'bundle' => 'first_example_bundle'
  52     );
  53     field_create_instance($instance);
  54   }
  55 
  56   /**
  57    * Test Entity Example features.
  58    *
  59    * CRUD
  60    * Table display
  61    * User access
  62    * Field management
  63    * Display management
  64    */
  65   function testEntityExampleBasic() {
  66     // Create 10 entities.
  67     for ($i = 1; $i <= 10; $i++) {
  68       $edit[$i]['item_description'] = $this->randomName();
  69       $edit[$i]['entity_example_test_text[und][0][value]'] = $this->randomName(32);
  70 
  71       $this->drupalPost('examples/entity_example/basic/add' , $edit[$i], 'Save');
  72       $this->assertText('item_description=' . $edit[$i]['item_description']);
  73 
  74       $this->drupalGet('examples/entity_example/basic/' . $i);
  75       $this->assertText('item_description=' . $edit[$i]['item_description']);
  76       $this->assertText($edit[$i]['entity_example_test_text[und][0][value]']);
  77     }
  78 
  79     // delete entity 5
  80     $this->drupalPost('examples/entity_example/basic/5/edit' , $edit[5], 'Delete');
  81     $this->drupalGet('examples/entity_example/basic/5');
  82     $this->assertResponse(404, 'Deleted entity 5 no longer exists');
  83     unset($edit[5]);
  84 
  85     // Update entity 2 and verify the update.
  86     $edit[2] = array(
  87       'item_description' => 'updated entity 2 ',
  88       'entity_example_test_text[und][0][value]' => 'updated entity 2 test text',
  89     );
  90     $this->drupalPost('examples/entity_example/basic/2/edit' , $edit[2], 'Save');
  91     $this->assertText('item_description=' . $edit[2]['item_description']);
  92     $this->assertText('updated entity 2 test text');
  93 
  94     // View the entity list page  and verify that the items which still exist
  95     // are there, and that the deleted #5 no longer is there.
  96     $this->drupalGet('admin/structure/entity_example_basic/manage');
  97     foreach ($edit as $id => $item) {
  98       $this->assertRaw('examples/entity_example/basic/' . $id . '">' . $item['item_description'] . '</a>');
  99     }
 100     $this->assertNoRaw('examples/entity_example/basic/5">');
 101 
 102     // Add a field through the field UI and verify that it behaves correctly.
 103     $field_edit = array(
 104       'fields[_add_new_field][label]' => 'New junk field',
 105       'fields[_add_new_field][field_name]' => 'new_junk_field',
 106       'fields[_add_new_field][type]' => 'text',
 107       'fields[_add_new_field][widget_type]' => 'text_textfield',
 108     );
 109     $this->drupalPost('admin/structure/entity_example_basic/manage/fields', $field_edit, t('Save'));
 110     $this->drupalPost(NULL, array(), t('Save field settings'));
 111     $this->drupalPost(NULL, array(), t('Save settings'));
 112     $this->assertResponse(200);
 113 
 114     // Now verify that we can edit and view this entity with fields.
 115     $edit[10]['field_new_junk_field[und][0][value]'] = $this->randomName();
 116     $this->drupalPost('examples/entity_example/basic/10/edit' , $edit[10], 'Save');
 117     $this->assertResponse(200);
 118     $this->assertText('item_description=' . $edit[10]['item_description']);
 119     $this->assertText($edit[10]['field_new_junk_field[und][0][value]'], 'Custom field updated successfully');
 120 
 121     // Create and login user without view access.
 122     $account = $this->drupalCreateUser(array('access content'));
 123     $this->drupalLogin($account);
 124     $this->drupalGet('admin/structure/entity_example_basic/manage');
 125     $this->assertResponse(403);
 126     $this->drupalGet('examples/entity_example/basic/2');
 127     $this->assertResponse(403, 'User does not have permission to view entity');
 128 
 129     // Create and login user with view access but no edit access.
 130     $account = $this->drupalCreateUser(array('access content', 'view any entity_example_basic entity'));
 131     $this->drupalLogin($account);
 132     $this->drupalGet('admin/structure/entity_example_basic/manage');
 133     $this->assertResponse(403, 'Denied access to admin manage page');
 134     $this->drupalGet('examples/entity_example/basic/2');
 135     $this->assertResponse(200, 'User has permission to view entity');
 136     $this->drupalGet('examples/entity_example/basic/2/edit');
 137     $this->assertResponse(403, 'User is denied edit privileges');
 138 
 139     // Create and login user with view and edit but no manage privs.
 140     $account = $this->drupalCreateUser(array('access content', 'view any entity_example_basic entity', 'edit any entity_example_basic entity'));
 141     $this->drupalLogin($account);
 142     $this->drupalGet('admin/structure/entity_example_basic/manage');
 143     $this->assertResponse(403, 'Denied access to admin manage page');
 144     $this->drupalGet('examples/entity_example/basic/2');
 145     $this->assertResponse(200, 'User has permission to view entity');
 146     $this->drupalGet('examples/entity_example/basic/2/edit');
 147     $this->assertResponse(200, 'User has edit privileges');
 148   }
 149 }
";i:1;N;i:2;N;}i:2;i:26477;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:33108;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:33108;}}