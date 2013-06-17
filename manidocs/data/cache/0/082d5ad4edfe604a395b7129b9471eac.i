a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Table Drag Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"tabledrag_example.info";i:1;i:2;i:2;i:35;}i:2;i:35;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:35;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:141:"
   1 name = Tabledrag Example
   2 description = Demonstrates how to create tabledrag forms.
   3 package = Example modules
   4 core = 7.x
";i:1;N;i:2;N;}i:2;i:75;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:225;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"tabledrag_example.install";i:1;i:2;i:2;i:225;}i:2;i:225;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:225;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4691:"
   1 <?php
   2 /**
   3  * @file
   4  * Install and uninstall functions for the tabledrag example module.
   5  *
   6  * This file contains the functions required to perform install and
   7  * uninstall operations.
   8  */
   9 
  10 /**
  11  * Implements hook_schema().
  12  *
  13  * This defines the database table which will hold the example item info.
  14  *
  15  * @ingroup tabledrag_example
  16  */
  17 function tabledrag_example_schema() {
  18   $schema['tabledrag_example'] = array(
  19     'description' => 'Stores some entries for our tabledrag fun.',
  20     'fields' => array(
  21       'id' => array(
  22         'description' => 'The primary identifier for each item',
  23         'type' => 'serial',
  24         'unsigned' => TRUE,
  25         'not null' => TRUE,
  26       ),
  27       'name' => array(
  28         'description' => 'A name for this item',
  29         'type' => 'varchar',
  30         'length' => 32,
  31         'not null' => TRUE,
  32         'default' => '',
  33       ),
  34       'description' => array(
  35         'description' => 'A description for this item',
  36         'type' => 'varchar',
  37         'length' => 255,
  38         'not null' => TRUE,
  39         'default' => '',
  40       ),
  41       'itemgroup' => array(
  42         'description' => 'The group this item belongs to',
  43         'type' => 'varchar',
  44         'length' => 32,
  45         'not null' => TRUE,
  46         'default' => '',
  47       ),
  48       'weight' => array(
  49         'description' => 'The sortable weight for this item',
  50         'type' => 'int',
  51         'length' => 11,
  52         'not null' => TRUE,
  53         'default' => 0,
  54       ),
  55       'pid' => array(
  56         'description' => 'The primary id of the parent for this item',
  57         'type' => 'int',
  58         'length' => 11,
  59         'unsigned' => TRUE,
  60         'not null' => TRUE,
  61         'default' => 0,
  62       ),
  63       'depth' => array(
  64         'description' => 'The depth of this item within the tree',
  65         'type' => 'int',
  66         'size' => 'small',
  67         'unsigned' => TRUE,
  68         'not null' => TRUE,
  69         'default' => 0,
  70       ),
  71     ),
  72     'primary key' => array('id'),
  73   );
  74   return $schema;
  75 }
  76 
  77 /**
  78  * Implements hook_install().
  79  *
  80  * This datafills the example item info which will be used in the example.
  81  *
  82  * @ingroup tabledrag_example
  83  */
  84 function tabledrag_example_install() {
  85   // Ensure translations don't break at install time.
  86   $t = get_t();
  87   // Insert some values into the database.
  88   $rows = array(
  89     array(
  90       'name' => $t('Item One'),
  91       'description' => $t('The first item'),
  92       'itemgroup' => $t('Group1'),
  93     ),
  94     array(
  95       'name' => $t('Item Two'),
  96       'description' => $t('The second item'),
  97       'itemgroup' => $t('Group1'),
  98     ),
  99     array(
 100       'name' => $t('Item Three'),
 101       'description' => $t('The third item'),
 102       'itemgroup' => $t('Group1'),
 103     ),
 104     array(
 105       'name' => $t('Item Four'),
 106       'description' => $t('The fourth item'),
 107       'itemgroup' => $t('Group2'),
 108     ),
 109     array(
 110       'name' => $t('Item Five'),
 111       'description' => $t('The fifth item'),
 112       'itemgroup' => $t('Group2'),
 113     ),
 114     array(
 115       'name' => $t('Item Six'),
 116       'description' => $t('The sixth item'),
 117       'itemgroup' => $t('Group2'),
 118     ),
 119     array(
 120       'name' => $t('Item Seven'),
 121       'description' => $t('The seventh item'),
 122       'itemgroup' => $t('Group3'),
 123     ),
 124     array(
 125       'name' => $t('A Root Node'),
 126       'description' => $t('This item cannot be nested under a parent item'),
 127       'itemgroup' => $t('Group3'),
 128     ),
 129     array(
 130       'name' => $t('A Leaf Item'),
 131       'description' => $t('This item cannot have child items'),
 132       'itemgroup' => $t('Group3'),
 133     ),
 134   );
 135   if (db_table_exists('tabledrag_example')) {
 136     foreach ($rows as $row) {
 137       db_insert('tabledrag_example')->fields($row)->execute();
 138     }
 139   }
 140 }
 141 
 142 /**
 143  * Implements hook_uninstall().
 144  *
 145  * This removes the example data when the module is uninstalled.
 146  *
 147  * @ingroup tabledrag_example
 148  */
 149 function tabledrag_example_uninstall() {
 150   db_drop_table('tabledrag_example');
 151 }
";i:1;N;i:2;N;}i:2;i:268;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4968;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"tabledrag_example.module";i:1;i:2;i:2;i:4968;}i:2;i:4968;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:4968;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2966:"
   1 <?php
   2 /**
   3  * @file
   4  * An example of how to build a sortable form using tabledrag.
   5  */
   6 
   7 /**
   8  * @defgroup tabledrag_example Example: Tabledrag
   9  * @ingroup examples
  10  * @{
  11  * Example of draggable table rows.
  12  */
  13 
  14 /**
  15  * Implements hook_help().
  16  *
  17  * Show a bit of information about this module on the example page.
  18  */
  19 function tabledrag_example_help($path, $arg) {
  20   switch ($path) {
  21     case 'examples/tabledrag_example':
  22       return '<p>' . t('The form here is a themed as a table that is sortable using tabledrag handles.') . '</p>';
  23   }
  24 }
  25 
  26 /**
  27  * Implements hook_menu().
  28  *
  29  * We'll let drupal_get_form() generate the form page for us, for both of
  30  * these menu items.
  31  *
  32  * @see drupal_get_form()
  33  */
  34 function tabledrag_example_menu() {
  35   // Basic example with single-depth sorting.
  36   $items['examples/tabledrag_example_simple'] = array(
  37     'title' => 'TableDrag example (simple)',
  38     'description' => 'Show a page with a sortable tabledrag form',
  39     'page callback' => 'drupal_get_form',
  40     'page arguments' => array('tabledrag_example_simple_form'),
  41     'access callback' => TRUE,
  42     'file' => 'tabledrag_example_simple_form.inc',
  43   );
  44   // Basic parent/child example.
  45   $items['examples/tabledrag_example_parent'] = array(
  46     'title' => 'TableDrag example (parent/child)',
  47     'description' => 'Show a page with a sortable parent/child tabledrag form',
  48     'page callback' => 'drupal_get_form',
  49     'page arguments' => array('tabledrag_example_parent_form'),
  50     'access callback' => TRUE,
  51     'file' => 'tabledrag_example_parent_form.inc',
  52   );
  53   return $items;
  54 }
  55 
  56 /**
  57  * Implements hook_theme().
  58  *
  59  * We need run our forms through custom theme functions in order to build the
  60  * table structure which is required by tabledrag.js.  Before we can use our
  61  * custom theme functions, we need to implement hook_theme in order to register
  62  * them with Drupal.
  63  *
  64  * We are defining our theme hooks with the same name as the form generation
  65  * function so that Drupal automatically calls our theming function when the
  66  * form is displayed.
  67  */
  68 function tabledrag_example_theme() {
  69   return array(
  70     // Theme function for the 'simple' example.
  71     'tabledrag_example_simple_form' => array(
  72       'render element' => 'form',
  73       'file' => 'tabledrag_example_simple_form.inc',
  74     ),
  75     // Theme function for the 'parent/child' example.
  76     'tabledrag_example_parent_form' => array(
  77       'render element' => 'form',
  78       'file' => 'tabledrag_example_parent_form.inc',
  79     ),
  80   );
  81 }
  82 /**
  83  * @} End of "defgroup tabledrag_example".
  84  */
";i:1;N;i:2;N;}i:2;i:5010;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7985;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"tabledrag_example_parent_form.inc";i:1;i:2;i:2;i:7985;}i:2;i:7985;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7985;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15618:"
   1 <?php
   2 /**
   3  * @file
   4  * Example demonstrating a parent/child tabledrag form
   5  */
   6 
   7 /**
   8  * Build the parent-child example form.
   9  *
  10  * @return
  11  *   A form array set for theming by theme_tabledrag_example_parent_form()
  12  *
  13  * @ingroup tabledrag_example
  14  */
  15 function tabledrag_example_parent_form($form_state) {
  16   // Identify that the elements in 'example_items' are a collection, to
  17   // prevent Form API from flattening the array when submitted.
  18   $form['example_items']['#tree'] = TRUE;
  19 
  20   // Tabledrag will take care of updating the parent_id relationship on each
  21   // row of our table when we drag items around, but we need to build out the
  22   // initial tree structure ourselves.  This means ordering our items such
  23   // that children items come directly after their parent items, and all items
  24   // are sorted by weight relative to their siblings.
  25   // To keep this from cluttering the actual tabledrag code, we have moved
  26   // this to a dedicated function.
  27 
  28   // Fetch the example data from the database, ordered by parent/child/weight.
  29   $result = tabledrag_example_parent_get_data();
  30 
  31   // Iterate through each database result.
  32   foreach ($result as $item) {
  33 
  34     // Create a form entry for this item.
  35     //
  36     // Each entry will be an array using the the unique id for that item as
  37     // the array key, and an array of table row data as the value.
  38     $form['example_items'][$item->id] = array(
  39 
  40       // We'll use a form element of type '#markup' to display the item name.
  41       'name' => array(
  42         '#markup' => $item->name,
  43       ),
  44 
  45       // We'll use a form element of type '#textfield' to display the item
  46       // description, to demonstrate that form elements can be included in the
  47       // table. We limit the input to 255 characters, which is the limit we
  48       // set on the database field.
  49       'description' => array(
  50         '#type' => 'textfield',
  51         '#default_value' => $item->description,
  52         '#size' => 20,
  53         '#maxlength' => 255,
  54       ),
  55 
  56       // For parent/child relationships, we also need to add form items to
  57       // store the current item's unique id and parent item's unique id.
  58       //
  59       // We would normally use a hidden element for this, but for this example
  60       // we'll use a disabled textfield element called 'id' so that we can
  61       // display the current item's id in the table.
  62       //
  63       // Because tabledrag modifies the #value of this element, we use
  64       // '#default_value' instead of '#value' when defining a hidden element.
  65       // Also, because tabledrag modifies '#value', we cannot use a markup
  66       // element, which does not support the '#value' property. (Markup
  67       // elements use the '#markup' property instead.)
  68       'id' => array(
  69         // '#type' => 'hidden',
  70         // '#default_value' => $item->id,
  71         '#type' => 'textfield',
  72         '#size' => 3,
  73         '#default_value' => $item->id,
  74         '#disabled' => TRUE,
  75       ),
  76 
  77       // The same information holds true for the parent id field as for the
  78       // item id field, described above.
  79       'pid' => array(
  80         // '#type' => 'hidden',
  81         // '#default_value' => $item->pid,
  82         '#type' => 'textfield',
  83         '#size' => 3,
  84         '#default_value' => $item->pid,
  85       ),
  86 
  87       // The 'weight' field will be manipulated as we move the items around in
  88       // the table using the tabledrag activity.  We use the 'weight' element
  89       // defined in Drupal's Form API.
  90       'weight' => array(
  91         '#type' => 'weight',
  92         '#title' => t('Weight'),
  93         '#default_value' => $item->weight,
  94         '#delta' => 10,
  95         '#title-display' => 'invisible',
  96       ),
  97 
  98       // We'll use a hidden form element to pass the current 'depth' of each
  99       // item within our parent/child tree structure to the theme function.
 100       // This will be used to calculate the initial amount of indentation to
 101       // add before displaying any child item rows.
 102       'depth' => array(
 103         '#type' => 'hidden',
 104         '#value' => $item->depth,
 105       ),
 106     );
 107   }
 108 
 109   // Now we add our submit button, for submitting the form results.
 110   //
 111   // The 'actions' wrapper used here isn't strictly necessary for tabledrag,
 112   // but is included as a Form API recommended practice.
 113   $form['actions'] = array('#type' => 'actions');
 114   $form['actions']['submit'] = array('#type' => 'submit', '#value' => t('Save Changes'));
 115   return $form;
 116 }
 117 
 118 /**
 119  * Theme callback for the tabledrag_example_parent_form form.
 120  *
 121  * The theme callback will format the $form data structure into a table and
 122  * add our tabledrag functionality.  (Note that drupal_add_tabledrag should be
 123  * called from the theme layer, and not from a form declaration.  This helps
 124  * keep template files clean and readable, and prevents tabledrag.js from
 125  * being added twice accidently.
 126  *
 127  * @ingroup tabledrag_example
 128  */
 129 function theme_tabledrag_example_parent_form($variables) {
 130   $form = $variables['form'];
 131 
 132   // Initialize the variable which will store our table rows.
 133   $rows = array();
 134 
 135   // Iterate over each element in our $form['example_items'] array.
 136   foreach (element_children($form['example_items']) as $id) {
 137 
 138     // Before we add our 'weight' column to the row, we need to give the
 139     // element a custom class so that it can be identified in the
 140     // drupal_add_tabledrag call.
 141     //
 142     // This could also have been done during the form declaration by adding
 143     // @code
 144     //   '#attributes' => array('class' => 'example-item-weight'),
 145     // @endcode
 146     // directly to the 'weight' element in tabledrag_example_simple_form().
 147     $form['example_items'][$id]['weight']['#attributes']['class'] = array('example-item-weight');
 148 
 149     // In the parent/child example, we must also set this same custom class on
 150     // our id and parent_id columns (which could also have been done within
 151     // the form declaration, as above).
 152     $form['example_items'][$id]['id']['#attributes']['class'] = array('example-item-id');
 153     $form['example_items'][$id]['pid']['#attributes']['class'] = array('example-item-pid');
 154 
 155     // To support the tabledrag behaviour, we need to assign each row of the
 156     // table a class attribute of 'draggable'. This will add the 'draggable'
 157     // class to the <tr> element for that row when the final table is
 158     // rendered.
 159     $class = array('draggable');
 160 
 161     // We can add the 'tabledrag-root' class to a row in order to indicate
 162     // that the row may not be nested under a parent row.  In our sample data
 163     // for this example, the description for the item with id '8' flags it as
 164     // a 'root' item which should not be nested.
 165     if ($id == '8') {
 166       $class[] = 'tabledrag-root';
 167     }
 168 
 169     // We can add the 'tabledrag-leaf' class to a row in order to indicate
 170     // that the row may not contain child rows.  In our sample data for this
 171     // example, the description for the item with id '9' flags it as a 'leaf'
 172     // item which can not contain child items.
 173     if ($id == '9') {
 174       $class[] = 'tabledrag-leaf';
 175     }
 176 
 177     // If this is a child element, we need to add some indentation to the row,
 178     // so that it appears nested under its parent.  Our $depth parameter was
 179     // calculated while building the tree in tabledrag_example_parent_get_data
 180     $indent = theme('indentation', array('size' => $form['example_items'][$id]['depth']['#value']));
 181     unset($form['example_items'][$id]['depth']);
 182 
 183     // We are now ready to add each element of our $form data to the $rows
 184     // array, so that they end up as individual table cells when rendered
 185     // in the final table.  We run each element through the drupal_render()
 186     // function to generate the final html markup for that element.
 187     $rows[] = array(
 188       'data' => array(
 189         // Add our 'name' column, being sure to include our indentation.
 190         $indent . drupal_render($form['example_items'][$id]['name']),
 191         // Add our 'description' column.
 192         drupal_render($form['example_items'][$id]['description']),
 193         // Add our 'weight' column.
 194         drupal_render($form['example_items'][$id]['weight']),
 195         // Add our hidden 'id' column.
 196         drupal_render($form['example_items'][$id]['id']),
 197         // Add our hidden 'parent id' column.
 198         drupal_render($form['example_items'][$id]['pid']),
 199       ),
 200       // To support the tabledrag behaviour, we need to assign each row of the
 201       // table a class attribute of 'draggable'. This will add the 'draggable'
 202       // class to the <tr> element for that row when the final table is
 203       // rendered.
 204       'class' => $class,
 205     );
 206   }
 207 
 208   // We now define the table header values.  Ensure that the 'header' count
 209   // matches the final column count for your table.
 210   //
 211   // Normally, we would hide the headers on our hidden columns, but we are
 212   // leaving them visible in this example.
 213   // $header = array(t('Name'), t('Description'), '', '', '');
 214   $header = array(t('Name'), t('Description'), t('Weight'), t('ID'), t('PID'));
 215 
 216   // We also need to pass the drupal_add_tabledrag() function an id which will
 217   // be used to identify the <table> element containing our tabledrag form.
 218   // Because an element's 'id' should be unique on a page, make sure the value
 219   // you select is NOT the same as the form ID used in your form declaration.
 220   $table_id = 'example-items-table';
 221 
 222   // We can render our tabledrag table for output.
 223   $output = theme('table', array(
 224     'header' => $header,
 225     'rows' => $rows,
 226     'attributes' => array('id' => $table_id),
 227   ));
 228 
 229   // And then render any remaining form elements (such as our submit button).
 230   $output .= drupal_render_children($form);
 231 
 232   // We now call the drupal_add_tabledrag() function in order to add the
 233   // tabledrag.js goodness onto our page.
 234   //
 235   // For our parent/child tree table, we need to pass it:
 236   // - the $table_id of our <table> element (example-items-table),
 237   // - the $action to be performed on our form items ('match'),
 238   // - a string describing where $action should be applied ('parent'),
 239   // - the $group value (pid column) class name ('example-item-pid'),
 240   // - the $subgroup value (pid column) class name ('example-item-pid'),
 241   // - the $source value (id column) class name ('example-item-id'),
 242   // - an optional $hidden flag identifying if the columns should be hidden,
 243   // - an optional $limit parameter to control the max parenting depth.
 244   drupal_add_tabledrag($table_id, 'match', 'parent', 'example-item-pid', 'example-item-pid', 'example-item-id', FALSE);
 245 
 246   // Because we also want to sort in addition to providing parenting, we call
 247   // the drupal_add_tabledrag function again, instructing it to update the
 248   // weight field as items at the same level are re-ordered.
 249   drupal_add_tabledrag($table_id, 'order', 'sibling', 'example-item-weight', NULL, NULL, FALSE);
 250 
 251   return $output;
 252 }
 253 
 254 /**
 255  * Submit callback for the tabledrag_example_parent_form form.
 256  *
 257  * Updates the 'weight' column for each element in our table, taking into
 258  * account that item's new order after the drag and drop actions have been
 259  * performed.
 260  *
 261  * @ingroup tabledrag_example
 262  */
 263 function tabledrag_example_parent_form_submit($form, &$form_state) {
 264   // Because the form elements were keyed with the item ids from the database,
 265   // we can simply iterate through the submitted values.
 266   foreach ($form_state['values']['example_items'] as $id => $item) {
 267     db_query(
 268       "UPDATE {tabledrag_example} SET weight = :weight, pid = :pid WHERE id = :id",
 269       array(':weight' => $item['weight'], ':pid' => $item['pid'], ':id' => $id)
 270     );
 271   }
 272 }
 273 
 274 /**
 275  * Retrives the tree structure from database, and sorts by parent/child/weight.
 276  *
 277  * The sorting should result in children items immediately following their
 278  * parent items, with items at the same level of the hierarchy sorted by
 279  * weight.
 280  *
 281  * The approach used here may be considered too database-intensive.
 282  * Optimization of the approach is left as an exercise for the reader. :)
 283  *
 284  * @ingroup tabledrag_example
 285  */
 286 function tabledrag_example_parent_get_data() {
 287   // Get all 'root node' items (items with no parents), sorted by weight.
 288   $rootnodes = db_query('SELECT id, name, description, weight, pid
 289                        FROM {tabledrag_example}
 290                        WHERE (pid = 0)
 291                        ORDER BY weight ASC');
 292   // Initialize a variable to store our ordered tree structure.
 293   $itemtree = array();
 294   // Depth will be incremented in our _get_tree() function for the first
 295   // parent item, so we start it at -1.
 296   $depth = -1;
 297   // Loop through the root nodes, and add their trees to the array.
 298   foreach ($rootnodes as $parent) {
 299     tabledrag_example_get_tree($parent, $itemtree, $depth);
 300   }
 301   return $itemtree;
 302 }
 303 
 304 /**
 305  * Recursively adds to the $itemtree array, ordered by parent/child/weight.
 306  *
 307  * @ingroup tabledrag_example
 308  */
 309 function tabledrag_example_get_tree($parentitem, &$itemtree = array(), &$depth = 0) {
 310   // Increase our $depth value by one.
 311   $depth++;
 312   // Set the current tree 'depth' for this item, used to calculate indentation.
 313   $parentitem->depth = $depth;
 314   // Add the parent item to the tree.
 315   $itemtree[$parentitem->id] = $parentitem;
 316   // Retrieve each of the children belonging to this parent.
 317   $children = db_query('SELECT id, name, description, weight, pid
 318                       FROM {tabledrag_example}
 319                       WHERE (pid = :pid)
 320                       ORDER BY weight ASC',
 321                       array(':pid' => $parentitem->id));
 322   foreach ($children as $child) {
 323     // Make sure this child does not already exist in the tree, to avoid loops.
 324     if (!in_array($child->id, array_keys($itemtree))) {
 325       // Add this child's tree to the $itemtree array.
 326       tabledrag_example_get_tree($child, $itemtree, $depth);
 327     }
 328   }
 329   // Finished processing this tree branch.  Decrease our $depth value by one
 330   // to represent moving to the next branch.
 331   $depth--;
 332   // Return.
 333   return;
 334 }
";i:1;N;i:2;N;}i:2;i:8036;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:23663;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"tabledrag_example_simple_form.inc";i:1;i:2;i:2;i:23663;}i:2;i:23663;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:23663;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:7734:"
   1 <?php
   2 /**
   3  * @file
   4  * Example demonstrating a simple (i.e. 'sort' only) tabledrag form
   5  */
   6 
   7 /**
   8  * Build the tabledrag_simple_example_form form.
   9  *
  10  * @return
  11  *   A form array set for theming by theme_tabledrag_example_simple_form()
  12  *
  13  * @ingroup tabledrag_example
  14  */
  15 function tabledrag_example_simple_form($form_state) {
  16   // Identify that the elements in 'example_items' are a collection, to
  17   // prevent Form API from flattening the array when submitted.
  18   $form['example_items']['#tree'] = TRUE;
  19 
  20   // Fetch the example data from the database, ordered by weight ascending.
  21   //
  22   // This query excludes the last two tabledrag_example database rows, as
  23   // they are intended only for the 'parent/child' tabledrag examples.
  24   $result = db_query('SELECT id, name, description, weight FROM {tabledrag_example} WHERE id < 8 ORDER BY weight ASC');
  25 
  26   // Iterate through each database result.
  27   foreach ($result as $item) {
  28 
  29     // Create a form entry for this item.
  30     //
  31     // Each entry will be an array using the the unique id for that item as
  32     // the array key, and an array of table row data as the value.
  33     $form['example_items'][$item->id] = array(
  34 
  35       // We'll use a form element of type '#markup' to display the item name.
  36       'name' => array(
  37         '#markup' => check_plain($item->name),
  38       ),
  39 
  40       // We'll use a form element of type '#textfield' to display the item
  41       // description, which will allow the value to be changed via the form.
  42       // We limit the input to 255 characters, which is the limit we set on
  43       // the database field.
  44       'description' => array(
  45         '#type' => 'textfield',
  46         '#default_value' => check_plain($item->description),
  47         '#size' => 20,
  48         '#maxlength' => 255,
  49       ),
  50 
  51       // The 'weight' field will be manipulated as we move the items around in
  52       // the table using the tabledrag activity.  We use the 'weight' element
  53       // defined in Drupal's Form API.
  54       'weight' => array(
  55         '#type' => 'weight',
  56         '#title' => t('Weight'),
  57         '#default_value' => $item->weight,
  58         '#delta' => 10,
  59         '#title-display' => 'invisible',
  60       ),
  61     );
  62   }
  63 
  64   // Now we add our submit button, for submitting the form results.
  65   //
  66   // The 'actions' wrapper used here isn't strictly necessary for tabledrag,
  67   // but is included as a Form API recommended practice.
  68   $form['actions'] = array('#type' => 'actions');
  69   $form['actions']['submit'] = array('#type' => 'submit', '#value' => t('Save Changes'));
  70   return $form;
  71 }
  72 
  73 /**
  74  * Theme callback for the tabledrag_example_simple_form form.
  75  *
  76  * The theme callback will format the $form data structure into a table and
  77  * add our tabledrag functionality.  (Note that drupal_add_tabledrag should be
  78  * called from the theme layer, and not from a form declaration.  This helps
  79  * keep template files clean and readable, and prevents tabledrag.js from
  80  * being added twice accidently.
  81  *
  82  * @return
  83  *   The rendered tabledrag form
  84  *
  85  * @ingroup tabledrag_example
  86  */
  87 function theme_tabledrag_example_simple_form($variables) {
  88   $form = $variables['form'];
  89 
  90   // Initialize the variable which will store our table rows.
  91   $rows = array();
  92 
  93   // Iterate over each element in our $form['example_items'] array.
  94   foreach (element_children($form['example_items']) as $id) {
  95 
  96     // Before we add our 'weight' column to the row, we need to give the
  97     // element a custom class so that it can be identified in the
  98     // drupal_add_tabledrag call.
  99     //
 100     // This could also have been done during the form declaration by adding
 101     // '#attributes' => array('class' => 'example-item-weight'),
 102     // directy to the 'weight' element in tabledrag_example_simple_form().
 103     $form['example_items'][$id]['weight']['#attributes']['class'] = array('example-item-weight');
 104 
 105     // We are now ready to add each element of our $form data to the $rows
 106     // array, so that they end up as individual table cells when rendered
 107     // in the final table.  We run each element through the drupal_render()
 108     // function to generate the final html markup for that element.
 109     $rows[] = array(
 110       'data' => array(
 111         // Add our 'name' column.
 112         drupal_render($form['example_items'][$id]['name']),
 113         // Add our 'description' column.
 114         drupal_render($form['example_items'][$id]['description']),
 115         // Add our 'weight' column.
 116         drupal_render($form['example_items'][$id]['weight']),
 117       ),
 118       // To support the tabledrag behaviour, we need to assign each row of the
 119       // table a class attribute of 'draggable'. This will add the 'draggable'
 120       // class to the <tr> element for that row when the final table is
 121       // rendered.
 122       'class' => array('draggable'),
 123     );
 124   }
 125 
 126   // We now define the table header values.  Ensure that the 'header' count
 127   // matches the final column count for your table.
 128   $header = array(t('Name'), t('Description'), t('Weight'));
 129 
 130   // We also need to pass the drupal_add_tabledrag() function an id which will
 131   // be used to identify the <table> element containing our tabledrag form.
 132   // Because an element's 'id' should be unique on a page, make sure the value
 133   // you select is NOT the same as the form ID used in your form declaration.
 134   $table_id = 'example-items-table';
 135 
 136   // We can render our tabledrag table for output.
 137   $output = theme('table', array(
 138     'header' => $header,
 139     'rows' => $rows,
 140     'attributes' => array('id' => $table_id),
 141   ));
 142 
 143   // And then render any remaining form elements (such as our submit button).
 144   $output .= drupal_render_children($form);
 145 
 146   // We now call the drupal_add_tabledrag() function in order to add the
 147   // tabledrag.js goodness onto our page.
 148   //
 149   // For a basic sortable table, we need to pass it:
 150   // - the $table_id of our <table> element,
 151   // - the $action to be performed on our form items ('order'),
 152   // - a string describing where $action should be applied ('siblings'),
 153   // - and the class of the element containing our 'weight' element.
 154   drupal_add_tabledrag($table_id, 'order', 'sibling', 'example-item-weight');
 155 
 156   return $output;
 157 }
 158 
 159 /**
 160  * Submit callback for the tabledrag_example_simple_form form.
 161  *
 162  * Updates the 'weight' column for each element in our table, taking into
 163  * account that item's new order after the drag and drop actions have been
 164  * performed.
 165  *
 166  * @ingroup tabledrag_example
 167  */
 168 function tabledrag_example_simple_form_submit($form, &$form_state) {
 169   // Because the form elements were keyed with the item ids from the database,
 170   // we can simply iterate through the submitted values.
 171   foreach ($form_state['values']['example_items'] as $id => $item) {
 172     db_query(
 173       "UPDATE {tabledrag_example} SET weight = :weight WHERE id = :id",
 174       array(':weight' => $item['weight'], ':id' => $id)
 175     );
 176   }
 177 }
";i:1;N;i:2;N;}i:2;i:23714;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31456;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:31456;}}