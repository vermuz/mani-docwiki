a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Vertical Tabs Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"vertical_tabs_example.info";i:1;i:2;i:2;i:38;}i:2;i:38;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:38;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:162:"
   1 name = Vertical tabs example
   2 description = Show how to use vertical tabs for enhancing user experience.
   3 package = Example modules
   4 core = 7.x
";i:1;N;i:2;N;}i:2;i:82;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:253;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"vertical_tabs_example.js";i:1;i:2;i:2;i:253;}i:2;i:253;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:253;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:904:"
   1 (function ($) {
   2 
   3 /**
   4  * Update the summary for the module's vertical tab.
   5  */
   6 Drupal.behaviors.vertical_tabs_exampleFieldsetSummaries = {
   7   attach: function (context) {
   8     // Use the fieldset class to identify the vertical tab element
   9     $('fieldset#edit-vertical-tabs-example', context).drupalSetSummary(function (context) {
  10       // Depending on the checkbox status, the settings will be customized, so
  11       // update the summary with the custom setting textfield string or a use a
  12       // default string.
  13       if ($('#edit-vertical-tabs-example-enabled', context).attr('checked')) {
  14         return Drupal.checkPlain($('#edit-vertical-tabs-example-custom-setting', context).val());
  15       }
  16       else {
  17         return Drupal.t('Using default');
  18       }
  19     });
  20   }
  21 };
  22 
  23 })(jQuery);
";i:1;N;i:2;N;}i:2;i:295;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1208;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"vertical_tabs_example.module";i:1;i:2;i:2;i:1208;}i:2;i:1208;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1208;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:4711:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Module file for vertical_tabs_example module.
   6  */
   7 
   8 /**
   9  * @defgroup vertical_tabs_example Example: Vertical Tabs
  10  * @ingroup examples
  11  * @{
  12  * Demonstrates the vertical tabs functionality provided by Drupal 7.
  13  *
  14  * This example does not cover how to save or load a custom setting, and only
  15  * deals with the elements visibility and summary in the tab.
  16  *
  17  * @see vertical_tabs_example.js
  18  */
  19 
  20 /**
  21  * Implements hook_menu for a simple explanation page.
  22  */
  23 function vertical_tabs_example_menu() {
  24   $items['examples/vertical_tabs'] = array(
  25     'title' => 'Vertical tabs example',
  26     'description' => 'Shows how vertical tabs can best be supported by a custom module',
  27     'page callback' => '_vertical_tabs_example_explanation',
  28     'access callback' => TRUE,
  29   );
  30   return $items;
  31 }
  32 
  33 /**
  34  * Implement hook_form_alter().
  35  *
  36  * Adds custom fieldset to the node form, and attach ajax behaviour for vertical
  37  * panels to update the settings description.
  38  *
  39  * @see vertical_tabs_example.js
  40  */
  41 function vertical_tabs_example_form_alter(&$form, $form_state, $form_id) {
  42   // Only include on node add/edit forms.
  43   if (!empty($form['#node_edit_form'])) {
  44 
  45     // Create a fieldset that will be included in the vertical tab.
  46     $form['vertical_tabs_example'] = array(
  47       '#type' => 'fieldset',
  48       '#title' => t('Example vertical tab'),
  49       '#collapsible' => TRUE,
  50       '#collapsed' => FALSE,
  51       '#tree' => TRUE,
  52       // Send this tab to the top of the list.
  53       '#weight' => -99,
  54       // The #group value must match the name of the vertical tabs element.
  55       // In most cases, this is 'additional_settings'.
  56       '#group' => 'additional_settings',
  57       // Vertical tabs provide its most usable appearance when they are used to
  58       // include a summary of the information contained in the fieldset. To do
  59       // this, we attach additional JavaScript to handle changing the summary
  60       // when form settings are changed.
  61       '#attached' => array(
  62         'js' => array(
  63           'vertical-tabs' => drupal_get_path('module', 'vertical_tabs_example') . '/vertical_tabs_example.js',
  64         ),
  65       ),
  66     );
  67 
  68     // The form elements below provide a demonstration of how a fieldset
  69     // summary can be displayed in a collapsed tab.
  70 
  71     // This checkbox is used to show or hide the custom settings form using
  72     // javascript (altering states of a container defined later).
  73     $form['vertical_tabs_example']['enabled'] = array(
  74       '#type' => 'checkbox',
  75       '#title' => t('Change this setting'),
  76       '#default_value' => FALSE,
  77     );
  78 
  79     // This container will be used to store the whole form for our custom
  80     // settings. This way, showing/hiding the form using javascript is easier,
  81     // as only one element should be set visible.
  82     $form['vertical_tabs_example']['vertical_tabs_examplecontainer'] = array(
  83       '#type' => 'container',
  84       '#parents' => array('vertical_tabs_example'),
  85       '#states' => array(
  86         'invisible' => array(
  87           // If the checkbox is not enabled, show the container.
  88           'input[name="vertical_tabs_example[enabled]"]' => array('checked' => FALSE),
  89         ),
  90       ),
  91     );
  92 
  93     // The string of this textfield will be shown as summary in the vertical
  94     // tab.
  95     $form['vertical_tabs_example']['vertical_tabs_examplecontainer']['custom_setting'] = array(
  96       '#type' => 'textfield',
  97       '#title' => t('Use this setting instead'),
  98       '#default_value' => 'I am a setting with a summary',
  99       '#description' => t('As you type into this field, the summary will be updated in the tab.'),
 100     );
 101   }
 102 }
 103 
 104 /**
 105  * Simple explanation page.
 106  */
 107 function _vertical_tabs_example_explanation() {
 108   return t("<p>The Vertical Tabs Example shows how a custom module can add a vertical tab to a node edit form, and support its summary field with JavaScript.</p><p>To see the effects of this module, <a href='!node_add'>add a piece of content</a> and look at the set of tabs at the bottom. We've added one called 'Example vertical tab.'</p>", array('!node_add' => url('node/add')));
 109 }
 110 /**
 111  * @} End of "defgroup vertical_tabs_example".
 112  */
";i:1;N;i:2;N;}i:2;i:1254;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5974;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5974;}}