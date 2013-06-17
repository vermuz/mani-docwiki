a:29:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Field Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"field_example.css";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:199:"
   1 /**
   2  * @file
   3  * CSS for Field Example.
   4  */
   5 div.form-item table .form-type-textfield, 
   6 div.form-item table .form-type-textfield * {
   7   display: inline-block;
   8 }
";i:1;N;i:2;N;}i:2;i:66;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:274;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"field_example.info";i:1;i:2;i:2;i:274;}i:2;i:274;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:274;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:178:"
   1 name = Field Example
   2 description = An implementation of a field to show the Field API
   3 package = Example modules
   4 core = 7.x
   5 files[] = field_example.test
";i:1;N;i:2;N;}i:2;i:310;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:497;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"field_example.install";i:1;i:2;i:2;i:497;}i:2;i:497;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:497;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1023:"
   1 <?php
   2 /**
   3  * @file
   4  * Install, update, and uninstall functions for the field_example module.
   5  */
   6 
   7 /**
   8  * Implements hook_field_schema().
   9  *
  10  * Defines the database schema of the field, using the format used by the
  11  * Schema API.
  12  *
  13  * The data we will store here is just one 7-character element, even
  14  * though the widget presents the three portions separately.
  15  *
  16  * All implementations of hook_field_schema() must be in the module's
  17  * .install file.
  18  *
  19  * @see http://drupal.org/node/146939
  20  * @see schemaapi
  21  * @see hook_field_schema()
  22  * @ingroup field_example
  23  */
  24 function field_example_field_schema($field) {
  25   $columns = array(
  26     'rgb' => array('type' => 'varchar', 'length' => 7, 'not null' => FALSE),
  27   );
  28   $indexes = array(
  29     'rgb' => array('rgb'),
  30   );
  31   return array(
  32     'columns' => $columns,
  33     'indexes' => $indexes,
  34   );
  35 }
";i:1;N;i:2;N;}i:2;i:536;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1568;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"field_example.js";i:1;i:2;i:2;i:1568;}i:2;i:1568;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1568;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:826:"
   1 /**
   2  * @file
   3  * Javascript for Field Example.
   4  */
   5 
   6 /**
   7  * Provides a farbtastic colorpicker for the fancier widget.
   8  */
   9 (function ($) {
  10   Drupal.behaviors.field_example_colorpicker = {
  11     attach: function(context) {
  12       $(".edit-field-example-colorpicker").live("focus", function(event) {
  13         var edit_field = this;
  14         var picker = $(this).closest('div').parent().find(".field-example-colorpicker");
  15         
  16         // Hide all color pickers except this one.
  17         $(".field-example-colorpicker").hide();
  18         $(picker).show();
  19         $.farbtastic(picker, function(color) {
  20           edit_field.value = color;
  21         }).setColor(edit_field.value);
  22       });
  23     }
  24   }
  25 })(jQuery);
";i:1;N;i:2;N;}i:2;i:1602;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2437;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"field_example.module";i:1;i:2;i:2;i:2437;}i:2;i:2437;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2437;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15208:"
   1 <?php
   2 /**
   3  * @file
   4  * An example field using the Field Types API.
   5  */
   6 
   7 /**
   8  * @defgroup field_example Example: Field Types API
   9  * @ingroup examples
  10  * @{
  11  * Examples using Field Types API.
  12  *
  13  * This is updated from Barry Jaspan's presentation at Drupalcon Paris,
  14  * @link http://acquia.com/community/resources/acquia-tv/intro-field-api-module-developers Video Presentation @endlink
  15  *
  16  * Providing a field requires:
  17  * - Defining a field:
  18  *   - hook_field_info()
  19  *   - hook_field_schema()
  20  *   - hook_field_validate()
  21  *   - hook_field_is_empty()
  22  *
  23  * - Defining a formatter for the field (the portion that outputs the field for
  24  *   display):
  25  *   - hook_field_formatter_info()
  26  *   - hook_field_formatter_view()
  27  *
  28  * - Defining a widget for the edit form:
  29  *   - hook_field_widget_info()
  30  *   - hook_field_widget_form()
  31  *
  32  * Our module defines the field in field_example_field_info(),
  33  * field_example_field_validate() and field_example_field_is_empty().
  34  * field_example_field_schema() is implemented in field_example.install.
  35  *
  36  * Our module sets up a formatter in field_example_field_formatter_info() and
  37  * field_example_field_formatter_view(). These are the API hooks that present
  38  * formatted and themed output to the user.
  39 
  40  * And finally, our module defines the widet in
  41  * field_example_field_widget_info() and field_example_field_widget_form().
  42  * The widget is the form element used to receive input from the user
  43  * when the field is being populated.
  44  *
  45  * @see field_types
  46  * @see field
  47  */
  48 
  49 /***************************************************************
  50  * Field Type API hooks
  51  ***************************************************************/
  52 
  53 /**
  54  * Implements hook_field_info().
  55  *
  56  * Provides the description of the field.
  57  */
  58 function field_example_field_info() {
  59   return array(
  60     // We name our field as the associative name of the array.
  61     'field_example_rgb' => array(
  62       'label' => t('Example Color RGB'),
  63       'description' => t('Demonstrates a field composed of an RGB color.'),
  64       'default_widget' => 'field_example_3text',
  65       'default_formatter' => 'field_example_simple_text',
  66     ),
  67   );
  68 }
  69 
  70 /**
  71  * Implements hook_field_validate().
  72  *
  73  * This hook gives us a chance to validate content that's in our
  74  * field. We're really only interested in the $items parameter, since
  75  * it holds arrays representing content in the field we've defined.
  76  * We want to verify that the items only contain RGB hex values like
  77  * this: #RRGGBB. If the item validates, we do nothing. If it doesn't
  78  * validate, we add our own error notification to the $errors parameter.
  79  *
  80  * @see field_example_field_widget_error()
  81  */
  82 function field_example_field_validate($entity_type, $entity, $field, $instance, $langcode, $items, &$errors) {
  83   foreach ($items as $delta => $item) {
  84     if (!empty($item['rgb'])) {
  85       if (! preg_match('@^#[0-9a-f]{6}$@', $item['rgb'])) {
  86         $errors[$field['field_name']][$langcode][$delta][] = array(
  87           'error' => 'field_example_invalid',
  88           'message' => t('Color must be in the HTML format #abcdef.'),
  89         );
  90       }
  91     }
  92   }
  93 }
  94 
  95 
  96 /**
  97  * Implements hook_field_is_empty().
  98  *
  99  * hook_field_is_emtpy() is where Drupal asks us if this field is empty.
 100  * Return TRUE if it does not contain data, FALSE if it does. This lets
 101  * the form API flag an error when required fields are empty.
 102  */
 103 function field_example_field_is_empty($item, $field) {
 104   return empty($item['rgb']);
 105 }
 106 
 107 /**
 108  * Implements hook_field_formatter_info().
 109  *
 110  * We need to tell Drupal that we have two different types of formatters
 111  * for this field. One will change the text color, and the other will
 112  * change the background color.
 113  *
 114  * @see field_example_field_formatter_view()
 115  */
 116 function field_example_field_formatter_info() {
 117   return array(
 118     // This formatter just displays the hex value in the color indicated.
 119     'field_example_simple_text' => array(
 120       'label' => t('Simple text-based formatter'),
 121       'field types' => array('field_example_rgb'),
 122     ),
 123     // This formatter changes the background color of the content region.
 124     'field_example_color_background' => array(
 125       'label' => t('Change the background of the output text'),
 126       'field types' => array('field_example_rgb'),
 127     ),
 128   );
 129 }
 130 
 131 /**
 132  * Implements hook_field_formatter_view().
 133  *
 134  * Two formatters are implemented.
 135  * - field_example_simple_text just outputs markup indicating the color that
 136  *   was entered and uses an inline style to set the text color to that value.
 137  * - field_example_color_background does the same but also changes the
 138  *   background color of div.region-content.
 139  *
 140  * @see field_example_field_formatter_info()
 141  */
 142 function field_example_field_formatter_view($entity_type, $entity, $field, $instance, $langcode, $items, $display) {
 143   $element = array();
 144 
 145   switch ($display['type']) {
 146     // This formatter simply outputs the field as text and with a color.
 147     case 'field_example_simple_text':
 148       foreach ($items as $delta => $item) {
 149         $element[$delta] = array(
 150           // We create a render array to produce the desired markup,
 151           // "<p style="color: #hexcolor">The color code ... #hexcolor</p>".
 152           // See theme_html_tag().
 153           '#type' => 'html_tag',
 154           '#tag' => 'p',
 155           '#attributes' => array(
 156             'style' => 'color: ' . $item['rgb'],
 157           ),
 158           '#value' => t('The color code in this field is @code', array('@code' => $item['rgb'])),
 159         );
 160       }
 161       break;
 162 
 163     // This formatter adds css to the page changing the '.region-content' area's
 164     // background color. If there are many fields, the last one will win.
 165     case 'field_example_color_background':
 166       foreach ($items as $delta => $item) {
 167         $element[$delta] = array(
 168           '#type' => 'html_tag',
 169           '#tag' => 'p',
 170           '#value' => t('The content area color has been changed to @code', array('@code' => $item['rgb'])),
 171           '#attached' => array(
 172             'css' => array(
 173               array(
 174                 'data' => 'div.region-content { background-color:' . $item['rgb'] . ';}',
 175                 'type' => 'inline',
 176               ),
 177             ),
 178           ),
 179         );
 180       }
 181       break;
 182   }
 183 
 184   return $element;
 185 }
 186 
 187 /**
 188  * Implements hook_field_widget_info().
 189  *
 190  * Three widgets are provided.
 191  * - A simple text-only widget where the user enters the '#ffffff'.
 192  * - A 3-textfield widget that gathers the red, green, and blue values
 193  *   separately.
 194  * - A farbtastic colorpicker widget that chooses the value graphically.
 195  *
 196  * These widget types will eventually show up in hook_field_widget_form,
 197  * where we will have to flesh them out.
 198  *
 199  * @see field_example_field_widget_form()
 200  */
 201 function field_example_field_widget_info() {
 202   return array(
 203     'field_example_text' => array(
 204       'label' => t('RGB value as #ffffff'),
 205       'field types' => array('field_example_rgb'),
 206     ),
 207     'field_example_3text' => array(
 208        'label' => t('RGB text field'),
 209        'field types' => array('field_example_rgb'),
 210     ),
 211     'field_example_colorpicker' => array(
 212       'label' => t('Color Picker'),
 213       'field types' => array('field_example_rgb'),
 214     ),
 215   );
 216 }
 217 
 218 /**
 219  * Implements hook_field_widget_form().
 220  *
 221  * hook_widget_form() is where Drupal tells us to create form elements for
 222  * our field's widget.
 223  *
 224  * We provide one of three different forms, depending on the widget type of
 225  * the Form API item provided.
 226  *
 227  * The 'field_example_colorpicker' and 'field_example_text' are essentially
 228  * the same, but field_example_colorpicker adds a javascript colorpicker
 229  * helper.
 230  *
 231  * field_example_3text displays three text fields, one each for red, green,
 232  * and blue. However, the field type defines a single text column,
 233  * rgb, which needs an HTML color spec. Define an element validate
 234  * handler that converts our r, g, and b fields into a simulated single
 235  * 'rgb' form element.
 236  */
 237 function field_example_field_widget_form(&$form, &$form_state, $field, $instance, $langcode, $items, $delta, $element) {
 238   $value = isset($items[$delta]['rgb']) ? $items[$delta]['rgb'] : '';
 239 
 240   $widget = $element;
 241   $widget['#delta'] = $delta;
 242 
 243   switch ($instance['widget']['type']) {
 244 
 245     case 'field_example_colorpicker':
 246       $widget += array(
 247         '#suffix' => '<div class="field-example-colorpicker"></div>',
 248         '#attributes' => array('class' => array('edit-field-example-colorpicker')),
 249         '#attached' => array(
 250           // Add Farbtastic color picker.
 251           'library' => array(
 252             array('system', 'farbtastic'),
 253           ),
 254           // Add javascript to trigger the colorpicker.
 255           'js' => array(drupal_get_path('module', 'field_example') . '/field_example.js'),
 256         ),
 257       );
 258 
 259     // DELIBERATE fall-through: From here on the field_example_text and
 260     // field_example_colorpicker are exactly the same.
 261     case 'field_example_text':
 262       $widget += array(
 263         '#type' => 'textfield',
 264         '#default_value' => $value,
 265         // Allow a slightly larger size that the field length to allow for some
 266         // configurations where all characters won't fit in input field.
 267         '#size' => 7,
 268         '#maxlength' => 7,
 269       );
 270       break;
 271 
 272     case 'field_example_3text':
 273       // Convert rgb value into r, g, and b for #default_value.
 274       if (!empty($value)) {
 275         preg_match_all('@..@', substr($value, 1), $match);
 276       }
 277       else {
 278         $match = array(array());
 279       }
 280 
 281       // Make this a fieldset with the three text fields.
 282       $widget += array(
 283         '#type' => 'fieldset',
 284         '#element_validate' => array('field_example_3text_validate'),
 285 
 286         // #delta is set so that the validation function will be able
 287         // to access external value information which otherwise would be
 288         // unavailable.
 289         '#delta' => $delta,
 290 
 291         '#attached' => array(
 292           'css' => array(drupal_get_path('module', 'field_example') . '/field_example.css'),
 293         ),
 294       );
 295 
 296       // Create a textfield for saturation values for Red, Green, and Blue.
 297       foreach (array('r' => t('Red'), 'g' => t('Green'), 'b' => t('Blue')) as $key => $title) {
 298         $widget[$key] = array(
 299           '#type' => 'textfield',
 300           '#title' => $title,
 301           '#size' => 2,
 302           '#default_value' => array_shift($match[0]),
 303           '#attributes' => array('class' => array('rgb-entry')),
 304           '#description' => t('The 2-digit hexadecimal representation of @color saturation, like "a1" or "ff"', array('@color' => $title)),
 305         );
 306         // Since Form API doesn't allow a fieldset to be required, we
 307         // have to require each field element individually.
 308         if ($instance['required'] == 1) $widget[$key]['#required'] = 1;
 309       }
 310       break;
 311 
 312   }
 313 
 314   $element['rgb'] = $widget;
 315   return $element;
 316 }
 317 
 318 
 319 /**
 320  * Validate the individual fields and then convert them into a single HTML RGB
 321  * value as text.
 322  */
 323 function field_example_3text_validate($element, &$form_state) {
 324   $delta = $element['#delta']; // TODO: Isn't there a better way to find out which element?
 325   $field = $form_state['field'][$element['#field_name']][$element['#language']]['field'];
 326   $field_name = $field['field_name'];
 327   if (isset($form_state['values'][$field_name][$element['#language']][$delta]['rgb'])) {
 328     $values = $form_state['values'][$field_name][$element['#language']][$delta]['rgb'];
 329     foreach (array('r', 'g', 'b') as $colorfield) {
 330       $colorfield_value = hexdec($values[$colorfield]);
 331       // If they left any empty, we'll set the value empty and quit.
 332       if (strlen($values[$colorfield]) == 0) {
 333         form_set_value($element, '', $form_state);
 334         return;
 335       }
 336       // If they gave us anything that's not hex, reject it.
 337       if ( (strlen($values[$colorfield]) != 2) || $colorfield_value < 0 || $colorfield_value > 255) {
 338         form_error($element[$colorfield], t("Saturation value must be a 2-digit hexadecimal value between 00 and ff."));
 339       }
 340     }
 341 
 342     $value = sprintf('#%02s%02s%02s', $values['r'], $values['g'], $values['b']);
 343     form_set_value($element, $value, $form_state);
 344   }
 345 }
 346 
 347 /**
 348  * Implements hook_field_widget_error().
 349  *
 350  * hook_field_widget_error() lets us figure out what to do with errors
 351  * we might have generated in hook_field_validate(). Generally, we'll just
 352  * call form_error().
 353  *
 354  * @see field_example_field_validate()
 355  * @see form_error()
 356  */
 357 function field_example_field_widget_error($element, $error, $form, &$form_state) {
 358   switch ($error['error']) {
 359     case 'field_example_invalid':
 360       form_error($element, $error['message']);
 361       break;
 362   }
 363 }
 364 
 365 
 366 /**
 367  * Implements hook_menu().
 368  *
 369  * Provides a simple user interface that tells the developer where to go.
 370  */
 371 function field_example_menu() {
 372   $items['examples/field_example'] = array(
 373     'title' => 'Field Example',
 374     'page callback' => '_field_example_page',
 375     'access callback' => TRUE,
 376   );
 377   return $items;
 378 }
 379 
 380 /**
 381  * A simple page to explain to the developer what to do.
 382  */
 383 function _field_example_page() {
 384   return t("The Field Example provides a field composed of an HTML RGB value, like #ff00ff. To use it, add the field to a content type.");
 385 }
 386 /**
 387  * @} End of "defgroup field_example".
 388  */
";i:1;N;i:2;N;}i:2;i:2475;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17692;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"field_example.test";i:1;i:2;i:2;i:17692;}i:2;i:17692;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:17692;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:7233:"
   1 <?php
   2 /**
   3  * @file
   4  * Tests for Field Example.
   5  */
   6 
   7 class FieldExampleTest extends DrupalWebTestCase {
   8 
   9   public static function getInfo() {
  10     return array(
  11       'name' => 'Field Example',
  12       'description' => 'Create a content type with example_field_rgb fields, create a node, check for correct values.',
  13       'group' => 'Examples',
  14     );
  15   }
  16   function setUp() {
  17     // Enable the email_example module.
  18     parent::setUp(array('field_ui', 'field_example'));
  19   }
  20 
  21   /**
  22    * Test basic functionality of the example field.
  23    *
  24    * - Creates a content type.
  25    * - Adds a single-valued field_example_rgb to it.
  26    * - Adds a multivalued field_example_rgb to it.
  27    * - Creates a node of the new type.
  28    * - Populates the single-valued field.
  29    * - Populates the multivalued field with two items.
  30    * - Tests the result.
  31    */
  32   function testExampleFieldBasic() {
  33     $content_type_machine = strtolower($this->randomName(10));
  34     $title = $this->randomName(20);
  35 
  36     // Create and login user.
  37     $account = $this->drupalCreateUser(array('administer content types'));
  38     $this->drupalLogin($account);
  39 
  40     $this->drupalGet('admin/structure/types');
  41 
  42     // Create the content type.
  43     $this->clickLink(t('Add content type'));
  44 
  45     $edit = array(
  46       'name' => $content_type_machine,
  47       'type' => $content_type_machine,
  48     );
  49     $this->drupalPost(NULL, $edit, t('Save and add fields'));
  50     $this->assertText(t('The content type @name has been added.', array('@name' => $content_type_machine)));
  51 
  52     $single_text_field = strtolower($this->randomName(10));
  53     $single_colorpicker_field = strtolower($this->randomName(10));
  54     $single_3text_field = strtolower($this->randomName(10));
  55     $multivalue_3text_field = strtolower($this->randomName(10));
  56 
  57     // Description of fields to be created;
  58     $fields[$single_text_field] = array(
  59       'widget' => 'field_example_text',
  60       'cardinality' => '1',
  61     );
  62     $fields[$single_colorpicker_field] = array(
  63       'widget' => 'field_example_colorpicker',
  64       'cardinality' => 1,
  65     );
  66     $fields[$single_3text_field] = array(
  67       'widget' => 'field_example_3text',
  68       'cardinality' => 1,
  69     );
  70     $fields[$multivalue_3text_field] = array(
  71       'widget' => 'field_example_3text',
  72       'cardinality' => -1,
  73     );
  74 
  75     foreach ($fields as $fieldname => $details) {
  76       $this->create_field($fieldname, $details['widget'], $details['cardinality']);
  77     }
  78 
  79     // Somehow clicking "save" isn't enough, and we have to do a
  80     // node_types_rebuild().
  81     node_types_rebuild();
  82     menu_rebuild();
  83     $type_exists = db_query('SELECT 1 FROM {node_type} WHERE type = :type', array(':type' => $content_type_machine))->fetchField();
  84     $this->assertTrue($type_exists, 'The new content type has been created in the database.');
  85 
  86     $permission = 'create ' . $content_type_machine . ' content';
  87     // Reset the permissions cache.
  88     $this->checkPermissions(array($permission), TRUE);
  89 
  90     // Now that we have a new content type, create a user that has privileges
  91     // on the content type.
  92     $account = $this->drupalCreateUser(array($permission));
  93     $this->drupalLogin($account);
  94 
  95     $this->drupalGet('node/add/' . $content_type_machine);
  96 
  97     // Add a node.
  98     $edit = array(
  99       'title' => $title,
 100       'field_' . $single_text_field . '[und][0][rgb]' => '#000001',
 101       'field_' . $single_colorpicker_field . '[und][0][rgb]' => '#000002',
 102 
 103       'field_' . $single_3text_field . '[und][0][rgb][r]' => '00',
 104       'field_' . $single_3text_field . '[und][0][rgb][g]' => '00',
 105       'field_' . $single_3text_field . '[und][0][rgb][b]' => '03',
 106 
 107       'field_' . $multivalue_3text_field . '[und][0][rgb][r]' => '00',
 108       'field_' . $multivalue_3text_field . '[und][0][rgb][g]' => '00',
 109       'field_' . $multivalue_3text_field . '[und][0][rgb][b]' => '04',
 110 
 111     );
 112     // We want to add a 2nd item to the multivalue field, so hit "add another".
 113     $this->drupalPost(NULL, $edit, t('Add another item'));
 114 
 115     $edit = array(
 116       'field_' . $multivalue_3text_field . '[und][1][rgb][r]' => '00',
 117       'field_' . $multivalue_3text_field . '[und][1][rgb][g]' => '00',
 118       'field_' . $multivalue_3text_field . '[und][1][rgb][b]' => '05',
 119     );
 120     // Now we can fill in the second item in the multivalue field and save.
 121     $this->drupalPost(NULL, $edit, t('Save'));
 122     $this->assertText(t('@content_type_machine @title has been created', array('@content_type_machine' => $content_type_machine, '@title' => $title)));
 123 
 124 
 125     $output_strings = $this->xpath("//div[contains(@class,'field-type-field-example-rgb')]/div/div/p/text()");
 126 
 127     $this->assertEqual((string)$output_strings[0], "The color code in this field is #000001");
 128     $this->assertEqual((string)$output_strings[1], "The color code in this field is #000002");
 129     $this->assertEqual((string)$output_strings[2], "The color code in this field is #000003");
 130     $this->assertEqual((string)$output_strings[3], "The color code in this field is #000004");
 131     $this->assertEqual((string)$output_strings[4], "The color code in this field is #000005");
 132   }
 133 
 134   /**
 135    * Utility function to create fields on a content type.
 136    * @param $field_name
 137    *   Name of the field, like field_something
 138    * @param $widget_type
 139    *   Widget type, like field_example_3text
 140    * @param $cardinality
 141    *   Cardinality
 142    */
 143   protected function create_field($field_name, $widget_type, $cardinality) {
 144         // Add a singleton field_example_text field.
 145     $edit = array(
 146       'fields[_add_new_field][label]' => $field_name,
 147       'fields[_add_new_field][field_name]' => $field_name,
 148       'fields[_add_new_field][type]' => 'field_example_rgb',
 149       'fields[_add_new_field][widget_type]' => $widget_type,
 150 
 151     );
 152     $this->drupalPost(NULL, $edit, t('Save'));
 153 
 154     // There are no settings for this, so just press the button.
 155     $this->drupalPost(NULL, array(), t('Save field settings'));
 156 
 157     $edit = array('field[cardinality]' => (string)$cardinality);
 158 
 159     // Using all the default settings, so press the button.
 160     $this->drupalPost(NULL, $edit, t('Save settings'));
 161     debug(t('Saved settings for field %field_name with widget %widget_type and cardinality %cardinality', array('%field_name' => $field_name, '%widget_type' => $widget_type, '%cardinality' => $cardinality)));
 162     $this->assertText(t('Saved @name configuration.', array('@name' => $field_name)));
 163   }
 164 }
";i:1;N;i:2;N;}i:2;i:17728;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24969;}i:28;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:24969;}}