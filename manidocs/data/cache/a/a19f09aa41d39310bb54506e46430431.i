a:21:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"RDF Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:28;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"rdf_example.info";i:1;i:2;i:2;i:28;}i:2;i:28;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:28;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:178:"
   1 name = RDF Example
   2 description = Demonstrates an RDF mapping using the RDF mapping API.
   3 package = Example modules
   4 core = 7.x
   5 files[] = rdf_example.test
";i:1;N;i:2;N;}i:2;i:62;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:249;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"rdf_example.install";i:1;i:2;i:2;i:249;}i:2;i:249;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:249;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3980:"
   1 <?php
   2 /**
   3  * @file
   4  * Install file for RDF Example module.
   5  *
   6  * To demonstrate hook_rdf_mapping, this module creates it's own node type. For
   7  * more information on creating node types, see Node Example.
   8  */
   9 
  10 /**
  11  * Implements hook_install().
  12  *
  13  * - Create photo, summary fields.
  14  * - Create photo, summary instances.
  15  *
  16  * @see node_type_set_defaults()
  17  * @see field_info_instance()
  18  * @see field_update_instance()
  19  * @see field_create_field()
  20  * @see field_create_instance()
  21  *
  22  * @ingroup rdf_example
  23  */
  24 function rdf_example_install() {
  25   // use get_t() to get the name of our localization function for translation
  26   // during install, when t() is not available.
  27   $t = get_t();
  28 
  29   // Define the node type.
  30   $rdf_example = array(
  31     'type' => 'recipe',
  32     'name' => $t('Recipe'),
  33     'base' => 'node_content',
  34     'description' => $t('The recipe node is defined to demonstrate RDF mapping.'),
  35   );
  36 
  37   // Set additional defaults and save the content type.
  38   $content_type = node_type_set_defaults($rdf_example);
  39   node_type_save($content_type);
  40 
  41   // Create all the fields we are adding to our content type.
  42   // http://api.drupal.org/api/function/field_create_field/7
  43   foreach (_rdf_example_installed_fields() as $field) {
  44     field_create_field($field);
  45   }
  46 
  47   // Create all the instances for our fields.
  48   // http://api.drupal.org/api/function/field_create_instance/7
  49   foreach (_rdf_example_installed_instances() as $instance) {
  50     $instance['entity_type'] = 'node';
  51     $instance['bundle'] = $rdf_example['type'];
  52     field_create_instance($instance);
  53   }
  54 }
  55 
  56 /**
  57  * Return a structured array defining the fields created by this content type.
  58  *
  59  * @ingroup rdf_example
  60  */
  61 function _rdf_example_installed_fields() {
  62   $t = get_t();
  63   return array(
  64     'recipe_photo' => array(
  65       'field_name' => 'recipe_photo',
  66       'cardinality' => 1,
  67       'type'        => 'image',
  68     ),
  69     'recipe_summary' => array(
  70       'field_name'  => 'recipe_summary',
  71       'cardinality' => 1,
  72       'type'        => 'text',
  73       'settings'    => array(
  74         'max_length' => 500,
  75       ),
  76     ),
  77   );
  78 }
  79 
  80 /**
  81  * Return a structured array defining the instances for this content type.
  82  *
  83  * @ingroup rdf_example
  84  */
  85 function _rdf_example_installed_instances() {
  86   $t = get_t();
  87   return array(
  88     'recipe_photo' => array(
  89       'field_name'  => 'recipe_photo',
  90       'label'       => $t('Photo of the prepared dish'),
  91     ),
  92     'recipe_summary' => array(
  93       'field_name' => 'recipe_summary',
  94       'label'       => $t('Short summary describing the dish'),
  95       'widget'      => array(
  96         'type'    => 'text_textarea',
  97       ),
  98     ),
  99   );
 100 }
 101 
 102 
 103 /**
 104  * Implements hook_uninstall().
 105  *
 106  * @ingroup rdf_example
 107  */
 108 function rdf_example_uninstall() {
 109   // Delete recipe content.
 110   $sql = 'SELECT nid FROM {node} n WHERE n.type = :type';
 111   $result = db_query($sql, array(':type' => 'recipe'));
 112   $nids = array();
 113   foreach ($result as $row) {
 114     $nids[] = $row->nid;
 115   }
 116   node_delete_multiple($nids);
 117 
 118   // Delete field instances for now.
 119   // Check status of http://drupal.org/node/1015846
 120   $instances = field_info_instances('node', 'recipe');
 121   foreach ($instances as $instance_name => $instance) {
 122     field_delete_instance($instance);
 123   }
 124 
 125   // Delete node type.
 126   node_type_delete('recipe');
 127 
 128   field_purge_batch(1000);
 129 }
";i:1;N;i:2;N;}i:2;i:286;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4275;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"rdf_example.module";i:1;i:2;i:2;i:4275;}i:2;i:4275;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:4275;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3207:"
   1 <?php
   2 /**
   3  * @file
   4  * This is an example outlining how a module can be used to define RDF mappings.
   5  * We define mappings for a node type defined in this module. We also customize
   6  * mappings for a node type that is defined in another module, node_example.
   7  */
   8 
   9 /**
  10  * @defgroup rdf_example Example: RDF
  11  * @ingroup examples
  12  * @{
  13  * Example RDF Mapping.
  14  */
  15 
  16 /**
  17  * Implements hook_rdf_mapping().
  18  *
  19  * This hook should only be used to define the RDF mapping for an entity or
  20  * bundle that has been defined by this module. On installation, this mapping
  21  * will be saved to the database. To alter anything in this mapping after module
  22  * installation (or to alter bundles defined in another module), the RDF CRUD
  23  * functions should be used, as shown below.
  24  */
  25 function rdf_example_rdf_mapping() {
  26   return array(
  27     array(
  28       'type' => 'node',
  29       'bundle' => 'recipe',
  30       'mapping' => array(
  31         'rdftype' => array('v:Recipe'),
  32         // We don't use the default bundle mapping for title. Instead, we add
  33         // the v:name property. We still want to use dc:title as well, though,
  34         // so we include it in the array.
  35         'title' => array(
  36           'predicates' => array('dc:title', 'v:name'),
  37         ),
  38         'recipe_summary' => array(
  39           'predicates' => array('v:summary'),
  40         ),
  41         // The photo URI isn't a string but instead points to a resource, so we
  42         // indicate that the attribute type is rel. If type isn't specified, it
  43         // defaults to property, which is used for string values.
  44         'recipe_photo' => array(
  45           'predicates' => array('v:photo'),
  46           'type'  => 'rel',
  47         ),
  48       ),
  49     ),
  50   );
  51 }
  52 
  53 /*
  54  * Implements hook_rdf_namespaces().
  55  *
  56  * This hook should be used to define any prefixes used by this module that are
  57  * not already defined in core by rdf_rdf_namespaces.
  58  *
  59  * http://api.drupal.org/api/drupal/modules--rdf--rdf.api.php/function/hook_rdf_namespaces/7
  60  */
  61 function rdf_example_rdf_namespaces() {
  62   return array(
  63     // Google's namespace for their custom vocabularies.
  64     'v' => 'http://rdf.data-vocabulary.org/#',
  65   );
  66 }
  67 
  68 /**
  69  * Implements hook_help().
  70  */
  71 function rdf_example_help($path, $arg) {
  72   switch ($path) {
  73     case 'examples/rdf_example':
  74       return "<p>" . t(
  75         "The RDF Example module provides RDF mappings for a custom node type and
  76         alters another node type's RDF mapping.
  77         You can check your RDF using a <a href='!parser'>parser</a> by copying
  78         and pasting your HTML source code into the box. For clearest results,
  79         use Turtle as your output format.",
  80         array('!parser' => url('http://www.w3.org/2007/08/pyRdfa/#distill_by_input'))
  81       ) . "</p>";
  82   }
  83 }
  84 /**
  85  * @} End of "defgroup rdf_example".
  86  */
";i:1;N;i:2;N;}i:2;i:4311;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7527;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"rdf_example.test";i:1;i:2;i:2;i:7527;}i:2;i:7527;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:7527;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1838:"
   1 <?php
   2 
   3 /**
   4  * @file
   5  * Tests for rdf.module.
   6  */
   7 
   8 /**
   9  * Test RDFa markup generation.
  10  *
  11  * @ingroup rdf_example
  12  */
  13 class RdfExampleRdfaMarkupTestCase extends DrupalWebTestCase {
  14   public static function getInfo() {
  15     return array(
  16       'name' => 'RDFa markup',
  17       'description' => 'Test RDFa markup generation.',
  18       'group' => 'Examples',
  19     );
  20   }
  21 
  22   function setUp() {
  23     parent::setUp('rdf', 'field_test', 'rdf_example');
  24   }
  25 
  26   /**
  27    * Create a recipe node of type blog and test whether the RDF mapping defined
  28    * for this bundle is reflected in the markup.
  29    */
  30   function testAttributesInMarkup() {
  31     $node = $this->drupalCreateNode(array('type' => 'recipe'));
  32     $this->drupalGet('node/' . $node->nid);
  33     $isoDate = date('c', $node->changed);
  34     $url = url('node/' . $node->nid);
  35 
  36     // The title is mapped to dc:title and v:name and is exposed in a meta tag
  37     // in the header.
  38     $recipe_title = $this->xpath("//meta[contains(@property, 'dc:title') and contains(@property, 'v:name') and @content='$node->title']");
  39     $this->assertTrue(!empty($recipe_title), 'Title is exposed with dc:title and v:name in meta element.');
  40 
  41     // Test that the type is applied and that the default mapping for date is
  42     // used.
  43     $recipe_meta = $this->xpath("//div[(@about='$url') and (@typeof='v:Recipe')]//span[contains(@property, 'dc:date') and contains(@property, 'dc:created') and @datatype='xsd:dateTime' and @content='$isoDate']");
  44     $this->assertTrue(!empty($recipe_meta), 'RDF type is present on post. Properties dc:date and dc:created are present on post date.');
  45   }
  46 }
";i:1;N;i:2;N;}i:2;i:7561;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9407;}i:20;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:9407;}}