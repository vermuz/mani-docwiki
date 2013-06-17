a:35:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Altering the database";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:38;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"moddev-alter-files-start";i:1;i:1;i:2;i:38;}i:2;i:38;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:38;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:78;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:78;}i:2;i:78;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:78;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:106;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:175;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"demo2.install";i:1;i:2;i:2;i:175;}i:2;i:175;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:175;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:953:"
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
";i:1;N;i:2;N;}i:2;i:206;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1168;}i:15;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:1168;}i:2;i:1168;}i:16;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1168;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2088:"
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
";i:1;N;i:2;N;}i:2;i:1198;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3296;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"moddev-alter-files-end";i:1;i:1;i:2;i:3296;}i:2;i:3296;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:3296;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3334;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"demo2.info";i:1;i:2;i:2;i:3334;}i:2;i:3334;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3334;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
name = Demo 2
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:3362;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3431;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"demo2.install";i:1;i:2;i:2;i:3431;}i:2;i:3431;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3431;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1558:"
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
      'last_viewed' => array(
        'type' => 'int',
        'unsigned' => TRUE,
        'not null' => TRUE,
        'default' => 0,
        'description' => 'The last views date (timestamp).',
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



/**
* Implements hook_update_N().
*
* Add the "Last viewed date" field.
*/
function demo2_update_7001() {
  $field = array(
    'type' => 'int',
    'unsigned' => TRUE,
    'not null' => TRUE,
    'default' => 0,
    'description' => "The last views date (timestamp).",    
  );
  db_add_field('demo2', 'last_viewed', $field);

  return t('The "Last Viewed Date" field has been added.');

}
";i:1;N;i:2;N;}i:2;i:3462;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5029;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"demo2.module";i:1;i:2;i:2;i:5029;}i:2;i:5029;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5029;}i:32;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2294:"
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
      $record->last_viewed = time();
    }

    // Increment view_count by 1
    $record->view_count++;

    // Update last_viewed
    $record->last_viewed = time();


    // Set the record
    demo2_set_record($record);

    #krumo($record);

    // Set up an array of placeholders to pass to t().
    $t_args = array(
      '%num' => $record->view_count,
      '%date' => date('M j, Y', $record->last_viewed),
    );

    $node->content['node_views'] = array(
      '#markup' => t('You have viewed this page %num times.  It was last viewed by you on %date.', $t_args),
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
    ->fields('d', array('nid', 'uid', 'view_count', 'last_viewed'))
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

";i:1;N;i:2;N;}i:2;i:5059;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7361;}i:34;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:7361;}}