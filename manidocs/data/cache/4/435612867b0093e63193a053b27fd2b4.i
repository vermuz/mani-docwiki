a:31:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"Adding a table to the database";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:47;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"moddev-addingtables-files-start";i:1;i:1;i:2;i:47;}i:2;i:47;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:47;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:94;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:94;}i:2;i:94;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:94;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:122;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:191;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:191;}i:2;i:191;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:191;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:985:"
<?php

/**
 * Implements hook_node_view().
 */
function demo2_node_view($node, $view_mode = 'full') {
  //only when looking at the full version, NOT the teaser
  if ($view_mode == 'full') {

    // Everytime a node is viewed, increment the node_views count
    // in the user's session by one and include the result in the node content

    //make sure there is a record in the session
    if (empty($_SESSION['node_views'][$node->nid])) {
      $_SESSION['node_views'][$node->nid] = 0;
    }
    
    #krumo('Before: '.$_SESSION['node_views'][$node->nid]);

    //add another to the session
    $_SESSION['node_views'][$node->nid]++;

    #krumo('After: '.$_SESSION['node_views'][$node->nid]);


    // Set up an array of placeholders to pass to t().
    $t_args = array(
      '%num' => $_SESSION['node_views'][$node->nid],
    );

    $node->content['node_views'] = array(
      '#markup' => t('You have viewed this page %num times.', $t_args),
      '#weight' => 10,
    );
  }
}
";i:1;N;i:2;N;}i:2;i:221;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1215;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"moddev-addingtables-files-end";i:1;i:1;i:2;i:1215;}i:2;i:1215;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1215;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1260;}i:18;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:1260;}i:2;i:1260;}i:19;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1260;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:1288;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1357;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"demo2.install";i:1;i:2;i:2;i:1357;}i:2;i:1357;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1357;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:953:"
<?php

/*
 *Implement hook_schema().
 */
function demo2_schema() {
  $schema = array();
  $schema['demo2'] = array(
    'description' => 'Information about node views.',
    'fields' => array(
      'nid' => array(
        'type' => 'int',
        'unsigned' => TRUE,
        'not null' => TRUE,
        'default' => 0,
        'description' => "The node's {node}.nid.",
      ),
      'uid' => array(
        'type' => 'int',
        'unsigned' => TRUE,
        'not null' => TRUE,
        'default' => 0,
        'description' => "The user's {uid}.uid.",
      ),
      'view_count' => array(
        'type' => 'int',
        'unsigned' => TRUE,
        'not null' => TRUE,
        'default' => 0,
        'description' => 'Simple node view counter per user.',
      ),
    ),
    'primary key' => array('nid', 'uid'),
  );

  return $schema;
}

/*
 *Implements hook_update_N().
 */
function demo2_update_7000() {
  drupal_install_schema('demo2');
}
";i:1;N;i:2;N;}i:2;i:1388;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2350;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:2350;}i:2;i:2350;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2350;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:985:"
<?php

/**
 * Implements hook_node_view().
 */
function demo2_node_view($node, $view_mode = 'full') {
  //only when looking at the full version, NOT the teaser
  if ($view_mode == 'full') {

    // Everytime a node is viewed, increment the node_views count
    // in the user's session by one and include the result in the node content

    //make sure there is a record in the session
    if (empty($_SESSION['node_views'][$node->nid])) {
      $_SESSION['node_views'][$node->nid] = 0;
    }
    
    #krumo('Before: '.$_SESSION['node_views'][$node->nid]);

    //add another to the session
    $_SESSION['node_views'][$node->nid]++;

    #krumo('After: '.$_SESSION['node_views'][$node->nid]);


    // Set up an array of placeholders to pass to t().
    $t_args = array(
      '%num' => $_SESSION['node_views'][$node->nid],
    );

    $node->content['node_views'] = array(
      '#markup' => t('You have viewed this page %num times.', $t_args),
      '#weight' => 10,
    );
  }
}
";i:1;N;i:2;N;}i:2;i:2380;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3373;}i:30;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3373;}}