a:27:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"Querying the database with db_select()";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:55;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"moddev-selects-files-start";i:1;i:1;i:2;i:55;}i:2;i:55;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:55;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:97;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"demo.info";i:1;i:2;i:2;i:97;}i:2;i:97;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:97;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
name = Demo
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:124;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:191;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"demo.module";i:1;i:2;i:2;i:191;}i:2;i:191;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:191;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:461:"
<?php

/*
 * Implements hook_menu().
 */
function demo_menu() {
  $items = array();

  $items['admin/reports/node-list'] = array(
    'title' => 'List of Nodes',
    'description' => t('A list of nodes with published status.'),
    'page callback' => 'demo_node_list',
    'access arguments' => array('administer content'),
  );

  return $items;
}

/*
 * Custom page callback for admin/reports/node-list
 */
function demo_node_list(){
  return 'It Works!';
}
";i:1;N;i:2;N;}i:2;i:220;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:690;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"moddev-selects-files-end";i:1;i:1;i:2;i:690;}i:2;i:690;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:690;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:730;}i:18;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"demo.info";i:1;i:2;i:2;i:730;}i:2;i:730;}i:19;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:730;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
name = Demo
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:757;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:824;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"demo.module";i:1;i:2;i:2;i:824;}i:2;i:824;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:824;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1630:"
<?php

/*
 * Implements hook_menu().
 */
function demo_menu() {
  $items = array();

  $items['admin/reports/node-list'] = array(
    'title' => 'List of Nodes',
    'description' => t('A list of nodes with published status.'),
    'page callback' => 'demo_node_list',
    'access arguments' => array('administer content'),
  );

  return $items;
}

/*
 * Custom page callback for admin/reports/node-list
 */
function demo_node_list(){
  
  //define variants
  $node_types = node_type_get_types();
  #krumo($node_types);
  $stati = array(0, 1); //0 = unpublished, 1 = published

  
  //loop through variants
  foreach($node_types as $type) {
    #krumo($type);
    $typename = $type->type;
    foreach($stati as $status) {
      #krumo($status);

      //SELECT COUNT FROM node WHERE type = $typename AND status = $status
      $query = db_select('node', 'n')
        ->condition('type', $typename)
        ->condition('status', $status);
      $query->addExpression('COUNT (nid)', 'node_count');
      $results = $query->execute();
      $data = $results->fetchObject();
      #krumo($data);

      //assign vars for printing
      if ($status == 0) {
        $status = 'unpusblished';
      }
      else {
        $status = 'published';
      }

      //assemble strings for output
      $items[] = t('The %type content type has %num %status nodes.', array('%type'=>$typename, '%num'=>$data->node_count, '%status'=>$status ));
      
    }  //end status loop
  }  //end node type loop

  #krumo($items);

  $content['node-list'] = array(
    '#items' => $items,
    '#theme' => 'item_list',
  );

  return render($content);

}
";i:1;N;i:2;N;}i:2;i:853;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2492;}i:26;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2492;}}