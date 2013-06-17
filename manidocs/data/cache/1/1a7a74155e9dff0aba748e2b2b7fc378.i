a:39:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"Querying the database with query methods";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:57;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"moddev-querying-files-start";i:1;i:1;i:2;i:57;}i:2;i:57;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:57;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:100;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:100;}i:2;i:100;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:100;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:128;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:197;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"demo2.install";i:1;i:2;i:2;i:197;}i:2;i:197;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:197;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:953:"
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
";i:1;N;i:2;N;}i:2;i:228;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1190;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:1190;}i:2;i:1190;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1190;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:985:"
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
";i:1;N;i:2;N;}i:2;i:1220;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2215;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"moddev-querying-files-end";i:1;i:1;i:2;i:2215;}i:2;i:2215;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:2215;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2256;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:2256;}i:2;i:2256;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2256;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:2284;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2353;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"demo2.install";i:1;i:2;i:2;i:2353;}i:2;i:2353;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2353;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:953:"
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
";i:1;N;i:2;N;}i:2;i:2384;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3346;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:3346;}i:2;i:3346;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3346;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2088:"
<?php

/**
 * Implements hook_node_view().
 */
function demo2_node_view($node, $view_mode = 'full') {
  //only when looking at the full version, NOT the teaser
  if ($view_mode == 'full') {

    global $user;

    // Everytime a node is viewed, increment the node_views count
    // in the demo2 table by one and include the result in the node content


    // Get record
    $record = demo2_get_record($node->nid, $user->uid);

    //If no record, create one that we can insert later
    if ($record === FALSE) {
      $record = new StdClass();
      $record->nid = $node->nid;
      $record->uid = $user->uid;
      $record->view_count = 0;
    }

    // Increment view_count by 1
    $record->view_count++;


    // Set the record
    demo2_set_record($record);

    krumo($record);


    // Set up an array of placeholders to pass to t().
    $t_args = array(
      '%num' => $record->view_count,
    );

    $node->content['node_views'] = array(
      '#markup' => t('You have viewed this page %num times.', $t_args),
      '#weight' => 10,
    );
  }
}


/**
 * Get the record.
 *
 * @param int $nid
 *   The node id.
 * @param int $uid
 *   The user id.
 * @return mixed
 *   The stdClass record, or FALSE if no record exists.
 */

function demo2_get_record($nid, $uid) {
  //SELECT view_count FROM demo2 WHERE nid = $nid & uid = $uid
  $query = db_select('demo2', 'd')
    ->fields('d', array('nid', 'uid', 'view_count'))
    ->condition('nid', $nid)
    ->condition('uid', $uid);
  $record = $query->execute()->fetch();
  return $record;

}


/**
 * Save a record.
 *
 * @param stdClass $record
 *   The record to save.
 */
function demo2_set_record($record) {
  //sanity check
  if (!is_object($record)) {
    return watchdog('demo2', 'We could not update information about node views.', array(), WATCHDOG_ERROR);
  }


  //INSERT/UPDATE into demo2 ('nid', 'uid', 'node_views') VALUES ('nid', 'uid', 'node_views')
  $query = db_merge('demo2')
    ->key(array('nid' =>$record->nid))
    ->key(array('uid' => $record->uid))
    ->fields((array) $record);
  $query->execute();

}
";i:1;N;i:2;N;}i:2;i:3376;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5475;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"Database Queries Cheatsheet";i:1;i:1;i:2;i:5475;}i:2;i:5475;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:5475;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2015:"
http://drupal.org/developing/api/database



SELECT QUERY

  //SELECT column1, column2, columnN 
  //FROM {tablename} 
  //WHERE column1 = $value1 
  //AND column2 <> $value2
  //ORDERBY 'sticky', DESC
  //ORDERBY 'created', DESC
  //LIMIT 10;

  $query = db_select('tablename', 'optional alias')
    ->fields('tablename or alias if given', array('colunm1', 'column2' ..., 'columnN'))
    ->condition('column1', 'value1')
    ->condition('column2', 'value2', 'optional <>')
    ->orderBy('sticky', 'DESC')
    ->orderBy('created', 'DESC')
    ->limit(variable_get('default_nodes_main', 10))
    ->extend('PagerDefault');
  return $query->execute()->fetch();
  //Calling fields() with no field list will result in a "SELECT *" query.



INSERT QUERY

  //INSERT INTO {tablename} ('column1', 'column2') VALUES ('value1', 'value2');

  $query = db_insert('tablename')
    ->fields(array('column1', 'column2'))
    ->values(array('column1' => 'value1', 'column2' => 'value2'))
    ->execute();



UPDATE QUERY

  //UPDATE {tablename}
  //SET column1 = value1, column2 = value2
  //WHERE column3 >= value3
  
  $query = db_update('tablename')
    ->fields(array('column1' => 'value1', 'column2' => 'value2'))
    ->condition('column3', 'value3', '>=')
    ->execute();
  //The third parameter for ->condition() is optional and defaults to "="



MERGE QUERY

  //In tablename, if the field = value exists, update field1 = value1 && field2 = value2 
  //UPDATE {tablename} SET column1 = value1, column2 = value2 WHERE column = value

  //If tablename, if the field = value does NOT exists, 
  //INSERT INTO {tablename} ('column', 'column1', 'column2') VALUES ('value', 'value1', 'value2');

  $query = db_merge('tablename')
    ->key(array('column' => 'value'))
    ->fields(array(
        'column1' => 'value1',
        'column2' => 'value2',
    ))
    ->execute();



DELETE QUERY
  //DELETE FROM {tablename} WHERE column = value;
  $query = db_delete('tablename')
    ->condition('column', 'value')
    ->execute();
";i:1;N;i:2;N;}i:2;i:5523;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7546;}i:38;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7546;}}