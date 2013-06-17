a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"Integrating with the theme system";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:50;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"spy_glass.info";i:1;i:2;i:2;i:50;}i:2;i:50;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:50;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:64:"
name = Spy Glass
description = Serious spy business
core = 7.x
";i:1;N;i:2;N;}i:2;i:82;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:155;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"spy_glass.module";i:1;i:2;i:2;i:155;}i:2;i:155;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:155;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2741:"
<?php

/**
 * Implements hook_menu().
 */
function spy_glass_menu() {
  $items = array();
  $items['node/%node/spy_glass'] = array(
    'title' => 'Spy Glass',
    'description' => 'Take a closer look',
    'page callback' => 'spy_glass_page',
    'page arguments' => array(1),
    'access callback' => 'node_access',
    'access arguments' => array('view', 1),
    'type' => MENU_LOCAL_TASK,
  );
  return $items;
}

/**
 * Implements hook_theme().
 */
function spy_glass_theme() {
  return array(
    'spy_glass_item' => array(
      'arguments' => array('title' => NULL, 'data' => NULL),
      'template' => 'spy-glass-item',
    ),
    /** for theme function
    'spy_glass_item' => array(
      'variables' => array('item' => NULL),
    ),
    */
  );
}

function spy_glass_page($node) {
  $information = _spy_glass_serious_spying_business($node);
  
  $content = array();
  foreach ($information as $item) {
    $content[] = array(
      '#type' => 'markup',
      '#markup' => theme('spy_glass_item', $item),
    );
  }
  return $content;
}

function spy_glass_preprocess_spy_glass_item(&$variables) {
  $variables['title'] = check_plain($variables['title']);
  $variables['data'] = check_plain($variables['data']);
  $variables['module_name'] = t('Spy Glass');
}

/*
function theme_spy_glass_item($variables) {
  $output = '<p>';
  $output .= '<strong>' . check_plain($variables['title']) . '</strong><br/>';
  $output .= check_plain($variables['data']);
  $output .= '</p>';
  return $output;
}
*/

/**
 * Collecting some super secret information about this node.
 */
function _spy_glass_serious_spying_business($node) {
  $information = array();
  $information[] = array(
    'title' => t('Title Character Count'),
    'data' => t('There are @num characters in the $node->title.', array('@num' => strlen($node->title))),
  );
  $seconds = $node->changed - $node->created;
  $information[] = array(
    'title' => t('Timestamp Differences'),
    'data' => t('The $node->changed timestamp is @seconds different from the $node->created timestamp.', array('@seconds' => $seconds)),
  );
  if ($node->translate == 0) {
    $information[] = array(
      'title' => t('Translated?'),
      'data' => t('This node is NOT translated into pirate speak, hope you know English.'),
    );
  }
  $information[] = array(
    'title' => t('Hash'),
    'data' => md5($node->title),
  );
  // Example of potential user input data that needs to be sanitized.
  // Instead of hard-coding this, it could be getting loaded from the db
  // where a user has entered the info.
  $information[] = array(
    'title' => t('Nefarious data'),
    'data' => '<a href="#" onclick="alert(\'Pwned!\'); return false;">click me</a>',
  );
  return $information;
}
";i:1;N;i:2;N;}i:2;i:189;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2939;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"spy-glass-item.tpl.php";i:1;i:2;i:2;i:2939;}i:2;i:2939;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2939;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:121:"
<p>
  <strong><?php print $title; ?></strong><br/>
  <?php print $data; ?>
  <em><?php print $module_name; ?></em>
</p>
";i:1;N;i:2;N;}i:2;i:2979;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3108;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3108;}}